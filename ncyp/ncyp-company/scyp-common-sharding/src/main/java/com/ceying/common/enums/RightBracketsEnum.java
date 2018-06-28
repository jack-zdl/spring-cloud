package com.ceying.common.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * @author: mzq
 * @date: 2018/6/11
 * @description :右括号
 * @version: 2.0
 */
public enum RightBracketsEnum implements BaseEnum<RightBracketsEnum, String> {
    ONE("1",")"),
    TWO("2","))"),
    THREE("3",")))"),
    FOUR("4","))))"),
    FIVE("5",")))))"),
    SIX("6","))))))"),
    SEVEN("7",")))))))"),
    EIGHT("8","))))))))"),
    NINE("9",")))))))))"),
    TEN("10","))))))))))");
    String key;
    String value;

    private RightBracketsEnum(String key, String value) {
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
