package com.ceying.chx;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class NcypBankEurekaApplication {

	public static void main(String[] args) {
		SpringApplication.run(NcypBankEurekaApplication.class, args);
	}
}
