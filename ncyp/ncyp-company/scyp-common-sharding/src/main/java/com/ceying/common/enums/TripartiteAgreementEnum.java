package com.ceying.common.enums;

/**
 * 三方协议枚举类
 * @author zhangdl
 * @version enum v1.0
 * @date 2017/7/24 11:22
 */
public enum TripartiteAgreementEnum implements BaseEnum<TripartiteAgreementEnum, String>{


    TRIPARTITEAGREEMENTID("tripartiteAgreementId","三方协议编码标识"),
    ACCOUNTSPAYABLEID("accountsPayableId","应付账款信息ID标识"),
    OPINION("opinion","意见标识"),
    NONEFFECTIVE("0","无效参数标识"),
    EFFECTIVE("1","有效参数标识"),
    REJECTTYPE("rejectType","银行拒绝放款类型"),
    LENDINGDATE("lendingDate","放款时间"),
    PAYABLEDATE("payabledate","还款时间"),
    IDS("delDataKeys","删除附件key"),
    SUPPLIERINITIALFINANCINGREQUEST("101","供应商经办发起融资申请"),
    SUPPLIERREVIEWFINANCINGREQUEST("102","供应商复核签约"),
    SUPPLIERAUDITFINANCINGREQUEST("103","供应商审核签约"),
    CORECOMPANYAPPROVEFINANCINGREQUEST("201","核心企业经办签约"),
    CORECOMPANYREVIEWFINANCINGREQUEST("202","核心企业复核签约"),
    CORECOMPANYAUDITFINANCINGREQUEST("203","核心企业审核签约"),
    BANKAPPROVEFINANCINGREQUEST("301","融资提供方经办签约"),
    BANKREVIEWFINANCINGREQUEST("302","融资提供方复核签约"),
    BANKAUDITFINANCINGREQUEST("303","融资提供方审核签约"),
    SYSTEMREJECT("401","系统自动否决"),
    supplierWithdrawFinancingRequest("8101","供应商经办撤销"),
    supplierVetoReviewFinancingRequest("8102","供应商复核否决"),
    supplierVetoAuditFinancingRequest("8103","供应商审核否决"),
    coreCompanyVetoApproveFinancingRequest("8201","核心企业经办否决"),
    coreCompanyVetoReviewFinancingRequest("8202","核心企业复核否决"),
    coreCompanyVetoAuditFinancingRequest("8203","核心企业审核否决"),
    bankVetoApproveFinancingRequest("8301","融资提供方经办否决"),
    bankVetoReviewFinancingRequest("8302","融资提供方复核否决"),
    bankVetoAuditFinancingRequest("8303","融资提供方审核否决"),
    supplierInitialAbolishFinancingRequest("9101","供应商经办作废"),
    supplierReviewAbolishFinancingRequest("9102","供应商复核作废"),
    supplierAuditAbolishFinancingRequest2TinyPunishment("9103","供应商审核作废，融资提供方未签约"),
    supplierAuditAbolishFinancingRequest2NoPunishment("9104","供应商审核作废，融资提供方签约超期"),
    supplierAuditAbolishFinancingRequest2HeavyPunishment("9105","供应商审核作废，融资提供方已签约"),
    approvetransitsign("9999","审批过渡标志"),
    /**
     * 未审批编码标识
     */
    waitForApprove("未审批", "1"),

    /**
     * 已审批编码标识
     */
    approved("已审批", "2"),

    /**
     * 已拒绝编码标识
     */
    rejectApproved("已拒绝", "3"),

    /**
     * 审批中编码标识
     */
    inApproving("审批中", "4"),

   //三方协议模板标签
    signdate("签订日","{signdate}"),
    financingcompany("融资企业","{financingcompany}"),
    financingcompanyaddress("住址","{financingcompanyaddress}"),
    financingcompanyrepresentative("融资企业法定代表人","{financingcompanyrepresentative}"),
    bank("商业银行","{bank}"),
    bankaddress("住址","{bankaddress}"),
    bankrepresentative("商业银行法定代表人","{bankrepresentative}"),
    corecompany("核心企业","{corecompany}"),
    corecompanyaddress("住址","{corecompanyaddress}"),
    corecompanyrepresentative("核心企业法定代表人","{corecompanyrepresentative}"),
    number("编号","{number}"),
    contractnumber("商务合同号","{contractnumber}"),
    invoicenumber("发票号","{invoicenumber}"),
    invoicedate("发票日","{invoicedate}"),
    paymentdate("付款到期日","{paymentdate}"),
    invoicemoney("发票金额","{invoicemoney}"),
    transfermoney("转让金额","{transfermoney}"),
    accountname("户名","{name}"),
    bankname("开户行","{bankname}"),
    bankaccount("账号","{bankaccount}"),

    /**
     * 封面
     */
    coverBankName("融资提供方","{bankName}"),
    coverSupplierName("供应商","{supplierName}"),
    coverCoreName("核心企业","{coreName}"),
    coverTripartiteAgreementCode("三方协议编号","{tripartiteAgreementCode}"),

    /**
     * 签约后状态
     */
    AFTERSIGNBANKON("101","融资提供方已放款"),
    AFTERSIGNTERRACEON("102","平台确认放款"),
    AFTERSIGCOREON("301","核心企业已还款"),
    AFTERSIGNTERRACEONCORE("401","平台经办确认还款"),
    AFTERSIGNBANKOFFONE("8101","融资提供方拒绝放款(银行原因)"),
    AFTERSIGNBANKOFFTWO("8102","融资提供方拒绝放款(供应商原因)"),
    AFTERSIGNTERRACEOFFONE("8201","平台经办确认拒绝还款(银行原因)"),
    AFTERSIGNTERRACEOFFTWO("8202","平台经办确认拒绝还款(供应商原因)"),

    /**
    * 融资提供方放款后支付并冻结核心企业服务费
    */ 
    coreCompanyFreezeAmount("1", "融资提供方放款后支付并冻结核心企业服务费"),
    oreCompanyFreezeBalance("2", "核心企业到期未还款冻结交易账户余额"),
    /**
     * 平台确认接口参数
     */
    terraceAffirmParam("平台确认接口参数","type"),
    BANKID("$_BANK_ID","三方协议工作流银行参数"),
    SUPPLIERID("$_SUPPLIER_ID","三方协议工作流供应商参数"),
    COREID("$_CORECOMPANY_ID","三方协议工作流核心企业参数");


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

    TripartiteAgreementEnum(String key, String value) {
        this.key = key;
        this.value = value;
    }

    public static String valueOf(int value) {
        switch (value) {
            case 101:
                return AFTERSIGNTERRACEON.getKey();
            case 301:
                return AFTERSIGNTERRACEONCORE.getKey();
            case 8101:
                return AFTERSIGNTERRACEOFFONE.getKey();
            case 8102:
                return AFTERSIGNTERRACEOFFTWO.getKey();
            default:
                return null;
        }
    }
}
