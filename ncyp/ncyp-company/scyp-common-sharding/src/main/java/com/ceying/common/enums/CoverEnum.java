package com.ceying.common.enums;

/**
 * 封面-应付账款编码
 * @author: zhangdl<br>
 * @date: 2018/4/9 17:06<br>
 * @version: 2.0 <br>
 */
public enum CoverEnum implements BaseEnum<CoverEnum, String> {
        /**
     * 封面-应付账款编码
     */
    coverAccountsPayableCode("应付账款编码","{accountsPayableCode}"),
    AccountExpireWarning("101","应付账款应付日期剩余时长过短预警"),
    FinancingIntentionWarning("102","退回重新提交融资意愿"),
    tripartiteAgreementDone("9f79accf15ea42e5a1211ea250e05002","三方协议审批完成");

    String key;
    String value;

    private CoverEnum(String key, String value) {
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
