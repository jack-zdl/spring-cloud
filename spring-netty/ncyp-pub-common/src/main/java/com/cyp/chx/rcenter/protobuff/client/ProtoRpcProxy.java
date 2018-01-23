package com.cyp.chx.rcenter.protobuff.client;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.parser.ParserConfig;
import com.cyp.chx.rcenter.bean.Storage;
import com.cyp.chx.rcenter.protobuff.bean.RpcProto;
import com.cyp.chx.rcenter.bean.Request;
import com.cyp.chx.rcenter.client.RpcProxy;
import com.cyp.chx.rcenter.bean.Url;
import com.cyp.chx.rcenter.protobuff.bean.ProtoRequest;
import com.cyp.chx.rcenter.protobuff.bean.ProtoResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/**
 * @Author：huanghaiyun
 * @Date:2017/12/7
 */
public class ProtoRpcProxy extends RpcProxy {

    private static final Logger LOGGER = LoggerFactory.getLogger(ProtoRpcProxy.class);

    private Url url;

    private long timeOut;

    public ProtoRpcProxy(Url url,long timeOut) {
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
                        Request request=new ProtoRequest();
                        request.setParams(args);
                        request.setMethodName(method.getName());
                        request.setPath(method.getDeclaringClass().getName());
                        request.setParameterTypes(method.getParameterTypes());
                        String s=method.getDeclaringClass().getName();
                        request.setVersion(serviceVersion);
//                        // 创建 RPC 客户端对象并发送 RPC 请求
                        ProtoClient client = ProtoClient.getINSTANCE();
                        RpcProto.ProtoData.Builder builder=req();
                        builder.setDataValue(JSONObject.toJSONString(request));
                        builder.setID(request.getId());
                        Storage stroage = client.send(url.getAddress(),builder.build(),timeOut);
                        RpcProto.ProtoData data= (RpcProto.ProtoData) stroage.get();
                        LOGGER.info("get result data:"+data);
                        ParserConfig.getGlobalInstance().setAutoTypeSupport(true);
                        ProtoResponse response=JSONObject.parseObject(data.getDataValue(),ProtoResponse.class);
                        if (response == null) {
                            throw new RuntimeException("response is null");
                        }
                        // 返回 RPC 响应结果
                        if (!response.isOk()) {
                            throw (Throwable) response.getResult();
                        } else {
                            return JSONObject.parseObject(response.getResult().toString(),Class.forName(response.getResultType()));
                        }

                    }
                }
        );
    }

    private RpcProto.ProtoData.Builder req() {
        RpcProto.ProtoData.Builder builder = RpcProto.ProtoData.newBuilder();
        builder.setEvent(false);
        builder.setTwoWay(true);
        builder.setIsRequest(true);
        return builder;
    }
}
