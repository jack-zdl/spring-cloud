package com.ceying.common.enums;

/**
 * 预警规则枚举类
 * @author zhangdl
 * @version enum v1.0
 * @date 2017/9/26 15:53
 */
public
enum WarningRulesEnum implements BaseEnum<WarningRulesEnum, String>{

    AccountExpireWarning("101","应付账款应付日期剩余时长过短预警"),
    FinancingIntentionWarning("102","退回重新提交融资意愿"),
    tripartiteAgreementDone("9f79accf15ea42e5a1211ea250e05002","三方协议审批完成");

    private String key;
    private String value;

    @Override
    public String getKey() {
        return key;
    }

    @Override
    public String getValue() {
        return value;
    }

    WarningRulesEnum(String key, String value) {
        this.key = key;
        this.value = value;
    }
}
