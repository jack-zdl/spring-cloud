package com.ceying.common.enums;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: dengqz
 * 开发时间: 2018/2/1<br>
 * <br>
 */
public enum MsgCodeEnum implements BaseEnum<MsgCodeEnum, String>{
    /**
     * 成功【1】
     */
    SUCCESS("1","成功"),
    /**
     * 失败【-1】
     */
    FAIL("-1","失败"),
    /**
     * 异常【-2】
     */
    EXCEPTION("-2","异常"),
    /**
     * 中间状态【0】
     */
    MIDDLE("0","中间状态");

    String key;
    String value;

    private MsgCodeEnum(String key, String value) {
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
