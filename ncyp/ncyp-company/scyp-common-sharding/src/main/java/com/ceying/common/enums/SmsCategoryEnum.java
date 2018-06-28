package com.ceying.common.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * @author: mzq
 * @date: 2018/6/11
 * @description :短信类别
 * @version: 2.0
 */
public enum SmsCategoryEnum implements BaseEnum<SmsCategoryEnum, String> {
    ONE("01","扣款提前通知"),
    TWO("02","扣款成功通知"),
    THREE("03","扣款失败通知"),
    FOUR("04","对账结果通知");
    String key;
    String value;

    private SmsCategoryEnum(String key, String value) {
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
