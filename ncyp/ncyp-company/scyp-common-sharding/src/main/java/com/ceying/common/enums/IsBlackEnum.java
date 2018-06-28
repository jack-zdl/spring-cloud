package com.ceying.common.enums;

/**
 * @author : Cheese
 * @date : 2018/3/26
 * @description : TODO
 */
public enum IsBlackEnum implements BaseEnum<IsBlackEnum,String> {

    WHITE("1","白名单"),
    BLACK("2","黑名单");
    String key;
    String value;

    IsBlackEnum(String key, String value) {
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
