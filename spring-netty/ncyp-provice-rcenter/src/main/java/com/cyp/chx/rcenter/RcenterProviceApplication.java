package com.cyp.chx.rcenter;

import org.apache.tomcat.util.threads.ThreadPoolExecutor;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.PropertySource;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

@SpringBootApplication
public class RcenterProviceApplication {

	public static void main(String[] args) {
		SpringApplication.run(RcenterProviceApplication.class, args);
	}

}
