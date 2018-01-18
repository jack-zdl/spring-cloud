package com.ceying.chx.common.enums;


public enum EnumMsgCode implements BasicEnum {
	/**
	 * 成功【1】
	 */
	Success("1"),
	/**
	 * 失败【-1】
	 */
	Fail("-1"),
	/**
	 * 异常【-2】
	 */
	Exception("-2"),
	/**
	 * 中间状态【0】
	 */
	Middle("0");

    private String msgcode;

    EnumMsgCode(String msgcode) {
        this.msgcode = msgcode;
    }

    @Override public String getValue() {
        return this.msgcode;
    }

}
