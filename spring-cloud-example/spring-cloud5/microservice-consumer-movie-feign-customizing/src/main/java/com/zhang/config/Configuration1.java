package com.zhang.config;


import feign.Contract;
import feign.Logger;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 功能说明: 为figin提供的配置类,
 *          设置不在主程序下的包下，为了和不和@ComponentScan同包下<br>
 *              使用Configuration1类做的配置文件，所以配置文件 可以设置相应的日志配置
 *     @see com.zhang.cloud.microservicesimpleconsumermovie.feign.UserFeginClient
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/28 19:48<br>
 */

@Configuration
public class Configuration1 {

    @Bean
    public
    Contract feignContract() {
        return new feign.Contract.Default();
    }

    /**
     * 为UserFeignClient在相应的配置文件中配置日志
     * @return
     */
    @Bean
    Logger.Level feignLoggerLevel() {
        return Logger.Level.FULL;
    }

}
