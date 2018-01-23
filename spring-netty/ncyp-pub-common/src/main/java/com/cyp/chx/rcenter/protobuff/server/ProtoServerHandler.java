package com.cyp.chx.rcenter.protobuff.server;

import com.alibaba.fastjson.JSONObject;
import com.cyp.chx.rcenter.protobuff.bean.RpcProto;
import com.cyp.chx.rcenter.protobuff.bean.ProtoRequest;
import com.cyp.chx.rcenter.protobuff.bean.ProtoResponse;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import net.sf.cglib.reflect.FastClass;
import net.sf.cglib.reflect.FastMethod;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @Author：huanghaiyun
 * @Date:2017/12/7
 */
public class ProtoServerHandler extends SimpleChannelInboundHandler<RpcProto.ProtoData> {

    private static final Logger LOGGER = LoggerFactory.getLogger(ProtoServerHandler.class);

    private final Map<String, Object> handlerMap;
    private Map<ChannelHandlerContext,List<Long>> resulMap;//通道与 需要返回的个数

    public ProtoServerHandler(Map<String, Object> handlerMap,Map<ChannelHandlerContext,List<Long>> resulMap) {
        this.handlerMap = handlerMap;
        this.resulMap=resulMap;
    }

    @Override
    public void channelRead0(final ChannelHandlerContext ctx, RpcProto.ProtoData request) throws Exception {
        ProtoResponse response=null;
        Long id=null;
        List<Long> list=resulMap.get(ctx);
        // 写入 RPC 响应对象并自动关闭连接
        ctx.writeAndFlush(response);
        try {
            if(list==null){
                list=new ArrayList<>();
                resulMap.put(ctx,list);
            }
            id=request.getID();
            list.add(id);
            response=new ProtoResponse(id);
            Object value = handle(request);
            response.setResult(JSONObject.toJSONString(value));
            response.setResultType(value.getClass().getName());
        } catch (Exception e) {
            LOGGER.error("handle result failure", e);
            response.setResult(e);
            response.setOk(false);
        }
        RpcProto.ProtoData data = resp(request.getID(),JSONObject.toJSONString(response));
        ctx.writeAndFlush(data);
        if(id!=null){
            list.remove(id);
        }
    }

    private Object handle(RpcProto.ProtoData data) throws Exception {
        // 获取服务对象
        ProtoRequest request=JSONObject.parseObject(data.getDataValue(),ProtoRequest.class);
        String serviceVersion = request.getVersion();
        String serviceName=request.getPath();
//        if (StringUtils.isNotEmpty(serviceVersion)) {
//            serviceName += "-" + serviceVersion;
//        }
        Object serviceBean = handlerMap.get(serviceName);
        if (serviceBean == null) {
            throw new RuntimeException(String.format("can not find service bean by key: %s", serviceName));
        }
        // 获取反射调用所需的参数
        Class<?> serviceClass = serviceBean.getClass();
        String methodName = request.getMethodName();
        Class<?>[] parameterTypes =request.getParameterTypes();
//        String[] obj=request.getParams().split("###");
//        JSONArray json=JSONArray.parseArray(request.getParams().toString());
        Object[] parameters =new Object[parameterTypes.length];
        for(int i=0;i<parameterTypes.length;i++){
            Object ob=request.getParams()[i];
            JSONObject jsonObjects1=null;
            if( ob instanceof  JSONObject){
                jsonObjects1= (JSONObject) request.getParams()[i];
                parameters[i]=jsonObjects1.toJavaObject(parameterTypes[i]);
            }else{
                parameters[i]=ob;
            }
        }
        // 使用 CGLib 执行反射调用
        FastClass serviceFastClass = FastClass.create(serviceClass);
        FastMethod serviceFastMethod = serviceFastClass.getMethod(methodName, parameterTypes);
        return serviceFastMethod.invoke(serviceBean, parameters);
    }
    private RpcProto.ProtoData resp(long id,String result) {
        RpcProto.ProtoData.Builder builder = RpcProto.ProtoData.newBuilder();
        builder.setID(id);
        builder.setEvent(false);
        builder.setDataValue(result);
        return builder.build();
    }

    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) {
        LOGGER.error("server caught exception", cause);
        ctx.close();
    }
}
