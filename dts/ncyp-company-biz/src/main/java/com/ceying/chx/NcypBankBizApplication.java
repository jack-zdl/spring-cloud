package com.ceying.chx;

import com.ceying.chx.config.mq.Barista;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.cloud.stream.annotation.EnableBinding;

import java.util.HashMap;
import java.util.Map;

@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients
// mapper 接口类扫描包配置
@MapperScan("com.ceying.chx.biz.base.dao")
@EnableBinding(Barista.class)
public class NcypBankBizApplication {

	public static void main(String[] args) {
		Map  map = new HashMap();
		SpringApplication.run(NcypBankBizApplication.class, args);
	}
}
