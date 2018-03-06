package com.ceying.chx;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer;

@SpringBootApplication
@EnableConfigServer
public class NcypConfigServer {
	public static void main(String[] args) {
		SpringApplication.run(NcypConfigServer.class, args);
	}
}
