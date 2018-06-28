package com.ceying.common.enums;

/**
 * 功能说明:    <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间:2018/5/15 16:22<br>
 * <br>
 */
public enum  RejectReasonEnum implements BaseEnum<RejectReasonEnum, String>{

    AFTERSIGNBANKOFFONE("8101","融资提供方拒绝放款(银行原因)"),
    AFTERSIGNBANKOFFTWO("8102","融资提供方拒绝放款(供应商原因)");

    String key;
    String value;

    @Override
    public String getKey() {
        return key;
    }

    @Override
    public String getValue() {
        return value;
    }

    private RejectReasonEnum(String key, String value) {
        this.key=key;
        this.value=value;
    }

}
