package com.cyp.chx.netty;

import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.*;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioServerSocketChannel;

/**
 * 功能说明:    <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间:2018/6/9 22:30<br>
 * <br>
 */
public class TimeServer {

    public void bind(int port)  {
        // 线程组 NIO线程  就是Reactor线程组 多路复用器
        EventLoopGroup bossGroup = new NioEventLoopGroup();  // 一个服务端接受客户端连接
        EventLoopGroup workerGroup = new NioEventLoopGroup();  // 用于SocketChannel的网络读写
        try {
            // 它是netty用来启动NIO服务端的辅助启动类，目的降低服务端的开发复杂度
            ServerBootstrap b = new ServerBootstrap();
            // 调用group 将二个NIO线程组传递ServerBootstrap
            b.group(bossGroup, workerGroup)
                    // 创建的Channel为NioServerSocketChannel
                    .channel(NioServerSocketChannel.class)
                    // 配置TCP参数，将backlog设置为1024
                    .option(ChannelOption.SO_BACKLOG, 1024)
                    //  绑定IO事件处理类  ChildChannelHnader  作用类似Reactor模式Handler类，主要处理网络IO事件，记录日志，对消息进行编码
                    .childHandler(new ChildChannelHnader());  //  这个ChildChannelHander是我的具体处理逻辑
            /**
             * 另外一种写法
             * .childHnadler(new ChannelInitializer<SocketChannel>(){
             *      @Override
             *      protected void initChannel(SocketChannel ch) throws Exception {
             *        ch.pipeline().addLast(new TimeServerHandler());
             *        }
             * }</>)
             */
            // 绑定端口，同步等待成功
            ChannelFuture f = b.bind(port).sync();
            // 等待服务费监听端口失败
            f.channel().closeFuture().sync();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            // 释放shutdownGracefully释放相关资源
            bossGroup.shutdownGracefully();
            workerGroup.shutdownGracefully();
        }
    }

    private class ChildChannelHnader extends ChannelInitializer<SocketChannel>{

        @Override
        protected void initChannel(SocketChannel arg0) {
            arg0.pipeline().addLast( new TimeServerHandler());
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
        new TimeServer().bind(port);
    }
}
