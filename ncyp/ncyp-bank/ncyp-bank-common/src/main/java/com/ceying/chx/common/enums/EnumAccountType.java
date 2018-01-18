package com.ceying.chx.common.enums;

/**
 * Created by dell on 2017/6/10.
 */
public enum EnumAccountType implements BasicEnum{
    /**
     * 银行账户【1】
     */
    BankAccount("1"),
    /**
     * 网商银行账户【2】
     */
    NetBankAccount("2"),
    /**
     * 支付宝账户【3】
     */
    Alipay("3");

    private String value;

    EnumAccountType(String value) {
        this.value = value;
    }
    @Override
    public String getValue() {
        return value;
    }
}
