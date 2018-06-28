package com.ceying.common.enums;

/**
 * Created by mzq on 2018/2/27.
 */
public enum OrgCateEnum implements BaseEnum <OrgCateEnum, String>{
    PLATFORM("0","平台"),
    BANK("1","银行"),
    COMPANY("2","企业");

    String key;
    String value;

    private OrgCateEnum(String key, String value) {
        this.key=key;
        this.value=value;
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
