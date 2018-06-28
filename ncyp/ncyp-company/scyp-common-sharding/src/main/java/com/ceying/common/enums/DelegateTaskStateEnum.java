package com.ceying.common.enums;

/**
 * @author: mzq
 * @date: 2018/5/4
 * @description :日期配置模式
 * @version: 2.0
 */
public enum DelegateTaskStateEnum implements BaseEnum<DelegateTaskStateEnum, String>{

    DELEGATE_EXPIRE("0","过期"),

    DELEGATE_BLOCKED("1","停用"),

    DELEGATE_RUNNING("2","启用"),

    DELEGATE_DELETE("3","删除");

    String key;
    String value;

    private DelegateTaskStateEnum(String key, String value) {
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
