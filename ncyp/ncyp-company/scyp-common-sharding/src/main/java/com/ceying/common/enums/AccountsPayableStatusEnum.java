package com.ceying.common.enums;

/**
 * @author: lidf
 * @date: 2018/3/29
 * @description:
 */
public enum AccountsPayableStatusEnum implements BaseEnum<AccountsPayableStatusEnum, String>{
    CORECOMPANY_READY_PUBLISH("100","核心企业待发布"),
    CORECOMPANY_APPROVING("101","核心企业审批中"),
    CORECOMPANY_APPROVED("102","核心企业已审批"),
    CORECOMPANY_VETOED("103","核心企业已否决"),
    CORECOMPANY_REVOKED("104","核心企业已撤销"),
//    CORECOMPANY_PUBLISH("101","核心企业经办发布"),
//    CORECOMPANY_REVIEW("102","核心企业复核签约") ,
//    CORECOMPANY_APPROVE("103","核心企业审批签约") ,
    SUPPLIER_APPROVING("201","供应商审批中"),
    SUPPLIER_APPROVED("202","供应商已审批"),
    SUPPLIER_VETOED("203","供应商已否决"),
    SUPPLIER_REVOKED("204","供应商已撤销"),
//    SUPPLIER_APPLY("201","供应商经办提交融资意向") ,
//    SUPPLIER_REVIEW("202","供应商复核签约") ,
//    SUPPLIER_APPROVE("203","供应商审批签约") ,
    BANK_APPROVING("301","融资提供方审批中"),
    BANK_APPROVED("302","融资提供方已审批"),
    BANK_VETOED("303","融资提供方已否决"),
    BANK_RETURNED("304","融资提供方已退回"),
//    BANK_QUOTE("301","融资提供方经办报价签约") ,
//    BANK_REVIEW("302","融资提供方复核签约") ,
//    BANK_APPROVE("303","融资提供方审批签约") ,
    BANK_ABANDONPRIORITY("401","融资提供方主动放弃优先权") ,
    BANK_AUTOABANDONPRIORITY("402","限定时间内未报价自动放弃优先权") ,
    TRIPARTITEAGREEMENT_RETURN_APPLY("501","三方协议退回重新提交融资意向"),
    ACCOUNTSPAYABLE_AUTO_CANCEL("601","应付账款到期自动作废"),
    TRIPARTITEAGREEMENT_REJECT("602","三方协议否决作废"),
    TRIPARTITEAGREEMENT_REJECT_BANKQUOTE("603","供应商已发起三方协议自动作废在途报价");
//    CORECOMPAY_CANCEL("8101","核心企业经办撤销") ,
//    CORECOMPAY_REVIEW_REJECT("8102","核心企业复核否决") ,
//    CORECOMPAY_APPROVE_REJECT("8103","核心企业审批否决") ,
//    SUPPLIER_CANCEL("8201","供应商经办撤销") ,
//    SUPPLIER_REVIEW_REJECT("8202","供应商复核否决") ,
//    SUPPLIER_APPROVE_REJECT("8203","供应商审批否决") ,
//    BANK_CANCEL("8301","融资提供方经办报价撤销") ,
//    BANK_REVIEW_REJECT("8302","融资提供方复核否决") ,
//    BANK_APPROVE_REJECT("8303","融资提供方审批否决") ,
//    BANK_REVIEW_RETURN("8304","融资提供方复核退回") ,
//    BANK_APPROVE_RETURN("8305","融资提供方审批退回");


    String key;
    String value;

    private AccountsPayableStatusEnum(String key, String value) {
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
