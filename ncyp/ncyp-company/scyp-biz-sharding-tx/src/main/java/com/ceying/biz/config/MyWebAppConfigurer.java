package com.ceying.biz.config;

import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * @author: zhangdl<br>
 * @date: 2018/3/29 11:27<br>
 * @version: 2.0 <br>
 * @description: <br>
 */

public class MyWebAppConfigurer  { //extends WebMvcConfigurerAdapter

//    @Override
//    public void addInterceptors(InterceptorRegistry registry) {
//     //多个拦截器组成一个拦截器链
//     //addPathPatterns 用于添加拦截规则
//     //excludePathPatterns 用户排除拦截
//     //注册拦截器
//        InterceptorRegistration ir = registry.addInterceptor(new TokenInterceptor());
//        // 配置拦截的路径
//        ir.addPathPatterns("/**");
//        // 配置不拦截的路径
//        ir.excludePathPatterns("/cpi/base/login");
//
//
//        registry.addInterceptor(new CommonInterceptor()).addPathPatterns("/**");
//        registry.addInterceptor(new IPInterceptor()).addPathPatterns("/**");
////        registry.addInterceptor(new TokenInterceptor()).addPathPatterns("/**").excludePathPatterns("/cpi/base/login");
////        registry.addInterceptor(new TokenInterceptor()).addPathPatterns("/**").excludePathPatterns("/login");
//        super.addInterceptors(registry);
//    }
}
