package com.ceying.common.enums;

/**
 * 审批状态枚举类，交易操作类型枚举<br>
 * @author: zhangdl<br>
 * @date: 2018/4/4 10:27<br>
 * @version: 2.0 <br>
 */
public enum ApproveStateEnum   implements BaseEnum <AccountOperateFlagEnum, String>{
    NOTAPPROVE("1","未审批"),
    APPROVED("2","已审批"),
    REFUSED("3","已拒绝"),
    APPROVING("4","审批中");

    String key;
    String value;

    private ApproveStateEnum(String key, String value) {
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
