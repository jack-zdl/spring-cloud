package com.ceying.chx.common.constants;

import java.util.Map;
import java.util.TreeMap;

/**
 * 通知方式
 */
public enum ENNoticeMode {
    /**
     * 预警消息：1
     */
    WARNINGMSG("1"),
    /**
     *  系统消息：2
     */
    SYSTEMMSG("2"),
    /**
     *  邮件：3
     */
    EMAIL("3"),
    /**
     *  短信：4
     */
    SHORTMSG("4");
    private String noticeMode;

    ENNoticeMode(String noticeMode) {
        this.noticeMode = noticeMode;
    }

    public String getValue() {
        return this.noticeMode;
    }


    private static final Map<String, ENNoticeMode> map = new TreeMap<String, ENNoticeMode>();

    static {
        map.put(WARNINGMSG.getValue(), WARNINGMSG);
        map.put(SYSTEMMSG.getValue(), SYSTEMMSG);
        map.put(EMAIL.getValue(), EMAIL);
        map.put(SHORTMSG.getValue(), SHORTMSG);
    }
}
