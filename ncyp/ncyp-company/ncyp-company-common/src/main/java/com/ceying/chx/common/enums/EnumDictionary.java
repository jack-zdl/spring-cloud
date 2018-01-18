package com.ceying.chx.common.enums;


public enum EnumDictionary implements BasicEnum {
    /**
     * 大合同审批状态【9999076】
     */
    LASTOPERATIONID("9999076"),
    /**
     * 银行报价模板【9999085】
     */
    QUOTETEMPLATE("9999085"),
    /**
     * 联系人类别【9999072】
     */
    CONTACT_TYPE("9999072"),
    /**
     * 组织状态【9999008】
     */
    ORG_STATUS("9999008"),
    /**
     * 是否【1001】
     */
    YES_OR_NOT("1001"),
    /**
     * 用户分类【9999001】
     */
    USER_TYPE("9999001"),
    /**
	 * 用户状态【9999002】
	 */
	USER_STATUS("9999002"),

    /**
     * 组织分类【9999004】
     */
    ORG_CATE("9999004"),

    /**
     *组织级别【9999005】
     */
    ORG_LEVEL("9999005"),

    /**
     * 是否分配【9999007】
     */
    ISAllOCATE("9999007"),

    /**
     * 租户状态【9999018】
     */
    TENANT_STATUS("9999018"),
    /**
     * 租户类型【9999017】
     */
    TENANT_TYPE("9999017"),
    /**
     * 菜单显示【9999019】
     */
    MENU_SHOW("9999019");

    private String value;

    EnumDictionary(String value) {
        this.value = value;
    }

    @Override public String getValue() {
        return this.value;
    }

}
