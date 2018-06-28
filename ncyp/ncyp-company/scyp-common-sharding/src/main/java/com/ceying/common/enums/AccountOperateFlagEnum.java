package com.ceying.common.enums;

/**
 * 交易操作类型枚举<br>
 * @author: zhangdl<br>
 * @date: 2018/4/4 10:27<br>
 * @version: 2.0 <br>
 */
public enum AccountOperateFlagEnum  implements BaseEnum <AccountOperateFlagEnum, String>{
    RECHARGE("1","充值"),
    WITHDRAW("2", "提现"),
    FREEZE("3", "冻结"),
    THAW("4","解冻"),
    CHARGEFEE("5", "扣减服务费"),
    RETURNFEE("6", "退回服务费"),
    PAYFEE("7","支付服务费"),
    FINE("8", "罚款"),
    COMPENSATION("9", "补偿款");

    String key;
    String value;

    private AccountOperateFlagEnum(String key, String value) {
        this.key=key;
        this.value=value;
    }
    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getValue() {
        return value;
    }
    public void setValue(String value) {
        this.value = value;
    }


}
