package com.ceying.triagreement.stream.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.messaging.Source;
import org.springframework.integration.annotation.InboundChannelAdapter;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 功能说明:    <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间:2018/6/26 22:49<br>
 * <br>
 */
@EnableBinding(Source.class) //该接口是Spring Cloud Stream中默认实现的对输入消息通道绑定的定义，
public class SinkSender {

    private static Logger logger = LoggerFactory.getLogger(SinkSender.class);

    @InboundChannelAdapter(value = Source.OUTPUT)
    public String timerMessageSource() {
        String format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        logger.error("-----------------------------  start  -----------------------------------------");
        logger.info("publish message :"+format);
        logger.error("-----------------------------  end  -----------------------------------------");
        return format;
    }
}
