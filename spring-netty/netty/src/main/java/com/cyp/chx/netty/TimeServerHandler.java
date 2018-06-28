package com.cyp.chx.netty;

import io.netty.buffer.ByteBuf;
import io.netty.buffer.Unpooled;
import io.netty.channel.ChannelHandlerAdapter;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;

import java.io.UnsupportedEncodingException;


/**
 * 功能说明:    <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间:2018/6/9 22:42<br>
 * <br>
 */
public class TimeServerHandler extends ChannelInboundHandlerAdapter  {  //ChannelInboundHandlerAdapter  ChannelHandlerAdapter

    @Override
    public void channelRead(ChannelHandlerContext ctx,Object msg) throws Exception  {
        // 将msg转换成Netty的ByteBuf对象
        ByteBuf buf = (ByteBuf) msg;
        // 获取缓存区可读字节数
        byte[] req = new byte[buf.readableBytes()];
        // 将缓存区字节数组复制到新建的Byte数组中，
        buf.readBytes(req);
        // 构造函数获取请求消息
        String body = new String(req,"UTF-8");

        System.out.println("the time server receive order :"+body);
        // 如果是 “” 则创建应答消息，通过ChannelHnadlerContext的write方法异步发送应答消息给客户端
        String currentTime = "QUERY TIME ORDER".equalsIgnoreCase(body) ? new java.util.Date(
                System.currentTimeMillis()).toString() : "BAD ORDER";
        //
        ByteBuf resp = Unpooled.copiedBuffer(currentTime.getBytes());
        ctx.write(resp);
    }
    @Override
    public void channelReadComplete(ChannelHandlerContext ctx){
        System.out.println("读完了");
        // 将发送缓存区消息全部写到SocketChannel发送给对象
        ctx.flush();
    }

    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
        cause.printStackTrace();
        // 关闭ChannelHandlerContext释放，及其相关的资源
        ctx.close();
    }
}
