package com.cyp.chx.rcenter.server;

import com.cyp.chx.rcenter.config.RpcConfig;
import io.netty.channel.Channel;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelPipeline;
import io.netty.handler.timeout.IdleStateHandler;

import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * 心跳服务器初始化
 */
public class HeartbeatHandlerInitializer extends ChannelInitializer<Channel> {
	private RpcConfig rpcConfig;
	private Map<ChannelHandlerContext,List<Long>> resulMap;

	public HeartbeatHandlerInitializer( Map<ChannelHandlerContext,List<Long>> resulMap,RpcConfig rpcConfig){
		this.resulMap=resulMap;
		this.rpcConfig=rpcConfig;
	}

	@Override
	protected void initChannel(Channel ch) throws Exception {
		ChannelPipeline pipeline = ch.pipeline();
		pipeline.addLast(new IdleStateHandler(rpcConfig.getReadTimeOut(),
				rpcConfig.getWriteTimeOut(), rpcConfig.getAllTimeOut(), TimeUnit.SECONDS));
		pipeline.addLast(new HeartbeatServerHandler(resulMap));
	}
}