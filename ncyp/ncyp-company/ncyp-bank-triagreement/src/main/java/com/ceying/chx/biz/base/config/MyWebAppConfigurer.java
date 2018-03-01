package com.ceying.chx.biz.base.config;

import com.ceying.chx.biz.base.interceptor.IPInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * 功能说明: 为了使自定义的拦截器生效，需要注册拦截器到spring容器中，
 *          具体的做法是继承WebMvcConfigurerAdapter类，覆盖其addInterceptors(InterceptorRegistry registry)方法。
 *          最后别忘了把Bean注册到Spring容器中，可以选择@Component 或者 @Configuration。
 *          <br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2017/11/13 22:27<br>
 * <br>
 */

@Configuration
public class MyWebAppConfigurer extends WebMvcConfigurerAdapter {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new IPInterceptor()).addPathPatterns("/**");
    }
}
