package com.zhang.cloud.microservicesimpleconsumermovie;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.cloud.netflix.ribbon.RibbonClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.web.client.RestTemplate;

/**
 * @ComponentScan(excludeFilters = {@ComponentScan.Filter(type= FilterType.ANNOTATION, value = ExcludeFromComponentScan.class)})
 * 这行代码意思
 * 1 是FooConfiguration 类在main主类的外面，
 * 2 使用自定义注解 使其可以在同一包内 使其可以设定接口的不同的轮询方式
 */
@SpringBootApplication
@EnableDiscoveryClient
public class MicroserviceSimpleConsumerMovieRibbonPropertiesApplication {

	/**
	 * @Bean 相当于 private RestTemplate restTemplate = new restTemplate();
	 * @return
	 */
	@Bean
	@LoadBalanced   //这个注解就是整合ribbon
	public RestTemplate restTemplate(){
		return new RestTemplate();
	}

	public static void main(String[] args) {
		SpringApplication.run(MicroserviceSimpleConsumerMovieRibbonPropertiesApplication.class, args);
	}
}
