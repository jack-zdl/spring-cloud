package com.ceying.chx;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.core.env.Environment;

@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients
public class NcypAgreementApplication {

	public static void main(String[] args) {
		SpringApplication.run(NcypAgreementApplication.class, args);
	}

	@Autowired
	void setEnviroment(Environment env) {
		System.out.println("my-config.appName from env: "
				+ env.getProperty("my-config.appName"));
	}
}