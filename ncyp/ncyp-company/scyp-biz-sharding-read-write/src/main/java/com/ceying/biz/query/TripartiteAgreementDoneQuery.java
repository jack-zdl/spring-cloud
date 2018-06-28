package com.ceying.biz.query;

import com.ceying.common.constant.CacheKeyConstant;
import com.ceying.common.enums.*;
import com.ceying.common.util.annotation.CacheConver;
import com.ceying.common.util.annotation.EnumConver;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 三方协议已完成查询类
 * @author: zhangdl<br>
 * @date: 2018/4/23 17:17<br>
 * @version: 2.0 <br>
 */

public class TripartiteAgreementDoneQuery {

    private String urid;
    /**
     * 通过缓存的加name
     * @Author: zhangdl
     * @Date: 2018/4/9
     */
    @CacheConver(cacheType = CacheKeyConstant.ORGNAMEMAP)
    private String bankid;
    @CacheConver(cacheType = CacheKeyConstant.ORGNAMEMAP)
    private String corecompanyid;
    @CacheConver(cacheType = CacheKeyConstant.ORGNAMEMAP)
    private String supplierid;
    private String payableno;
    @CacheConver(cacheType = CacheKeyConstant.ORGNAMEMAP)
    private String contractid;
    @EnumConver(enumType = IsRecourseEnum.class)
    private String isrecourse;
    private String interestrate;
    private Date estimatereturndate;
    private String invoicenumber;
    private Date billdate;
    private Date payabledate;
    private Date expiringdate;
    private BigDecimal amount;
    private BigDecimal financingamount;
    @EnumConver(enumType = BusinessTypeEnum.class)
    private String businesstype;
    private Date financingdate;


    private Date lendingdate;

    private Date returndate;
    @EnumConver(enumType = AfterSignEnum.class)
    private String aftersignflag;
    /**
     * 三方协议编号
     * @Author: zhangdl
     * @Date: 2018/4/11
     */
    private String tacontractid;
    private String description;
    private Integer rowversion;


    public Date getExpiringdate() {
        return expiringdate;
    }

    public void setExpiringdate(Date expiringdate) {
        this.expiringdate = expiringdate;
    }

    public
    String getUrid() {
        return urid;
    }

    public
    void setUrid(String urid) {
        this.urid = urid;
    }

    public
    String getBankid() {
        return bankid;
    }

    public
    void setBankid(String bankid) {
        this.bankid = bankid;
    }

    public
    String getCorecompanyid() {
        return corecompanyid;
    }

    public
    void setCorecompanyid(String corecompanyid) {
        this.corecompanyid = corecompanyid;
    }

    public
    String getSupplierid() {
        return supplierid;
    }

    public
    void setSupplierid(String supplierid) {
        this.supplierid = supplierid;
    }

    public
    String getPayableno() {
        return payableno;
    }

    public
    void setPayableno(String payableno) {
        this.payableno = payableno;
    }

    public
    String getContractid() {
        return contractid;
    }

    public
    void setContractid(String contractid) {
        this.contractid = contractid;
    }

    public
    String getIsrecourse() {
        return isrecourse;
    }

    public
    void setIsrecourse(String isrecourse) {
        this.isrecourse = isrecourse;
    }

    public
    String getInterestrate() {
        return interestrate;
    }

    public
    void setInterestrate(String interestrate) {
        this.interestrate = interestrate;
    }

    public
    String getInvoicenumber() {
        return invoicenumber;
    }

    public
    void setInvoicenumber(String invoicenumber) {
        this.invoicenumber = invoicenumber;
    }

    public
    Date getBilldate() {
        return billdate;
    }

    public
    void setBilldate(Date billdate) {
        this.billdate = billdate;
    }

    public
    Date getPayabledate() {
        return payabledate;
    }

    public
    void setPayabledate(Date payabledate) {
        this.payabledate = payabledate;
    }

    public
    BigDecimal getAmount() {
        return amount;
    }

    public
    void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public
    BigDecimal getFinancingamount() {
        return financingamount;
    }

    public
    void setFinancingamount(BigDecimal financingamount) {
        this.financingamount = financingamount;
    }

    public String getAftersignflag() {
        return aftersignflag;
    }

    public void setAftersignflag(String aftersignflag) {
        this.aftersignflag = aftersignflag;
    }

    public
    String getBusinesstype() {
        return businesstype;
    }

    public
    void setBusinesstype(String businesstype) {
        this.businesstype = businesstype;
    }

    public
    Date getFinancingdate() {
        return financingdate;
    }

    public
    void setFinancingdate(Date financingdate) {
        this.financingdate = financingdate;
    }

    public
    Date getLendingdate() {
        return lendingdate;
    }

    public
    void setLendingdate(Date lendingdate) {
        this.lendingdate = lendingdate;
    }

    public
    Date getReturndate() {
        return returndate;
    }

    public
    void setReturndate(Date returndate) {
        this.returndate = returndate;
    }

    public
    String getTacontractid() {
        return tacontractid;
    }

    public
    void setTacontractid(String tacontractid) {
        this.tacontractid = tacontractid;
    }

    public
    String getDescription() {
        return description;
    }

    public
    void setDescription(String description) {
        this.description = description;
    }

    public
    Integer getRowversion() {
        return rowversion;
    }

    public
    void setRowversion(Integer rowversion) {
        this.rowversion = rowversion;
    }

    public Date getEstimatereturndate() {
        return estimatereturndate;
    }

    public void setEstimatereturndate(Date estimatereturndate) {
        this.estimatereturndate = estimatereturndate;
    }
}
