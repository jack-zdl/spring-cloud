/*
 * Copyright (c) 2017 CeYing and/or its affiliates. All rights reserved.
 * CeYing PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 *
 */
package com.ceying.biz.entity;

import com.ceying.common.util.datetools.DateUtil;
import com.ceying.common.util.sequence.SequenceUtil;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 核心企业额度操作实体类
 * 对应核心企业额度操作表
 * @author zhangdl
 * @version class v1.0
 * @date 2017/7/17 9:51
 */
@Table(name = "t_biz_corecompanyquotaops")
public class CoreCompanyQuotaOpsEntity implements Serializable {

    private static final long serialVersionUID = 6128252190968445402L;

    /**
     * 主键ID
     */
    @Id
    private String urid;

    /**
     * 核心企业额度id
     */
    @Column(name = "corequotaid")
    private String coreQuotaId;

    /**
     * 操作额度
     */
    @Column(name = "operateamount")
   private BigDecimal operateAmount;

    /**
     * 操作员KEY
     */
    private String operator;

    /**
     * 操作组织ID
     */
    @Column(name = "operateorgid")
    private String operateOrgId;

    /**
     * 操作日期
     */
    @Column(name = "operatedate")
    private Date operateDate;

    /**
     * 操作标识
     */
    @Column(name = "operateflag")
    private String operateFlag;

    /**
     * 签名信息
     */
    private String signature;

    /**
     * 描述
     */
    private String description;

    /**
     * 获得主键ID
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
     * 获得核心企业额度ID
     * @return
     */
    public
    String getCoreQuotaId() {
        return coreQuotaId;
    }

    /**
     * 设置核心企业额度id
     * @param coreQuotaId
     */
    public
    void setCoreQuotaId(String coreQuotaId) {
        this.coreQuotaId = coreQuotaId;
    }

    /**
     * 获得操作金额
     * @return
     */
    public
    BigDecimal getOperateAmount() {
        return operateAmount;
    }

    /**
     * 设置操作金额
     * @param operateAmount
     */
    public
    void setOperateAmount(BigDecimal operateAmount) {
        this.operateAmount = operateAmount;
    }

    /**
     * 获得操作员KEY
     * @return
     */
    public
    String getOperator() {
        return operator;
    }

    /**
     * 设置操作员KEY
     * @param operator
     */
    public
    void setOperator(String operator) {
        this.operator = operator;
    }

    /**
     * 获得操作组织ID
     * @return
     */
    public
    String getOperateOrgId() {
        return operateOrgId;
    }

    /**
     * 设置操作组织ID
     * @param operateOrgId
     */
    public
    void setOperateOrgId(String operateOrgId) {
        this.operateOrgId = operateOrgId;
    }

    /**
     * 获得操作日期
     * @return
     */
    public
    Date getOperateDate() {
        return operateDate;
    }

    /**
     * 设置操作日期
     * @param operateDate
     */
    public
    void setOperateDate(Date operateDate) {
        this.operateDate = operateDate;
    }

    /**
     * 获得操作标识
     * @return
     */
    public
    String getOperateFlag() {
        return operateFlag;
    }

    /**
     * 设置操作标识
     * @param operateFlag
     */
    public
    void setOperateFlag(String operateFlag) {
        this.operateFlag = operateFlag;
    }

    /**
     * 获得签名信息
     * @return
     */
    public
    String getSignature() {
        return signature;
    }

    /**
     * 设置签名信息
     * @param signature
     */
    public
    void setSignature(String signature) {
        this.signature = signature;
    }

    /**
     * 获得描述
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

    public
    CoreCompanyQuotaOpsEntity() {
    }

    public
    CoreCompanyQuotaOpsEntity(String urid) {
        this.urid = urid;
    }

    /**
     * 全参构造函数
     * @param coreQuotaId 核心企业额度ID
     * @param operateAmount 操作金额
     * @param operator 操作员KEY
     * @param operateOrgId 操作组织ID
     * @param operateFlag 操作标识
     * @param signature 签名信息
     * @param description 描述
     */
    public CoreCompanyQuotaOpsEntity(String coreQuotaId, BigDecimal operateAmount, String operator, String operateOrgId,
                              String operateFlag, String signature, String description) {
        this.urid = SequenceUtil.UUID();
        this.coreQuotaId = coreQuotaId;
        this.operateAmount = operateAmount;
        this.operator = operator;
        this.operateOrgId = operateOrgId;
        this.operateDate = DateUtil.getCurrentDateTime();
        this.operateFlag = operateFlag;
        this.signature = signature;
        this.description = description;
    }

    @Override
    public
    String toString() {
        return "CoreCompanyQuotaOps{" +
                "urid='" + urid + '\'' +
                ", coreQuotaId='" + coreQuotaId + '\'' +
                ", operateAmount=" + operateAmount +
                ", operator='" + operator + '\'' +
                ", operateOrgId='" + operateOrgId + '\'' +
                ", operateDate=" + operateDate +
                ", operateFlag='" + operateFlag + '\'' +
                ", signature='" + signature + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}
