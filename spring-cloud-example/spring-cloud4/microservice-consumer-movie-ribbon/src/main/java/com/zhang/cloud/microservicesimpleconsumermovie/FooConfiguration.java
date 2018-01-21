package com.zhang.cloud.microservicesimpleconsumermovie;

import com.netflix.client.config.IClientConfig;
import com.netflix.loadbalancer.IRule;
import com.netflix.loadbalancer.RandomRule;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 功能说明: 这是一个负载均衡的算法实现类，这个类不能再main函数包下，及其子包下所以必须在外面的包<br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2017/11/22 22:53<br>
 * <br>
 */

@SuppressWarnings("SpringJavaAutowiringInspection")
@Configuration
@ExcludeFromComponentScan
public class FooConfiguration {

    @Autowired
    private IClientConfig config;

    @Bean
    public
    IRule ribbonRule (IClientConfig config) {
        System.out.println();
        return new RandomRule();
    }


}
