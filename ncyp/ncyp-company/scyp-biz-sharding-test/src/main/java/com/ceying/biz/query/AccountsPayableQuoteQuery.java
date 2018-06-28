package com.ceying.biz.query;

import com.ceying.common.constant.CacheKeyConstant;
import com.ceying.common.enums.IsActiveEnum;
import com.ceying.common.util.annotation.CacheConver;
import com.ceying.common.util.annotation.EnumConver;

import java.util.Date;

/**
 * @author: zhangdl<br>
 * @date: 2018/4/13 11:17<br>
 * @version: 2.0 <br>
 * 应付账款报价表
 */
public class AccountsPayableQuoteQuery {
    private String urid;
    @CacheConver(cacheType = CacheKeyConstant.ORGNAMEMAP)
    private String bankid;
    private String contractid;
    private String financingamount;
    private Date financingdate;
    @EnumConver(enumType = IsActiveEnum.class)
    private String isactive;

    private String isrecourse;
    private String rowversion;
    private String interestrate;

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
    String getContractid() {
        return contractid;
    }

    public
    void setContractid(String contractid) {
        this.contractid = contractid;
    }

    public
    String getFinancingamount() {
        return financingamount;
    }

    public
    void setFinancingamount(String financingamount) {
        this.financingamount = financingamount;
    }

    public Date getFinancingdate() {
        return financingdate;
    }

    public void setFinancingdate(Date financingdate) {
        this.financingdate = financingdate;
    }

    public
    String getIsactive() {
        return isactive;
    }

    public
    void setIsactive(String isactive) {
        this.isactive = isactive;
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
    String getRowversion() {
        return rowversion;
    }

    public
    void setRowversion(String rowversion) {
        this.rowversion = rowversion;
    }

    public
    String getInterestrate() {
        return interestrate;
    }

    public
    void setInterestrate(String interestrate) {
        this.interestrate = interestrate;
    }
}
