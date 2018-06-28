package com.ceying.common.enums;

/**
 * zhangdl
 */
public enum BankQuotaOpcodes implements BaseEnum<ExceptionCodeEnum, String>{


    QUOTA_FREEZE("101","冻结额度"),
    QUOTA_THAW("102", "解冻额度"),
    QUOTA_CHANGE("103", "额度变更");

    String key;
    String value;

    private BankQuotaOpcodes(String key, String value) {
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
