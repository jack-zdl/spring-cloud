package com.zhang.cloud.microservicesimpleconsumermovie;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;


@SpringBootApplication
//@EnableDiscoveryClient   //表明这是服务发现的
@EnableEurekaServer        //服务发现的服务端
public class MicroserviceDiscoveryEurekaApplication {


	public static void main(String[] args) {
		SpringApplication.run(MicroserviceDiscoveryEurekaApplication.class, args);
	}
}
