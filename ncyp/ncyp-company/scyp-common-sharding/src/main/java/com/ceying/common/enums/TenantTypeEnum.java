package com.ceying.common.enums;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: fuerjian
 * Date: 2018-03-27
 * Time: 14:47
 */
public enum TenantTypeEnum implements BaseEnum<TenantTypeEnum,String> {

    NOEMAL("0","普通"),
    LARGE("1","大型"),
    GROUP("2","集团");

    String key;
    String value;

    private TenantTypeEnum(String key, String value) {
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
