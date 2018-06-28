package com.ceying.chx;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;


@EnableZuulProxy        //开启Zuul的API网关服务
@EnableDiscoveryClient
@SpringBootApplication
public class NcypCompanyGatewayApplication {

	public static void main(String[] args) {
		SpringApplication.run(NcypCompanyGatewayApplication.class, args);
	}
}
