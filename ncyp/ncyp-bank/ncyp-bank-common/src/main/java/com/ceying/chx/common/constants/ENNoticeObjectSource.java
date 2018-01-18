package com.ceying.chx.common.constants;

import java.util.Map;
import java.util.TreeMap;

/**
 * 通知对象源
 */
public enum ENNoticeObjectSource {

    /**
     * 单据:1
     */
    BILL("1"),
    /**
     * 自定义设置:2
     */
    CUSTOM("2");


    private static final Map<String, ENNoticeObjectSource> map = new TreeMap<String, ENNoticeObjectSource>();

    static {
        map.put(BILL.getValue(), BILL);
        map.put(CUSTOM.getValue(), CUSTOM);
    }

    // 定义私有变量
    private String noticeObjectSource;

    // 构造函数，枚举类型只能为私有
    ENNoticeObjectSource(String noticeObjectSource) {
        this.noticeObjectSource = noticeObjectSource;
    }

    public String getValue() {
        return noticeObjectSource;
    }

}
