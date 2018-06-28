package com.ceying.biz.query;

import com.ceying.common.constant.CacheKeyConstant;
import com.ceying.common.constant.ConditionTypeConstant;
import com.ceying.common.enums.AccountsPayableStatusEnum;
import com.ceying.common.enums.BusinessTypeEnum;
import com.ceying.common.enums.IsActiveEnum;
import com.ceying.common.enums.IsRecourseEnum;
import com.ceying.common.util.annotation.CacheConver;
import com.ceying.common.util.annotation.Condition;
import com.ceying.common.util.annotation.EnumConver;

import javax.persistence.Column;
import javax.persistence.Id;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @author: lidf
 * @date: 2018/3/28
 * @description:
 * @version: 2.0
 */
public class PayableAndQuoteQuery {

    /**
     * 主键ID
     */
    @Id
    @Column(name="urid")
    private String urid;

    /**
     * 租户ID
     */
    private String tenantid;

    /**
     * 应付账款编号
     */
    private String payableno;

    /**
     * 合同编号
     */
    private String contractid;

    /**
     * 核心企业ID
     */
    @CacheConver(cacheType = CacheKeyConstant.ORGNAMEMAP)
    private String corecompanyid;

    /**
     * 供应商ID
     */
    @CacheConver(cacheType = CacheKeyConstant.ORGNAMEMAP)
    @Condition
    private String supplierid;

    /**
     * 优先融资提供方ID
     */
    @CacheConver(cacheType = CacheKeyConstant.ORGNAMEMAP)
    private String bankid;

    /**
     * 入账时间
     */
    private Date billdate;

    /**
     * 金额
     */
    private BigDecimal amount;

    /**
     * 保理到期日
     */
    private Date payabledate;


    /**
     * 最后一个操作标识
     */
    @EnumConver(enumType = AccountsPayableStatusEnum.class)
    @Condition(type = ConditionTypeConstant.IN)
    private String lastoperationflag;


    /**
     * 融资金额
     */
    private BigDecimal financingamount;

    /**
     * 冻结供应商融资服务费
     */
    private BigDecimal freezeamount;

    /**
     * 核心企业向供应商收取的费率(针对一笔应付账款)
     */
    private BigDecimal corecompanysupplierrate;

    /**
     * 向供应商收取的总费率（平台+核心企业）
     */
    private BigDecimal supplierrate;

    /**
     * 向供应商收取的费率（核心企业）
     */
    private BigDecimal suppliercorerate;

    /**
     * 融资期限
     */
    private Date financingdate;

    /**
     * 扩展字段1
     */
    private String attribute1;

    /**
     * 扩展字段2
     */
    private String attribute2;

    /**
     * 是否有效
     */
    @EnumConver(enumType = IsActiveEnum.class)
    @Condition
    private String isactive;


    /**
     * 描述
     */
    private String description;

    /**
     * 是否是第一次融资
     */
    private String isfirstfinance;

    /**
     * 冻结供应商融资服务费保证金
     */
    private BigDecimal securitydeposit;

    /**
     * 发票号
     */
    private String invoicenumber;

    /**
     * 应付账款到期日
     */
    private Date expiringdate;

    /**
     * 融资意向书
     */
    private byte[] signaturecontent;

    /**
     * 业务类型
     */
    @EnumConver(enumType = BusinessTypeEnum.class)
    private String businesstype;

    /**
     * 报价urid
     */
    private String quoteurid;
    /**
     * 报价银行id
     */
    @CacheConver(cacheType = CacheKeyConstant.ORGNAMEMAP)
    private String quotebankid;
    /**
     * 融资到期日
     */
    private Date quotefinancingdate;

    private BigDecimal quoteamount;

    /**
     * 有追利率
     */
    private BigDecimal recourseinterestrate;

    /**
     * 无追利率
     */
    private BigDecimal nonrecourseinterestrate;

    /**
     * 利率，作为返回前端的值
     */
    private BigDecimal interestrate;
    private BigDecimal interestratel;

    /**
     * 有追无追
     */
    @EnumConver(enumType = IsRecourseEnum.class)
    private String isrecourse;

    @EnumConver(enumType = AccountsPayableStatusEnum.class)
    private String quoteoperateflag;


    public BigDecimal getQuoteamount() {
        return quoteamount;
    }

    public void setQuoteamount(BigDecimal quoteamount) {
        this.quoteamount = quoteamount;
    }

    public BigDecimal getInterestratel() {
        return interestratel;
    }

    public void setInterestratel(BigDecimal interestratel) {
        this.interestratel = interestratel;
    }

    public String getQuoteoperateflag() {
        return quoteoperateflag;
    }

    public void setQuoteoperateflag(String quoteoperateflag) {
        this.quoteoperateflag = quoteoperateflag;
    }

    public BigDecimal getRecourseinterestrate() {
        return recourseinterestrate;
    }

    public void setRecourseinterestrate(BigDecimal recourseinterestrate) {
        this.recourseinterestrate = recourseinterestrate;
    }

    public BigDecimal getNonrecourseinterestrate() {
        return nonrecourseinterestrate;
    }

    public void setNonrecourseinterestrate(BigDecimal nonrecourseinterestrate) {
        this.nonrecourseinterestrate = nonrecourseinterestrate;
    }

    public BigDecimal getInterestrate() {
        return interestrate;
    }

    public void setInterestrate(BigDecimal interestrate) {
        this.interestrate = interestrate;
    }

    public String getIsrecourse() {
        return isrecourse;
    }

    public void setIsrecourse(String isrecourse) {
        this.isrecourse = isrecourse;
    }

    public String getQuoteurid() {
        return quoteurid;
    }

    public void setQuoteurid(String quoteurid) {
        this.quoteurid = quoteurid;
    }

    public String getQuotebankid() {
        return quotebankid;
    }

    public void setQuotebankid(String quotebankid) {
        this.quotebankid = quotebankid;
    }

    public Date getQuotefinancingdate() {
        return quotefinancingdate;
    }

    public void setQuotefinancingdate(Date quotefinancingdate) {
        this.quotefinancingdate = quotefinancingdate;
    }

    public String getUrid() {
        return urid;
    }

    public void setUrid(String urid) {
        this.urid = urid;
    }

    public String getTenantid() {
        return tenantid;
    }

    public void setTenantid(String tenantid) {
        this.tenantid = tenantid;
    }

    public String getPayableno() {
        return payableno;
    }

    public void setPayableno(String payableno) {
        this.payableno = payableno;
    }

    public String getContractid() {
        return contractid;
    }

    public void setContractid(String contractid) {
        this.contractid = contractid;
    }

    public String getCorecompanyid() {
        return corecompanyid;
    }

    public void setCorecompanyid(String corecompanyid) {
        this.corecompanyid = corecompanyid;
    }

    public String getSupplierid() {
        return supplierid;
    }

    public void setSupplierid(String supplierid) {
        this.supplierid = supplierid;
    }

    public String getBankid() {
        return bankid;
    }

    public void setBankid(String bankid) {
        this.bankid = bankid;
    }

    public Date getBilldate() {
        return billdate;
    }

    public void setBilldate(Date billdate) {
        this.billdate = billdate;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public Date getPayabledate() {
        return payabledate;
    }

    public void setPayabledate(Date payabledate) {
        this.payabledate = payabledate;
    }

    public String getLastoperationflag() {
        return lastoperationflag;
    }

    public void setLastoperationflag(String lastoperationflag) {
        this.lastoperationflag = lastoperationflag;
    }

    public BigDecimal getFinancingamount() {
        return financingamount;
    }

    public void setFinancingamount(BigDecimal financingamount) {
        this.financingamount = financingamount;
    }

    public BigDecimal getFreezeamount() {
        return freezeamount;
    }

    public void setFreezeamount(BigDecimal freezeamount) {
        this.freezeamount = freezeamount;
    }

    public BigDecimal getCorecompanysupplierrate() {
        return corecompanysupplierrate;
    }

    public void setCorecompanysupplierrate(BigDecimal corecompanysupplierrate) {
        this.corecompanysupplierrate = corecompanysupplierrate;
    }

    public BigDecimal getSupplierrate() {
        return supplierrate;
    }

    public void setSupplierrate(BigDecimal supplierrate) {
        this.supplierrate = supplierrate;
    }

    public BigDecimal getSuppliercorerate() {
        return suppliercorerate;
    }

    public void setSuppliercorerate(BigDecimal suppliercorerate) {
        this.suppliercorerate = suppliercorerate;
    }

    public Date getFinancingdate() {
        return financingdate;
    }

    public void setFinancingdate(Date financingdate) {
        this.financingdate = financingdate;
    }

    public String getAttribute1() {
        return attribute1;
    }

    public void setAttribute1(String attribute1) {
        this.attribute1 = attribute1;
    }

    public String getAttribute2() {
        return attribute2;
    }

    public void setAttribute2(String attribute2) {
        this.attribute2 = attribute2;
    }

    public String getIsactive() {
        return isactive;
    }

    public void setIsactive(String isactive) {
        this.isactive = isactive;
    }


    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getIsfirstfinance() {
        return isfirstfinance;
    }

    public void setIsfirstfinance(String isfirstfinance) {
        this.isfirstfinance = isfirstfinance;
    }

    public BigDecimal getSecuritydeposit() {
        return securitydeposit;
    }

    public void setSecuritydeposit(BigDecimal securitydeposit) {
        this.securitydeposit = securitydeposit;
    }

    public String getInvoicenumber() {
        return invoicenumber;
    }

    public void setInvoicenumber(String invoicenumber) {
        this.invoicenumber = invoicenumber;
    }

    public Date getExpiringdate() {
        return expiringdate;
    }

    public void setExpiringdate(Date expiringdate) {
        this.expiringdate = expiringdate;
    }

    public byte[] getSignaturecontent() {
        return signaturecontent;
    }

    public void setSignaturecontent(byte[] signaturecontent) {
        this.signaturecontent = signaturecontent;
    }

    public String getBusinesstype() {
        return businesstype;
    }

    public void setBusinesstype(String businesstype) {
        this.businesstype = businesstype;
    }

    public PayableAndQuoteQuery() {
    }
}
