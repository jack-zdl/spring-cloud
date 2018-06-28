package com.ceying.common.util.annotation;

import com.ceying.common.constant.OrderTypeConstant;

import java.lang.annotation.*;

/**
 * @author : Meow
 * @date : 2018-4-3
 * @description : 排序
 */
@Retention(RetentionPolicy.RUNTIME) // 注解会在class字节码文件中存在，在运行时可以通过反射获取到
@Target({ElementType.FIELD})//定义注解的作用目标**作用范围字段、枚举的常量/方法
@Documented//说明该注解将被包含在javadoc中
public @interface Order {
    /**
     * 排序方式
     */
    String type() default OrderTypeConstant.ASC;
}
