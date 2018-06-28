package com.ceying.common.enums;

/**
 * @author: mzq
 * @date: 2018/5/22
 * @description :触发方式
 * @version: 2.0
 */
public enum  TriggerModeEnum implements BaseEnum<TriggerModeEnum,String> {

    TIMER("1","定时"),
    INSTANT("2","即时");

    String key;
    String value;

    private TriggerModeEnum(String key, String value) {
        this.key = key;
        this.value = value;
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

