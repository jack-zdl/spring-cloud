package com.ceying.common.enums;

/**
 * @author : Meow
 * @date : 2018-3-16
 * @description : 窗口类型枚举
 */
public enum WindowTypeEnum implements BaseEnum<WindowTypeEnum, String>{
    /**
     * 子窗口【0】
     */
    CHILD_WINDOW("0","子窗口"),
    /**
     * 单页模式窗口【1】
     */
    SIMPLE_WINDOW("2","单页模式窗口"),
    /**
     * 非单页模式窗口【2】
     */
    NOT_SIMPLE_WINDOW("3","非单页模式窗口");

    String key;
    String value;

    private WindowTypeEnum(String key, String value) {
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