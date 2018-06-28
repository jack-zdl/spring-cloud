package com.ceying.common.enums;

/**
 * @author: zhangdl<br>
 * @date: 2018/4/23 16:17<br>
 * @version: 2.0 <br>
 * @description: <br>
 */
public enum AfterSignEnum implements BaseEnum <CertTypeEnum, String>{
    /**
     * 签约后状态
     */
    AFTERSIGNBANKON("101","融资提供方已放款"),
    AFTERSIGNTERRACEON("102","平台确认放款"),
    AFTERSIGCOREON("301","核心企业已还款"),
    AFTERSIGNTERRACEONCORE("401","平台经办确认还款"),
    AFTERSIGNBANKOFFONE("8101","融资提供方拒绝放款(银行原因)"),
    AFTERSIGNBANKOFFTWO("8102","融资提供方拒绝放款(供应商原因)"),
    AFTERSIGNTERRACEOFFONE("8201","平台经办确认拒绝还款(银行原因)"),
    AFTERSIGNTERRACEOFFTWO("8202","平台经办确认拒绝还款(供应商原因)");

    String key;
    String value;

    private AfterSignEnum(String key, String value) {
        this.key=key;
        this.value=value;
    }

    @Override
    public
    String getKey() {
        return key;
    }

    @Override
    public
    String getValue() {
        return value;
    }
}
