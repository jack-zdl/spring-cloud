package com.ceying.biz.entity;

import com.ceying.common.base.CommonBaseObject;

import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @author: lidf
 * @date: 2018/3/28
 * @description:
 * @version: 2.0
 */
@Table(name = "t_biz_accountspayabletemp")
public class AccountsPayableTempEntity implements Serializable {

    /**
     * 主键id
     */
    @Id
    private String urid;

    /**
     * 租户ID
     */
    private String tenantid;

    /**
     * 批次号
     */
    private String batchno;

    /**
     * 合同编号
     */
    private String contractid;

    /**
     * 核心企业ID
     */
    private String corecompanyid;

    /**
     * 核心企业名称
     */
    private String corecompanyname;

    /**
     * 供应商名称
     */
    private String suppliername;

    /**
     * 入账时间
     */
    private String billdate;

    /**
     * 金额
     */
    private BigDecimal amount;

    /**
     * 应付日期
     */
    private String payabledate;

    /**
     * 扩展字段1
     */
    private String attribute1;

    /**
     * 扩展字段2
     */
    private String attribute2;

    /**
     * 描述
     */
    private String description;

    /**
     * 错误信息
     */
    private String errormessage;

    /**
     * 发票号
     */
    private String invoicenumber;

    private String createdby;
    private Date createdon;

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

    public String getBatchno() {
        return batchno;
    }

    public void setBatchno(String batchno) {
        this.batchno = batchno;
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

    public String getCorecompanyname() {
        return corecompanyname;
    }

    public void setCorecompanyname(String corecompanyname) {
        this.corecompanyname = corecompanyname;
    }

    public String getSuppliername() {
        return suppliername;
    }

    public void setSuppliername(String suppliername) {
        this.suppliername = suppliername;
    }

    public String getBilldate() {
        return billdate;
    }

    public void setBilldate(String billdate) {
        this.billdate = billdate;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getPayabledate() {
        return payabledate;
    }

    public void setPayabledate(String payabledate) {
        this.payabledate = payabledate;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getErrormessage() {
        return errormessage;
    }

    public void setErrormessage(String errormessage) {
        this.errormessage = errormessage;
    }

    public String getInvoicenumber() {
        return invoicenumber;
    }

    public void setInvoicenumber(String invoicenumber) {
        this.invoicenumber = invoicenumber;
    }

    public String getCreatedby() {
        return createdby;
    }

    public void setCreatedby(String createdby) {
        this.createdby = createdby;
    }

    public Date getCreatedon() {
        return createdon;
    }

    public void setCreatedon(Date createdon) {
        this.createdon = createdon;
    }
}
