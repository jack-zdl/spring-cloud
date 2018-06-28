package com.ceying.common.enums;

/**
 * @author : Meow
 * @date : 2018-3-28
 * @description : 特殊日期类型枚举
 */
public enum SpecialCalendarTypeEnum implements BaseEnum<SpecialCalendarTypeEnum, String> {
    SPECIAL_WORKDAY("1","特殊工作日"),
    SPECIAL_HOLIDAY("2","特殊节假日");

    String key;
    String value;

    private SpecialCalendarTypeEnum(String key, String value) {
        this.key=key;
        this.value=value;
    }

    @Override
    public String getKey() {
        return key;
    }
    public void setKey(String value) {
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
