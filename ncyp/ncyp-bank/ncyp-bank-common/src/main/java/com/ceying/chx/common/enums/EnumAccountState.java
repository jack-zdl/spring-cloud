package com.ceying.chx.common.enums;


public enum EnumAccountState implements BasicEnum {
	/**
	 * 新建【1】
	 */
	New("1"),
	/**
	 * 开户【2】
	 */
	Open("2"),
	/**
	 * 冻结【3】
	 */
	Frozen("3"),
	/**
	 * 注销【4】
	 */
	Cancellation("4");

    private String value;

    EnumAccountState(String value) {
        this.value = value;
    }

    @Override public String getValue() {
        return this.value;
    }

}
