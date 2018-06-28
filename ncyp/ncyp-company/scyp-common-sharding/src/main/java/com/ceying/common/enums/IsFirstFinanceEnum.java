package com.ceying.common.enums;

/**
 * @author: lidf
 * @date: 2018/3/19
 * @description :是否为首次融资
 * @version: 2.0
 */
public enum IsFirstFinanceEnum implements BaseEnum<IsFirstFinanceEnum, String>{
    /**
     * 首次【1】
     */
    IS_FIRST("1","首次"),
    /**
     * 非首次【0】
     */
    NOT_FIRST("0","非首次");

    String key;
    String value;
    private IsFirstFinanceEnum(String key, String value) {
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
