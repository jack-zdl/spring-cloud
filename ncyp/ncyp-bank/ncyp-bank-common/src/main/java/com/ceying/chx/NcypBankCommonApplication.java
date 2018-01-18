package com.ceying.chx;

import tk.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


/**
 * 功能说明: ncyp-bank-common的主程序入口类<br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/8 14:49<br>
 */
@SpringBootApplication
@MapperScan("com.ceying.chx.common.dao")
public class NcypBankCommonApplication {

	/**
	 * main方法入口
	 * @param args 参数
	 */
	public static void main(String[] args) {
		SpringApplication.run(NcypBankCommonApplication.class, args);
	}
}
