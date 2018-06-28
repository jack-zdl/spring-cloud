package com.ceying.common.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * @author: mzq
 * @date: 2018/6/11
 * @description :通知对象源
 * @version: 2.0
 */
public enum NoticeObjectSourceEnum implements BaseEnum<NoticeObjectSourceEnum, String> {
    BILL("1","单据"),
    CUSTOM("2","自定义设置");
    String key;
    String value;

    private NoticeObjectSourceEnum(String key, String value) {
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
