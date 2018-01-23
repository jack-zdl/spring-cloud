package com.ceying.chx;

import com.ceying.chx.common.util.convert.DateConvert;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;
import org.springframework.boot.autoconfigure.web.HttpMessageConverters;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ConversionServiceFactoryBean;
import org.springframework.core.convert.converter.Converter;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.client.RestTemplate;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@SpringBootApplication(exclude={DataSourceAutoConfiguration.class,HibernateJpaAutoConfiguration.class})
@EnableDiscoveryClient
@EnableCaching
public class NcypBankFrontApplication {

	public static void main(String[] args) {
		SpringApplication.run(NcypBankFrontApplication.class, args);
	}

    @Bean
    @LoadBalanced
    RestTemplate restTemplate() {
        return new RestTemplate();
	}

    /**
     * 前端传后端时间格式的转换
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
     * @return
     */
    @Bean
    public HttpMessageConverters customConverters() {
        Collection<HttpMessageConverter<?>> messageConverters = new ArrayList<>();
        MappingJackson2HttpMessageConverter bean = new MappingJackson2HttpMessageConverter();
        ObjectMapper mapper=new ObjectMapper();
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        mapper.setDateFormat(format);
        bean.setObjectMapper(mapper);
        messageConverters.add(bean);
        return new HttpMessageConverters(true, messageConverters);
    }
}
