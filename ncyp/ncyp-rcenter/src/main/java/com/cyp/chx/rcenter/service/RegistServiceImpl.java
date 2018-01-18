package com.cyp.chx.rcenter.service;

import com.cyp.chx.rcenter.bean.ReNotifyTaskList;
import com.cyp.chx.rcenter.client.RpcServiceFactory;
import com.cyp.chx.rcenter.bean.Url;
import com.cyp.chx.rcenter.config.RpcConfig;
import com.cyp.chx.rcenter.regist.RegistService;
import com.cyp.chx.rcenter.server.RpcService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.TaskExecutor;
import org.springframework.data.redis.core.StringRedisTemplate;

import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;

/**
 * @Author：huanghaiyun
 * @Date:2017/12/18
 */
@RpcService(RegistService.class)
public class RegistServiceImpl implements RegistService {

    private Logger LOGGER = LoggerFactory.getLogger(RegistServiceImpl.class);
    @Autowired
    private RpcConfig rpcConfig;
    @Autowired
    private StringRedisTemplate redisTemplate;

    @Autowired
    private RpcServiceFactory rpcServiceFactory;
    @Autowired
    private TaskExecutor taskExecutor;

    private static final String serviceKey="serviceMapKey";//普通服务 缓存

    @Override
    public List<String> regist(String address, String name) {
        List<String> list=registService(address,name);
        Url url=new Url(address);
        if(url.isRegistCenter()){//注册中小 注册 需要将本地数据全部同步过去  同时通知其他注册中心
            Map<Object,Object> map=redisTemplate.opsForHash().entries(serviceKey);
            taskExecutor.execute(new RegistNotifyTask(address,name,map));
        }else{//非注册中心注册 只需要通知其他注册中心
            taskExecutor.execute(new RegistNotifyTask(address,name));
        }
        return list;
    }

    @Override
    public long clean(String name) {
        return redisTemplate.opsForHash().delete(serviceKey,name);
    }

    @Override
    public String getUrl(String name) {
        return (String) redisTemplate.opsForHash().get(serviceKey,name);
    }

    @Override
    public void registNotify(String address, String name) {
        Url url=new Url(address);
        if(url.isRegistCenter()){
            rpcConfig.addRegist(url);
        }
        redisTemplate.opsForHash().put(serviceKey,name,address);
    }

    @Override
    public void registNotify(Map<Object, Object> map) {
        redisTemplate.opsForHash().putAll(serviceKey,map);
    }

    @Override
    public long getState() {
        Url url=new Url(rpcConfig.getLocalAddress());
        long weight=Integer.valueOf(url.getParam("weight"));
        return weight;
    }

    private  List<String> registService(String address, String name){
        Url url=new Url(address);
        if(url.isRegistCenter()){
            rpcConfig.addRegist(url);
        }
        redisTemplate.opsForHash().put(serviceKey,name,address);
        return rpcConfig.getRegistAddress();
    }

    /**
     *  注册中心 同步数据线程
     */
    private class RegistNotifyTask implements Runnable {
        private String address;
        private String name;
        private Map<Object,Object> map;
        public RegistNotifyTask(String address,String name){
            this.address=address;
            this.name=name;
        };
        public RegistNotifyTask(String address,String name,Map<Object,Object> map){
            this.address=address;
            this.name=name;
            this.map=map;
        };
        public void run() {
            LOGGER.info("开始主动通知");
            Url localUrl=new Url(rpcConfig.getLocalAddress());
            CopyOnWriteArrayList<String> readList=new CopyOnWriteArrayList<String>(rpcConfig.getRegistAddress());
            for(String regist:readList){
                Url remoteUrl=new Url(regist);
                if(localUrl.getAddress().equals(remoteUrl.getAddress())){//被通知对象为自己时 不通知
                    continue;
                }
                try {
                    RegistService service=rpcServiceFactory.createByUrl(RegistService.class,regist);
                    service.registNotify(address,name);
                } catch (Exception e) {
                    ReNotifyTaskList list=ReNotifyTaskList.getINSTANCE();
                    list.add(regist,address,name);
                    LOGGER.info("主动通知出错\turl:"+regist,e);
                }
            }
            if(map!=null){
                RegistService service=rpcServiceFactory.createByUrl(RegistService.class,address);
                service.registNotify(map);
            }
            LOGGER.info("主动通知结束");
        }
    }

}
