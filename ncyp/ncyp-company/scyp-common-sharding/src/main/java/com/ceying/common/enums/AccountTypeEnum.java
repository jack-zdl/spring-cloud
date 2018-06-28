package com.ceying.common.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * @author: mzq
 * @date: 2018/4/10
 * @description :账户类型  9999091
 * @version: 2.0
 */
public enum AccountTypeEnum implements BaseEnum<AccountTypeEnum, String>{

    REVERSE_FACTORING("101","反向保理"),

    POSITIVE_FACTORING("201","正向保理"),

    ACCOUNT_RECEIVABLE_PLEDGE("301","应收账款质押"),

    WITHDRAWALS("401","提现");

    String key;
    String value;

    private AccountTypeEnum(String key, String value) {
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
    public static final Map<String, String> map = new TreeMap<String, String>();
    static {
        map.put(REVERSE_FACTORING.getKey(), REVERSE_FACTORING.getValue());
        map.put(POSITIVE_FACTORING.getKey(), POSITIVE_FACTORING.getValue());
        map.put(ACCOUNT_RECEIVABLE_PLEDGE.getKey(), ACCOUNT_RECEIVABLE_PLEDGE.getValue());
        map.put(WITHDRAWALS.getKey(), WITHDRAWALS.getValue());
    }
}
