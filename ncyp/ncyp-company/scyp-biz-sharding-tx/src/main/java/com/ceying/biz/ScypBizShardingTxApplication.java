package com.ceying.biz;

import com.ceying.common.util.convert.DateConvert;
import com.ceying.common.util.upload.UploadUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.base.Strings;
import feign.Logger;
import feign.RequestInterceptor;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.web.HttpMessageConverters;
import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.convert.converter.Converter;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.context.request.RequestContextHolder;
import tk.mybatis.spring.annotation.MapperScan;


import javax.servlet.MultipartConfigElement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.concurrent.ThreadPoolExecutor;

@SpringBootApplication
@EnableEurekaClient
@EnableHystrix
@EnableRedisHttpSession(maxInactiveIntervalInSeconds = -1)
@EnableTransactionManagement
@EnableCaching
@ComponentScan(basePackages = {"com.ceying.biz", "com.ceying.eagleeye.common", "com.ceying.common"})
@MapperScan("com.ceying.biz.dao")
@EnableFeignClients(basePackages = {"com.ceying.common", "com.ceying.biz"})
//@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})  //要排除DataSourceAutoConfiguration，否则多数据源无法配置
public class ScypBizShardingTxApplication {

    public static void main(String[] args) {
        SpringApplication springApplication = new SpringApplication(ScypBizShardingTxApplication.class);
        springApplication.run(args);
    }

    /**
     * 前端传后端时间格式的转换
     *
     * @return
     */
    @Bean
    public Converter<String, Date> addNewConvert() {
        return new Converter<String, Date>() {
            @Override
            public Date convert(String source) {
                DateConvert sdf = new DateConvert();
                Date date = null;
                date = sdf.convert((String) source);
                return date;
            }
        };
    }

    /**
     * 后端传前端时间格式的转换
     *
     * @return
     */
    @Bean
    public HttpMessageConverters customConverters() {
        Collection<HttpMessageConverter<?>> messageConverters = new ArrayList<>();
        MappingJackson2HttpMessageConverter bean = new MappingJackson2HttpMessageConverter();
        ObjectMapper mapper = new ObjectMapper();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        mapper.setDateFormat(format);
        bean.setObjectMapper(mapper);
        messageConverters.add(bean);
        return new HttpMessageConverters(true, messageConverters);
    }

    @Bean
    public RequestInterceptor requestInterceptor() {
        return requestTemplate -> {
            try {
                String sessionId = RequestContextHolder.currentRequestAttributes().getSessionId();
                if (!Strings.isNullOrEmpty(sessionId)) {
                    requestTemplate.header("Cookie", "SESSION=" + sessionId);
                }
            } catch (IllegalStateException e) {
//                e.printStackTrace();
            }
        };
    }

    /**
     * 文件上传配置
     *
     * @return
     */
    @Bean
    public MultipartConfigElement multipartConfigElement() throws Exception {
        MultipartConfigFactory factory = new MultipartConfigFactory();
        //文件最大
        factory.setMaxFileSize("10MB");
        factory.setLocation(UploadUtil.getUploadLocation());
        return factory.createMultipartConfig();
    }

    @Bean
    ThreadPoolTaskExecutor sendTaskExecutor(){
        ThreadPoolTaskExecutor taskExecutor=new ThreadPoolTaskExecutor();
        taskExecutor.setCorePoolSize(30);//核心线程数
        taskExecutor.setMaxPoolSize(100);//最大线程数
        taskExecutor.setQueueCapacity(1000);//队列最大长度
        taskExecutor.setKeepAliveSeconds(60);//线程池维护线程所允许的空闲时间
        taskExecutor.setRejectedExecutionHandler(new ThreadPoolExecutor.CallerRunsPolicy());//线程池对拒绝任务(无线程可用)的处理策略
        return taskExecutor;
    }

    @Bean
    public Logger.Level feignLoggerLevel() {
        return feign.Logger.Level.FULL;
    }

}
