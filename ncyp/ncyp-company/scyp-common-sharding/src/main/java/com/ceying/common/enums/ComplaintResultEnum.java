package com.ceying.common.enums;

/**
 * @author: fej
 * @date: 2018/4/12
 * @description :
 * @version: 2.0
 */
public enum ComplaintResultEnum implements BaseEnum<ComplaintResultEnum, String> {

    /**
     * 未处理【1】
     */
    UNTREATED("1","未处理"),
    /**
     * 已处理【2】
     */
    HANDLED("2","已处理");

    String key;
    String value;
    private ComplaintResultEnum(String key, String value) {
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
