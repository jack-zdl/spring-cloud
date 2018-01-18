package com.ceying.chx.common.enums;

/**
 * Created by dell on 2017/6/10.
 */
public enum EnumSource implements BasicEnum {
    /**
     * 手工录入【1】
     */
    ManualEntry("1"),
    /**
     * 文件导入【2】
     */
    FileImport("2");


    private String value;

    EnumSource(String value) {
        this.value = value;
    }
    @Override
    public String getValue() {
        return value;
    }
}
