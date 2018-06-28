package com.ceying.common.enums;

/**
 * @author: mzq
 * @date: 2018/5/4
 * @description :日期配置模式
 * @version: 2.0
 */
public enum DelegateTypeEnum implements BaseEnum<DelegateTypeEnum, String>{
    All_DELEGATE("A","全权委托"),

    PROCESS_DELEGATE("P","流程委托");

    String key;
    String value;

    private DelegateTypeEnum(String key, String value) {
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
