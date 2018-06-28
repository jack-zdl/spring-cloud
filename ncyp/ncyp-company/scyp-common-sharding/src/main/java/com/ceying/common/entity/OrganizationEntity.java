package com.ceying.common.entity;

import com.ceying.common.enums.IsActiveEnum;
import com.ceying.common.util.annotation.EnumConver;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @author: mzq
 * @date: 2018/3/19
 * @description : 组织表t_sys_organization对应实体类
 * @version: 2.0
 */
@Table(name = "t_sys_organization")
public class OrganizationEntity implements Serializable {
    @Id
    @Column(name="org_id")
    private String orgId;

    private String dimension;

    private String orgCode;

    private String orgName;

    private String parentId;

    private String manageId;

    private String positionCode;

    private String orgCate;

    private String orgLevel;

    private Integer orgOrder;

    private String orgPath;

    private String ssoOrgCode;

    private String ssoParentCode;

    private String extId;

    private String remark;

    @EnumConver(enumType = IsActiveEnum.class)
    private String status;

    private String tenantId;

    private String shortorgname;

    private BigDecimal platformsupplierrate;

    private BigDecimal corecompanyrate;

    private String areaid;

    private Integer financenumber;

    private String address;

    private String legalperson;

    private Date createdate;

    private Date lastmodifiedon;

    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    public String getDimension() {
        return dimension;
    }

    public void setDimension(String dimension) {
        this.dimension = dimension;
    }

    public String getOrgCode() {
        return orgCode;
    }

    public void setOrgCode(String orgCode) {
        this.orgCode = orgCode;
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public String getManageId() {
        return manageId;
    }

    public void setManageId(String manageId) {
        this.manageId = manageId;
    }

    public String getPositionCode() {
        return positionCode;
    }

    public void setPositionCode(String positionCode) {
        this.positionCode = positionCode;
    }

    public String getOrgCate() {
        return orgCate;
    }

    public void setOrgCate(String orgCate) {
        this.orgCate = orgCate;
    }

    public String getOrgLevel() {
        return orgLevel;
    }

    public void setOrgLevel(String orgLevel) {
        this.orgLevel = orgLevel;
    }

    public Integer getOrgOrder() {
        return orgOrder;
    }

    public void setOrgOrder(Integer orgOrder) {
        this.orgOrder = orgOrder;
    }

    public String getOrgPath() {
        return orgPath;
    }

    public void setOrgPath(String orgPath) {
        this.orgPath = orgPath;
    }

    public String getSsoOrgCode() {
        return ssoOrgCode;
    }

    public void setSsoOrgCode(String ssoOrgCode) {
        this.ssoOrgCode = ssoOrgCode;
    }

    public String getSsoParentCode() {
        return ssoParentCode;
    }

    public void setSsoParentCode(String ssoParentCode) {
        this.ssoParentCode = ssoParentCode;
    }

    public String getExtId() {
        return extId;
    }

    public void setExtId(String extId) {
        this.extId = extId;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTenantId() {
        return tenantId;
    }

    public void setTenantId(String tenantId) {
        this.tenantId = tenantId;
    }

    public String getShortorgname() {
        return shortorgname;
    }

    public void setShortorgname(String shortorgname) {
        this.shortorgname = shortorgname;
    }

    public BigDecimal getPlatformsupplierrate() {
        return platformsupplierrate;
    }

    public void setPlatformsupplierrate(BigDecimal platformsupplierrate) {
        this.platformsupplierrate = platformsupplierrate;
    }

    public BigDecimal getCorecompanyrate() {
        return corecompanyrate;
    }

    public void setCorecompanyrate(BigDecimal corecompanyrate) {
        this.corecompanyrate = corecompanyrate;
    }

    public String getAreaid() {
        return areaid;
    }

    public void setAreaid(String areaid) {
        this.areaid = areaid;
    }

    public Integer getFinancenumber() {
        return financenumber;
    }

    public void setFinancenumber(Integer financenumber) {
        this.financenumber = financenumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLegalperson() {
        return legalperson;
    }

    public void setLegalperson(String legalperson) {
        this.legalperson = legalperson;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public Date getLastmodifiedon() {
        return lastmodifiedon;
    }

    public void setLastmodifiedon(Date lastmodifiedon) {
        this.lastmodifiedon = lastmodifiedon;
    }
}
