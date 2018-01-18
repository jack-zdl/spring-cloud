package com.ceying.chx;

import com.ceying.chx.biz.base.config.IPBlack;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.concurrent.ConcurrentMapCacheManager;
import org.springframework.cache.ehcache.EhCacheManagerFactoryBean;
import org.springframework.cache.support.SimpleCacheManager;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.validation.beanvalidation.MethodValidationPostProcessor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;


/**
 * 功能说明: biz的主方法
 *           <p>@Configuration 主要是跟着MethodValidationPostProcessor 来做方法校验</p>
 *           <p>@EnableTransactionManagement 启动springboot 事物注解</p>
 *           <br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl
 * 开发时间: 2017/11/9 11:13<br>
 */
@SpringBootApplication
//@RestController
@EnableTransactionManagement
@Configuration
@EnableConfigurationProperties({IPBlack.class})
@EnableCaching  // 开启缓存，需要显示的指定
public class NcypBankBizApplication {

    @Bean
    public
    CacheManager cacheManager(){
        return new ConcurrentMapCacheManager();
    }

    @Bean
    public
    EhCacheManagerFactoryBean ehCache(){
        EhCacheManagerFactoryBean ehCacheManagerFactoryBean = new EhCacheManagerFactoryBean();
        ehCacheManagerFactoryBean.setConfigLocation(new ClassPathResource("ehcache.xml"));
        return ehCacheManagerFactoryBean;
    }
    /**
     * 开启方法级别的参数校验
     * @return MethodValidationPostProcessor spring做方法级校验的类
     */
    @Bean
    public
    MethodValidationPostProcessor methodValidationPostProcessor() {
        return new MethodValidationPostProcessor();
    }



	public static void main(String[] args) {
		SpringApplication.run(NcypBankBizApplication.class, args);
	}
//    @Value("${server.port}")
//    String port ;
//    @RequestMapping("/hi")
//    public String home(@RequestParam String name) {
//        return "hi "+name+",i am from port:" +port;
//    }
}
