package com.ceying.common.config;

import com.ceying.common.constant.RedisConstants;
import com.ceying.common.transaction.treeData.TreeLink;
import com.ceying.common.transaction.treeData.TreeLinkContext;
import feign.RequestInterceptor;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;

import java.util.List;

/**
 * 功能说明: feign 发送数据前的拦截器 <br>
 * 对发送的http 报文头部进行改造 添加自定义头部信息 <br>
 * 系统版本: 2.0 <br>
 * 开发人员: huanghaiyun
 * 开发时间: 2018/6/5<br>
 * <br>
 */
@Component
public class FeignConfig{
    @Autowired
    private RedisTemplate<String, Object> cacheTemplate;
        @Bean
        public RequestInterceptor requestInterceptor() {
            return requestTemplate -> {
                try {//分布式事物自定义头信息
                    TreeLink parent=TreeLinkContext.getNowNode();
                    if(parent!=null){//当前节点不为空  表示当前链路需要 进行事务管理
                        List<TreeLink> childList=parent.getChildens();
                        if(!childList.isEmpty()) {
                            TreeLink child=childList.get(childList.size()-1);
                            child.setBody(requestTemplate.body());
                            child.setQueries(requestTemplate.queries());
                            child.setMethod(requestTemplate.method());
                            child.setHeaders(requestTemplate.headers());
                            child.setUrl(requestTemplate.url());
                            if(StringUtils.isBlank(child.getRollbackUrl())){
                                child.setRollbackUrl(requestTemplate.url()+"RollBack");
                            }
                            requestTemplate.header("TreeLink","parentId="+child.getParentId()+",treeId="+child.getTreeId()+",treeIndex="+child.getTreeIndex());
                        }
                        cacheTemplate.opsForHash().put(RedisConstants.MYTRANSACTION,TreeLinkContext.getTree().getTreeId(),TreeLinkContext.getTree());
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                try {//session 传递
                    String sessionId = RequestContextHolder.currentRequestAttributes().getSessionId();
                    if (StringUtils.isNotBlank(sessionId)) {
                        requestTemplate.header("Cookie", "SESSION=" + sessionId);
                    }
                } catch (IllegalStateException e) {
                    e.printStackTrace();
                }
            };
        }
}
