package com.ceying.biz.vo;

import java.util.List;

/**
 * @author: mzq
 * @date: 2018/4/2
 * @description : 供应商专户账户VO类
 * @version: 2.0
 */
public class SupplierAccountsVO {
    private String sidx;

    private String sord;
    //页码
    private Integer page=1;
    //行数
    private Integer rows=50;

    private String orgId;

    private String accountname;

    private String accountnumber;

    private String bankid;

    private String supplierid;

    private String isactive;

    private String urid;

    private List<Integer> businessType;

    public List<Integer> getBusinessType() {
        return businessType;
    }

    public void setBusinessType(List<Integer> businessType) {
        this.businessType = businessType;
    }

    public String getUrid() {
        return urid;
    }

    public void setUrid(String urid) {
        this.urid = urid;
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

    public String getAccountname() {
        return accountname;
    }

    public void setAccountname(String accountname) {
        this.accountname = accountname;
    }

    public String getAccountnumber() {
        return accountnumber;
    }

    public void setAccountnumber(String accountnumber) {
        this.accountnumber = accountnumber;
    }

    public String getBankid() {
        return bankid;
    }

    public void setBankid(String bankid) {
        this.bankid = bankid;
    }

    public String getSupplierid() {
        return supplierid;
    }

    public void setSupplierid(String supplierid) {
        this.supplierid = supplierid;
    }

    public String getIsactive() {
        return isactive;
    }

    public void setIsactive(String isactive) {
        this.isactive = isactive;
    }

    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
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
}
