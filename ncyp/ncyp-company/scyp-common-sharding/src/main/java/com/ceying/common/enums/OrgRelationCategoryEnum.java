package com.ceying.common.enums;

/**
 * @author : Cheese
 * @date : 2018/4/10
 * @description : 组织关系类别枚举
 */
public enum OrgRelationCategoryEnum implements BaseEnum<OrgRelationCategoryEnum,String> {
    ORGBANK("1","核心企业-融资提供方"),
    ORGSUPPLIER("2","核心企业-供应商"),
    BANKSUPPLIER("3","融资提供方-供应商");

    String key;
    String value;

    OrgRelationCategoryEnum(String key, String value) {
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
