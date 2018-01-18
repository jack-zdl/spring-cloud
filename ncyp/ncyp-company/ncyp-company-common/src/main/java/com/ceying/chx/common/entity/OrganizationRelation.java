package com.ceying.chx.common.entity;


import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 功能说明: 组织关系表<br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl
 * 开发时间: 2017/11/9 11:13<br>
 * <br>
 */

public class OrganizationRelation extends CommonBaseObject implements Serializable {

    /**
     * 组织关系表
     * @return
     */
    @Override
    public String getTableName() {
        return "T_ORGANIZATIONRELATION";
    }

    private static final long serialVersionUID = 8815034634364108148L;

    /**
     * 主键ID
     */
    private String urid;

    /**
     * 己方组织ID
     */
    private String ourOrgId;

    /**
     *  对方组织ID
     */
    private String oppOrgId;

    /**
     * 优先权
     */
    private String priority;

    /**
     * 类别
     * 1 核心企业-银行
     * 2 核心企业-供应商
     * 3 核心企业 - 银行 - 供应商
     */
    private String category;

    /**
     * 核心企业向供应商收取费率
     */
    private Double coreCompanySupplierRate;

    /**
     * 是否是黑名单
     */
    private String isblack;

    /**
     * 宽展期（银行给核心企业的宽展期）
     */
    private BigDecimal extensionDate;

    /**
     * 关联组织关系ID
     */
    private String organizationRelationId;

    /**
     * 获得组织ID
     * @return
     */
    public String getUrid() {
        return urid;
    }

    /**
     * 设置组织ID
     * @param urid
     * @return
     */
    public OrganizationRelation setUrid(String urid) {
        this.urid = urid;
        return this;
    }

    /**
     * 获得己方组织ID
     * @return
     */
    public String getOurOrgId() {
        return ourOrgId;
    }

    /**
     * 设置己方组织ID
     * @param ourOrgId
     * @return
     */
    public OrganizationRelation setOurOrgId(String ourOrgId) {
        this.ourOrgId = ourOrgId;
        return this;
    }

    /**
     * 获得对方组织ID
     * @return
     */
    public String getOppOrgId() {
        return oppOrgId;
    }

    /**
     * 设置对方组织ID
     * @param oppOrgId
     * @return
     */
    public OrganizationRelation setOppOrgId(String oppOrgId) {
        this.oppOrgId = oppOrgId;
        return this;
    }

    /**
     * 获得优先权
     * @return
     */
    public String getPriority() {
        return priority;
    }

    /**
     * 设置优先权
     * @param priority
     * @return
     */
    public OrganizationRelation setPriority(String priority) {
        this.priority = priority;
        return this;
    }

    /**
     * 获得类别
     * @return
     */
    public String getCategory() {
        return category;
    }

    /**
     * 设置类别
     * @param category
     * @return
     */
    public OrganizationRelation setCategory(String category) {
        this.category = category;
        return this;
    }

    /**
     * 获得核心企业向供应商收取费率
     * @return
     */
    public Double getCoreCompanySupplierRate() {
        return coreCompanySupplierRate;
    }

    /**
     * 设置核心企业向供应商收取费率
     * @param coreCompanySupplierRate
     * @return
     */
    public
    OrganizationRelation setCoreCompanySupplierRate(Double coreCompanySupplierRate) {
        this.coreCompanySupplierRate = coreCompanySupplierRate;
        return this;
    }

    /**
     * 是否是黑名单
     * @return
     */
    public
    String getIsblack() {
        return isblack;
    }

    /**
     * 设置是否是黑名单
     * @param isblack
     * @return
     */
    public
    OrganizationRelation setIsblack(String isblack) {
        this.isblack = isblack;
        return this;
    }

    /**
     * 获得宽展期
     * @return
     */
    public
    BigDecimal getExtensionDate() {
        return extensionDate;
    }

    /**
     * 设置宽展期
     * @param extensionDate
     * @return
     */
    public
    OrganizationRelation setExtensionDate(BigDecimal extensionDate) {
        this.extensionDate = extensionDate;
        return this;
    }

    /**
     * 获得关联组织关系ID
     * @return
     */
    public
    String getOrganizationRelationId() {
        return organizationRelationId;
    }

    /**
     * 设置关联组织关系ID
     * @param organizationRelationId
     * @return
     */
    public
    OrganizationRelation setOrganizationRelationId(String organizationRelationId) {
        this.organizationRelationId = organizationRelationId;
        return this;
    }

    public
    OrganizationRelation() {
    }

    @Override
    public
    String toString() {
        return "OrganizationRelation{" +
                "createdby='" + createdby + '\'' +
                ", createdon=" + createdon +
                ", lastmodifiedby='" + lastmodifiedby + '\'' +
                ", lastmodifiedon=" + lastmodifiedon +
                ", rowversion=" + rowversion +
                ", urid='" + urid + '\'' +
                ", ourOrgId='" + ourOrgId + '\'' +
                ", oppOrgId='" + oppOrgId + '\'' +
                ", priority='" + priority + '\'' +
                ", category='" + category + '\'' +
                ", coreCompanySupplierRate=" + coreCompanySupplierRate +
                ", isblack='" + isblack + '\'' +
                ", extensionDate=" + extensionDate +
                ", organizationRelationId='" + organizationRelationId + '\'' +
                '}';
    }
}