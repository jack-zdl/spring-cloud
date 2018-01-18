package com.cyp.chx.rcenter.hessian.client;

import com.cyp.chx.rcenter.bean.Storage;
import com.cyp.chx.rcenter.hessian.bean.HessRequest;
import com.cyp.chx.rcenter.hessian.bean.HessResponse;
import com.cyp.chx.rcenter.hessian.code.Decode;
import com.cyp.chx.rcenter.hessian.code.Encode;
import io.netty.bootstrap.Bootstrap;
import io.netty.channel.*;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.net.SocketAddress;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 共享连接的客户端（需要加上心跳来保持长连接）
 * @Author：huanghaiyun
 * @Date:2017/12/7
 */
@ChannelHandler.Sharable
public class HessClient extends SimpleChannelInboundHandler<HessResponse> {

    private static final Logger LOGGER = LoggerFactory.getLogger(HessClient.class);

    private static final HessClient INSTANCE=new HessClient();

    private Bootstrap bootstrap;
    private Map<Long,Storage> resulMap=new ConcurrentHashMap<Long,Storage>();
    private Map<String,Channel> clientMap=new ConcurrentHashMap<String,Channel>();
    private Map<String,Object> lockMap=new ConcurrentHashMap<String,Object>();

    private HessClient() {
    }

    public static HessClient getINSTANCE() {
        return INSTANCE;
    }

    @Override
    public void channelRead0(ChannelHandlerContext ctx, HessResponse response) throws Exception {
        Storage storage=resulMap.get(response.getId());
        if(storage!=null){
            storage.set(response);
            resulMap.remove(response.getId());
        }else{
            throw  new Exception("收到一条 没有记录的报文");
        }
    }

    /**
     * 连接被关闭
     * @param ctx
     * @throws Exception
     */
    @Override
    public void channelInactive(ChannelHandlerContext ctx) throws Exception {
        SocketAddress address=ctx.channel()
                .remoteAddress();
        String key=address.toString().replace("/","");
        clientMap.remove(key);
        lockMap.remove(key);
    }
    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
        LOGGER.error("api caught exception", cause);
        ctx.close();
    }

    public Storage send(String url, HessRequest request,long timeOut) throws Exception {
        Storage storage=new Storage(timeOut);
        resulMap.put(request.getId(),storage);
        Channel channel=getClient(url);
//        LOGGER.info("channel open:"+channel.isOpen());
        if(channel!=null){
            channel.write(request);
            channel.flush();
        }else{
            throw new Exception("没有channel");
        }
        return storage;
    }
    private Channel getClient(String url) throws InterruptedException {
        Object obj=lockMap.get(url);
        if(obj==null){
            obj=new Object();
            lockMap.put(url,obj);
        }
        Channel channel=null;
        synchronized (obj){
            channel= clientMap.get(url);
            if(channel!=null&&!channel.isActive()){
                clientMap.remove(url);
                channel=null;
            }
            if(channel==null){
                if(bootstrap==null){
                    EventLoopGroup group = new NioEventLoopGroup();
                    bootstrap = new Bootstrap();
                    bootstrap.group(group);
                    bootstrap.channel(NioSocketChannel.class);
                    bootstrap.handler(new ChannelInitializer<SocketChannel>() {
                        @Override
                        public void initChannel(SocketChannel channel) throws Exception {
                            ChannelPipeline pipeline = channel.pipeline();
                            pipeline.addLast(new Encode()); // 编码 RPC 请求
                            pipeline.addLast(new Decode()); // 解码 RPC 响应
                            pipeline.addLast(INSTANCE); // 处理 RPC 响应
                        }
                    });
                    bootstrap.option(ChannelOption.TCP_NODELAY, true);
                }
                String[] address=url.split(":");
                String host=address[0];
                int port=Integer.valueOf(address[1]);
                ChannelFuture channelFuture=bootstrap.connect(host, port).sync();
                channel=channelFuture.channel();
                clientMap.put(url,channel);
            }
        }
        return channel;
    }
}
