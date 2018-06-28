package com.ceying.common.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 单据对象枚举
 * @author  chx
 * @date 创建时间：2016-11-1 上午10:54:53 
 */
public enum ENNoteObject {

    /**
     * 应付账款:1
     */
    ACCOUNTSPAYABLE("1"),
    /**
     * 三方协议：2
     */
    TRIPARTITEAGREEMENT("2"),

    /**
     * 交易账户充值 3
     */
    TRADEACCOUNTRECHARGE("3"),

    /**
     * 封面urid 4
     */
    TRIPARTITEAGREEMENTCOVER("4"),


    /**
     * 以下暂未启用
     */
	/**
     * 银行账户申请单:1
     */
    ACCOUNTAPPLY("1"),
    /**
     * 付款单：2
     */
    PAYMENT("2"),
    /**
     * 收款单：3
     */
    RECMENT("3"),
    /**
     * 应付承兑汇票：4
     */
    PAYDRAFT("4"),
    /**
     * 应收承兑汇票：5
     */
    RECDRAFT("5"),
    /**
     * 资金下拨申请单：6
     */
    ALLOCATIONAPPLY("6"),
    /**
     * 内部账户：7
     */
    INTERNALACCOUNT("7"),
    /**
     * 资金计划调整单：8
     */
    BUDGETADJUST("8"),
    /**
     * 资金计划单：9
     */
    BUDGET("9"),
    /**
     * 余额调节表：10
     */
    REMAINAJUSTS("10"),
    /**
     * 内部账户计息单：11
     */
    INTERNALINTEREST("11");
    
    private static final Map<String, ENNoteObject> map = new TreeMap<String, ENNoteObject>();
    private static final Map<String, String> mapLabel = new TreeMap<String, String>();

    static {
        map.put(ACCOUNTSPAYABLE.getValue(), ACCOUNTSPAYABLE);
        map.put(TRIPARTITEAGREEMENT.getValue(), TRIPARTITEAGREEMENT);

        map.put(ACCOUNTAPPLY.getValue(), ACCOUNTAPPLY);
        map.put(PAYMENT.getValue(), PAYMENT);
        map.put(RECMENT.getValue(), RECMENT);
        map.put(PAYDRAFT.getValue(), PAYDRAFT);
        map.put(RECDRAFT.getValue(), RECDRAFT);
        map.put(ALLOCATIONAPPLY.getValue(),ALLOCATIONAPPLY);
        map.put(INTERNALACCOUNT.getValue(), INTERNALACCOUNT);
        map.put(BUDGETADJUST.getValue(), BUDGETADJUST);
        map.put(BUDGET.getValue(), BUDGET);
        map.put(REMAINAJUSTS.getValue(), REMAINAJUSTS);
        map.put(INTERNALINTEREST.getValue(), INTERNALINTEREST);

        mapLabel.put(ACCOUNTAPPLY.getValue(), "银行账户申请单");
        mapLabel.put(PAYMENT.getValue(), "付款单");
        mapLabel.put(RECMENT.getValue(), "收款单");
        mapLabel.put(PAYDRAFT.getValue(), "应付承兑汇票");
        mapLabel.put(RECDRAFT.getValue(), "应收承兑汇票");
        mapLabel.put(ALLOCATIONAPPLY.getValue(), "资金下拨申请单");
        mapLabel.put(INTERNALACCOUNT.getValue(), "内部账户");
        mapLabel.put(BUDGETADJUST.getValue(), "资金计划调整单");
        mapLabel.put(BUDGET.getValue(), "资金计划单");
        mapLabel.put(REMAINAJUSTS.getValue(), "余额调节表");
        mapLabel.put(INTERNALINTEREST.getValue(), "内部账户计息单");
    }

    // 定义私有变量
    private String logicOperate;

    // 构造函数，枚举类型只能为私有
    ENNoteObject(String logicOperate) {
        this.logicOperate = logicOperate;
    }

    public String getValue() {
        return logicOperate;
    }


    /**
     * 获取枚举中文名称
     *
     * @return
     */
    public String getLabel() {
        return mapLabel.get(this.logicOperate);
    }
}
