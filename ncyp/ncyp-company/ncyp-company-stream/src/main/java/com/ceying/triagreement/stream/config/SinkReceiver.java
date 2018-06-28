package com.ceying.triagreement.stream.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.annotation.StreamListener;
import org.springframework.cloud.stream.messaging.Sink;

/**
 * 功能说明: 创建用于接收来自RabbitMQ消息的消费者SinkReceiver<br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/3/5 15:24<br>
 */
@EnableBinding(Sink.class) //该接口是Spring Cloud Stream中默认实现的对输入消息通道绑定的定义，
public class SinkReceiver {
    private static Logger logger = LoggerFactory.getLogger(SinkReceiver.class);


    /**
     * 注册为消息中间件的事件监听器
     * 注册为input消息通道的监听处理器
     * @param payload
     */
    @StreamListener(Sink.INPUT)
    public void receive(Object payload) {
        logger.info("Received: " + payload);
    }
}
