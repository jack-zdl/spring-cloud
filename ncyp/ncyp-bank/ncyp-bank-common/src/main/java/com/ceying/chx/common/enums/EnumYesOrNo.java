package com.ceying.chx.common.enums;


public enum EnumYesOrNo implements BasicEnum {
	/**
	 * 否【0】
	 */
	NO("0"),

    /**
     * 是【1】
     */
    YES("1");

    private String value;

    EnumYesOrNo(String value) {
        this.value = value;
    }

    @Override public String getValue() {
        return this.value;
    }

}
