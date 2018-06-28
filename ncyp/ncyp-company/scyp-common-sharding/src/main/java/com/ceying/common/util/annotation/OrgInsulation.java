package com.ceying.common.util.annotation;

import com.ceying.common.constant.IsolationLevelConstant;

import java.lang.annotation.*;

/**
 * 功能说明: 组织隔离注解 <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间:2018/5/16 15:24<br>
 * <br>
 */
@Retention(RetentionPolicy.RUNTIME) // 注解会在class字节码文件中存在，在运行时可以通过反射获取到
@Target({ElementType.FIELD})//定义注解的作用目标**作用范围字段、枚举的常量/方法
@Documented//说明该注解将被包含在javadoc中
public @interface OrgInsulation {
    /**
     * 隔离级别
     */
    int level() default IsolationLevelConstant.ROOTlEVEL;
}
