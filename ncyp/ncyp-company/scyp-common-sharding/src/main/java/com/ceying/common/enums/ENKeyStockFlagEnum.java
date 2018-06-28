package com.ceying.common.enums;

/**
 * 功能说明:Key存盘<br>
 * 系统版本: 2.0 <br>
 * 开发人员: huanghaiyun
 * 开发时间: 2018/3/27<br>
 * <br>
 */
public enum ENKeyStockFlagEnum implements BaseEnum<ENKeyStockFlagEnum, String> {

    /**
     * 存盘操作标识符
     */
    SCRAP("104","作废"),

    ;

    private String key;
    private String value;

    ENKeyStockFlagEnum(String key, String value) {
        this.key = key;
        this.value = value;
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
