package com.ceying.common.enums;

/**
 * @author : Meow
 * @date : 2018-3-16
 * @description : 是否登陆
 */
public enum IsLoginEnum implements BaseEnum<IsLoginEnum, String>{
    /**
     * 否【0】
     */
    NO("0","否"),
    /**
     * 是【1】
     */
    YES("1","是");

    String key;
    String value;

    private IsLoginEnum(String key, String value) {
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