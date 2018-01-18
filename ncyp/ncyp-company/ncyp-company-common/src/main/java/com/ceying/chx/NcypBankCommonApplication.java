package com.ceying.chx;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.ceying.chx.common.dao")
public class NcypBankCommonApplication {

	public static void main(String[] args) {
		SpringApplication.run(NcypBankCommonApplication.class, args);
	}
}
