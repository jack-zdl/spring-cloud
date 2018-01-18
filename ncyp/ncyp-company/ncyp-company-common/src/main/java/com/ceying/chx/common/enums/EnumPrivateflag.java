package com.ceying.chx.common.enums;

/**
 * Created by dell on 2017/6/10.
 */
public enum  EnumPrivateflag implements BasicEnum{
    /**
     * 对私账户【1】
     */
    PrivateAccount("1"),
    /**
     * 对公账户【2】
     */
    PublicAccount("2");


    private String value;

    EnumPrivateflag(String value) {
        this.value = value;
    }
    @Override
    public String getValue() {
        return value;
    }
}
