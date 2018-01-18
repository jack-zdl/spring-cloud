package com.cyp.chx.rcenter.protobuff.server;

import com.cyp.chx.rcenter.bean.Url;
import com.cyp.chx.rcenter.config.RpcConfig;
import com.cyp.chx.rcenter.protobuff.bean.RpcProto;
import com.cyp.chx.rcenter.server.HeartbeatHandlerInitializer;
import com.cyp.chx.rcenter.server.NettyServer;
import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.*;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import io.netty.handler.codec.protobuf.ProtobufDecoder;
import io.netty.handler.codec.protobuf.ProtobufEncoder;
import io.netty.handler.codec.protobuf.ProtobufVarint32FrameDecoder;
import io.netty.handler.codec.protobuf.ProtobufVarint32LengthFieldPrepender;
import io.netty.handler.logging.LogLevel;
import io.netty.handler.logging.LoggingHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @Author：huanghaiyun
 * @Date:2017/12/20
 */
public class ProtoRpcServer extends NettyServer {
    private Logger LOGGER = LoggerFactory.getLogger(ProtoRpcServer.class);
    private Url url;
    private Map<String, Object> handlerMap = new HashMap<>(); // 存放接口名与服务对象之间的映射关系
    private Map<ChannelHandlerContext,List<Long>> resulMap=new ConcurrentHashMap<ChannelHandlerContext,List<Long>>();//通道与 需要返回的个数
    private RpcConfig rpcConfig;
    public ProtoRpcServer(Url url, Map<String, Object> handlerMap,RpcConfig rpcConfig){
        this.url=url;
        this.handlerMap=handlerMap;
        this.rpcConfig=rpcConfig;
    }
    @Override
    public void start(){
        // 配置服务端的NIO线程组
        EventLoopGroup bossGroup = new NioEventLoopGroup();
        EventLoopGroup workerGroup = new NioEventLoopGroup();
        try {
            ServerBootstrap b = new ServerBootstrap();
            b.group(bossGroup, workerGroup)
                    .channel(NioServerSocketChannel.class)
                    .option(ChannelOption.SO_BACKLOG, 100)
                    .handler(new LoggingHandler(LogLevel.INFO))
                    .childHandler(new ChannelInitializer<SocketChannel>() {
                        @Override
                        public void initChannel(SocketChannel ch) {
                             ch.pipeline().addLast(
                             new ProtobufVarint32FrameDecoder());
                            ch.pipeline().addLast(
                                    new ProtobufDecoder(
                                            RpcProto.ProtoData
                                                    .getDefaultInstance()));
                            ch.pipeline().addLast(
                                    new ProtobufVarint32LengthFieldPrepender());
                            ch.pipeline().addLast(new ProtobufEncoder());
                            ch.pipeline().addLast(new ProtoServerHandler(handlerMap,resulMap));
                            ch.pipeline().addLast(new HeartbeatHandlerInitializer(resulMap,rpcConfig));

                        }
                    });

            // 绑定端口，同步等待成功
            ChannelFuture f = b.bind(url.getHost(),url.getPort()).sync();
            // 等待服务端监听端口关闭
            f.channel().closeFuture().sync();
        } catch (Exception e){
            LOGGER.error("rpc 对外提供服务线程启动失败",e);
        }finally {
            // 优雅退出，释放线程池资源
            bossGroup.shutdownGracefully();
            workerGroup.shutdownGracefully();
        }
    }
}
