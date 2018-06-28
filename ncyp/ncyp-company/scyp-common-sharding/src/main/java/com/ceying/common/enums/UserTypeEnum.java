package com.ceying.common.enums;

/**
 * @author Cheese
 * @date: 2018/3/14
 */
public enum UserTypeEnum implements BaseEnum<UserTypeEnum, String> {
    /**
     * 柜员【0】
     */
    BANKTELLER("0","柜员"),
    /**
     * 用户【1】
     */
    USER("1","用户");


    String key;
    String value;

    private UserTypeEnum(String key, String value) {
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
