package com.cyp.chx.rcenter.client;

import com.cyp.chx.rcenter.bean.Url;
import com.cyp.chx.rcenter.hessian.client.HessRpcProxy;
import com.cyp.chx.rcenter.protobuff.client.ProtoRpcProxy;
import com.cyp.chx.rcenter.regist.RegistService;
import com.cyp.chx.rcenter.config.RpcConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author：huanghaiyun
 * @Date:2017/12/19
 */
@Service
public class RpcServiceFactory {

    @Autowired
    private RpcConfig rpcConfig;
    /**
     * 根据请求的服务名创建 service
     * @param interfaceClass
     * @param serverName
     * @param <T>
     * @return
     */
    public <T> T createByName(final Class<?> interfaceClass,String serverName) throws Exception {
        return createByName(interfaceClass,serverName,null);
    }
    /**
     * 根据rpc url 创建 service
     * @param interfaceClass
     * @param url
     * @param <T>
     * @return
     */
    public <T> T createByUrl(final Class<?> interfaceClass,String url){
        return createByUrl(interfaceClass,url,null);
    }

    /**
     * 根据请求的服务名创建 service
     * @param interfaceClass
     * @param serverName
     * @param timeout 获取数据的 超时时间
     * @param <T>
     * @return
     * @throws Exception
     */
    public <T> T createByName(final Class<?> interfaceClass,String serverName,Long timeout) throws Exception {
        String url=getRpcUrl(serverName);
        if(url==null){
            throw new Exception("改服务不存在 serverName:"+serverName);
        }
        RpcProxy rpcProxy=getProxy(url,timeout);
        return rpcProxy.create(interfaceClass);
    }
    /**
     * 根据rpc url 创建 service
     * @param interfaceClass
     * @param url
     * @param <T>
     * @return
     */
    public <T> T createByUrl(final Class<?> interfaceClass,String url,Long timeout){
        RpcProxy rpcProxy=getProxy(url,timeout);
        return rpcProxy.create(interfaceClass);
    }

    /**
     * 根据服务名获取rpc url
     * @param name
     * @return
     */
    public String getRpcUrl(String name){
        // 注册 RPC 服务地址
        RpcProxy rpcProxy =getProxy(rpcConfig.getRegistByWeight(),null);
        RegistService service= rpcProxy.create(RegistService.class);
        return service.getUrl(name);
    }

    /**
     * 根据url 创建对应的 proxy
     * @param address
     * @return
     */
    private RpcProxy getProxy(String address,Long timeout){
        //TODO
        Url url=new Url(address);
        if(timeout==null){
            timeout=rpcConfig.getGetResultTimeOut();
        }
        switch (url.getProtocol()){
            case PROTOBUFF:return new ProtoRpcProxy(url,timeout);
            case HESSIAN:return new HessRpcProxy(url,timeout);
            default:return new ProtoRpcProxy(url,timeout);
        }
    }
}
