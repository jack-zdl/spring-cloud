package com.ceying.common.enums;

/**
 * Created by mzq on 2018/2/27.
 */
public enum CertTypeEnum implements BaseEnum <CertTypeEnum, String>{
    IDCARD("0","身份证"),
    RESIDENCEBOOKLET("1","户口簿"),
    PASSPORT("2","护照"),
    OFFICER("3","军官证"),
    SOLDIER("4","士兵证"),
    HONGKONGMACAO("5","港澳居民来往内地通行证"),
    TAIWAN("6","台湾同胞来往内地通行证"),
    TEMPORARYIDCARD("7","临时身份证"),
    FOREIGNER("8","外国人居留证"),
    POLICEOFFICER("9","警官证"),
    OTHER("99","其他证件");

    String key;
    String value;

    private CertTypeEnum(String key, String value) {
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
