package com.ceying.biz.vo;

import com.ceying.common.constant.ConditionTypeConstant;
import com.ceying.common.util.annotation.TablesCondition;

/**
 * @author : Meow
 * @date : 2018-5-29
 * @description : 报价查询
 */
public class QuoteVO {
    private Integer page;
    private Integer rows;
    private String sidx;
    private String sord;
    @TablesCondition(type = ConditionTypeConstant.LIKE,table = "a")
    private String payableno;
    @TablesCondition(type = ConditionTypeConstant.LIKE,table = "a")
    private String contractid;
    @TablesCondition(table = "a")
    private String bankid;
    private String urid;
    @TablesCondition(table = "a")
    private String supplierid;

    @TablesCondition(table = "a")
    private String corecompanyid;

    public String getSupplierid() {
        return supplierid;
    }

    public void setSupplierid(String supplierid) {
        this.supplierid = supplierid;
    }

    public String getCorecompanyid() {
        return corecompanyid;
    }

    public void setCorecompanyid(String corecompanyid) {
        this.corecompanyid = corecompanyid;
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

    public String getBankid() {
        return bankid;
    }

    public void setBankid(String bankid) {
        this.bankid = bankid;
    }

    public String getUrid() {
        return urid;
    }

    public void setUrid(String urid) {
        this.urid = urid;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }

    public String getSidx() {
        return sidx;
    }

    public void setSidx(String sidx) {
        this.sidx = sidx;
    }

    public String getSord() {
        return sord;
    }

    public void setSord(String sord) {
        this.sord = sord;
    }
}
