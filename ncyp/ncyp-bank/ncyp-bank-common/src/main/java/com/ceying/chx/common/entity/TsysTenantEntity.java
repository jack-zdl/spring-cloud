package com.ceying.chx.common.entity;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * 功能说明: 租户表<br>
 * 系统版本: 1.0 <br>
 * 开发人员: dengqz
 * 开发时间: 2018/1/17<br>
 * <br>
 */
@Table(name="tsys_tenant")
public class TsysTenantEntity {
    @Id
    @Column(name="tenant_id")
    private String tenantId;
    private String tenantCode;
    private String tenantName;
    private String tenantShortname;
    private String tenantType;
    private String tenantStatus;
    private String telno;
    private String mobile;
    private String email;
    private String remark;
    private Integer tenantOrder;
    private Date createDate;
    private Date modifyDate;
    private String extField_1;
    private String extField_2;
    private String extField_3;
    private String tenantCnshortname;

    public String getTenantId() {
        return tenantId;
    }

    public void setTenantId(String tenantId) {
        this.tenantId = tenantId;
    }

    public String getTenantCode() {
        return tenantCode;
    }

    public void setTenantCode(String tenantCode) {
        this.tenantCode = tenantCode;
    }

    public String getTenantName() {
        return tenantName;
    }

    public void setTenantName(String tenantName) {
        this.tenantName = tenantName;
    }

    public String getTenantShortname() {
        return tenantShortname;
    }

    public void setTenantShortname(String tenantShortname) {
        this.tenantShortname = tenantShortname;
    }

    public String getTenantType() {
        return tenantType;
    }

    public void setTenantType(String tenantType) {
        this.tenantType = tenantType;
    }

    public String getTenantStatus() {
        return tenantStatus;
    }

    public void setTenantStatus(String tenantStatus) {
        this.tenantStatus = tenantStatus;
    }

    public String getTelno() {
        return telno;
    }

    public void setTelno(String telno) {
        this.telno = telno;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getTenantOrder() {
        return tenantOrder;
    }

    public void setTenantOrder(Integer tenantOrder) {
        this.tenantOrder = tenantOrder;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    public String getExtField_1() {
        return extField_1;
    }

    public void setExtField_1(String extField_1) {
        this.extField_1 = extField_1;
    }

    public String getExtField_2() {
        return extField_2;
    }

    public void setExtField_2(String extField_2) {
        this.extField_2 = extField_2;
    }

    public String getExtField_3() {
        return extField_3;
    }

    public void setExtField_3(String extField_3) {
        this.extField_3 = extField_3;
    }

    public String getTenantCnshortname() {
        return tenantCnshortname;
    }

    public void setTenantCnshortname(String tenantCnshortname) {
        this.tenantCnshortname = tenantCnshortname;
    }
}
