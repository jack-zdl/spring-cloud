package com.ceying.common.enums;

/**
 * 功能说明:Key库存管理操作标志 <br>
 * 系统版本: 2.0 <br>
 * 开发人员: huanghaiyun
 * 开发时间: 2018/3/27<br>
 * <br>
 */
public enum ENKeyInventoryOperateFlagEnum implements BaseEnum<ENKeyInventoryOperateFlagEnum, String> {

    /**
     * 入库
     */
    IN("101","入库"),
    /**
     * 领用
     */
    RECEIVE("102","领用"),
    /**
     * 初始化
     */
    INIT("103","初始化"),
    /**
     * 作废
     */
    SCRAP("104","作废");

    private String key;
    private String value;

    ENKeyInventoryOperateFlagEnum(String key,String value) {
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
