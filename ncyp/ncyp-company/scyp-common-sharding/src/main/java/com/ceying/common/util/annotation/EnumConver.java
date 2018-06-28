package com.ceying.common.util.annotation;

import java.lang.annotation.*;

/**
 * @author : Cheese
 * @date : 2018/4/3
 * @description : 枚举翻译注解
 */
@Documented
@Inherited
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.FIELD})//此注解作用于属性域上
public @interface EnumConver {
    Class enumType();//定义使用的枚举类型
}
