package com.ceying.common.enums;

/**
 * @author: lidf
 * @date: 2018/5/10
 * @description :银行报价状态
 * @version: 2.0
 */
public enum BankQuoteStausEnum implements BaseEnum<BankQuoteStausEnum, String>{
    /**
     * 待报价
     */
    WAIT_QUOTE("0","待报价"),
    /**
     * 审核报价
     */
    CHECK_QUOTE("1","审核报价"),
    /**
     * 完成报价
     */
    FINISH_QUOTE("2","完成报价");

    String key;
    String value;
    private BankQuoteStausEnum(String key, String value) {
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
