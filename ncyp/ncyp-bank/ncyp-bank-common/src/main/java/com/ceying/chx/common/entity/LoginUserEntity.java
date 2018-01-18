package com.ceying.chx.common.entity;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 功能说明: 登录用户<br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl
 * 开发时间: 2017/11/9 11:13<br>
 */
public class LoginUserEntity implements Serializable {

    private static final long serialVersionUID = -120736742913911478L;

    public String getTableName() {
        return "tsys_user_login";
    }

    /**
     * QA:用户代码，外键TSYS_USER.USER_ID
     */
    private String userId;

    /**
     * 上次成功登录日
     */
    private BigDecimal lastLoginDate;

    /**
     * 上次成功登录时
     */
    private BigDecimal lastLoginTime;

    /**
     * 最近登录操作IP
     */
    private String lastLoginIp;

    /**
     * 登录累计失败次数
     */
    private BigDecimal loginFailTimes;

    /**
     * 最后登录失败日
     */
    private BigDecimal lastFailDate;

    /**
     * 扩展字段
     */
    private String extField;

    /**
     * 租户ID
     */
    private String  tenantId;

    /**
     * 组织ID
     */
    private String orgId;

    /**
     * 用户名称
     */
    private String userName;

    /**
     * 用户中文简称
     */
    private String tenantCnshortname;

    /**
     * 用户英文代码
     */
    private String tenantShortname;

    /**
     * 电话
     */
    private String mobile;

    /**
     * KEY证书编号
     */
    private String cCredentials;

    /**
     *
     * @return
     */
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public BigDecimal getLastLoginDate() {
        return lastLoginDate;
    }

    public void setLastLoginDate(BigDecimal lastLoginDate) {
        this.lastLoginDate = lastLoginDate;
    }

    public BigDecimal getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(BigDecimal lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public String getLastLoginIp() {
        return lastLoginIp;
    }

    public void setLastLoginIp(String lastLoginIp) {
        this.lastLoginIp = lastLoginIp == null ? null : lastLoginIp.trim();
    }

    public BigDecimal getLoginFailTimes() {
        return loginFailTimes;
    }

    public void setLoginFailTimes(BigDecimal loginFailTimes) {
        this.loginFailTimes = loginFailTimes;
    }

    public BigDecimal getLastFailDate() {
        return lastFailDate;
    }

    public void setLastFailDate(BigDecimal lastFailDate) {
        this.lastFailDate = lastFailDate;
    }

    public String getExtField() {
        return extField;
    }

    public void setExtField(String extField) {
        this.extField = extField == null ? null : extField.trim();
    }

    public String getTenantId() {
        return tenantId;
    }

    public void setTenantId(String tenantId) {
        this.tenantId = tenantId;
    }

    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId == null ? null : orgId.trim();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getTenantCnshortname() {
        return tenantCnshortname;
    }

    public void setTenantCnshortname(String tenantCnshortname) {
        this.tenantCnshortname = tenantCnshortname == null ? null : tenantCnshortname.trim();
    }

    public String getTenantShortname() {
        return tenantShortname;
    }

    public void setTenantShortname(String tenantShortname) {
        this.tenantShortname = tenantShortname == null ? null : tenantShortname.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getcCredentials() {
        return cCredentials;
    }

    public void setcCredentials(String cCredentials) {
        this.cCredentials = cCredentials == null ? null : cCredentials.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", userId=").append(userId);
        sb.append(", lastLoginDate=").append(lastLoginDate);
        sb.append(", lastLoginTime=").append(lastLoginTime);
        sb.append(", lastLoginIp=").append(lastLoginIp);
        sb.append(", loginFailTimes=").append(loginFailTimes);
        sb.append(", lastFailDate=").append(lastFailDate);
        sb.append(", extField=").append(extField);
        sb.append(", tenantId=").append(tenantId);
        sb.append(", orgId=").append(orgId);
        sb.append(", userName=").append(userName);
        sb.append(", tenantCnshortname=").append(tenantCnshortname);
        sb.append(", tenantShortname=").append(tenantShortname);
        sb.append(", mobile=").append(mobile);
        sb.append(", cCredentials=").append(cCredentials);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}