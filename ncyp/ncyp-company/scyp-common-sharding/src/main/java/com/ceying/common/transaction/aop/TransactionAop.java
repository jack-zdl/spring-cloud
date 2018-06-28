package com.ceying.common.transaction.aop;

import com.ceying.common.constant.RedisConstants;
import com.ceying.common.constant.TopicConstants;
import com.ceying.common.exception.ServiceException;
import com.ceying.common.transaction.treeData.TreeLink;
import com.ceying.common.transaction.treeData.TreeLinkContext;
import com.ceying.common.util.annotation.MyTransaction;
import com.ceying.common.util.annotation.RollBackAspect;
import com.ceying.common.util.response.BaseReturnResult;
import com.ceying.eagleeye.common.producer.KafkaMsgProducer;
import org.apache.commons.lang.StringUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.List;

/**
 * 功能说明: 分布式事物涉及的 相关aop 切面 <br>
 * 系统版本: 2.0 <br>
 * 开发人员: huanghaiyun
 * 开发时间: 2018/5/31<br>
 * <br>
 */
@Aspect //AOP 切面
@Component
public class TransactionAop {
    private static final Logger log = LoggerFactory.getLogger(TransactionAop.class);

    @Autowired
    private KafkaMsgProducer kafkaMsgProducer;
    @Autowired
    private RedisTemplate<String, Object> cacheTemplate;

    @Pointcut("execution(* com.ceying.*.feign.*+.*(..))")
    public void feign(){}
    /**
     *
     * 对开启了分布式事物的 方法进行拦截
     * @param joinPoint
     * @param transaction
     * @return
     */
    @Before("@annotation(transaction)")
    public void beforeTransaction(JoinPoint joinPoint, MyTransaction transaction) {
        try {
            TreeLink treeLink=TreeLinkContext.getTree();
            if(treeLink==null){
                treeLink=new TreeLink();
                treeLink.setTreeIndex(treeLink.getTreeId()+"#");
                treeLink.setParentId("root");
                TreeLinkContext.setTree(treeLink);
                TreeLinkContext.setNownode(treeLink);
            }
            cacheTemplate.opsForHash().put(RedisConstants.MYTRANSACTION,treeLink.getTreeId(),treeLink);
        } catch (Exception e) {
            log.error("对MyTransaction 拦截失败",e);
        }
    }
    /**
     *
     * 执行成功 往 kafka 推送分布式事物执行成功的消息
     * @param joinPoint
     * @param transaction
     * @return
     */
    @AfterReturning(value = "@annotation(transaction)")
    public void afterReturningTransaction(JoinPoint joinPoint, MyTransaction transaction) {
        try {
            TreeLink treeLink=TreeLinkContext.getTree();
            //TODO 将执行成功的消息删除
            kafkaMsgProducer.sendMessage(TopicConstants.TRANSACTION_SUCCESS,treeLink.getTreeId());
        } catch (Exception e) {
            log.error("链路执行成功 发送执行成功的消息时发生异常",e);
        }
    }

    /**
     *
     * 执行失败 往 kafka 推送分布式事物执行失败的消息
     * @param joinPoint
     * @param transaction
     * @return
     */
    @AfterThrowing(value = "@annotation(transaction)", throwing = "ex")
    public void afterThrowingTransaction(JoinPoint joinPoint, MyTransaction transaction,Exception ex) {
        try {
            TreeLink treeLink=TreeLinkContext.getTree();
            //TODO 将执行失败的消息发送出去
            kafkaMsgProducer.sendMessage(TopicConstants.TRANSACTION_FAIL,treeLink.getTreeId());
        } catch (Exception e) {
            log.error("链路执行失败 发送执行失败的消息时发生异常",e);
        }
    }
    /**
     *
     * 扫描controller
     * @param joinPoint
     * @return
     */
    @Before(value = "@annotation(requestMapping)")
    public void beforeController(JoinPoint joinPoint, RequestMapping requestMapping) {
        try {
            TreeLinkContext.remove();//移除上一线程请求的数据
            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
            String treeLinkHeader=request.getHeader("TreeLink");
            if(StringUtils.isNotBlank(treeLinkHeader)){//是否带有 自定义 分布式事物 的头部信息，有的话 构建分布式链路节点数据。
                String[] treeHeads=treeLinkHeader.split(",");
                String parentId = null;
                String treeId = null;
                String treeIndex = null;
                if(treeHeads.length==3){
                    String[] parentIds=treeHeads[0].split("=");
                    parentId=parentIds[1];
                    String[] treeIds=treeHeads[1].split("=");
                    treeId=treeIds[1];
                    String[] treeIndexs=treeHeads[2].split("=");
                    treeIndex=treeIndexs[1];
                    String[] treeIdList=treeIndex.split("#");
                    String root=treeIdList[0];
                    TreeLink tree= (TreeLink) cacheTemplate.opsForHash().get(RedisConstants.MYTRANSACTION,root);//从redis 中获取完整的链路数据
                    TreeLinkContext.setTree(tree);
                    TreeLink nowNode=getNowNode(tree,treeIdList,0);//获取当前请求所在的节点
                    TreeLinkContext.setNownode(nowNode);
                }
            }
        } catch (Exception e) {
            log.error("扫描controller 时发生异常",e);
        }
    }
    /**
     *
     * feign 调用前 将回滚信息 放入 threadlocal 中
     * @param joinPoint
     * @return
     */
    @Before(value ="feign()")
    public void beforeFeign(JoinPoint joinPoint) {

        try {
            TreeLink parent=TreeLinkContext.getNowNode();
            if(parent!=null){
                TreeLink child=new TreeLink();
                child.setParentId(parent.getTreeId());
                child.setTreeIndex(parent.getTreeIndex()+child.getTreeId()+"#");
                parent.addChilden(child);

                FeignClient feignClient=joinPoint.getTarget().getClass().getInterfaces()[0].getAnnotation(FeignClient.class);
                if(feignClient!=null){
                    if(StringUtils.isNotBlank(feignClient.name())){
                        child.setServiceName(feignClient.name());
                    }else{
                        child.setServiceName(feignClient.value());
                    }
                }
                Signature signature = joinPoint.getSignature();
                MethodSignature methodSignature = (MethodSignature)signature;
                Method targetMethod = methodSignature.getMethod();
                RollBackAspect rollback=targetMethod.getAnnotation(RollBackAspect.class);
                if(rollback!=null){
                    child.setRollBack(rollback.isRollBack());
                    child.setRollbackUrl(rollback.rollBackUrl());
                }
            }
        } catch (Exception e) {
            log.error("扫描feign 时发生异常",e);
        }
    }

    /**
     *
     * feign 调用后 判断是否调用成功  调用失败抛异常
     * @param joinPoint
     * @return
     */
    @AfterReturning(value ="feign()",returning = "result")
    public void afterReturnFeign(JoinPoint joinPoint,Object result) throws ServiceException {
        if(result instanceof BaseReturnResult){
            BaseReturnResult bas= (BaseReturnResult) result;
            if(!bas.isSuccess()){
                throw new ServiceException(bas.getCode());
            }
        }
    }
    private TreeLink getParent(TreeLink treeLink,String parent){
        if(treeLink.getTreeId().equals(parent)){
            return treeLink;
        }
        if(!treeLink.getChildens().isEmpty()){
            for(TreeLink child:treeLink.getChildens()){
                TreeLink parentNode=getParent(child,parent);
                if(parentNode!=null){
                    return parentNode;
                }
            }
        }
        return null;
    }

    /**
     * 获取当前请求 所在的节点
     * @param treeLink
     * @param treeIndex
     * @param index
     * @return
     * @throws Exception
     */
    private TreeLink getNowNode(TreeLink treeLink,String[] treeIndex,int index) throws Exception {
        if(treeIndex.length==(index+1)){
            if(treeIndex[index].equals(treeLink.getTreeId())){
                return treeLink;
            }else{
                throw new Exception("未找到当前节点");
            }
        }else{
            List<TreeLink> childeList=treeLink.getChildens();
            for(int i=0;i<childeList.size();i++){
                TreeLink child=childeList.get(i);
                if(child.getTreeId().equals(treeIndex[index+1])){
                    return getNowNode(child,treeIndex,index+1);
                }
            }
        }
        throw new Exception("未找到当前节点");
    }
}
