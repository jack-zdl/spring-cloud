package com.ceying.common.enums;

/**
 * Created by mzq on 2018/2/26.
 * 组织状态
 */
public enum OrgStateEnum implements BaseEnum<OrgStateEnum, String>{

    //组织状态
    CANCEL("-1","注销"),
    NORMAL("0","正常");



    String key;
    String value;

    private OrgStateEnum(String key, String value) {
        this.key=key;
        this.value=value;
    }

    @Override
    public String getKey() {
        return key;
    }
    public void setKey(String value) {
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
