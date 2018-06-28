package com.ceying.biz.entity;

import com.ceying.common.base.CommonBaseObject;
import com.ceying.common.constant.CacheKeyConstant;
import com.ceying.common.constant.ConditionTypeConstant;
import com.ceying.common.constant.IsolationLevelConstant;
import com.ceying.common.enums.AccountsPayableStatusEnum;
import com.ceying.common.enums.BusinessTypeEnum;
import com.ceying.common.enums.IsActiveEnum;
import com.ceying.common.util.annotation.*;
import com.ceying.common.util.datetools.DateUtil;
import com.ceying.common.util.sequence.SequenceUtil;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import static com.ceying.common.constant.IsolationLevelConstant.ORG;

/**
 * @author: lidf
 * @date: 2018/3/28
 * @description:
 * @version: 2.0
 */
@Table(name = "t_biz_accountspayable")
public class AccountsPayableEntity extends CommonBaseObject implements Serializable {

    private static final long serialVersionUID = 6490885841273316343L;
    /**
     * 主键ID
     */
    @Id
    @Column(name="urid")
    private String urid;

    /**
     * 租户ID
     */
    private String tenantid;

    /**
     * 应付账款编号
     */
    private String payableno;

    /**
     * 合同编号
     */
    private String contractid;

    /**
     * 核心企业ID
     */
    @CacheConver(cacheType = CacheKeyConstant.ORGNAMEMAP)
    private String corecompanyid;

    /**
     * 供应商ID
     */
    @CacheConver(cacheType = CacheKeyConstant.ORGNAMEMAP)
    @Condition
    @OrgInsulation(level = IsolationLevelConstant.ROOTlEVEL)
    private String supplierid;

    /**
     * 优先融资提供方ID
     */
    @CacheConver(cacheType = CacheKeyConstant.ORGNAMEMAP)
    private String bankid;

    /**
     * 入账时间
     */
    private Date billdate;

    /**
     * 金额
     */
    private BigDecimal amount;

    /**
     * 保理到期日
     */
    private Date payabledate;


    /**
     * 最后一个操作标识
     */
    @EnumConver(enumType = AccountsPayableStatusEnum.class)
    @Condition(type = ConditionTypeConstant.IN)
    private String lastoperationflag;


    /**
     * 融资金额
     */
    private BigDecimal financingamount;

    /**
     * 冻结供应商融资服务费
     */
    private BigDecimal freezeamount;

    /**
     * 核心企业向供应商收取的费率(针对一笔应付账款)
     */
    private BigDecimal corecompanysupplierrate;

    /**
     * 向供应商收取的总费率（平台+核心企业）
     */
    private BigDecimal supplierrate;

    /**
     * 向供应商收取的费率（核心企业）
     */
    private BigDecimal suppliercorerate;

    /**
     * 融资期限
     */
    private Date financingdate;

    /**
     * 扩展字段1
     */
    private String attribute1;

    /**
     * 扩展字段2
     */
    private String attribute2;

    /**
     * 是否有效
     */
    @EnumConver(enumType = IsActiveEnum.class)
    @Condition
    private String isactive;


    /**
     * 描述
     */
    private String description;

    /**
     * 是否是第一次融资
     */
    private String isfirstfinance;

    /**
     * 冻结供应商融资服务费保证金
     */
    private BigDecimal securitydeposit;

    /**
     * 发票号
     */
    private String invoicenumber;

    /**
     * 应付账款到期日
     */
    private Date expiringdate;

    /**
     * 融资意向书
     */
    private byte[] signaturecontent;

    /**
     * 业务类型
     */
    @EnumConver(enumType = BusinessTypeEnum.class)
    private String businesstype;


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

    public String getBankid() {
        return bankid;
    }

    public void setBankid(String bankid) {
        this.bankid = bankid;
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

    public String getLastoperationflag() {
        return lastoperationflag;
    }

    public void setLastoperationflag(String lastoperationflag) {
        this.lastoperationflag = lastoperationflag;
    }

    public BigDecimal getFinancingamount() {
        return financingamount;
    }

    public void setFinancingamount(BigDecimal financingamount) {
        this.financingamount = financingamount;
    }

    public BigDecimal getFreezeamount() {
        return freezeamount;
    }

    public void setFreezeamount(BigDecimal freezeamount) {
        this.freezeamount = freezeamount;
    }

    public BigDecimal getCorecompanysupplierrate() {
        return corecompanysupplierrate;
    }

    public void setCorecompanysupplierrate(BigDecimal corecompanysupplierrate) {
        this.corecompanysupplierrate = corecompanysupplierrate;
    }

    public BigDecimal getSupplierrate() {
        return supplierrate;
    }

    public void setSupplierrate(BigDecimal supplierrate) {
        this.supplierrate = supplierrate;
    }

    public BigDecimal getSuppliercorerate() {
        return suppliercorerate;
    }

    public void setSuppliercorerate(BigDecimal suppliercorerate) {
        this.suppliercorerate = suppliercorerate;
    }

    public Date getFinancingdate() {
        return financingdate;
    }

    public void setFinancingdate(Date financingdate) {
        this.financingdate = financingdate;
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

    public String getIsactive() {
        return isactive;
    }

    public void setIsactive(String isactive) {
        this.isactive = isactive;
    }


    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getIsfirstfinance() {
        return isfirstfinance;
    }

    public void setIsfirstfinance(String isfirstfinance) {
        this.isfirstfinance = isfirstfinance;
    }

    public BigDecimal getSecuritydeposit() {
        return securitydeposit;
    }

    public void setSecuritydeposit(BigDecimal securitydeposit) {
        this.securitydeposit = securitydeposit;
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

    public byte[] getSignaturecontent() {
        return signaturecontent;
    }

    public void setSignaturecontent(byte[] signaturecontent) {
        this.signaturecontent = signaturecontent;
    }

    public String getBusinesstype() {
        return businesstype;
    }

    public void setBusinesstype(String businesstype) {
        this.businesstype = businesstype;
    }

    public AccountsPayableEntity() {
    }

    /**
     * 全参构造函数
     * @param tenantid 租户ID
     * @param payableno  最后一个操作标识
     * @param contractid 合同编号
     * @param corecompanyid 核心企业ID
     * @param supplierid 供应商id
     * @param bankid  优先融资提供方ID
     * @param billdate  入账时间
     * @param amount 金额
     * @param payabledate   应付日期
     * @param lastoperationflag 最后一次操作标识
     * @param financingamount 融资金额
     * @param freezeamount 冻结供应商融资服务费
     * @param financingdate 融资期限
     * @param attribute1 扩展字段1
     * @param attribute2 扩展字段2
     * @param isActive 有效无效
     * @param createdby 创建人
     * @param description 描述
     * @param isfirstfinance 是否是第一次融资
     * @param securitydeposit 冻结供应商融资服务费保证金
     */
    public AccountsPayableEntity( String tenantid, String payableno, String contractid, String corecompanyid,
                     String supplierid, String bankid, Date billdate, BigDecimal amount, Date payabledate,
                     String lastoperationflag,  BigDecimal financingamount, BigDecimal freezeamount, BigDecimal supplierrate,
                     BigDecimal coreCompanySupplierRate, Date financingdate, String attribute1, String attribute2, String isActive,
                     String createdby,  String description,
                     String isfirstfinance, BigDecimal securitydeposit) {
        this.urid = SequenceUtil.UUID();
        this.tenantid = tenantid;
        this.payableno = payableno;
        this.contractid = contractid;
        this.corecompanyid = corecompanyid;
        this.supplierid = supplierid;
        this.bankid = bankid;
        this.billdate = billdate;
        this.amount = amount;
        this.payabledate = payabledate;
        this.lastoperationflag = lastoperationflag;
        this.financingamount = financingamount;
        this.freezeamount = freezeamount;
        this.supplierrate = supplierrate;
        this.corecompanysupplierrate = coreCompanySupplierRate;
        this.financingdate = financingdate;
        this.attribute1 = attribute1;
        this.attribute2 = attribute2;
        this.isactive = isActive;
        this.createdby = createdby;
        this.createdon = new Date();
        this.rowversion = 1;
        this.description = description;
        this.isfirstfinance = isfirstfinance;
        this.securitydeposit = securitydeposit;
    }

    /**
     * 修改应付账款信息对象
     * @param accountsPayable 应付账款信息对象
     * @param payableno  最后一个操作标识
     * @param billdate  入账时间
     * @param amount 金额
     * @param payabledate   应付日期
     * @param lastoperationflag 最后一次操作标识
     * @param financingamount 融资金额
     * @param freezeamount 冻结供应商融资服务费
     * @param financingdate 融资期限
     * @param attribute1 扩展字段1
     * @param attribute2 扩展字段2
     * @param isActive 有效无效
     * @param lastmodifiedby 修改人
     * @param description 描述
     * @param isfirstfinance 是否是第一次融资
     * @param securitydeposit 冻结供应商融资服务费保证金
     */
    public void setAccountsPayable(AccountsPayableEntity accountsPayable, String payableno,  Date billdate, BigDecimal amount, Date payabledate,
                                   String lastoperationflag,  BigDecimal financingamount, BigDecimal freezeamount, BigDecimal supplierrate,
                                   BigDecimal corecompanysupplierrate, Date financingdate, String attribute1, String attribute2, String isActive,
                                   String lastmodifiedby,   String description, String isfirstfinance, BigDecimal securitydeposit) {
        accountsPayable.setPayableno(payableno == null ? accountsPayable.getPayableno():payableno);
        accountsPayable.setBilldate(billdate  == null ? accountsPayable.getBilldate(): billdate);
        accountsPayable.setAmount(amount  == null ? accountsPayable.getAmount():amount);
        accountsPayable.setPayabledate(payabledate == null ? accountsPayable.getPayabledate():payabledate);
        accountsPayable.setLastoperationflag(lastoperationflag == null ? accountsPayable.getLastoperationflag():lastoperationflag);
        accountsPayable.setFinancingamount(financingamount == null ? accountsPayable.getFinancingamount():financingamount);
        accountsPayable.setFreezeamount(freezeamount == null ? accountsPayable.getFreezeamount():freezeamount);
        accountsPayable.setSupplierrate(supplierrate == null ? accountsPayable.getSupplierrate():supplierrate);
        accountsPayable.setCorecompanysupplierrate(corecompanysupplierrate == null ? accountsPayable.getCorecompanysupplierrate():corecompanysupplierrate);
        accountsPayable.setFinancingdate(financingdate  == null ? accountsPayable.getFinancingdate():financingdate);
        accountsPayable.setAttribute1(attribute1  == null ? accountsPayable.getAttribute1():attribute1);
        accountsPayable.setAttribute2(attribute2  == null ? accountsPayable.getAttribute2():attribute2);
        accountsPayable.setIsactive(isActive  == null ? accountsPayable.getIsactive():isActive);
        accountsPayable.setLastmodifiedby(lastmodifiedby);
        accountsPayable.setLastmodifiedon(new Date());
        accountsPayable.setRowversion(accountsPayable.getRowversion()+1);
        accountsPayable.setDescription(description  == null ? accountsPayable.getDescription():description);
        accountsPayable.setIsfirstfinance(isfirstfinance  == null ? accountsPayable.getIsfirstfinance():isfirstfinance);
        accountsPayable.setSecuritydeposit(securitydeposit  == null ? accountsPayable.getSecuritydeposit():securitydeposit);
    }


    /**
     * 修改应付账款信息对象
     * @param accountsPayable 应付账款信息对象
     * @param lastoperationflag 最后一次操作标识
     * @param isActive 有效无效
     * @param lastmodifiedby 修改人
     * @param description 描述
     * @param isfirstfinance 是否是第一次融资
     * @param securitydeposit 冻结供应商融资服务费保证金
     */
    public void setAccountsPayable(AccountsPayableEntity accountsPayable, String lastoperationflag,   String isActive,
                                   String lastmodifiedby,   String description, String isfirstfinance, BigDecimal securitydeposit) {
        accountsPayable.setLastoperationflag(lastoperationflag);
        accountsPayable.setIsactive(isActive);
        accountsPayable.setLastmodifiedby(lastmodifiedby);
        accountsPayable.setLastmodifiedon(DateUtil.getCurrentDateTime());
        accountsPayable.setDescription(description);
        accountsPayable.setIsfirstfinance(isfirstfinance);
        accountsPayable.setSecuritydeposit(securitydeposit);
        accountsPayable.setSignaturecontent(accountsPayable.getSignaturecontent());
    }

    @Override
    public
    String toString() {
        return "AccountsPayable{" +
                "urid='" + urid + '\'' +
                ", tenantid=" + tenantid +
                ", contractid='" + contractid + '\'' +
                ", corecompanyid='" + corecompanyid + '\'' +
                ", supplierid='" + supplierid + '\'' +
                ", bankid='" + bankid + '\'' +
                ", billdate=" + billdate +
                ", amount=" + amount +
                ", payabledate=" + payabledate +
                ", lastoperationflag='" + lastoperationflag + '\'' +
                ", financingamount=" + financingamount +
                ", financingdate=" + financingdate +
                ", attribute1='" + attribute1 + '\'' +
                ", attribute2='" + attribute2 + '\'' +
                ", createdby='" + createdby + '\'' +
                ", createdon=" + createdon +
                ", lastmodifiedby='" + lastmodifiedby + '\'' +
                ", lastmodifiedon=" + lastmodifiedon +
                ", rowversion=" + rowversion +
                ", description='" + description + '\'' +
                '}';
    }
}
