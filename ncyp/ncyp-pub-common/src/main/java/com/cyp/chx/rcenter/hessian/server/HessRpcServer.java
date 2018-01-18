package com.cyp.chx.rcenter.hessian.server;

import com.cyp.chx.rcenter.config.RpcConfig;
import com.cyp.chx.rcenter.server.HeartbeatHandlerInitializer;
import com.cyp.chx.rcenter.server.NettyServer;
import com.cyp.chx.rcenter.bean.Url;
import com.cyp.chx.rcenter.hessian.code.Decode;
import com.cyp.chx.rcenter.hessian.code.Encode;
import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.*;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @Author：huanghaiyun
 * @Date:2017/12/18
 */
public class HessRpcServer extends NettyServer {

    private Logger LOGGER = LoggerFactory.getLogger(HessRpcServer.class);
    private Url url;
    private Map<String, Object> handlerMap; // 存放接口名与服务对象之间的映射关系
    private Map<ChannelHandlerContext,List<Long>> resulMap=new ConcurrentHashMap<ChannelHandlerContext,List<Long>>();//通道与 需要返回的个数
    private RpcConfig rpcConfig;
    public HessRpcServer( Url url, Map<String, Object> handlerMap,RpcConfig rpcConfig){
        this.url=url;
        this.handlerMap=handlerMap;
        this.rpcConfig=rpcConfig;
    }
    @Override
    public void start() {
        EventLoopGroup bossGroup = new NioEventLoopGroup();
        EventLoopGroup workerGroup = new NioEventLoopGroup();
        try {
            // 创建并初始化 Netty 服务端 Bootstrap 对象
            ServerBootstrap bootstrap = new ServerBootstrap();
            bootstrap.group(bossGroup, workerGroup);
            bootstrap.channel(NioServerSocketChannel.class);
            bootstrap.childHandler(new ChannelInitializer<SocketChannel>() {
                @Override
                public void initChannel(SocketChannel channel) throws Exception {
                    ChannelPipeline pipeline = channel.pipeline();
                    pipeline.addLast(new Decode()); // 解码 RPC 请求
                    pipeline.addLast(new Encode()); // 编码 RPC 响应
                    pipeline.addLast(new HessServerHandler(handlerMap,resulMap)); // 处理 RPC 请求
                    pipeline.addLast(new HeartbeatHandlerInitializer(resulMap,rpcConfig));
                }
            });
            bootstrap.option(ChannelOption.SO_BACKLOG, 1024);
            bootstrap.childOption(ChannelOption.SO_KEEPALIVE, true);
            // 启动 RPC 服务器
            ChannelFuture future = bootstrap.bind(url.getHost(), url.getPort()).sync();

            LOGGER.debug("server started on port {}", url.getPort());
            // 关闭 RPC 服务器
            future.channel().closeFuture().sync();
        } catch (Exception e){
            LOGGER.error("rpc 对外提供服务线程启动失败",e);
        }finally {
            workerGroup.shutdownGracefully();
            bossGroup.shutdownGracefully();
        }
    }
}
