package com.cyp.chx.rcenter.controller;

import com.alibaba.fastjson.JSONObject;
import com.cyp.chx.rcenter.client.RpcServiceFactory;
import com.cyp.chx.rcenter.config.RpcConfig;
import com.cyp.chx.rcenter.service.HelloService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author：huanghaiyun
 * @Date:2017/12/26
 */
@RestController
public class TestController {
    @Autowired
    private RpcServiceFactory rpcServiceFactory;
    @Autowired
    private RpcConfig rpcConfig;
    @RequestMapping("/test")
    public String test(){
        try {
            HelloService service=rpcServiceFactory.createByName(HelloService.class,"provice");
            String name=service.hello("asdas");
            System.out.println(name);
            System.out.println("==========:"+JSONObject.toJSONString(rpcConfig.getRegistAddress()));

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "hello";
    }
    @RequestMapping("/test1")
    public String test1(){
        int success=0;
        int fail=0;
        for(int i=0;i<10000;i++){
            try {
                HelloService service=rpcServiceFactory.createByName(HelloService.class,"provice");
                String name=service.hello("asdas");
                success++;

            } catch (Exception e) {
                fail++;
            }
        }
        System.out.println("success:"+success);
        System.out.println("fail:"+fail);
        return "hello";
    }
    @RequestMapping("/test2")
    public String test2(){
        try {
            HelloService service=rpcServiceFactory.createByName(HelloService.class,"provice");
            service.test2();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "hello";
    }
}
