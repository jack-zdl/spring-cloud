package com.ceying.common.enums;

/**
 * @author : Meow
 * @date : 2018-5-17
 * @description : 开票状态枚举
 */
public enum OpenStateEnum implements BaseEnum<OpenStateEnum, String> {

    /**
     * 待开票
     */
    READY("1","待开票"),

    /**
     * 已开票
     */
    ALREADY("2","已开票"),

    /**
     * 开票作废
     */
    CENCEL("3","开票作废");


    String key;
    String value;

    private OpenStateEnum(String key, String value) {
        this.key = key;
        this.value = value;
    }

    @Override
    public String getKey() {
        return key;
    }

    public void setKey(String value) {
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
