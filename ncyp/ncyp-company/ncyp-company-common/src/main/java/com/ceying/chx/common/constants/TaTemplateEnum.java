package com.ceying.chx.common.constants;

/**
 * 提供给三方协议模板的枚举类
 * @author zhangdl
 * @version enum v1.0
 * @date 2017/6/26 15:15
 */
public
enum TaTemplateEnum {
    BEFORESEND("100","待发布"), //发布
    BANKSEND("101","发布"), //发布
    BANKCHECKAGREE("102","银行复核签约"),
    BANKAUDITINGAGREE("103","银行审核签约"),
    CORECOMPANYHANDLEAGREE("201","核心企业经办签约"),
    CORECOMPANYCHECKAGREE("202","核心企业复核签约"),
    CORECOMPANYAUDITINGAGREE("203","核心企业审核签约"),
    BANKCANCEL("8101","撤销"), //撤销
    BANKCHECKREJECT("8102","银行复核签约"),
    BANKAUDITINGREJECT("8103","银行审核签约"),
    CORECOMPANYHANDLEREJECT("8201","核心企业经办签约"),
    CORECOMPANYCHECKREJECT("8202","核心企业复核签约"),
    CORECOMPANYAUDITINGREJECT("8203","核心企业审核签约"),
    ENUM("ENUMkey", "enumvalue");

    private String name;
    private String value;

    public String getName() {
        return name;
    }

    public String getValue() {
        return value;
    }

    TaTemplateEnum(String name, String value) {
        this.name = name;
        this.value = value;
    }
}
