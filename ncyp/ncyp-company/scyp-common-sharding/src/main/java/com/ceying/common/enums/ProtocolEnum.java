package com.ceying.common.enums;

/**
 * 功能说明:    <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间:2018/6/6 16:00<br>
 * <br>
 */
public enum  ProtocolEnum implements BaseEnum<ProtocolEnum, String>{

    ACCOUNTSPAYABLE("1","应付账款类型"),
    ACCOUNTSPAYABLEQUOTE("2","应付账款报价类型"),
    TRIPARTITEAGREEMENT("3","三方协议类型"),
    CONTENT("11","样本模板"),
    UPLOADCONTENT("12","上传附件");

    String key;
    String value;

    private ProtocolEnum(String key, String value) {
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
