package com.ceying.common.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * @author: mzq
 * @date: 2018/6/11
 * @description :比较关系
 * @version: 2.0
 */
public enum CompareEnum implements BaseEnum<CompareEnum, String> {
    ONE("1","="),
    TWO("2","<>"),
    THREE("3",">"),
    FOUR("4","<"),
    FIVE("5",">="),
    SIX("6","<="),
    SEVEN("7","空"),
    EIGHT("8","非空"),
    NINE("9","包含"),
    TEN("10","不包含"),
    ELEVEN("11","前X天"),
    TWELVE("12","后X天"),
    THIRTEEN("13","模糊");
    String key;
    String value;

    private CompareEnum(String key, String value) {
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
    public static final Map<String, String> map = new TreeMap<String, String>();
}
