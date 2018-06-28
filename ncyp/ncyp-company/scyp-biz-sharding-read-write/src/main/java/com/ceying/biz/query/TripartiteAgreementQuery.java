package com.ceying.biz.query;

import com.ceying.common.constant.CacheKeyConstant;
import com.ceying.common.enums.*;
import com.ceying.common.util.annotation.CacheConver;
import com.ceying.common.util.annotation.EnumConver;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Objects;

/**
 * 三方协议查询可融资应付账款
 * @author: zhangdl<br>
 * @date: 2018/4/9 15:16<br>
 * @version: 2.0 <br>
 */
public class TripartiteAgreementQuery {

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
    private String invoicenumber;
    private Date billdate;
    private Date payabledate;
    private BigDecimal amount;
    private BigDecimal financingamount;
    @EnumConver(enumType = BusinessTypeEnum.class)
    private String businesstype;
    private Date financingdate;
    @EnumConver(enumType = AccountsPayableStatusEnum.class)
    private String lastoperationflag;

    /** 
    * 通过枚举类的加value
    * @Author: zhangdl
    * @Date: 2018/4/9 
    */ 
    @EnumConver(enumType = TripartiteAgreementEnum.class)
    private String supplastoperateflag;
    @EnumConver(enumType = TripartiteAgreementEnum.class)
    private String corelastoperateflag;
    @EnumConver(enumType = TripartiteAgreementEnum.class)
    private String banklastoperateflag;

    private Date lendingdate;

    private Date returndate;
    @EnumConver(enumType = AfterSignEnum.class)
    private String aftersignflagname;
    /** 
    * 三方协议编号
    * @Author: zhangdl
    * @Date: 2018/4/11 
    */ 
    private String tacontractid;
    private String description;
    private Integer rowversion;

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

    public
    Date getFinancingdate() {
        return financingdate;
    }

    public
    void setFinancingdate(Date financingdate) {
        this.financingdate = financingdate;
    }

    public
    String getLastoperationflag() {
        return lastoperationflag;
    }

    public
    void setLastoperationflag(String lastoperationflag) {
        this.lastoperationflag = lastoperationflag;
    }

    public
    String getSupplastoperateflag() {
        return supplastoperateflag;
    }

    public
    void setSupplastoperateflag(String supplastoperateflag) {
        this.supplastoperateflag = supplastoperateflag;
    }

    public
    String getCorelastoperateflag() {
        return corelastoperateflag;
    }

    public
    void setCorelastoperateflag(String corelastoperateflag) {
        this.corelastoperateflag = corelastoperateflag;
    }

    public
    String getBanklastoperateflag() {
        return banklastoperateflag;
    }

    public
    void setBanklastoperateflag(String banklastoperateflag) {
        this.banklastoperateflag = banklastoperateflag;
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

    public
    TripartiteAgreementQuery() {
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
    String getBusinesstype() {
        return businesstype;
    }

    public
    void setBusinesstype(String businesstype) {
        this.businesstype = businesstype;
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
    String getAftersignflagname() {
        return aftersignflagname;
    }

    public
    void setAftersignflagname(String aftersignflagname) {
        this.aftersignflagname = aftersignflagname;
    }

    /**
    *
    * @Param: [urid, bankid, corecompanyid, supplierid, payableno, contractid, billdate, payabledate, amount, financingamount, businesstypename, financingdate, lastoperationflag, description, rowversion]
    * @return:
    * @Author: zhangdl
    * @Date:
    */
    public
    TripartiteAgreementQuery(String urid, String bankid, String corecompanyid, String supplierid, String payableno, String contractid,
                             Date billdate, Date payabledate, BigDecimal amount, BigDecimal financingamount, String businesstype,
                             Date financingdate, String lastoperationflag, String description, Integer rowversion) {
        this.urid = urid;
        this.bankid = bankid;
        this.corecompanyid = corecompanyid;
        this.supplierid = supplierid;
        this.payableno = payableno;
        this.contractid = contractid;
        this.billdate = billdate;
        this.payabledate = payabledate;
        this.amount = amount;
        this.financingamount = financingamount;
        this.businesstype = businesstype;
        this.financingdate = financingdate;
        this.lastoperationflag = lastoperationflag;
        this.description = description;
        this.rowversion = rowversion;
    }

    public
    TripartiteAgreementQuery(String urid, String bankid, String corecompanyid, String supplierid, String payableno, String contractid,
                             Date billdate, Date payabledate, BigDecimal amount, BigDecimal financingamount, String businesstype,
                             Date financingdate,String supplastoperateflag,String corelastoperateflag,String banklastoperateflag,String tacontractid, String description, Integer rowversion) {
        this.urid = urid;
        this.bankid = bankid;
        this.corecompanyid = corecompanyid;
        this.supplierid = supplierid;
        this.payableno = payableno;
        this.contractid = contractid;
        this.billdate = billdate;
        this.payabledate = payabledate;
        this.amount = amount;
        this.financingamount = financingamount;
        this.businesstype = businesstype;
        this.financingdate = financingdate;
        this.supplastoperateflag = supplastoperateflag;
        this.corelastoperateflag = corelastoperateflag;
        this.banklastoperateflag = banklastoperateflag;
        this.tacontractid = tacontractid;
        this.description = description;
        this.rowversion = rowversion;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TripartiteAgreementQuery that = (TripartiteAgreementQuery) o;
        return Objects.equals(urid, that.urid) &&
                Objects.equals(bankid, that.bankid) &&
                Objects.equals(corecompanyid, that.corecompanyid) &&
                Objects.equals(supplierid, that.supplierid) &&
                Objects.equals(payableno, that.payableno) &&
                Objects.equals(contractid, that.contractid) &&
                Objects.equals(isrecourse, that.isrecourse) &&
                Objects.equals(interestrate, that.interestrate) &&
                Objects.equals(invoicenumber, that.invoicenumber) &&
                Objects.equals(billdate, that.billdate) &&
                Objects.equals(payabledate, that.payabledate) &&
                Objects.equals(amount, that.amount) &&
                Objects.equals(financingamount, that.financingamount) &&
                Objects.equals(businesstype, that.businesstype) &&
                Objects.equals(businesstype, that.businesstype) &&
                Objects.equals(financingdate, that.financingdate) &&
                Objects.equals(lastoperationflag, that.lastoperationflag) &&
                Objects.equals(supplastoperateflag, that.supplastoperateflag) &&
                Objects.equals(corelastoperateflag, that.corelastoperateflag) &&
                Objects.equals(banklastoperateflag, that.banklastoperateflag) &&
                Objects.equals(lendingdate, that.lendingdate) &&
                Objects.equals(returndate, that.returndate) &&
                Objects.equals(aftersignflagname, that.aftersignflagname) &&
                Objects.equals(tacontractid, that.tacontractid) &&
                Objects.equals(description, that.description) &&
                Objects.equals(rowversion, that.rowversion);
    }

    @Override
    public int hashCode() {
        return Objects.hash(urid, bankid, corecompanyid, supplierid, payableno, contractid, isrecourse, interestrate, invoicenumber, billdate, payabledate, amount, financingamount, businesstype, businesstype, financingdate, lastoperationflag, supplastoperateflag, corelastoperateflag, banklastoperateflag, lendingdate, returndate, aftersignflagname, tacontractid, description, rowversion);
    }
}
