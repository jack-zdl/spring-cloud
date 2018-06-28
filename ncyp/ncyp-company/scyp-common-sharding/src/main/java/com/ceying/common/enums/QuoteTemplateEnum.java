package com.ceying.common.enums;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: lidf
 * 开发时间: 2018/4/24<br>
 * <br>
 */
public enum QuoteTemplateEnum implements BaseEnum<QuoteTemplateEnum, String>{
    FLOATING("1","基准上浮(年化)"),
    REALRATE("2","实际利率(年化)"),
    MONTHLYRATE("3","月息");

    String key;
    String value;

    private QuoteTemplateEnum(String key, String value) {
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
