package com.ceying.chx;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class NcypBankBizApplication {

	public static void main(String[] args) {
		SpringApplication.run(NcypBankBizApplication.class, args);
	}
}
