package com.ceying.common.enums;

/**
 * @author: fej
 * @date: 2018/4/18
 * @description :
 * @version: 2.0
 */
public enum BlockChainNodeApplyIsActiveEnum implements BaseEnum<BlockChainNodeApplyIsActiveEnum, String>{
    /**
     * 成功【1】
     */
    YES("1","有效"),
    /**
     * 失败【2】
     */
    NO("2","无效");

    String key;
    String value;

    private BlockChainNodeApplyIsActiveEnum(String key, String value) {
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
