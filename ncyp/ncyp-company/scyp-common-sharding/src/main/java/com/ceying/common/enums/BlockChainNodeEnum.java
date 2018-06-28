package com.ceying.common.enums;

/**
 * @author: fej
 * @date: 2018/4/18
 * @description :
 * @version: 2.0
 */
public enum BlockChainNodeEnum implements BaseEnum<BlockChainNodeEnum,String>{

    ORSEND("101","经办送审"), //发布
    CHECKAGREE("102","复核同意"),
    AUDITINGAGREE("103","审批同意"),
    PLATFORMGAGREE("201","平台同意"),
    ORCANCEL("8101","经办撤销"), //撤销
    CHECKREJECT("8102","复核否决"),
    AUDITINGREJECT("8103","审批否决"),
    PLATFORMREJECT("8201","平台否决");

    String key;
    String value;

    private BlockChainNodeEnum(String key, String value) {
        this.key=key;
        this.value=value;
    }
    @Override
    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    @Override
    public String getValue() {
        return value;
    }
    public void setValue(String value) {
        this.value = value;
    }
}
