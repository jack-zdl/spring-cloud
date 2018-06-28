package com.ceying.common.util.annotation;

import java.lang.annotation.*;

/**
 * @author : Cheese
 * @date : 2018/4/3
 * @description : 缓存翻译注解
 */
@Documented
@Inherited
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.FIELD})//此注解作用于属性域上
public @interface CacheConver {
    String cacheType();//定义使用的缓存类型
}
