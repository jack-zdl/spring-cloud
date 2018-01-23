package com.cyp.chx.rcenter.server;

import com.cyp.chx.rcenter.hessian.server.HessRpcServer;
import com.cyp.chx.rcenter.regist.RegistService;
import com.cyp.chx.rcenter.client.RpcServiceFactory;
import com.cyp.chx.rcenter.bean.Url;
import com.cyp.chx.rcenter.config.RpcConfig;
import com.cyp.chx.rcenter.protobuff.server.ProtoRpcServer;
import org.apache.commons.collections4.MapUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author：huanghaiyun
 * @Date:2017/12/18
 */
@Service
public class RpcServer implements ApplicationContextAware, InitializingBean {

    private Logger LOGGER = LoggerFactory.getLogger(RpcServer.class);

    @Autowired
    private RpcConfig rpcConfig;
    @Autowired
    private RpcServiceFactory rpcServiceFactory;
    private NettyServer nettyServer;

    private Map<String, Object> handlerMap = new HashMap<>(); // 存放接口名与服务对象之间的映射关系

    @Override
    public void afterPropertiesSet() throws Exception {
        //向注册中心注册服务
        try {
            RegistService service= rpcServiceFactory.createByUrl(RegistService.class,rpcConfig.getRegistByWeight());
            List<String> registList=service.regist(rpcConfig.getLocalAddress(),rpcConfig.getName());
            if(registList!=null){
                rpcConfig.setRegistAddress(registList);
                LOGGER.info("rpc 服务注册成功:"+rpcConfig);
            }else {
                LOGGER.error("rpc 服务注册失败:"+rpcConfig);
            }
        } catch (Exception e) {
            LOGGER.error("rpc 服务注册失败:",e);
        }
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        // 扫描带有 RpcService 注解的类并初始化 handlerMap 对象
        Map<String, Object> serviceBeanMap = applicationContext.getBeansWithAnnotation(RpcService.class);
        if (MapUtils.isNotEmpty(serviceBeanMap)) {
            for (Object serviceBean : serviceBeanMap.values()) {
                RpcService rpcService = serviceBean.getClass().getAnnotation(RpcService.class);
                String serviceName = rpcService.value().getName();
                String serviceVersion = rpcService.version();
                if (StringUtils.isNotEmpty(serviceVersion)) {
                    serviceName += "-" + serviceVersion;
                }
                handlerMap.put(serviceName, serviceBean);
            }
        }
        //开启给外部调用的rpc 服务
        startRpc();
    }
    private void startRpc() {
        Url url=new Url(rpcConfig.getLocalAddress());
        switch (url.getProtocol()){
            case PROTOBUFF:nettyServer=new ProtoRpcServer(url,handlerMap,rpcConfig);break;
            case HESSIAN:nettyServer=new HessRpcServer(url,handlerMap,rpcConfig);break;
            default:nettyServer=new ProtoRpcServer(url,handlerMap,rpcConfig);break;
        }
        Thread thread=new Thread(new Runnable() {
            @Override
            public void run() {
                nettyServer.start();
            }
        });
        thread.start();
    }



}
