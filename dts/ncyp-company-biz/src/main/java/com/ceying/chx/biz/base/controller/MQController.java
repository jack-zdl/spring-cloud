package com.ceying.chx.biz.base.controller;

import com.ceying.chx.biz.base.dao.TOrderMapper;
import com.ceying.chx.biz.base.dao.TestMapper;
import com.ceying.chx.biz.base.entity.TOrder;
import com.ceying.chx.biz.base.entity.TestEntity;
import com.ceying.chx.biz.base.fegin.MQFeginClient;
import com.ceying.chx.config.mq.Barista;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * 功能说明: 使用rabbitmq的形式来分布式事物<br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/3/12 17:24<br>
 */
@RestController
@RequestMapping("/mq")
public class MQController {

    @Autowired
    private MQFeginClient mqFeginClient;

    @Autowired
    private TestMapper testMapper;

    @Autowired
    private TOrderMapper orderMapper;

    @Autowired
    private Barista source;

    @GetMapping(value = "/asynchronous/{name}")
    public String test(@PathVariable String name){
        //mqFeginClient.index(name)
        return null;
    }

    @GetMapping(value = "/local")
    public TestEntity local(){
        TestEntity testEntity = new TestEntity();
        testEntity.setId(100);
        testEntity.setUserId("local");
        int number = testMapper.save(testEntity);
        return  testEntity;
    }

    @GetMapping(value = "/order")
    public List order(){
        TOrder tOrder = new TOrder();
//        tOrder.setOrderId(1);
//        tOrder.setUserId(1);
//        orderMapper.save(tOrder);
//
//        TOrder tOrder1 = new TOrder();
//        tOrder.setOrderId(2);
//        tOrder.setUserId(2);
//        orderMapper.save(tOrder1);
        // 执行完本地的事物方法，开始发送mq
        TOrder tOrder2 = new TOrder();
        source.logOutPut().send(MessageBuilder.withPayload(tOrder2).build());
        System.out.println("发送mq信息");
        List list = new ArrayList();
        list.add(tOrder);
//        list.add(tOrder1);
        return  list;
    }
}
