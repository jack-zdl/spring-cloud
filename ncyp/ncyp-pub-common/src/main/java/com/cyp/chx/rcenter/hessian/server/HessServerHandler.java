package com.cyp.chx.rcenter.hessian.server;

import com.cyp.chx.rcenter.hessian.bean.HessRequest;
import com.cyp.chx.rcenter.hessian.bean.HessResponse;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import net.sf.cglib.reflect.FastClass;
import net.sf.cglib.reflect.FastMethod;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.net.SocketAddress;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @Author：huanghaiyun
 * @Date:2017/12/7
 */
public class HessServerHandler extends SimpleChannelInboundHandler<HessRequest> {

    private static final Logger LOGGER = LoggerFactory.getLogger(HessServerHandler.class);

    private final Map<String, Object> handlerMap;

    private Map<ChannelHandlerContext,List<Long>> resulMap;

    public HessServerHandler(Map<String, Object> handlerMap,Map<ChannelHandlerContext,List<Long>> resulMap) {
        this.handlerMap = handlerMap;
        this.resulMap=resulMap;
    }

    @Override
    public void channelRead0(final ChannelHandlerContext ctx, HessRequest request) throws Exception {
        // 创建并初始化 RPC 响应对象
        HessResponse response = null;
        Long id=null;
        List<Long> list=resulMap.get(ctx);
        try {
            if(list==null){
                list=new ArrayList<>();
                resulMap.put(ctx,list);
            }
            id=request.getId();
            list.add(id);
            response = new HessResponse(request.getId());
            Object value = handle(request);
            response.setResult(value);

        } catch (Exception e) {
            LOGGER.error("handle result failure", e);
            response.setResult(e);
            response.setOk(false);
        }
        // 写入 RPC 响应对象并自动关闭连接
        ctx.writeAndFlush(response);
        if(id!=null){
            list.remove(id);
        }
    }

    private Object handle(HessRequest request) throws Exception {
        // 获取服务对象
        String serviceVersion = request.getVersion();
        String serviceName=request.getPath();
        if (StringUtils.isNotEmpty(serviceVersion)) {
            serviceName += "-" + serviceVersion;
        }
        Object serviceBean = handlerMap.get(serviceName);
        if (serviceBean == null) {
            throw new RuntimeException(String.format("can not find service bean by key: %s", serviceName));
        }
        // 获取反射调用所需的参数
        Class<?> serviceClass = serviceBean.getClass();
        String methodName = request.getMethodName();
        Class<?>[] parameterTypes = request.getParameterTypes();
        Object[] parameters = request.getParams();
        // 执行反射调用
//        Method method = serviceClass.getMethod(methodName, parameterTypes);
//        method.setAccessible(true);
//        return method.invoke(serviceBean, parameters);
        // 使用 CGLib 执行反射调用
        FastClass serviceFastClass = FastClass.create(serviceClass);
        FastMethod serviceFastMethod = serviceFastClass.getMethod(methodName, parameterTypes);
        return serviceFastMethod.invoke(serviceBean, parameters);
    }

    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) {
        LOGGER.error("server caught exception", cause);
        ctx.close();
    }
}
