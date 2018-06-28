package com.ceying.chx.config.mq;

import org.springframework.cloud.stream.annotation.Input;
import org.springframework.cloud.stream.annotation.Output;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.SubscribableChannel;
import org.springframework.stereotype.Component;

/**
 * 功能说明: <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/3/19 16:34<br>
 */
public interface Barista {

    String INPUT_CHANNEL = "input_channel";
    String OUTPUT_CHANNEL = "output_channel";

    String INPUT1 = "input1";
    String OUTPUT1 = "output1";
    @Input
    SubscribableChannel orders();

    @Output
    MessageChannel hotDrinks();

    @Output
    MessageChannel coldDrinks();

    @Input(Barista.INPUT_CHANNEL)
    SubscribableChannel logInput();

    @Output(Barista.OUTPUT_CHANNEL)
    MessageChannel logOutPut();
}
