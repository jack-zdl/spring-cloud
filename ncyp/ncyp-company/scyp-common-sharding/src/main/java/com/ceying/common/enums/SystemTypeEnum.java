package com.ceying.common.enums;

/**
 * @author : Meow
 * @date : 2018-3-16
 * @description : 系统类型枚举
 */
public enum SystemTypeEnum implements BaseEnum<SystemTypeEnum, String> {

    /**
     * 基础业务框架【BIZFRAME】
     */
    BIZFRAME("BIZFRAME", "基础业务框架"),
    /**
     * 工作流【WORKFLOW】
     */
    WORKFLOW("WORKFLOW", "工作流");


    String key;
    String value;

    private SystemTypeEnum(String key, String value) {
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