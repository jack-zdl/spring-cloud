package com.cyp.chx.common.util.response;

/**
 * 功能说明: 字典返回对象<br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/15 23:55<br>
 */

public class ParamRespJson {
    private String text;

    private String value;

    public
    String getText() {
        return text;
    }

    public
    ParamRespJson setText(String text) {
        this.text = text;
        return this;
    }

    public
    String getValue() {
        return value;
    }

    public
    ParamRespJson setValue(String value) {
        this.value = value;
        return this;
    }
}
