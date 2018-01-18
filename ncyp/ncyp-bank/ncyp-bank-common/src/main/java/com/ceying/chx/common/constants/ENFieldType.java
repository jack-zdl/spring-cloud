package com.ceying.chx.common.constants;

import java.util.Map;
import java.util.TreeMap;


/**
 * 功能说明:变量类型-常量类  <br>
 * 生成时间: 2017-03-27 10:48:48 <br>
 * 开发人员: chx
 * 系统版本: 2.0 <br>
 */
public enum ENFieldType {
    /**
     * 字符：C
     */
    CHARACTER("C"),
    /**
     *  整型：I
     */
    INTEGER("I"),
    /**
     * 浮点数：F
     */
    FLOAT("F"),
    /**
     *  字符串：S
     */
    STRING("S"),
    /**
     * 日期：D
     */
    DATE("D"),
    /**
     *  时间：T
     */
    TIME("T"),
    /**
     * 日期时间：DT
     */
    DATETIME("DT"),
    /**
     *  字典：N
     */
    DICTIONARY("N"),
    /**
     * 字段缓存：NC
     */
    DICTIONARYCACHE("NC"),
    /**
     *  辅助查询：M
     */
    MINISTRANT("M");
    private String fieldType;
    private ENFieldType(String fieldType) {
        this.fieldType = fieldType;
    }
    public String getValue() {
        return this.fieldType;
    }
    private static final Map<String, ENFieldType> map = new TreeMap<String, ENFieldType>();
    static {
        map.put(CHARACTER.getValue(), CHARACTER);
        map.put(INTEGER.getValue(), INTEGER);
        map.put(FLOAT.getValue(), FLOAT);
        map.put(STRING.getValue(), STRING);
        map.put(DATE.getValue(), DATE);
        map.put(TIME.getValue(), TIME);
        map.put(DATETIME.getValue(), DATETIME);
        map.put(DICTIONARY.getValue(), DICTIONARY);
        map.put(DICTIONARYCACHE.getValue(), DICTIONARYCACHE);
        map.put(MINISTRANT.getValue(), MINISTRANT);
    }

}
