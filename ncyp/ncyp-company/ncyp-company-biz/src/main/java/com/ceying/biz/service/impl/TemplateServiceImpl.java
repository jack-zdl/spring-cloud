package com.ceying.biz.service.impl;

import com.ceying.biz.feign.SystemFeignClient;
import com.ceying.biz.service.TemplateService;
import com.ceying.chx.common.entity.triagreementtemp.TripartiteagreementTemplate;
import com.ceying.chx.common.util.response.RespJson;
import com.ceying.chx.common.util.response.RespJsonFactory;
import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 * 功能说明: Template的实现类   <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间:2018/6/22 16:21<br>
 * <br>
 */
@Service
@Qualifier("templateServiceImpl")
public class TemplateServiceImpl implements TemplateService {

    @Autowired
    private SystemFeignClient systemFeignClient;

    @Override
    public RespJson save() {
        System.out.println("111111111");
        TripartiteagreementTemplate tripartiteagreementTemplate = new TripartiteagreementTemplate();
        RespJson respJson = getFegin(tripartiteagreementTemplate);
        return respJson;
    }

    @HystrixCommand(fallbackMethod = "hiConsumerFallBack",ignoreExceptions = Exception.class)
    public RespJson getFegin(TripartiteagreementTemplate tripartiteagreementTemplate){
        RespJson respJson = systemFeignClient.agreementTemplateAdd(tripartiteagreementTemplate);
        return respJson;
    }

    /**
     * fallbackMethod 方法，String id 是原方法的参数，Throwable e 是发生的异常
     */
    public RespJson hiConsumerFallBack(TripartiteagreementTemplate tripartiteagreementTemplate, Throwable e) {
        RespJson respJson = RespJsonFactory.buildSuccess("333",tripartiteagreementTemplate);
        return respJson;
    }

    /**
     * 默认函数，必须无参
     * @return
     */
    public RespJson defaultBack(){
        return RespJsonFactory.buildFailure("默认函数");
    }
}
