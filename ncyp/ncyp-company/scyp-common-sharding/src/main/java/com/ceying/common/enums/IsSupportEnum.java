package com.ceying.common.enums;
/**
 * @author : Cheese
 * @date : 2018/4/11
 * @description : TODO
 */
public enum IsSupportEnum implements BaseEnum<IsSupportEnum,String> {
    SUPPORT("1","支持"),
    NONSUPPORT("0","不支持");

    private String key;
    private String value;

    IsSupportEnum(String key, String value) {
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
