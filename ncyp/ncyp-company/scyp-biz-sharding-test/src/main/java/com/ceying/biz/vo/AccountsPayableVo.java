package com.ceying.biz.vo;

import com.ceying.common.constant.ConditionTypeConstant;
import com.ceying.common.constant.ExtremeTypeConstant;
import com.ceying.common.util.annotation.Condition;
import com.ceying.common.util.annotation.Extreme;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @author: lidf
 * @date: 2018/3/28
 * @description:
 * @version: 2.0
 */
public class AccountsPayableVo implements Serializable{

    private static final long serialVersionUID = 3007369435990997798L;
    /**
     * 页码
     */
    private Integer page;
    /**
     * 行数
     */
    private Integer rows;

    private String sidx;

    private String sord;

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


    private String urid;

    private BigDecimal corecompanysupplierrate;

    /**
     * 合同编号
     */
    @Condition(type = ConditionTypeConstant.LIKE)
    private String contractid;


    /**
     * 供应商ID
     */
    @Condition
    private String supplierid;

    @Condition
    private String corecompanyid;

    /**
     * 入账时间
     */
    private Date billdate;

    /**
     * 金额
     */
    private BigDecimal amount;
    @Extreme(type = ExtremeTypeConstant.GREATER_EQUAL,field = "amount")
    private BigDecimal minAmount;
    @Extreme(type = ExtremeTypeConstant.LESS_EQUAL,field = "amount")
    private BigDecimal maxAmount;

    /**
     * 融资金额
     */
    private BigDecimal financingamount;


    /**
     * 保理到期日
     */
    private Date payabledate;

    /**
     * 创建日期
     */
    private Date createdon;
    /**
     * 修改版本
     */
    private Integer rowversion;

    /**
     * 描述
     */
    private String description;

    /**
     * 发票号
     */
    @Condition(type = ConditionTypeConstant.LIKE)
    private String invoicenumber;

    /**
     * 应付账款到期日
     */
    private Date expiringdate;

    private String userId;

    private String bussinesstype;
    /**
     * 是否有效
     */
    @Condition
    private String isactive;

    @Condition(type = ConditionTypeConstant.IN)
    private String lastoperationflag;

    private String roleFlag;

    public Date getCreatedon() {
        return createdon;
    }

    public void setCreatedon(Date createdon) {
        this.createdon = createdon;
    }

    public String getIsactive() {
        return isactive;
    }

    public void setIsactive(String isactive) {
        this.isactive = isactive;
    }

    public BigDecimal getFinancingamount() {
        return financingamount;
    }

    public void setFinancingamount(BigDecimal financingamount) {
        this.financingamount = financingamount;
    }

    public String getCorecompanyid() {
        return corecompanyid;
    }

    public void setCorecompanyid(String corecompanyid) {
        this.corecompanyid = corecompanyid;
    }

    public String getRoleFlag() {
        return roleFlag;
    }

    public void setRoleFlag(String roleFlag) {
        this.roleFlag = roleFlag;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getBussinesstype() {
        return bussinesstype;
    }

    public void setBussinesstype(String bussinesstype) {
        this.bussinesstype = bussinesstype;
    }

    public String getLastoperationflag() {
        return lastoperationflag;
    }

    public void setLastoperationflag(String lastoperationflag) {
        this.lastoperationflag = lastoperationflag;
    }

    public BigDecimal getCorecompanysupplierrate() {
        return corecompanysupplierrate;
    }

    public void setCorecompanysupplierrate(BigDecimal corecompanysupplierrate) {
        this.corecompanysupplierrate = corecompanysupplierrate;
    }

    public BigDecimal getMinAmount() {
        return minAmount;
    }

    public void setMinAmount(BigDecimal minAmount) {
        this.minAmount = minAmount;
    }

    public BigDecimal getMaxAmount() {
        return maxAmount;
    }

    public void setMaxAmount(BigDecimal maxAmount) {
        this.maxAmount = maxAmount;
    }

    public String getUrid() {
        return urid;
    }

    public void setUrid(String urid) {
        this.urid = urid;
    }

    public String getContractid() {
        return contractid;
    }

    public void setContractid(String contractid) {
        this.contractid = contractid;
    }

    public String getSupplierid() {
        return supplierid;
    }

    public void setSupplierid(String supplierid) {
        this.supplierid = supplierid;
    }

    public Date getBilldate() {
        return billdate;
    }

    public void setBilldate(Date billdate) {
        this.billdate = billdate;
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

    public Integer getRowversion() {
        return rowversion;
    }

    public void setRowversion(Integer rowversion) {
        this.rowversion = rowversion;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getInvoicenumber() {
        return invoicenumber;
    }

    public void setInvoicenumber(String invoicenumber) {
        this.invoicenumber = invoicenumber;
    }

    public Date getExpiringdate() {
        return expiringdate;
    }

    public void setExpiringdate(Date expiringdate) {
        this.expiringdate = expiringdate;
    }
}
