package com.ceying.biz.query;

import com.ceying.common.constant.CacheKeyConstant;
import com.ceying.common.enums.BusinessTypeEnum;
import com.ceying.common.util.annotation.CacheConver;
import com.ceying.common.util.annotation.EnumConver;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 三方协议
 * @author: zhangdl<br>
 * @date: 2018/4/19 14:18<br>
 * @version: 2.0 <br>
 */
public class TripartiteAgreementTaskQuery {
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
    //发票号
    private String contractid;
    //应付账款编号
    private String tenantid;
    //
    private Date billdate;
    //
    private Date expiringdate;
    //三方协议编号
    private String tacontractid;
    //应付账号编号
    private String payableno;

    @EnumConver(enumType = BusinessTypeEnum.class)
    private String businesstype;
    //实际融资金额
    private BigDecimal  financingamount;

    private Date financingdate;

    /**
    * 发票号
    * @Author: zhangdl
    * @Date: 2018/4/19
    */
    private String invoicenumber;

    private BigDecimal amount;
    private Date payabledate;

    //工作流相关的属性
    private String id;
    private String name;
    private String formKey;
    private String processInstanceId;
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
    String getContractid() {
        return contractid;
    }

    public
    void setContractid(String contractid) {
        this.contractid = contractid;
    }

    public
    String getTenantid() {
        return tenantid;
    }

    public
    void setTenantid(String tenantid) {
        this.tenantid = tenantid;
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
    Date getExpiringdate() {
        return expiringdate;
    }

    public
    void setExpiringdate(Date expiringdate) {
        this.expiringdate = expiringdate;
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
    String getInvoicenumber() {
        return invoicenumber;
    }

    public
    void setInvoicenumber(String invoicenumber) {
        this.invoicenumber = invoicenumber;
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
    Date getPayabledate() {
        return payabledate;
    }

    public
    void setPayabledate(Date payabledate) {
        this.payabledate = payabledate;
    }

    public
    String getId() {
        return id;
    }

    public
    void setId(String id) {
        this.id = id;
    }

    public
    String getName() {
        return name;
    }

    public
    void setName(String name) {
        this.name = name;
    }

    public
    String getFormKey() {
        return formKey;
    }

    public
    void setFormKey(String formKey) {
        this.formKey = formKey;
    }

    public
    String getProcessInstanceId() {
        return processInstanceId;
    }

    public
    void setProcessInstanceId(String processInstanceId) {
        this.processInstanceId = processInstanceId;
    }

    public String getTacontractid() {
        return tacontractid;
    }

    public void setTacontractid(String tacontractid) {
        this.tacontractid = tacontractid;
    }

    public String getPayableno() {
        return payableno;
    }

    public void setPayableno(String payableno) {
        this.payableno = payableno;
    }

}
