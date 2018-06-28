package com.ceying.common.enums;

/**
 * 有追无追枚举类
 * @author: zhangdl<br>
 * @date: 2018/4/23 15:57<br>
 * @version: 2.0 <br>
 */
public enum IsRecourseEnum implements BaseEnum <IsRecourseEnum, String>{
    IsRecourse("1","有追"),
    NoRecourse("2","无追");

    String key;
    String value;

    private IsRecourseEnum(String key, String value) {
        this.key = key;
        this.value = value;
    }
    @Override
    public
    String getKey() {
        return key;
    }

    @Override
    public
    String getValue() {
        return value;
    }
}
