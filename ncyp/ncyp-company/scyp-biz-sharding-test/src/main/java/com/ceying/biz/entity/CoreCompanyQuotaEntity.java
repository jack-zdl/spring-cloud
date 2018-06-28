/*
 * Copyright (c) 2017 CeYing and/or its affiliates. All rights reserved.
 * CeYing PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 *
 */
package com.ceying.biz.entity;


import com.ceying.common.base.CommonBaseObject;
import com.ceying.common.constant.CacheKeyConstant;
import com.ceying.common.util.annotation.CacheConver;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 核心企业额度实体类
 * 对应的核心企业额度表
 * @author zhangdl
 * @version class v1.0
 * @date 2017/7/17 9:25
 */
@Table(name = "T_BIZ_CORECOMPANYQUOTA")
public class CoreCompanyQuotaEntity extends CommonBaseObject implements Serializable {

    private static final long serialVersionUID = -131030505916206565L;

    /**
     * 主键ID
     */
    @Id
    private String urid;

    /**
     * 核心企业ID
     */
    @Column(name = "corecompanyid")
    @CacheConver(cacheType = CacheKeyConstant.ORGNAMEMAP)
    private String coreCompanyId;

    /**
     * 总额度
     */
    @Column(name = "amountlimits")
    private BigDecimal amountLimits;

    /**
     * 冻结额度
     */
    @Column(name = "freezeamount")
    private BigDecimal freezeAmount;

    /**
     * 可用额度
     */
    @Column(name = "availableamount")
    private BigDecimal availableAmount;

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
     * 获得核心企业ID
     * @return
     */
    public
    String getCoreCompanyId() {
        return coreCompanyId;
    }

    /**
     * 设置核心企业ID
     * @param coreCompanyId
     */
    public
    void setCoreCompanyId(String coreCompanyId) {
        this.coreCompanyId = coreCompanyId;
    }

    /**
     * 获得总额度
     * @return
     */
    public
    BigDecimal getAmountLimits() {
        return amountLimits;
    }

    /**
     * 设置总额度
     * @param amountLimits
     */
    public
    void setAmountLimits(BigDecimal amountLimits) {
        this.amountLimits = amountLimits;
    }

    /**
     * 获得冻结额度
     * @return
     */
    public
    BigDecimal getFreezeAmount() {
        return freezeAmount;
    }

    /**
     * 设置冻结额度
     * @param freezeAmount
     */
    public
    void setFreezeAmount(BigDecimal freezeAmount) {
        this.freezeAmount = freezeAmount;
    }

    /**
     * 得到可用额度
     * @return
     */
    public
    BigDecimal getAvailableAmount() {
        return availableAmount;
    }

    /**
     * 设置可用额度
     * @param availableAmount
     */
    public
    void setAvailableAmount(BigDecimal availableAmount) {
        this.availableAmount = availableAmount;
    }

    /**
     * 获取描述
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
    CoreCompanyQuotaEntity() {
    }

    /**
     * 全参构造函数
     * @param createdby 创建人
     * @param createdon 创建时间
     * @param rowversion 版本
     * @param urid 主键
     * @param coreCompanyId 核心企业ID
     * @param amountLimits 总额度
     * @param freezeAmount 冻结额度
     * @param availableAmount 可用额度
     * @param description 描述
     */
    public CoreCompanyQuotaEntity(String createdby, Date createdon, Integer rowversion,
                     String urid, String coreCompanyId, BigDecimal amountLimits, BigDecimal freezeAmount,
                     BigDecimal availableAmount, String description) {
        super(createdby, createdon, rowversion);
        this.urid = urid;
        this.coreCompanyId = coreCompanyId;
        this.amountLimits = amountLimits;
        this.freezeAmount = freezeAmount;
        this.availableAmount = availableAmount;
        this.description = description;
    }

    /**
     *  修改核心企业额度类
     * @param lastmodifiedby 修改人
     * @param lastmodifiedon 修改时间
     * @param rowversion 版本
     * @param amountLimits 总额度
     * @param freezeAmount 冻结额度
     * @param availableAmount 可用额度
     * @param description 描述
     */
    public void CoreCompanyQuotaEntity(CoreCompanyQuotaEntity coreCompanyQuota, String lastmodifiedby, Date lastmodifiedon,
                                    Integer rowversion,  BigDecimal amountLimits, BigDecimal freezeAmount,
                                    BigDecimal availableAmount, String description) {
        coreCompanyQuota.setLastmodifiedby(lastmodifiedby);
        coreCompanyQuota.setLastmodifiedon(lastmodifiedon);
        coreCompanyQuota.setRowversion(rowversion);
        coreCompanyQuota.setAmountLimits(amountLimits);
        coreCompanyQuota.setFreezeAmount(freezeAmount);
        coreCompanyQuota.setAvailableAmount(availableAmount);
        coreCompanyQuota.setDescription(description);
    }

    @Override
    public
    String toString() {
        return "CoreCompanyQuota{" +
                "createdby='" + createdby + '\'' +
                ", createdon=" + createdon +
                ", lastmodifiedby='" + lastmodifiedby + '\'' +
                ", lastmodifiedon=" + lastmodifiedon +
                ", rowversion=" + rowversion +
                ", urid='" + urid + '\'' +
                ", coreCompanyId='" + coreCompanyId + '\'' +
                ", amountLimits=" + amountLimits +
                ", freezeAmount=" + freezeAmount +
                ", availableAmount=" + availableAmount +
                ", description='" + description + '\'' +
                '}';
    }
}
