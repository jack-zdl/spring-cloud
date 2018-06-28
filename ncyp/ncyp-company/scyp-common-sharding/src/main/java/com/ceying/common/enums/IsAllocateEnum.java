package com.ceying.common.enums;

/**
 * @author: mzq
 * @date: 2018/3/19
 * @description :权限分配标志
 * @version: 2.0
 */
public enum IsAllocateEnum implements BaseEnum<IsAllocateEnum, String>{
    /**
     * 未分配【0】
     */
    NO_ALLOCATE("0","未分配"),
    /**
     * 分配【1】
     */
    ALLOCATE("1","分配");

    String key;
    String value;
    private IsAllocateEnum(String key, String value) {
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
