/*
 * Copyright (c) 2017 CeYing and/or its affiliates. All rights reserved.
 * CeYing PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 *
 */
package com.ceying.biz.entity;

import com.ceying.common.base.CommonBaseObject;
import com.ceying.common.constant.CacheKeyConstant;
import com.ceying.common.constant.ConditionTypeConstant;
import com.ceying.common.util.annotation.CacheConver;
import com.ceying.common.util.annotation.Condition;
import com.ceying.common.util.annotation.EnumConver;
import com.ceying.common.util.datetools.DateUtil;
import com.ceying.common.util.sequence.SequenceUtil;

import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * 三方协议实体类 对应三方协议表
 * @author zhangdl
 * @version v1.0
 * @since 1.1  可以指定那些方法是新增的
 * @date 2017/7/13
 */
@Table(name = "t_biz_tripartiteagreement")
public class TripartiteAgreementEntity extends CommonBaseObject implements Serializable, Cloneable {

    private static final long serialVersionUID = -8965375180864156912L;

    /**
     * 主键ID
     */
    @Id
    private String urid;

    /**
     * 租户ID
     */
    private Integer tenantid;

    /**
     * 三方协议模板ID
     */
    private String tatemplateid;

    /**
     * 应付账款ID
     */
    @Condition(type = ConditionTypeConstant.IN)
    private String accountspayableid;

    /**
     * 应付账款报价ID
     */
    private String accountspayablequoteid;

    /**
     * 三方协议编码
     */
    private String tacontractid;

    /**
     * 融资提供方ID
     */
    @Condition(type = ConditionTypeConstant.IN)
    @CacheConver(cacheType = CacheKeyConstant.ORGNAMEMAP)
    private String bankid;

    /**
     * 核心企业ID
     */
    @Condition(type = ConditionTypeConstant.IN)
    @CacheConver(cacheType = CacheKeyConstant.ORGNAMEMAP)
    private String corecompanyid;

    /**
     * 供应商ID
     */
    @Condition(type = ConditionTypeConstant.IN)
    @CacheConver(cacheType = CacheKeyConstant.ORGNAMEMAP)
    private String supplierid;

    /**
     * 供应商专户ID
     */
    private String supplieraccountid;

    /**
     * 融资金额
     */
    private BigDecimal financingamount;

    /**
     * 融资期限
     */
    private Date financingdate;

    /**
     * 有追无追
     */
    private String isrecourse;

    /**
     * 利率
     */
    private BigDecimal interestrate;

    /**
     * 放款日期
     */
    private Date lendingdate;

    /**
     * 预计还款日期（保理到期日）
     */
    private Date estimatereturndate;

    /**
     * 还款日期
     */
    private Date returndate;

    /**
     * 平台向供应商收取的总费率
     */
    private BigDecimal supplierrate;

    /**
     * 平台付给核心企业的费率
     */
    private BigDecimal corecompanyrate;

    /**
     * 应付账款转让三方协议 文本
     */
    private byte[] signaturecontent;

    /**
     * 是否有效
     */
    @Condition
    private String isactive;

    /**
     * 审批状态
     */
    private String description;

    /**
     * pdf三方协议文档
     */
    private byte[] pdfContent;

    /**
     * pdf sign文本
     */
    private byte[] pdfSign;

    /**
     * 供应商最后一次操作标识
     */
    @Condition(type = ConditionTypeConstant.NOT_IN)
    private String supplastoperateflag;

    /**
     * 核心企业最后一次操作标识
     */
    @Condition(type = ConditionTypeConstant.NOT_IN)
    private String corelastoperateflag;

    /**
     * 融资提供方最后一次操作标识
     */
    @Condition(type = ConditionTypeConstant.NOT_IN)
    private String banklastoperateflag;

    /**
     * 放款后操作标志
     */
    private String lendingafterflag;

    /**
     *审批状态
     */
    private String approvestate;

    /**
     * 签约后状态
     */
    private String aftersignflag;

    /**
    *  区块链地址
    */
    private String blockchainaddress;

    /**
     * 得到主键ID
     * @return
     */
    public
    String getUrid() {
        return urid;
    }

    /**
     * 设置主键ID
     * @param urid
     */
    public
    void setUrid(String urid) {
        this.urid = urid;
    }

    /**
     * 得到租户ID
     * @return
     */
    public
    Integer getTenantid() {
        return tenantid;
    }

    /**
     * 设置租户ID
     * @param tenantid
     */
    public
    void setTenantid(Integer tenantid) {
        this.tenantid = tenantid;
    }

    /**
     * 得到三方协议模板ID
     * @return
     */
    public
    String getTatemplateid() {
        return tatemplateid;
    }

    /**
     * 设置三方协议模板ID
     * @param tatemplateid
     */
    public
    void setTatemplateid(String tatemplateid) {
        this.tatemplateid = tatemplateid;
    }

    /**
     * 得到应付账款ID
     * @return
     */
    public
    String getAccountspayableid() {
        return accountspayableid;
    }

    /**
     * 设置应付账款ID
     * @param accountspayableid
     */
    public
    void setAccountspayableid(String accountspayableid) {
        this.accountspayableid = accountspayableid;
    }

    /**
     * 获得应付账款报价ID
     * @return
     */
    public
    String getAccountspayablequoteid() {
        return accountspayablequoteid;
    }

    /**
     * 设置应付账款报价ID
     * @param accountspayablequoteid
     */
    public
    void setAccountspayablequoteid(String accountspayablequoteid) {
        this.accountspayablequoteid = accountspayablequoteid;
    }

    /**
     * 得到三方协议编号
     * @return
     */
    public
    String getTacontractid() {
        return tacontractid;
    }

    /**
     * 设置三方协议编号
     * @param tacontractid
     */
    public
    void setTacontractid(String tacontractid) {
        this.tacontractid = tacontractid;
    }

    /**
     * 得到融资提供方ID
     * @return
     */
    public
    String getBankid() {
        return bankid;
    }

    /**
     * 设置融资提供方ID
     * @param bankid
     */
    public
    void setBankid(String bankid) {
        this.bankid = bankid;
    }

    /**
     * 得到核心企业ID
     * @return
     */
    public
    String getCorecompanyid() {
        return corecompanyid;
    }

    /**
     * 设置核心企业id
     * @param corecompanyid
     */
    public
    void setCorecompanyid(String corecompanyid) {
        this.corecompanyid = corecompanyid;
    }

    /**
     * 得到供应商ID
     * @return
     */
    public
    String getSupplierid() {
        return supplierid;
    }

    /**
     * 设置供应商ID
     * @param supplierid
     */
    public
    void setSupplierid(String supplierid) {
        this.supplierid = supplierid;
    }

    /**
     * 得到供应商专户ID
     * @return
     */
    public
    String getSupplieraccountid() {
        return supplieraccountid;
    }

    /**
     * 设置供应商专户ID
     * @param supplieraccountid
     */
    public
    void setSupplieraccountid(String supplieraccountid) {
        this.supplieraccountid = supplieraccountid;
    }

    /**
     * 得到融资金额
     * @return
     */
    public
    BigDecimal getFinancingamount() {
        return financingamount;
    }

    /**
     * 设置融资金额
     * @param financingamount
     */
    public
    void setFinancingamount(BigDecimal financingamount) {
        this.financingamount = financingamount;
    }

    /**
     * 设置融资期限
     * @return
     */
    public
    Date getFinancingdate() {
        return financingdate;
    }

    /**
     * 设置融资期限
     * @param financingdate
     */
    public
    void setFinancingdate(Date financingdate) {
        this.financingdate = financingdate;
    }

    /**
     * 得到有追无追
     * @return
     */
    public
    String getIsrecourse() {
        return isrecourse;
    }

    /**
     * 设置有追无追
     * @param isrecourse
     */
    public
    void setIsrecourse(String isrecourse) {
        this.isrecourse = isrecourse;
    }

    /**
     * 得到利率
     * @return
     */
    public
    BigDecimal getInterestrate() {
        return interestrate;
    }

    /**
     * 设置利率
     * @param interestrate
     */
    public
    void setInterestrate(BigDecimal interestrate) {
        this.interestrate = interestrate;
    }

    /**
     * 得到放款日期
     * @return
     */
    public
    Date getLendingdate() {
        return lendingdate;
    }

    /**
     * 设置放款日期
     * @param lendingdate
     */
    public
    void setLendingdate(Date lendingdate) {
        this.lendingdate = lendingdate;
    }

    /**
     * 获得预计还款日期
     * @return
     */
    public
    Date getEstimatereturndate() {
        return estimatereturndate;
    }

    /**
     * 设置预计还款日期
     * @param estimatereturndate
     */
    public
    void setEstimatereturndate(Date estimatereturndate) {
        this.estimatereturndate = estimatereturndate;
    }

    /**
     * 得到还款日期
     * @return
     */
    public
    Date getReturndate() {
        return returndate;
    }

    /**
     * 设置还款日期
     * @param returndate
     */
    public
    void setReturndate(Date returndate) {
        this.returndate = returndate;
    }

    /**
     * 得到平台向供应商收取的总费率
     * @return
     */
    public
    BigDecimal getSupplierrate() {
        return supplierrate;
    }

    /**
     * 设置平台向供应商收取的总费率
     * @param supplierrate
     */
    public
    void setSupplierrate(BigDecimal supplierrate) {
        this.supplierrate = supplierrate;
    }

    /**
     * 得到平台付给核心企业的费率
     * @return
     */
    public
    BigDecimal getCorecompanyrate() {
        return corecompanyrate;
    }

    /**
     * 设置平台付给核心企业的费率
     * @param corecompanyrate
     */
    public
    void setCorecompanyrate(BigDecimal corecompanyrate) {
        this.corecompanyrate = corecompanyrate;
    }

    /**
     * 获得应付账款转让三方协议
     * @return
     */
    public
    byte[] getSignaturecontent() {
        return signaturecontent;
    }

    /**
     * 设置应付账款转让三方协议
     * @param signaturecontent
     * @return
     */
    public TripartiteAgreementEntity setSignaturecontent(byte[] signaturecontent) {
        this.signaturecontent = signaturecontent;
        return this;
    }

    /**
     * 得到是否有效
     * @return
     */
    public
    String getIsactive() {
        return isactive;
    }

    /**
     * 设置是否有效
     * @param isactive
     */
    public
    void setIsactive(String isactive) {
        this.isactive = isactive;
    }

    /**
     * 得到描述
     * @return
     */
    public
    String getDescription() {
        return description;
    }

    /**
     * 设置描述
     * @param description
     */
    public
    void setDescription(String description) {
        this.description = description;
    }

    /**
     * 得到供应商最后一次操作标志
     * @return
     */
    public
    String getSupplastoperateflag() {
        return supplastoperateflag;
    }

    /**
     * 设置供应商最后一次操作标志
     * @param supplastoperateflag
     */
    public
    void setSupplastoperateflag(String supplastoperateflag) {
        this.supplastoperateflag = supplastoperateflag;
    }

    /**
     * 得到核心企业最后一次操作标识
     * @return
     */
    public
    String getCorelastoperateflag() {
        return corelastoperateflag;
    }

    /**
     * 设置供应商最后一次操作标识
     * @param corelastoperateflag
     */
    public
    void setCorelastoperateflag(String corelastoperateflag) {
        this.corelastoperateflag = corelastoperateflag;
    }

    /**
     * 得到融资提供方最后一次操作标识
     * @return
     */
    public
    String getBanklastoperateflag() {
        return banklastoperateflag;
    }

    /**
     * 设置融资提供方最后一次操作标识
     * @param banklastoperateflag
     */
    public
    void setBanklastoperateflag(String banklastoperateflag) {
        this.banklastoperateflag = banklastoperateflag;
    }

    /**
     * 获得放款后操作标志
     * @return
     */
    public
    String getLendingafterflag() {
        return lendingafterflag;
    }

    /**
     * 设置放款后操作标志
     * @param lendingafterflag
     * @return
     */
    public void setLendingafterflag(String lendingafterflag) {
        this.lendingafterflag = lendingafterflag;
    }

    /**
     * 得到审批状态
     * @return
     */
    public
    String getApprovestate() {
        return approvestate;
    }

    /**
     * 设置审批状态
     * @param approvestate
     */
    public
    void setApprovestate(String approvestate) {
        this.approvestate = approvestate;
    }

    /**
     * 获得签约后状态
     * @return
     */
    public
    String getAftersignflag() {
        return aftersignflag;
    }

    /**
     * 设置签约后状态
     * @param aftersignflag
     * @return
     */
    public TripartiteAgreementEntity setAftersignflag(String aftersignflag) {
        this.aftersignflag = aftersignflag;
        return this;
    }

    public
    String getBlockchainaddress() {
        return blockchainaddress;
    }

    public
    void setBlockchainaddress(String blockchainaddress) {
        this.blockchainaddress = blockchainaddress;
    }

    public byte[] getPdfContent() {
        return pdfContent;
    }

    public void setPdfContent(byte[] pdfContent) {
        this.pdfContent = pdfContent;
    }

    public byte[] getPdfSign() {
        return pdfSign;
    }

    public void setPdfSign(byte[] pdfSign) {
        this.pdfSign = pdfSign;
    }

    /**
     * 无参构造函数
     */
    public TripartiteAgreementEntity() {
    }

    /**
     * 全参构造函数
     * @param createdby 创建人
     * @param tenantid  租户ID
     * @param tatemplateid 三方协议
     * @param accountspayableid 应付账款信息ID
     * @param accountspayablequoteid 应付账款报价ID
     * @param tacontractid 三方协议编号
     * @param bankid 融资提供方ID
     * @param corecompanyid 核心企业ID
     * @param supplierid 供应商ID
     * @param supplieraccountid 供应商专户ID
     * @param financingamount 融资金额
     * @param financingdate 融资期限
     * @param isrecourse 有追无追
     * @param interestrate 利率
     * @param lendingdate 放款日期
     * @param estimatereturndate 预计还款日期
     * @param returndate 还款日期
     * @param supplierrate 平台向供应商收取费率
     * @param corecompanyrate 平台向核心企业收取费率
     * @param isactive 是否有效
     * @param description 描述
     * @param supplastoperateflag 供应商最后一次标识
     * @param corelastoperateflag 核心企业最后一次标识
     * @param banklastoperateflag 融资提供方最后一次标识
     * @param approvestate 审批状态
     */
    public TripartiteAgreementEntity(String createdby, Integer tenantid, String tatemplateid, String accountspayableid, String accountspayablequoteid,
                        String tacontractid, String bankid, String corecompanyid, String supplierid, String supplieraccountid,
                        BigDecimal financingamount, Date financingdate, String isrecourse, BigDecimal interestrate, Date lendingdate,
                        Date estimatereturndate, Date returndate, BigDecimal supplierrate, BigDecimal corecompanyrate, String isactive,
                        String description, String supplastoperateflag, String corelastoperateflag, String banklastoperateflag, String approvestate) {
        super(createdby, DateUtil.getCurrentDateTime(),  1);
        this.urid = SequenceUtil.UUID();
        this.tenantid = tenantid;
        this.tatemplateid = tatemplateid;
        this.accountspayableid = accountspayableid;
        this.accountspayablequoteid = accountspayablequoteid;
        this.tacontractid = tacontractid;
        this.bankid = bankid;
        this.corecompanyid = corecompanyid;
        this.supplierid = supplierid;
        this.supplieraccountid = supplieraccountid;
        this.financingamount = financingamount;
        this.financingdate = financingdate;
        this.isrecourse = isrecourse;
        this.interestrate = interestrate;
        this.lendingdate = lendingdate;
        this.estimatereturndate = estimatereturndate;
        this.returndate = returndate;
        this.supplierrate = supplierrate;
        this.corecompanyrate = corecompanyrate;
        this.isactive = isactive;
        this.description = description;
        this.supplastoperateflag = supplastoperateflag;
        this.corelastoperateflag = corelastoperateflag;
        this.banklastoperateflag = banklastoperateflag;
        this.approvestate = approvestate;
    }

    /**
     * 修改传入对象的属性
     * @param tripartiteAgreement  三方协议引用副本，修改此对象的属性
     * @param lastmodifiedby 修改人
     * @param financingdate 融资期限
     * @param isrecourse 有追无追
     * @param interestrate 利率
     * @param lendingdate 放款日期
     * @param estimatereturndate 预计还款日期
     * @param returndate 还款日期
     * @param supplierrate 平台向供应商收取费率
     * @param corecompanyrate 平台向核心企业收取费率
     * @param isactive 是否有效
     * @param description 描述
     * @param supplastoperateflag 供应商最后一次标识
     * @param corelastoperateflag 核心企业最后一次标识
     * @param banklastoperateflag 融资提供方最后一次标识
     * @param approvestate 审批状态
     */
    public  void setTripartiteAgreement(TripartiteAgreementEntity tripartiteAgreement, String lastmodifiedby,
                                      BigDecimal financingamount, Date financingdate,
                                       String isrecourse, BigDecimal interestrate, Date lendingdate, Date estimatereturndate, Date returndate,
                                       BigDecimal supplierrate, BigDecimal corecompanyrate, String isactive, String description,
                                       String supplastoperateflag, String corelastoperateflag, String banklastoperateflag, String approvestate) {
        tripartiteAgreement.setLastmodifiedby(lastmodifiedby);
        tripartiteAgreement.setLastmodifiedon(DateUtil.getCurrentDateTime());
        tripartiteAgreement.setFinancingamount(financingamount == null? tripartiteAgreement.getFinancingamount():financingamount);
        tripartiteAgreement.setFinancingdate(financingdate == null? tripartiteAgreement.getFinancingdate():financingdate);
        tripartiteAgreement.setIsrecourse(isrecourse  == null? tripartiteAgreement.getIsrecourse():isrecourse);
        tripartiteAgreement.setInterestrate(interestrate  == null? tripartiteAgreement.getInterestrate():interestrate);
        tripartiteAgreement.setLendingdate(lendingdate  == null? tripartiteAgreement.getLendingdate():lendingdate);
        tripartiteAgreement.setEstimatereturndate(estimatereturndate  == null? tripartiteAgreement.getEstimatereturndate():estimatereturndate);
        tripartiteAgreement.setReturndate(returndate == null? tripartiteAgreement.getReturndate():returndate);
        tripartiteAgreement.setSupplierrate(supplierrate == null? tripartiteAgreement.getSupplierrate():supplierrate);
        tripartiteAgreement.setCorecompanyrate(corecompanyrate == null? tripartiteAgreement.getCorecompanyrate():corecompanyrate);
        tripartiteAgreement.setIsactive(isactive == null? tripartiteAgreement.getIsactive():isactive);
        tripartiteAgreement.setDescription(description == null? tripartiteAgreement.getDescription():description);
        tripartiteAgreement.setSupplastoperateflag(supplastoperateflag == null? tripartiteAgreement.getSupplastoperateflag():supplastoperateflag);
        tripartiteAgreement.setCorelastoperateflag(corelastoperateflag == null? tripartiteAgreement.getCorelastoperateflag():corelastoperateflag);
        tripartiteAgreement.setBanklastoperateflag(banklastoperateflag == null? tripartiteAgreement.getBanklastoperateflag():banklastoperateflag);
        tripartiteAgreement.setApprovestate(approvestate == null? tripartiteAgreement.getApprovestate():approvestate);
    }

    /**
     * 修改传入对象的属性
     * @param tripartiteAgreement  三方协议引用副本，修改此对象的属性
     * @param lastmodifiedby 修改人
     * @param isactive 是否有效
     * @param description 描述
     * 重新塞入blob
     */
    public  void setTripartiteAgreement(TripartiteAgreementEntity tripartiteAgreement, String lastmodifiedby,String isactive, String description) {
        tripartiteAgreement.setLastmodifiedby(lastmodifiedby);
        tripartiteAgreement.setLastmodifiedon(DateUtil.getCurrentDateTime());
        tripartiteAgreement.setIsactive(isactive == null? tripartiteAgreement.getIsactive():isactive);
        tripartiteAgreement.setDescription(description == null? tripartiteAgreement.getDescription():description);
        tripartiteAgreement.setSignaturecontent(tripartiteAgreement.getSignaturecontent());
    }

    @Override
    public Object clone() throws CloneNotSupportedException {
        return super.clone();
    }


    @Override
    public
    String toString() {
        return "TripartiteAgreement{" +
                "urid='" + urid + '\'' +
                ", tenantid=" + tenantid +
                ", tatemplateid='" + tatemplateid + '\'' +
                ", accountspayableid='" + accountspayableid + '\'' +
                ", tacontractid='" + tacontractid + '\'' +
                ", bankid='" + bankid + '\'' +
                ", corecompanyid='" + corecompanyid + '\'' +
                ", supplierid='" + supplierid + '\'' +
                ", supplieraccountid='" + supplieraccountid + '\'' +
                ", financingamount=" + financingamount +
                ", financingdate=" + financingdate +
                ", isrecourse='" + isrecourse + '\'' +
                ", interestrate=" + interestrate +
                ", lendingdate=" + lendingdate +
                ", returndate=" + returndate +
                ", supplierrate=" + supplierrate +
                ", corecompanyrate=" + corecompanyrate +
                ", isactive='" + isactive + '\'' +
                ", description='" + description + '\'' +
                ", supplastoperateflag='" + supplastoperateflag + '\'' +
                ", corelastoperateflag='" + corelastoperateflag + '\'' +
                ", banklastoperateflag='" + banklastoperateflag + '\'' +
                ", approvestate='" + approvestate + '\'' +
                '}';
    }
}
