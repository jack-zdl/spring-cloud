package com.ceying.common.enums;

/**
 * 功能说明: <br>
 * 系统版本: 2.0 <br>
 * 开发人员: huanghaiyun
 * 开发时间: 2018/4/3<br>
 * <br>
 */
public enum ENKeyApplyStatusEnum implements BaseEnum<ENKeyApplyStatusEnum, String> {

    /**
     * 已申请
     */
    APPLIED("101","已申请"),
    /**
     * 已批准
     */
    APPROVED("102","已批准"),
    /**
     * 已到货
     */
    CONFIRMED("103","已到货");

    private String key;
    private String value;

    ENKeyApplyStatusEnum(String key,String value) {
        this.key = key;
        this.value = value;
    }
    @Override
    public String getKey() {
        return this.key;
    }

    @Override
    public String getValue() {
        return this.value;
    }
}
