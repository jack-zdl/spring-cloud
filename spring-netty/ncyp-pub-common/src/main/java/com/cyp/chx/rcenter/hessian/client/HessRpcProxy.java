package com.cyp.chx.rcenter.hessian.client;

import com.cyp.chx.rcenter.client.RpcProxy;
import com.cyp.chx.rcenter.bean.Storage;
import com.cyp.chx.rcenter.bean.Url;
import com.cyp.chx.rcenter.hessian.bean.HessRequest;
import com.cyp.chx.rcenter.hessian.bean.HessResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/**
 * @Author：huanghaiyun
 * @Date:2017/12/7
 */
public class HessRpcProxy extends RpcProxy {

    private static final Logger LOGGER = LoggerFactory.getLogger(HessRpcProxy.class);

    private Url url;
    private long timeOut;


    public HessRpcProxy(Url url,long timeOut) {
        this.url = url;
        this.timeOut=timeOut;
    }

    @Override
    public <T> T create(final Class<?> interfaceClass) {
        return create(interfaceClass, "");
    }

    @Override
    public <T> T create(final Class<?> interfaceClass,long timeout) {
        return create(interfaceClass, "",timeout);
    }
    @Override
    public <T> T create(final Class<?> interfaceClass, final String serviceVersion) {
        return create(interfaceClass, "",timeOut);
    }
    @Override
    public <T> T create(final Class<?> interfaceClass, final String serviceVersion,long timeout) {
        // 创建动态代理对象
        return (T) Proxy.newProxyInstance(
                interfaceClass.getClassLoader(),
                new Class<?>[]{interfaceClass},
                new InvocationHandler() {
                    @Override
                    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                        // 创建 RPC 请求对象并设置请求属性
                        HessRequest request=new HessRequest();
                        request.setParams(args);
                        request.setMethodName(method.getName());
                        request.setPath(method.getDeclaringClass().getName());
                        request.setParameterTypes(method.getParameterTypes());
                        String s=method.getDeclaringClass().getName();
                        request.setVersion(serviceVersion);
//                        // 创建 RPC 客户端对象并发送 RPC 请求
                        HessClient client = HessClient.getINSTANCE();
                        Storage stroage = client.send(url.getAddress(),request,timeout);
                        HessResponse response= (HessResponse) stroage.get();
                        if (response == null) {
                            throw new RuntimeException("response is null");
                        }
                        // 返回 RPC 响应结果
                        if (!response.isOk()) {
                            throw (Exception) response.getResult();
                        } else {
                            return response.getResult();
                        }

                    }
                }
        );
    }
}
