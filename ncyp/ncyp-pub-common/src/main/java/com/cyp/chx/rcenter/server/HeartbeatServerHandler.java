package com.cyp.chx.rcenter.server;

import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;
import io.netty.handler.timeout.IdleState;
import io.netty.handler.timeout.IdleStateEvent;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;
import java.util.Map;

/**
 * 说明：心跳服务器处理器
 *
 */
public class HeartbeatServerHandler extends ChannelInboundHandlerAdapter {
	private  Map<ChannelHandlerContext,List<Long>> resulMap;
	private static final Logger LOGGER = LoggerFactory.getLogger(HeartbeatServerHandler.class);

	public HeartbeatServerHandler( Map<ChannelHandlerContext,List<Long>> resulMap){
		this.resulMap=resulMap;
	}

	@Override
	public void userEventTriggered(ChannelHandlerContext ctx, Object evt)
			throws Exception {

		if (evt instanceof IdleStateEvent) {
			IdleStateEvent event = (IdleStateEvent) evt;
			if (event.state() == IdleState.ALL_IDLE) {
				if(resulMap!=null&&resulMap.get(ctx)!=null&&resulMap.get(ctx).size()<=0){
					LOGGER.error("address："+ctx.channel().remoteAddress()+"\t长时间未收发数据\t resultMap size:"+resulMap.size());
				}else{
					ctx.close();
					LOGGER.info("address："+ctx.channel().remoteAddress()+"\t长时间未发送数据，通道关闭！");
				}
			}
		} else {
			super.userEventTriggered(ctx, evt);
		}
	}
}
