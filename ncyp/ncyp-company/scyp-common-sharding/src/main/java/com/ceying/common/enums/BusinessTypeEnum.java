package com.ceying.common.enums;

/**
 * Created by Energie on 2018/3/29.
 * 供应商支持业务类型
 */
public enum BusinessTypeEnum implements BaseEnum<BusinessTypeEnum, String>{
    REVERSE("101","反向保理"),
    POSITIVE("201","正向保理"),
    PLEDGE("301","应收账款质押");

    String key;
    String value;

    private BusinessTypeEnum(String key, String value) {
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
