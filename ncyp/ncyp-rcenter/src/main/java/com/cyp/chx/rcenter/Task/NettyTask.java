package com.cyp.chx.rcenter.Task;

import com.cyp.chx.rcenter.bean.NotifyTaskBean;
import com.cyp.chx.rcenter.bean.ReNotifyTaskList;
import com.cyp.chx.rcenter.client.RpcServiceFactory;
import com.cyp.chx.rcenter.bean.Url;
import com.cyp.chx.rcenter.config.RpcConfig;
import com.cyp.chx.rcenter.regist.RegistService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * 注册中心之间的 定时任务
 * @Author：huanghaiyun
 * @Date:2018/1/4
 */
@Component
public class NettyTask {

    private Logger LOGGER = LoggerFactory.getLogger(NettyTask.class);
    @Autowired
    private RpcConfig rpcConfig;
    @Autowired
    private RpcServiceFactory rpcServiceFactory;

    /**
     * 保持注册中心心跳 同时更新他的权重
     */
    @Scheduled(cron="0 0/3 * * * ?")//每3分钟一个心跳
    public void sendHeart(){
        for(int i=0;i<rpcConfig.getRegistAddress().size();i++){
            try {
                String regist=rpcConfig.getRegistAddress().get(i);
                RegistService service=rpcServiceFactory.createByUrl(RegistService.class,regist);
                Url url=new Url(regist);
                long weight=service.getState();
                url.setParam("weight",weight);
                rpcConfig.getRegistAddress().set(i,url.encode());
            } catch (Exception e) {
                LOGGER.error("发送心跳异常",e);
            }
        }
    }
    @Scheduled(cron="0 0/30 * * * ? ")//每半小时一次重发
    public void ressend(){
        ReNotifyTaskList list=ReNotifyTaskList.getINSTANCE();
        List<NotifyTaskBean>failList=new ArrayList<NotifyTaskBean>();
        LOGGER.info("开始异常通知 需要通知的数量："+list.size());
        while (list.size()>0) {
            NotifyTaskBean bean=list.poll();
            if(!send(bean)){//发送失败
                failList.add(bean);
            }
        }
        list.addAll(failList);
        LOGGER.info("异常通知结束 剩余需要通知的数量："+list.size());
    }
    private boolean send(NotifyTaskBean bean){
        while (true){
            try {
                RegistService service=rpcServiceFactory.createByUrl(RegistService.class,bean.getRegist());
                service.registNotify(bean.getAddress(),bean.getName());
                return true;
            } catch (Exception e) {
                bean.setTimes(bean.getTimes()+1);
                LOGGER.info("通知失败\t:"+bean,e);
                if(bean.getTimes()%3==0){
                    return false;
                }
            }
        }
    }
}
