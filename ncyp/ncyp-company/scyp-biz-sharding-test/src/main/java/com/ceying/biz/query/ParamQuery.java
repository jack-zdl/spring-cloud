package com.ceying.biz.query;

/**
 * 功能说明:   选择框的对象 <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间:2018/5/15 16:04<br>
 * <br>
 */
public class ParamQuery {
    private String text;

    private String value;

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public ParamQuery(String text, String value) {
        this.text = text;
        this.value = value;
    }
}
