package com.ceying.common.enums;

/**
 * @author: mzq
 * @date: 2018/4/10
 * @description :输入类型  9999026
 * @version: 2.0
 */
public enum InputTypeEnum implements BaseEnum<InputTypeEnum, String>{

    CHAR("C","字符"),

    DATE("D","日期"),

    DATETIME("DT","日期时间"),

    FLOAT("F","浮点数"),

    INT("I","整型"),

    MINISTRANT("M","辅助查询"),

    DIC("N","字典"),

    STRING("S","字符串"),

    TIME("T","时间");

    String key;
    String value;

    private InputTypeEnum(String key, String value) {
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
