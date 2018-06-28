package com.ceying.biz.query;

import com.ceying.common.constant.CacheKeyConstant;
import com.ceying.common.util.annotation.CacheConver;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @author: lidf
 * @date: 2018/4/16
 * @description:
 * @version: 2.0
 */
public class AccountsPayableTasksQuery {

    /**
     * 应付账款urid
     */
    private String urid;
    /**
     * 核心企业
     */
    @CacheConver(cacheType = CacheKeyConstant.ORGNAMEMAP)
    private String corecompanyid;
    /**
     * 供应商
     */
    @CacheConver(cacheType = CacheKeyConstant.ORGNAMEMAP)
    private String supplierid;
    /**
     * 合同编号
     */
    private String contractid;
    /**
     * 发票号
     */
    private String invoicenumber;
    /**
     * 发票金额
     */
    private BigDecimal amount;
    /**
     * 保理日期
     */
    private Date payabledate;
    /**
     * 应付账款编号
     */
    private String payableno;

    /**
     * 最后一个操作标识
     */
    private String lastoperationflag;

    /**
     * 报价urid
     */
    private String quoteurid;
    /**
     * 报价银行id
     */
    private String quotebankid;
    /**
     * 融资到期日
     */
    private Date quotefinancingdate;

    /**
     * 待办总数
     */
    private int total;


    /**
     * 流程定义所需字段
     */
    private String id;
    private String name;
    private String formKey;
    private String processInstanceId;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
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

    public String getLastoperationflag() {
        return lastoperationflag;
    }

    public void setLastoperationflag(String lastoperationflag) {
        this.lastoperationflag = lastoperationflag;
    }

    public String getUrid() {
        return urid;
    }

    public void setUrid(String urid) {
        this.urid = urid;
    }

    public String getFormKey() {
        return formKey;
    }

    public void setFormKey(String formKey) {
        this.formKey = formKey;
    }

    public String getProcessInstanceId() {
        return processInstanceId;
    }

    public void setProcessInstanceId(String processInstanceId) {
        this.processInstanceId = processInstanceId;
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

    public Date getPayabledate() {
        return payabledate;
    }

    public void setPayabledate(Date payabledate) {
        this.payabledate = payabledate;
    }

    public String getPayableno() {
        return payableno;
    }

    public void setPayableno(String payableno) {
        this.payableno = payableno;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public AccountsPayableTasksQuery(){}

    public AccountsPayableTasksQuery(String urid, String corecompanyid, String supplierid, String contractid,
                                     String invoicenumber, BigDecimal amount, Date payabledate, String payableno,
                                     String lastoperationflag, String quoteurid, Date quotefinancingdate,
                                     String id, String name, String formKey, String processInstanceId) {
        this.urid = urid;
        this.corecompanyid = corecompanyid;
        this.supplierid = supplierid;
        this.contractid = contractid;
        this.invoicenumber = invoicenumber;
        this.amount = amount;
        this.payabledate = payabledate;
        this.payableno = payableno;
        this.lastoperationflag = lastoperationflag;
        this.quoteurid = quoteurid;
        this.quotefinancingdate = quotefinancingdate;
        this.id = id;
        this.name = name;
        this.formKey = formKey;
        this.processInstanceId = processInstanceId;
    }
}
