package com.cyp.chx.netty;

import io.netty.bootstrap.Bootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;

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
                        @Override
                        protected void initChannel(SocketChannel ch) throws Exception {
                            ch.pipeline().addLast(new TimeClientHandler());
                        }
                    });
            // 发起异步操作
            ChannelFuture f = b.connect(host,port).sync();

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
