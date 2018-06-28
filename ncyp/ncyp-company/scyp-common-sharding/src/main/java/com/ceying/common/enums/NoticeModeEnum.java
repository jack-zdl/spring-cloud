package com.ceying.common.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * @author: mzq
 * @date: 2018/6/11
 * @description :通知方式
 * @version: 2.0
 */
public enum NoticeModeEnum implements BaseEnum<NoticeModeEnum, String> {
    WARNINGMSG("1","预警消息"),
    SYSTEMMSG("2","系统消息"),
    EMAIL("3","邮件"),
    SHORTMSG("4","短信");
    String key;
    String value;

    private NoticeModeEnum(String key, String value) {
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
