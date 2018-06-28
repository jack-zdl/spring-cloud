package com.ceying.biz;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@EnableEurekaClient
@EnableFeignClients(basePackages = {"com.ceying.biz"})
@ComponentScan(basePackages = {"com.ceying.biz"})
public class NcypBankBizApplication {

	public static void main(String[] args) {
		SpringApplication.run(NcypBankBizApplication.class, args);
	}
}
