package com.ceying.common.enums;

public enum  LendingAfterFlagEnum implements BaseEnum<LendingAfterFlagEnum,String>{

    Payload("1","已放款"),

    NONSUPPORT("0","不支持");

    private String key;
    private String value;

    private LendingAfterFlagEnum(String key, String value) {
        this.key = key;
        this.value = value;
    }
    @Override
    public String getKey() {
        return null;
    }

    @Override
    public String getValue() {
        return null;
    }
}
