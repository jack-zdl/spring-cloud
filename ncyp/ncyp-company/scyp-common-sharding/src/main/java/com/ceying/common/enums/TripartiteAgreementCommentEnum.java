package com.ceying.common.enums;

/**
 * 三方协议注释枚举类
 * @author zhangdl
 * @version enum v1.0
 * @date 2017/7/24 11:22
 */
public enum TripartiteAgreementCommentEnum implements BaseEnum<TripartiteAgreementCommentEnum, String>{
//DEDUCT_BAIL   //RAISET_TERRACE

    RELEASE_BAIL("10","释放保证金"),
    RELEASE_COVER_CHARGE("20","释放服务费"),
    DEDUCTION_BAIL("30","扣减保证金"),
    DEDUCTION_COVER_CHARGE("40","扣减实际服务费"),
    PAY_BAIL("50",""),
    PAY_COVER_CHARGE("",""),

    ADD_FIRST_RELEASE_BAIL("3","发起三方协议：优先报价银行有效期过期，解冻保证金"),
    ADD_FIRST_DEDUCT_BAIL("4","发起三方协议：优先报价银行有效期过期，扣除保证金"),
    ADD_FIRST_RAISET_TERRACE("5","优先报价银行有效期过期，将供应商扣除保证金添加到平台交易余额中"),

    ADD_NOFIRST_RELEASE_BAIL("6","发起三方协议：该支持报价银行有效期过期，解冻保证金"),
    ADD_NOFIRST_DEDUCT_BAIL("7","发起三方协议：该支持报价银行有效期过期，扣除保证金"),
    ADD_NOFIRST_RAISET_TERRACE("8","该支持报价银行有效期过期，将供应商扣除保证金添加到平台交易余额中"),

    AGREEMENT_FIRST_RELEASE_COVER_CHARGE("9","优先报价银行有效期过期，释放服务费"),
    AGREEMENT_FIRST_DEDUCT_BAIL("10","优先报价银行有效期过期，扣除保证金"),
    AGREEMENT_FIRST_RAISET_TERRACE("11","优先报价银行有效期过期，支付服务费"),

    AGREEMENT_NOTFIRST_RELEASE_COVER_CHARGE("12","支持报价银行有效期过期，释放服务费"),
    AGREEMENT_NOFIRST_DEDUCT_BAIL("13","支持报价银行有效期过期，扣除保证金"),
    AGREEMENT_NOFIRST_RAISET_TERRACE("14","支持报价银行有效期过期，支付服务费"),

    CALL_TO_AGREEMENT_RELEASE_COVER_CHARGE("15","撤销申请融资，解冻多余服务费"),
    CALL_TO_ACC_RELEASE_COVER_CHARGE("16","撤销申请融资，释放服务费"),
    CALL_TO_ACC_DEDUCT_BAIL("17","撤销申请融资，扣除保证金"),

    CALL_TO_ACC_RAISET_TERRACE("18","撤销申请融资，支付服务费"),

    VETO_SUPPLIER_RELEASE_COVER_CHARGE("19","供应商否决，释放其余服务费"),
    VETO_SUPPLIER_DEDUCT_BAIL("20","供应商否决，扣除保证金"),
    VETO_SUPPLIER_RAISET_TERRACE("21","供应商否决，支付服务费"),

    VETO_BANK_RELEASE_COVER_CHARGE("22","三方协议否决，释放服务费记录"),
    BANKCREDITFREE("23","银行放款，解冻服务费"),
    BANKCREDITCHARGEFEE("24","银行放款，扣减实际服务费"),
    BANKCREDIT("25","银行放款，支付给平台服务费"),

    BANKREJECTCREDITFREE("26","供应商真实性有问题，银行拒绝放款，解冻服务费"),
    BANKREJECTDITCHARGEFEE("27","供应商真实性有问题，银行拒绝放款，扣除服务费"),
    BANKREJECTCREDIT("28","供应商真实性有问题，银行拒绝放款，将供应商扣除服务费添加到平台交易余额中");



    private String key;

    private String value;

    @Override
    public String getKey() {
        return key;
    }

    @Override
    public String getValue() {
        return value;
    }

    TripartiteAgreementCommentEnum(String key, String value) {
        this.key = key;
        this.value = value;
    }
}
