package com.cyp.chx.rcenter.server;

import org.springframework.stereotype.Component;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * rpc扫描接口
 * @Author：huanghaiyun
 * @Date:2017/12/18
 */
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Component // 标明可被 Spring 扫描
public @interface RpcService {
 
    Class<?> value();

    /**
     * 服务版本号
     */
    String version() default "";
}