package com.ceying.common.enums;

import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author : Cheese
 * @date : 2018/5/31
 * @description : 交易账户状态
 */
public enum  AccountStateEnum implements BaseEnum<AccountStateEnum,String> {
    NORMAL("1","正常"),
    BANWITHDRAWALS("2", "禁止提现"),
    CLOSED("3", "注销");

    String key;
    String value;

    AccountStateEnum(String key, String value) {
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
