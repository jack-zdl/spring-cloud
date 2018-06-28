package com.cyp.chx.netty;

import io.netty.buffer.ByteBuf;
import io.netty.buffer.Unpooled;
import io.netty.channel.ChannelHandlerAdapter;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;

import java.io.UnsupportedEncodingException;
import java.util.logging.Logger;

/**
 * 功能说明:    <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间:2018/6/10 16:34<br>
 * <br>
 */
public class TimeClientHandler extends ChannelInboundHandlerAdapter {  //  ChannelHandlerAdapter   ChannelInboundHandlerAdapter
    private static final Logger logger =Logger.getLogger(TimeClientHandler.class.getName());

    private final ByteBuf firstMessage;

    public TimeClientHandler() {
        byte[] req = "QUERY TIME ORDER".getBytes();
        firstMessage = Unpooled.buffer(req.length);
        firstMessage.writeBytes(req);
    }

    // 当客户端和服务端TCP链路建立成功，Netty的NIO线程调用channelActive方法，发生查询时间指令给客户端，调用writeAndFlush
    // 方法将请求消息发送服务端
    @Override
    public void channelActive(ChannelHandlerContext ctx){
        logger.warning("0000nexpected exception from downstream");
        ctx.writeAndFlush(firstMessage);
    }

    // 当服务端返回应答消息，channelRead从Netty的ByteBuf中读取并打印应答消息
    @Override
    public void channelRead(ChannelHandlerContext ctx,Object msg) throws UnsupportedEncodingException {
        ByteBuf buf = (ByteBuf) msg;
        byte[] req = new byte[buf.readableBytes()];
        buf.readByte();
        String body = new String(req,"UTF-8");
        System.out.println("Now is:"+body);
    }

    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
        logger.warning("11111Unexpected exception from downstream"+cause.getMessage());
        ctx.close();
    }
}
