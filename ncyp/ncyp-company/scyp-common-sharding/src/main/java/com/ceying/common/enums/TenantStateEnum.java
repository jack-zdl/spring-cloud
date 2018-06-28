package com.ceying.common.enums;

/**
 * @author : Cheese
 * @date : 2018/3/20
 * @description : TODO
 */
public enum TenantStateEnum implements BaseEnum<TenantStateEnum, String> {
    /**
     * 正常【0】
     */
    NOEMAL("0","正常"),
    /**
     * 注销【1】
     */
    CANCELLATION("1","注销"),
    /**
     * 禁用【2】
     */
    DISABLE("2","禁用");


    String key;
    String value;

    private TenantStateEnum(String key, String value) {
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
