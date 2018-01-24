package com.cyp.chx.rcenter.controller;

import com.alibaba.fastjson.JSONObject;
import com.cyp.chx.common.entity.TripartiteagreementTemplateEntity;
import com.cyp.chx.common.service.RpcCommonService;
import com.cyp.chx.common.util.response.RespJson;
import com.cyp.chx.common.util.response.RespJsonFactory;
import com.cyp.chx.rcenter.client.RpcServiceFactory;
import com.cyp.chx.rcenter.config.RpcConfig;
import com.cyp.chx.rcenter.service.HelloService;
import com.cyp.chx.rcenter.service.Person;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author：zhangdelei000@gmail.com
 * @Date:2017/12/26
 */
@RestController
@RequestMapping("/common")
public class CommonController {
    @Autowired
    private RpcServiceFactory rpcServiceFactory;
    @Autowired
    private RpcConfig rpcConfig;

    /**
     * 在公共工程的接口是无法使用的，必须是自己工程的接口，并且这个接口的目录结构必须相同。
     * @return
     */
    @GetMapping("/test")
    public RespJson test(){
        RespJson  name = null;
        try {
            RpcCommonService service=rpcServiceFactory.createByName(RpcCommonService.class,"provice");
            TripartiteagreementTemplateEntity tripartiteagreementTemplateEntity = new TripartiteagreementTemplateEntity();
            tripartiteagreementTemplateEntity.setUrid("11111");
            name = service.rpcObjectService(tripartiteagreementTemplateEntity);
            System.out.println(name);
            System.out.println("==========:"+JSONObject.toJSONString(rpcConfig.getRegistAddress()));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return name;
    }

    /**
     * 在公共工程的接口是无法使用的，必须是自己工程的接口，并且这个接口的目录结构必须相同。
     * @return
     */
    @GetMapping("/objec")
    public RespJson testObject(){
        Person person = null;
        try {
            HelloService service=rpcServiceFactory.createByName(HelloService.class,"provice");
             person = new Person();
            person.setName("zhangdelei");
            person.setAge(11);
            Person name = service.helloPerson(person);
            System.out.println(name);
            System.out.println("==========:"+JSONObject.toJSONString(rpcConfig.getRegistAddress()));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return RespJsonFactory.buildSuccess(person);
    }

}
