package com.ceying.common.enums;

/**
 * 功能说明: config server 中对应数据库中的application 字段<br>
 * 用于 进行类别区分<br>
 * 系统版本: 2.0 <br>
 * 开发人员: huanghaiyun
 * 开发时间: 2018/4/24<br>
 * <br>
 */
public enum ApplicationNameEnum implements BaseEnum<ApplicationNameEnum, String>{

    SYSTEM("scyp-system","system微服务"),

    KEY("scyp-key","key微服务"),

    BIZ("scyp-biz","biz微服务"),

    MODELER("scyp-modeler","modeler微服务"),

    EAGLEEYE("scyp-eagleeye-consumer","鹰眼微服务"),

    ADDITION("scyp-addition","addition微服务"),

    ALL("all","所有微服务");

    String key;
    String value;

    private ApplicationNameEnum(String key, String value) {
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
