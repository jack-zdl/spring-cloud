package com.ceying.chx.common.enums;


public enum EnumUserStatus implements BasicEnum {
	/**
	 * 正常【0】
	 */
	Normal("0"),
	/**
	 * 注销【1】
	 */
	Cancellation("1"),
	/**
	 * 禁用【2】
	 */
	Disable("2");

    private String value;

    EnumUserStatus(String value) {
        this.value = value;
    }

    @Override public String getValue() {
        return this.value;
    }

}
