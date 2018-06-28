package com.ceying.common.enums;

/**
 * @author: mzq
 * @date: 2018/5/4
 * @description :日期配置模式
 * @version: 2.0
 */
public enum DateConfigEnum implements BaseEnum<DateConfigEnum, String>{
    DAY_PATTERN("1","日模式"),

    MONTH_PATTERN("2","月模式");

    String key;
    String value;

    private DateConfigEnum(String key, String value) {
        this.key=key;
        this.value=value;
    }

    @Override
    public String getKey() {
        return key;
    }
    public void setKey(String key) {
        this.key = key;
    }

    @Override
    public String getValue() {
        return value;
    }
    public void setValue(String value) {
        this.value = value;
    }

    }
