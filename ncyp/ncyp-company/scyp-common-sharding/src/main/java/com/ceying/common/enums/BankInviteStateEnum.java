package com.ceying.common.enums;

/**
 * @author: mzq
 * @date: 2018/4/25
 * @description :融资提供方邀请处理状态
 * @version: 2.0
 */
public enum BankInviteStateEnum implements BaseEnum <BankInviteStateEnum, String> {

    WAITING( "1","未处理"),

    APPROVED( "2","同意"),

    REJECTED( "3","拒绝");

    String key;
    String value;

    BankInviteStateEnum(String key,String value){
        this.key=key;
        this.value = value;
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
