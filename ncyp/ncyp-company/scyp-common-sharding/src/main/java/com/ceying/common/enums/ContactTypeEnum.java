package com.ceying.common.enums;

/**
 * @author: mzq
 * @date: 2018/3/20
 * @description :联系人类别枚举   9999072
 * @version: 2.0
 */
public enum ContactTypeEnum implements BaseEnum<ContactTypeEnum, String> {
    CRITICAL("1","关键"),
    COMMON("2","常用"),
    NORMAL("3","普通");

    String key;
    String value;

    private ContactTypeEnum(String key, String value) {
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
