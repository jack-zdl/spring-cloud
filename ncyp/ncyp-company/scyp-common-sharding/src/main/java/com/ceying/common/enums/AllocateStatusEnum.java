package com.ceying.common.enums;

/**
 * @author Cheese
 * @date: 2018/3/14
 */
public enum AllocateStatusEnum implements BaseEnum <AllocateStatusEnum, String> {

    /**
     * 已分配
     */
    ALLOCATED("1","已分配"),
    /**
     * 未分配
     */
    UNALLOCATED("0","未分配");

    String key;
    String value;

    AllocateStatusEnum(String key,String value){
        this.key=key;
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
