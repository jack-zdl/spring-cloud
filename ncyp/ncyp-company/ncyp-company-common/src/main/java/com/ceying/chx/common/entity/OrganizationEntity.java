package com.ceying.chx.common.entity;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl
 * 开发时间: 2017/11/9 11:13<br>
 * <br>
 */

public
class OrganizationEntity implements Serializable {

    private static final long serialVersionUID = -8212210396806549226L;

    public String getTableName() {
        return "TSYS_ORGANIZATION";
    }

    /**
     * 租户
     */
    private Integer tenantId;

    /**
     * 组织标识
     */
    private String orgId="";

    /**
     * 组织维度
     */
    private String dimension="";

    /**
     * 组织编码
     */
    private String orgCode="";

    /**
     * 组织名称
     */
    private String orgName="";

    /**
     * 上级标识
     */
    private String parentId="";

    /**
     * 主管标识
     */
    private String manageId="";

    /**
     * 负责岗位标识
     */
    private String positionCode="";


    /**
     * 组织类型
     */
    private String orgCate="";

    /**
     * 组织级别
     */
    private String orgLevel="";

    /**
     * 序号
     */
    private int orgOrder=0;

    /**
     * 索引号
     */
    private String orgPath="";

    /**
     * SSO组织编码
     */
    private String ssoOrgCode;

    /**
     * SSO上级组织编码
     */
    private String ssoParentCode;


    /**
     * 扩展标识【用于保存策赢平台对接组织的原始id】
     */
    private String extId="";

    /**
     * 备注
     */
    private String remark="";

    /**
     * 状态(0为正常，-1为注销)
     */
    private int status;

    /**
     * 平台向供应商收取费率
     */
    private BigDecimal platformSupplierrate;

    /**
     * 平台付给核心企业的费率
     */
    private BigDecimal coreCompanyRate;

    /**
     * 区域ID
     */
    private String areaId;

    /**
     * 融资次数
     */
    private Integer financeNumber;

    /**
     * 法人
     */
    private String legalPerson;

    /**
     * 地址
     */
    private String address;

    /**
     * 获得租户ID
     * @return
     */
    public
    Integer getTenantId() {
        return tenantId;
    }

    /**
     * 设置租户ID
     * @param tenantId
     * @return
     */
    public
    OrganizationEntity setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
        return this;
    }

    /**
     * 获得组织机构标识
     * @return
     */
    public
    String getOrgId() {
        return orgId;
    }

    /**
     * 设置组织机构标识
     * @param orgId
     * @return
     */
    public
    OrganizationEntity setOrgId(String orgId) {
        this.orgId = orgId;
        return this;
    }

    /**
     * 获得维度
     * @return
     */
    public
    String getDimension() {
        return dimension;
    }

    /**
     * 设置维度
     * @param dimension
     * @return
     */
    public
    OrganizationEntity setDimension(String dimension) {
        this.dimension = dimension;
        return this;
    }

    /**
     * 获得组织机构编码
     * @return
     */
    public
    String getOrgCode() {
        return orgCode;
    }

    /**
     * 设置组织机构编码
     * @param orgCode
     * @return
     */
    public
    OrganizationEntity setOrgCode(String orgCode) {
        this.orgCode = orgCode;
        return this;
    }

    /**
     * 获得组织机构名称
     * @return
     */
    public
    String getOrgName() {
        return orgName;
    }

    /**
     * 设置组织机构名称
     * @param orgName
     * @return
     */
    public
    OrganizationEntity setOrgName(String orgName) {
        this.orgName = orgName;
        return this;
    }

    /**
     * 获得上级组织标识
     * @return
     */
    public
    String getParentId() {
        return parentId;
    }

    /**
     * 设置上级组织标识
     * @param parentId
     * @return
     */
    public
    OrganizationEntity setParentId(String parentId) {
        this.parentId = parentId;
        return this;
    }

    /**
     *  获得组管组织标识
     * @return
     */
    public
    String getManageId() {
        return manageId;
    }

    /**
     * 设置组管组织标识
     * @param manageId
     * @return
     */
    public
    OrganizationEntity setManageId(String manageId) {
        this.manageId = manageId;
        return this;
    }

    /**
     * 获得负责岗位标识
     * @return
     */
    public
    String getPositionCode() {
        return positionCode;
    }

    /**
     * 设置负责岗位标识
     * @param positionCode
     * @return
     */
    public
    OrganizationEntity setPositionCode(String positionCode) {
        this.positionCode = positionCode;
        return this;
    }

    /**
     * 获得组织分类
     * @return
     */
    public
    String getOrgCate() {
        return orgCate;
    }

    /**
     * 设置组织分类
     * @param orgCate
     * @return
     */
    public
    OrganizationEntity setOrgCate(String orgCate) {
        this.orgCate = orgCate;
        return this;
    }

    /**
     * 获得组织级别
     * @return
     */
    public
    String getOrgLevel() {
        return orgLevel;
    }

    /**
     * 设置组织级别
     * @param orgLevel
     * @return
     */
    public
    OrganizationEntity setOrgLevel(String orgLevel) {
        this.orgLevel = orgLevel;
        return this;
    }

    /**
     * 获得组织序号
     * @return
     */
    public
    int getOrgOrder() {
        return orgOrder;
    }

    /**
     * 设置组织序号
     * @param orgOrder
     * @return
     */
    public
    OrganizationEntity setOrgOrder(int orgOrder) {
        this.orgOrder = orgOrder;
        return this;
    }

    /**
     * 获得组织索引
     * @return
     */
    public
    String getOrgPath() {
        return orgPath;
    }

    /**
     * 设置组织索引
     * @param orgPath
     * @return
     */
    public
    OrganizationEntity setOrgPath(String orgPath) {
        this.orgPath = orgPath;
        return this;
    }

    /**
     * 获得SSO组织编码
     * @return
     */
    public
    String getSsoOrgCode() {
        return ssoOrgCode;
    }

    /**
     * 设置SSO组织编码
     * @param ssoOrgCode
     * @return
     */
    public
    OrganizationEntity setSsoOrgCode(String ssoOrgCode) {
        this.ssoOrgCode = ssoOrgCode;
        return this;
    }

    /**
     * 获得SSO上级组织编码
     * @return
     */
    public
    String getSsoParentCode() {
        return ssoParentCode;
    }

    /**
     * 设置SSO上级组织编码
     * @param ssoParentCode
     * @return
     */
    public
    OrganizationEntity setSsoParentCode(String ssoParentCode) {
        this.ssoParentCode = ssoParentCode;
        return this;
    }

    /**
     * 获得扩展标识
     * @return
     */
    public
    String getExtId() {
        return extId;
    }

    /**
     * 设置扩展标识
     * @param extId
     * @return
     */
    public
    OrganizationEntity setExtId(String extId) {
        this.extId = extId;
        return this;
    }

    /**
     * 获得备注
     * @return
     */
    public
    String getRemark() {
        return remark;
    }

    /**
     * 设置备注
     * @param remark
     * @return
     */
    public
    OrganizationEntity setRemark(String remark) {
        this.remark = remark;
        return this;
    }

    /**
     * 获得QA状态
     * @return
     */
    public
    int getStatus() {
        return status;
    }

    /**
     * 获得QA状态
     * @param status
     * @return
     */
    public
    OrganizationEntity setStatus(int status) {
        this.status = status;
        return this;
    }

    /**
     * 获得平台向供应商收取的费率
     * @return
     */
    public
    BigDecimal getPlatformSupplierrate() {
        return platformSupplierrate;
    }

    /**
     * 设置平台向供应商收取的费率
     * @param platformSupplierrate
     * @return
     */
    public
    OrganizationEntity setPlatformSupplierrate(BigDecimal platformSupplierrate) {
        this.platformSupplierrate = platformSupplierrate;
        return this;
    }

    /**
     * 获得平台付给核心企业的费率
     * @return
     */
    public
    BigDecimal getCoreCompanyRate() {
        return coreCompanyRate;
    }

    /**
     * 设置平台付给核心企业的费率
     * @param coreCompanyRate
     * @return
     */
    public
    OrganizationEntity setCoreCompanyRate(BigDecimal coreCompanyRate) {
        this.coreCompanyRate = coreCompanyRate;
        return this;
    }

    /**
     * 获得区域ID
     * @return
     */
    public
    String getAreaId() {
        return areaId;
    }

    /**
     * 设置区域ID
     * @param areaId
     * @return
     */
    public
    OrganizationEntity setAreaId(String areaId) {
        this.areaId = areaId;
        return this;
    }

    /**
     * 获得融资次数
     * @return
     */
    public
    Integer getFinanceNumber() {
        return financeNumber;
    }

    /**
     * 设置融资次数
     * @param financeNumber
     * @return
     */
    public
    OrganizationEntity setFinanceNumber(Integer financeNumber) {
        this.financeNumber = financeNumber;
        return this;
    }

    /**
     * 获得法人
     * @return
     */
    public
    String getLegalPerson() {
        return legalPerson;
    }

    /**
     * 设置法人
     * @param legalPerson
     * @return
     */
    public
    OrganizationEntity setLegalPerson(String legalPerson) {
        this.legalPerson = legalPerson;
        return this;
    }

    /**
     * 获得地址
     * @return
     */
    public
    String getAddress() {
        return address;
    }

    /**
     * 设置地址
     * @param address
     * @return
     */
    public
    OrganizationEntity setAddress(String address) {
        this.address = address;
        return this;
    }

    @Override
    public
    String toString() {
        return "OrganizationEntity{" +
                "tenantId=" + tenantId +
                ", orgId='" + orgId + '\'' +
                ", dimension='" + dimension + '\'' +
                ", orgCode='" + orgCode + '\'' +
                ", orgName='" + orgName + '\'' +
                ", parentId='" + parentId + '\'' +
                ", manageId='" + manageId + '\'' +
                ", positionCode='" + positionCode + '\'' +
                ", orgCate='" + orgCate + '\'' +
                ", orgLevel='" + orgLevel + '\'' +
                ", orgOrder=" + orgOrder +
                ", orgPath='" + orgPath + '\'' +
                ", extId='" + extId + '\'' +
                ", remark='" + remark + '\'' +
                ", status=" + status +
                ", platformSupplierrate=" + platformSupplierrate +
                ", coreCompanyRate=" + coreCompanyRate +
                ", areaId='" + areaId + '\'' +
                ", financeNumber=" + financeNumber +
                ", legalPerson='" + legalPerson + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}
