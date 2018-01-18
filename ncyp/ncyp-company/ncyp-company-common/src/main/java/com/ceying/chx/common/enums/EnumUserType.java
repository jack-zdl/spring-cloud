package com.ceying.chx.common.enums;


public enum EnumUserType implements BasicEnum {
	/**
	 * 用户【0】
	 */
	USER("0"),
	/**
	 * 管理员【1】
	 */
	ADMINISTRATOR("1");

    private String value;

    EnumUserType(String value) {
        this.value = value;
    }

    @Override public String getValue() {
        return this.value;
    }

}
