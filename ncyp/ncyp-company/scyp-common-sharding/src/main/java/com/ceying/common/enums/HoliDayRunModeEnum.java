package com.ceying.common.enums;

/**
 * @author: mzq
 * @date: 2018/5/7
 * @description :节假日是否运行
 * @version: 2.0
 */
public enum HoliDayRunModeEnum implements BaseEnum<HoliDayRunModeEnum, String>{
    /**
     * 节假日运行
     */
    RUN("1","节假日运行"),
    /**
     *  节假日不运行
     */
    NOTRUN("2","节假日运行");

    String key;
    String value;

    private HoliDayRunModeEnum(String key, String value) {
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
