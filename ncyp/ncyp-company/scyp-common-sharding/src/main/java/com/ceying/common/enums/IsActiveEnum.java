package com.ceying.common.enums;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: dengqz
 * 开发时间: 2018/2/1<br>
 * <br>
 */
public enum IsActiveEnum implements BaseEnum<IsActiveEnum, String>{
    /**
     * 成功【1】
     */
    YES("1","√"),
    /**
     * 失败【-1】
     */
    NO("0","×");

    String key;
    String value;

    private IsActiveEnum(String key, String value) {
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
