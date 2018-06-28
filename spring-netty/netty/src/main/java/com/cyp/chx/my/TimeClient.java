package com.cyp.chx.my;

import io.netty.bootstrap.Bootstrap;
import io.netty.buffer.Unpooled;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.codec.LineBasedFrameDecoder;
import io.netty.handler.codec.string.StringDecoder;

/**
 * 功能说明:    <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间:2018/6/10 16:17<br>
 * <br>
 */
public class TimeClient {

    public void connect (int port,String host) throws InterruptedException {
        // 配置客户端NIO 线程组
        EventLoopGroup group = new NioEventLoopGroup();
        try {
            // 客户端辅助启动类
            Bootstrap b = new Bootstrap();
            // channel需要设置NioSocketChannel
            b.group(group).channel(NioSocketChannel.class)
                    .option(ChannelOption.TCP_NODELAY,true)
                    .handler(new ChannelInitializer<SocketChannel>() {
                        // 简单直接创建内部类，创建NioSocketChannel成功以后，在初始化时，将ChannelHnadler设置到ChannelPipeline中，用于处理网络IO事件

                        /**
                         *  增加解码器
                         * @param ch
                         * @throws Exception
                         */
                        @Override
                        protected void initChannel(SocketChannel ch) throws Exception {
                            ch.pipeline().addLast(new LineBasedFrameDecoder(1024));
                            ch.pipeline().addLast(new StringDecoder());
                            ch.pipeline().addLast(new TimeClientHandler());  // 当服务端请求数据返回客户端处理逻辑
                        }
                    });
            // 发起异步操作
            ChannelFuture f = b.connect(host,port).sync();
            ChannelFuture f1 = b.connect(host,1111).sync();
//
//            f.channel().write(Unpooled.copiedBuffer("777".getBytes()));
//            f.channel().flush();
            f.channel().closeFuture().sync();
            f.channel().closeFuture().sync();
        }finally {
            // 优雅退出，释放NIO线程组
            group.shutdownGracefully();
        }
    }

    public static void main(String[] args) throws InterruptedException {
        int port = 8080;
        if(args != null && args.length >0){
           try {
            port = Integer.valueOf(args[0]);
           }catch (NumberFormatException e){
               e.printStackTrace();
           }
        }
        new TimeClient().connect(port,"127.0.0.1");
    }
}
