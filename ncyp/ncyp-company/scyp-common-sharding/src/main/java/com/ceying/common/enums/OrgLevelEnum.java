package com.ceying.common.enums;

/**
 * Created by mzq on 2018/2/27.
 */
public enum OrgLevelEnum implements BaseEnum<OrgLevelEnum, String>{
    //组织级别
    PLATFORM("0","平台"),
    LEVEL1("1","一级"),
    LEVEL2("2","二级"),
    LEVEL3("3","三级"),
    LEVEL4("4","四级");

    String key;
    String value;

    private OrgLevelEnum(String key, String value) {
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
