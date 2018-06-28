package com.ceying.common.entity;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
 * 功能说明: 用户表<br>
 * 系统版本: 1.0 <br>
 * 开发人员: dengqz
 * 开发时间: 2018/1/17<br>
 * <br>
 */
@Table(name="t_sys_user")
public class UserEntity implements Serializable{
    @Id
    @Column(name="user_id")
    private String userId;
    private String userName;
    private String userPwd;
    private String orgId;
    private String userType;
    private String userStatus;
    private String lockStatus;
    private Date createDate;
    private Date modifyDate;
    private Date passModifyDate;
    private String mobile;
    private String email;
    private String extFlag;
    private String remark;
    private String extField_1;
    private String extField_2;
    private String extField_3;
    private String extField_4;
    private String extField_5;
    private Integer userOrder;
    private String cIdentitytype;
    private String cIdentityno;
    private String cCredentials;
    private String tenantId;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(String userStatus) {
        this.userStatus = userStatus;
    }

    public String getLockStatus() {
        return lockStatus;
    }

    public void setLockStatus(String lockStatus) {
        this.lockStatus = lockStatus;
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

    public Date getPassModifyDate() {
        return passModifyDate;
    }

    public void setPassModifyDate(Date passModifyDate) {
        this.passModifyDate = passModifyDate;
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

    public String getExtFlag() {
        return extFlag;
    }

    public void setExtFlag(String extFlag) {
        this.extFlag = extFlag;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
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

    public String getExtField_4() {
        return extField_4;
    }

    public void setExtField_4(String extField_4) {
        this.extField_4 = extField_4;
    }

    public String getExtField_5() {
        return extField_5;
    }

    public void setExtField_5(String extField_5) {
        this.extField_5 = extField_5;
    }

    public Integer getUserOrder() {
        return userOrder;
    }

    public void setUserOrder(Integer userOrder) {
        this.userOrder = userOrder;
    }

    public String getcIdentitytype() {
        return cIdentitytype;
    }

    public void setcIdentitytype(String cIdentitytype) {
        this.cIdentitytype = cIdentitytype;
    }

    public String getcIdentityno() {
        return cIdentityno;
    }

    public void setcIdentityno(String cIdentityno) {
        this.cIdentityno = cIdentityno;
    }

    public String getcCredentials() {
        return cCredentials;
    }

    public void setcCredentials(String cCredentials) {
        this.cCredentials = cCredentials;
    }

    public String getTenantId() {
        return tenantId;
    }

    public void setTenantId(String tenantId) {
        this.tenantId = tenantId;
    }
}
