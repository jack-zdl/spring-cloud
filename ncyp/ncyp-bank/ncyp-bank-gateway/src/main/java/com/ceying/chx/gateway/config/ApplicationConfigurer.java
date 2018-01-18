package com.ceying.chx.gateway.config;

//import org.springframework.boot.web.servlet.ServletListenerRegistrationBean;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;

/**
 * 功能说明:  通过bean的形式配置listern<br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2017/12/28 16:44<br>
 * <br>
 */

/**
 * Spring Boot 提供了 ServletRegistrationBean、FilterRegistrationBean、
 ServletListenerRegistrationBean 三种类型来分别配置应用的 Servlet、Filter、Listener。
 # 在 Spring Boot 应用中配置使用 Servlet、Filter、Listener
 */
//@Configuration
public class ApplicationConfigurer {

    /**
     * 通过ServletListenerRegistrationBean将配置Listener
     * @return
     */
//    @Bean
//    public
//    ServletListenerRegistrationBean<?> registerCustomListener() {
//        return new ServletListenerRegistrationBean<>(new CustomListener());
//    }

//    @Bean
//    public FilterRegistrationBean registerCustomFilter() {
//        FilterRegistrationBean filterRegBean = new FilterRegistrationBean(new CustomFilter());
//        filterRegBean.setUrlPatterns(Arrays.asList("/*"));
//        return filterRegBean;
//    }
//
//    @Bean
//    public ServletRegistrationBean registerCustomServlet() {
//        ServletRegistrationBean servletRegBean = new ServletRegistrationBean(new CustomServlet());
//        servletRegBean.setUrlMappings(Arrays.asList("/customServlet"));
//        servletRegBean.setLoadOnStartup(1);
//        return servletRegBean;
//    }
}
