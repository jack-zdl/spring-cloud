package com.ceying.chx.common.constants;

import java.util.Map;
import java.util.TreeMap;

/**
 * 通知对象
 */
public enum ENNoticeObject {

    /**
     * 系统用户:1
     */
    SYSTEMUSER("1"),
    /**
     * 其它人员:2
     */
    OTHERS("2");

    // 定义私有变量
    private String noticeObject;

    // 构造函数，枚举类型只能为私有
    ENNoticeObject(String noticeObject) {
        this.noticeObject = noticeObject;
    }

    public String getValue() {
        return noticeObject;
    }

    private static final Map<String, ENNoticeObject> map = new TreeMap<String, ENNoticeObject>();

    static {
        map.put(SYSTEMUSER.getValue(), SYSTEMUSER);
        map.put(OTHERS.getValue(), OTHERS);
    }

}
