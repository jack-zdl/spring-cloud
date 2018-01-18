package com.ceying.chx.common.enums;


public enum EnumLockStatus implements BasicEnum {
	/**
	 * 签退【0】
	 */
	SIGNOUT("0"),
	/**
	 * 登录【1】
	 */
	LOGIN("1"),
	/**
	 * 非正常签退【2】
	 */
	ABSINGOUT("2"),
	/**
	 * 锁定【3】
	 */
	LOCKING("3");

    private String value;

    EnumLockStatus(String value) {
        this.value = value;
    }

    @Override public String getValue() {
        return this.value;
    }

}
