package com.ceying.common.enums;

/**
 * @author: mzq
 * @date: 2018/5/4
 * @description :日期配置模式
 * @version: 2.0
 */
public enum DelegateIsActiveEnum implements BaseEnum<DelegateIsActiveEnum, String>{
    DELEGATE_YES("0","否"),

    DELEGATE_NO("1","是");

    String key;
    String value;

    private DelegateIsActiveEnum(String key, String value) {
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
