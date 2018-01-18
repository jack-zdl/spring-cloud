package com.ceying.chx.common.enums;

/**
 * 功能说明: 分配状态<br>
 * 系统版本: 1.0 <br>
 * 开发人员: wangxp
 * 开发时间: 2017/6/9<br>
 * <br>
 */
public enum EnumAllocateStatus implements BasicEnum {
    /**
     * 已分配
     */
    Allocated("已分配"),
    /**
     * 未分配
     */
    Unallocated("未分配");

    private String value;

    EnumAllocateStatus(String value){
        this.value = value;
    }
    @Override
    public String getValue() {
        return this.value;
    }
}
