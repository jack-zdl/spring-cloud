package com.ceying.chx.common.enums;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: wangxp
 * 开发时间: 2017/6/17<br>
 * <br>
 */
public enum EnumIsBankDirect implements BasicEnum {
    /**
     * 银企直联
     */
    IsBankDirect("1"),
    /**
     * 非银企直联
     */
    IsNotBankDirect("0")
    ;

    private  String value;

    EnumIsBankDirect(String value){
        this.value = value;
    }

    @Override
    public String getValue() {
        return this.value;
    }
}
