package com.ceying.common.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 单据对象枚举
 * 注意 这是t_biz_noteobjects 里面的对象，现在将他们翻译出来。 以前是将他们的urid拿出来，进行数据库查询，现在直接在枚举类查找
 * @author  chx
 * @date 创建时间：2016-11-1 上午10:54:53 
 */
public enum NoteObjectEnum implements BaseEnum <OrgCateEnum, String>{

    /**
     * 应付账款
     */
    ACCOUNTSPAYABLE("AP","应付账款"),
    /**
     * 三方协议：2
     */
    TRIPARTITEAGREEMENT("TA","三方协议"),

    /**
     * 封面urid 4
     */
    TRADEACCOUNTRECHARGE("TC","封面"),

    /**
     * 交易账户充值 3
     */
    TRIPARTITEAGREEMENTCOVER("TR","交易账户充值");



    String key;
    String value;

    private NoteObjectEnum(String key, String value) {
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
