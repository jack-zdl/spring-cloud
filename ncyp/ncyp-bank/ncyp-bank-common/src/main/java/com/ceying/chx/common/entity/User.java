package com.ceying.chx.common.entity;


import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 功能说明: 用户<br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl
 * 开发时间: 2017/11/9 11:13<br>
 * <br>
 */

public class User implements  Serializable { //UserDetails,

    /**
     * 获得表名
     * @return
     */
    public
    String getTableName() {
        return "TSYS_USER";
    }
    /**
     * 用户代码
     */
    private String userId;

    /**
     * 用户名称
     */
    private Object userName;

    /**
     * 用户密码
     */
    private String userPwd;

    /**
     * QA:组织ID,外键:TSYS_ORGANIZATION.ORG_ID
     */
    private String orgId;

    /**
     * 取数据字典[SYS_BIZ_USER_CATE] 0-柜员 1-用户
     */
    private String userType;

    /**
     * 用于表示此用户状态 取数据字典[SYS_BIZ_USER_STATUS] 0-正常 1-注销 2-禁用
     */
    private String userStatus;

    /**
     * 用于表示此用户是否被锁定 取数据字典[SYS_BIZ_LOCK_STATUS] 0-签退 1-登录 2-非正常签退 3-锁定
     */
    private String lockStatus;

    /**
     * 创建时间
     */
    private Date createDate;

    /**
     * 最后修改时间
     */
    private Date modifyDate;

    /**
     * 密码修改时间
     */
    private Date passModifyDate;

    /**
     * 用户手机号
     */
    private String mobile;

    /**
     * 用户邮箱
     */
    private String email;

    /**
     * 扩展标识
     */
    private String extFlag;

    /**
     * 备注
     */
    private String remark;

    /**
     * 扩展字段1
     */
    private String extField1;

    /**
     * 扩展字段2
     */
    private String extField2;

    /**
     * 扩展字段3
     */
    private String extField3;

    /**
     * 扩展字段4
     */
    private String extField4;

    /**
     * 扩展字段5
     */
    private String extField5;

    /**
     * QA:用户指令
     */
    private BigDecimal userOrder;

    /**
     * QA:身份证件类型
     */
    private String cIdentitytype;

    /**
     * QA:证件号码
     */
    private String cIdentityno;

    /**
     * QA:证书
     */
    private String cCredentials;

    /**
     *  QA:创建时间
     */
    private Integer createTime;

    /**
     * QA:最后修改时间
     */
    private Integer modifyTime;

    /**
     *  租户ID
     */
    private BigDecimal tenantId;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public Object getUserName() {
        return userName;
    }

    public void setUserName(Object userName) {
        this.userName = userName;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd == null ? null : userPwd.trim();
    }

    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId == null ? null : orgId.trim();
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType == null ? null : userType.trim();
    }

    public String getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(String userStatus) {
        this.userStatus = userStatus == null ? null : userStatus.trim();
    }

    public String getLockStatus() {
        return lockStatus;
    }

    public void setLockStatus(String lockStatus) {
        this.lockStatus = lockStatus == null ? null : lockStatus.trim();
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
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getExtFlag() {
        return extFlag;
    }

    public void setExtFlag(String extFlag) {
        this.extFlag = extFlag == null ? null : extFlag.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getExtField1() {
        return extField1;
    }

    public void setExtField1(String extField1) {
        this.extField1 = extField1 == null ? null : extField1.trim();
    }

    public String getExtField2() {
        return extField2;
    }

    public void setExtField2(String extField2) {
        this.extField2 = extField2 == null ? null : extField2.trim();
    }

    public String getExtField3() {
        return extField3;
    }

    public void setExtField3(String extField3) {
        this.extField3 = extField3 == null ? null : extField3.trim();
    }

    public String getExtField4() {
        return extField4;
    }

    public void setExtField4(String extField4) {
        this.extField4 = extField4 == null ? null : extField4.trim();
    }

    public String getExtField5() {
        return extField5;
    }

    public void setExtField5(String extField5) {
        this.extField5 = extField5 == null ? null : extField5.trim();
    }

    public BigDecimal getUserOrder() {
        return userOrder;
    }

    public void setUserOrder(BigDecimal userOrder) {
        this.userOrder = userOrder;
    }

    public String getcIdentitytype() {
        return cIdentitytype;
    }

    public void setcIdentitytype(String cIdentitytype) {
        this.cIdentitytype = cIdentitytype == null ? null : cIdentitytype.trim();
    }

    public String getcIdentityno() {
        return cIdentityno;
    }

    public void setcIdentityno(String cIdentityno) {
        this.cIdentityno = cIdentityno == null ? null : cIdentityno.trim();
    }

    public String getcCredentials() {
        return cCredentials;
    }

    public void setcCredentials(String cCredentials) {
        this.cCredentials = cCredentials == null ? null : cCredentials.trim();
    }

    public
    Integer getCreateTime() {
        return createTime;
    }

    public
    User setCreateTime(Integer createTime) {
        this.createTime = createTime;
        return this;
    }

    public
    Integer getModifyTime() {
        return modifyTime;
    }

    public
    User setModifyTime(Integer modifyTime) {
        this.modifyTime = modifyTime;
        return this;
    }

    public BigDecimal getTenantId() {
        return tenantId;
    }

    public void setTenantId(BigDecimal tenantId) {
        this.tenantId = tenantId;
    }

    @Override
    public
    String toString() {
        return "User{" +
                "userId='" + userId + '\'' +
                ", userName=" + userName +
                ", userPwd='" + userPwd + '\'' +
                ", orgId='" + orgId + '\'' +
                ", userType='" + userType + '\'' +
                ", userStatus='" + userStatus + '\'' +
                ", lockStatus='" + lockStatus + '\'' +
                ", createDate=" + createDate +
                ", modifyDate=" + modifyDate +
                ", passModifyDate=" + passModifyDate +
                ", mobile='" + mobile + '\'' +
                ", email='" + email + '\'' +
                ", extFlag='" + extFlag + '\'' +
                ", remark='" + remark + '\'' +
                ", extField1='" + extField1 + '\'' +
                ", extField2='" + extField2 + '\'' +
                ", extField3='" + extField3 + '\'' +
                ", extField4='" + extField4 + '\'' +
                ", extField5='" + extField5 + '\'' +
                ", userOrder=" + userOrder +
                ", cIdentitytype='" + cIdentitytype + '\'' +
                ", cIdentityno='" + cIdentityno + '\'' +
                ", cCredentials='" + cCredentials + '\'' +
                ", createTime=" + createTime +
                ", modifyTime=" + modifyTime +
                ", tenantId=" + tenantId +
                '}';
    }

//    @Override
//    public
//    Collection<? extends GrantedAuthority> getAuthorities() {
//        return null;
//    }
//
//    @Override
//    public
//    String getPassword() {
//        return null;
//    }
//
//    @Override
//    public
//    String getUsername() {
//        return null;
//    }
//
//    @Override
//    public
//    boolean isAccountNonExpired() {
//        return false;
//    }
//
//    @Override
//    public
//    boolean isAccountNonLocked() {
//        return false;
//    }
//
//    @Override
//    public
//    boolean isCredentialsNonExpired() {
//        return false;
//    }
//
//    @Override
//    public
//    boolean isEnabled() {
//        return false;
//    }
}