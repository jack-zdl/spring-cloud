package com.ceying.common.enums;

/**
 * 提供给三方协议模板的枚举类
 * @author zhangdl
 * @version enum v1.0
 * @date 2017/6/26 15:15
 */
public
enum TaTemplateEnum implements BaseEnum<TaTemplateEnum, String>{
    BEFORESEND("100","待发布"), //发布
    BANKSEND("101","发布"), //发布
    BANKCHECKAGREE("102","融资提供方复核签约"),
    BANKAUDITINGAGREE("103","融资提供方审批签约"),
    CORECOMPANYHANDLEAGREE("201","核心企业经办签约"),
    CORECOMPANYCHECKAGREE("202","核心企业复核签约"),
    CORECOMPANYAUDITINGAGREE("203","核心企业审批签约"),
    BANKCANCEL("8101","撤销"), //撤销
    BANKCHECKREJECT("8102","融资提供方复核撤销"),
    BANKAUDITINGREJECT("8103","融资提供方审批撤销"),
    CORECOMPANYHANDLEREJECT("8201","核心企业经办撤销"),
    CORECOMPANYCHECKREJECT("8202","核心企业复核撤销"),
    CORECOMPANYAUDITINGREJECT("8203","核心企业审批撤销"),
    ENUM("ENUMkey", "enumvalue");

    private String key;
    private String value;

    public String getKey() {
        return key;
    }

    public String getValue() {
        return value;
    }

    TaTemplateEnum(String key, String value) {
        this.key = key;
        this.value = value;
    }
}
