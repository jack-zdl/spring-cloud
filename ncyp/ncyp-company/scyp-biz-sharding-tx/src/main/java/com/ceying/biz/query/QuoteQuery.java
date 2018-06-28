package com.ceying.biz.query;

import com.ceying.common.constant.CacheKeyConstant;
import com.ceying.common.enums.AccountsPayableStatusEnum;
import com.ceying.common.util.annotation.CacheConver;
import com.ceying.common.util.annotation.EnumConver;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @author : Meow
 * @date : 2018-5-29
 * @description : TODO
 */
public class QuoteQuery {
    @CacheConver(cacheType = CacheKeyConstant.ORGNAMEMAP)
    private String corecompanyid;
    @CacheConver(cacheType = CacheKeyConstant.ORGNAMEMAP)
    private String supplierid;
    private String contractid;
    private String invoicenumber;
    private BigDecimal amount;
    private Date estimatereturndate;
    @CacheConver(cacheType = CacheKeyConstant.ORGNAMEMAP)
    private String bankid;
    private BigDecimal financingamount;
    @EnumConver(enumType = AccountsPayableStatusEnum.class)
    private String lastoperationflag;

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

    public String getContractid() {
        return contractid;
    }

    public void setContractid(String contractid) {
        this.contractid = contractid;
    }

    public String getInvoicenumber() {
        return invoicenumber;
    }

    public void setInvoicenumber(String invoicenumber) {
        this.invoicenumber = invoicenumber;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public Date getEstimatereturndate() {
        return estimatereturndate;
    }

    public void setEstimatereturndate(Date estimatereturndate) {
        this.estimatereturndate = estimatereturndate;
    }

    public String getBankid() {
        return bankid;
    }

    public void setBankid(String bankid) {
        this.bankid = bankid;
    }

    public BigDecimal getFinancingamount() {
        return financingamount;
    }

    public void setFinancingamount(BigDecimal financingamount) {
        this.financingamount = financingamount;
    }

    public String getLastoperationflag() {
        return lastoperationflag;
    }

    public void setLastoperationflag(String lastoperationflag) {
        this.lastoperationflag = lastoperationflag;
    }
}
