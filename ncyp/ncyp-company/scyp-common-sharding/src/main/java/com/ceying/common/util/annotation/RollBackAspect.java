package com.ceying.common.util.annotation;

import java.lang.annotation.*;

/**
 * 功能说明: 自定义分布式事物注解<br>
 *  写在service的 方法上，<br>
 *  当该方法 抛出异常，将会对反向调用中间涉及到的所有 feign 请求中 需要回滚的 回滚方法 <br>
 * 系统版本: 2.0 <br>
 * 开发人员: huanghaiyun
 * 开发时间: 2018/6/5<br>
 * <br>
 */
@Retention(RetentionPolicy.RUNTIME) // 注解会在class字节码文件中存在，在运行时可以通过反射获取到
@Target({ElementType.METHOD})//定义注解的作用目标**作用范围 方法
@Documented//说明该注解将被包含在javadoc中
public @interface RollBackAspect {
    boolean isRollBack() default false;
    String rollBackUrl() default "";
}
