package com.ceying.biz.vo;

import com.ceying.common.constant.ConditionTypeConstant;
import com.ceying.common.enums.IsActiveEnum;
import com.ceying.common.util.annotation.Condition;
import com.ceying.common.util.annotation.EnumConver;
import org.dozer.Mapping;

import javax.persistence.Id;
import javax.persistence.Table;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @author: lidf
 * @date: 2018/3/28
 * @description: 报价表
 * @version: 2.0
 */
@Table(name = "t_biz_accountspayablequote")
public class AccountsPayableQuoteVo {

    /**
     * 主键ID
     */
    @Id
    private String  urid;

    /**
     * 租户ID
     */
    private String tenantid;

    /**
     * 三方协议模板ID
     */
    private String tatemplateid ;

    /**
     * 应付账款ID
     */
    @Condition(type = ConditionTypeConstant.IN)
    private String accountspayableid;

    /**
     * 融资提供方ID
     */
    private String bankid;

    /**
     * 供应商专户ID
     */
    private String supplieraccountid;

    /**
     * 融资金额
     */
    private BigDecimal financingamount;

    /**
     * 融资期限
     */
    private Date financingdate;

    /**
     * 预计还款日期
     */
    private Date estimatereturndate;

    /**
     * 是否为优先行报价
     */
    private String isfirstquote;

    /**
     * 最近一次操作标志
     */
    @Condition
    private String lastoperationflag;

    /**
     * 预计融资成本
     */
    private BigDecimal financingcost;

    /**
     * 有追无追
     */
    private String isrecourse ;

    /**
     * 有追利率
     */
    private BigDecimal recourseinterestrate ;

    /**
     * 无追利率
     */
    @Mapping("interestrate")
    protected BigDecimal nonrecourseinterestrate ;

    /**
     * 有追折扣
     */
    private BigDecimal recoursediscount  ;

    /**
     * 无追折扣
     */
    private BigDecimal nonrecoursediscount  ;

    /**
     * 是否有效
     */
    @EnumConver(enumType = IsActiveEnum.class)
    @Condition
    private String isactive  ;

    /**
     * 描述
     */
    private String description  ;

    /**
     * 融资确认书
     */
    private byte[] signaturecontent;


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

    public String getTatemplateid() {
        return tatemplateid;
    }

    public void setTatemplateid(String tatemplateid) {
        this.tatemplateid = tatemplateid;
    }

    public String getAccountspayableid() {
        return accountspayableid;
    }

    public void setAccountspayableid(String accountspayableid) {
        this.accountspayableid = accountspayableid;
    }

    public String getBankid() {
        return bankid;
    }

    public void setBankid(String bankid) {
        this.bankid = bankid;
    }

    public String getSupplieraccountid() {
        return supplieraccountid;
    }

    public void setSupplieraccountid(String supplieraccountid) {
        this.supplieraccountid = supplieraccountid;
    }

    public BigDecimal getFinancingamount() {
        return financingamount;
    }

    public void setFinancingamount(BigDecimal financingamount) {
        this.financingamount = financingamount;
    }

    public Date getFinancingdate() {
        return financingdate;
    }

    public void setFinancingdate(Date financingdate) {
        this.financingdate = financingdate;
    }

    public Date getEstimatereturndate() {
        return estimatereturndate;
    }

    public void setEstimatereturndate(Date estimatereturndate) {
        this.estimatereturndate = estimatereturndate;
    }

    public String getIsfirstquote() {
        return isfirstquote;
    }

    public void setIsfirstquote(String isfirstquote) {
        this.isfirstquote = isfirstquote;
    }

    public String getLastoperationflag() {
        return lastoperationflag;
    }

    public void setLastoperationflag(String lastoperationflag) {
        this.lastoperationflag = lastoperationflag;
    }

    public BigDecimal getFinancingcost() {
        return financingcost;
    }

    public void setFinancingcost(BigDecimal financingcost) {
        this.financingcost = financingcost;
    }

    public String getIsrecourse() {
        return isrecourse;
    }

    public void setIsrecourse(String isrecourse) {
        this.isrecourse = isrecourse;
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

    public BigDecimal getRecoursediscount() {
        return recoursediscount;
    }

    public void setRecoursediscount(BigDecimal recoursediscount) {
        this.recoursediscount = recoursediscount;
    }

    public BigDecimal getNonrecoursediscount() {
        return nonrecoursediscount;
    }

    public void setNonrecoursediscount(BigDecimal nonrecoursediscount) {
        this.nonrecoursediscount = nonrecoursediscount;
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

    public byte[] getSignaturecontent() {
        return signaturecontent;
    }

    public void setSignaturecontent(byte[] signaturecontent) {
        this.signaturecontent = signaturecontent;
    }

    public AccountsPayableQuoteVo() {
    }


}
