package com.cyp.chx.rcenter;

import org.apache.tomcat.util.threads.ThreadPoolExecutor;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.PropertySource;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

@SpringBootApplication
@EnableScheduling
public class RcenterApplication {

	public static void main(String[] args) {
		SpringApplication.run(RcenterApplication.class, args);
	}

	/**
	 * spring 线程池 用来处理 注册中心的 数据同步
	 * @return
	 */
	@Bean
	public ThreadPoolTaskExecutor taskExecutor(){
		ThreadPoolTaskExecutor taskExecutor = new ThreadPoolTaskExecutor();
		taskExecutor.setCorePoolSize(10);//核心线程数
		taskExecutor.setMaxPoolSize(20);//最大线程数
		taskExecutor.setQueueCapacity(1000);//队列最大长度
		taskExecutor.setKeepAliveSeconds(300);//线程池维护线程所允许的空闲时间
		taskExecutor.setRejectedExecutionHandler(new ThreadPoolExecutor.CallerRunsPolicy());//线程池对拒绝任务(无线程可用)的处理策略
		return taskExecutor;
	}
}
