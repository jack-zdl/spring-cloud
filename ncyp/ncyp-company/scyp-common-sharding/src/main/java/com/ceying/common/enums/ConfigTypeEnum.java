package com.ceying.common.enums;

/**
 * 功能说明: config server 中对应数据库中的profile字段 <br>
 * 用于 进行类别区分<br>
 * 系统版本: 2.0 <br>
 * 开发人员: huanghaiyun
 * 开发时间: 2018/4/24<br>
 * <br>
 */
public enum ConfigTypeEnum implements BaseEnum<ConfigTypeEnum, String>{

    REDIS("redis","redis配置"),

    DATABASE("database","数据库配置"),

    KAFKA("kafka","kafka配置"),

    EAGLEEYE("eagleeye","鹰眼配置"),

    OTHER("other","其他配置");

    String key;
    String value;

    private ConfigTypeEnum(String key, String value) {
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
