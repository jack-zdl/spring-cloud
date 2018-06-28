package com.ceying.common.enums;

/**
 * @author: mzq
 * @date: 2018/4/10
 * @description :比较关系操作符号
 * @version: 2.0
 */
public enum OperateSignEnum implements BaseEnum<OperateSignEnum, String>{

    EQUAL("1","="),

    NOTEQUAL("2","<>"),

    MORE("3",">"),

    LESS("4","<"),

    MOREOREQUAL("5",">="),

    LESSOREQUAL("6","<="),

    ISNULL("7","空"),

    NOTNULL("8","非空"),

    INCLUDE("9","包含"),

    EXCLUDE("10","不包含"),

    DAYSBEFORE("11","前X天"),

    DAYSAFTER("12","后X天"),

    LIKE("13","模糊");

    String key;
    String value;

    private OperateSignEnum(String key, String value) {
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
