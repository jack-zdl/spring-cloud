package com.ceying.chx.common.dto;


import com.ceying.chx.common.config.LoginValid;
import com.ceying.chx.common.config.SelectValid;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;

/**
 * 功能说明: 系统用户DTO类<br>
 * 系统版本: 2.0 <br>
 * 开发人员: miaozhenqing<br>
 * 开发时间: 2018/1/10<br>
 */
public class SysUserDto implements Serializable {

	private static final long serialVersionUID = -5026728323973380085L;
    private int start;
    private int limit;
	/** 用户代码 */
    private String userId;

    private Integer tenantId;

    /**
     * 用户名称
     */
    @NotNull(message = "用户名称不能为空",groups  = {LoginValid.class})
    private String userName;

    /**
     * 用户密码
     */
    @NotNull(message = "用户密码不能为空",groups = {LoginValid.class})
    private String userPwd;

    /** QA:组织ID,外键:TSYS_ORGANIZATION.ORG_ID */
    @NotNull(message = "组织编码",groups = {SelectValid.class})
    private String orgId;

    /** 取数据字典[SYS_BIZ_USER_CATE] 0-柜员 1-用户 */
    private String userType;

    /** 用于表示此用户状态 取数据字典[SYS_BIZ_USER_STATUS] 0-正常 1-注销 2-禁用 */
    private String userStatus;

    /** 用于表示此用户是否被锁定 取数据字典[SYS_BIZ_LOCK_STATUS] 0-签退 1-登录 2-非正常签退 3-锁定 */
    private String lockStatus;

    /** 创建时间 */
    private Date createDate;

    /** 最后修改时间 */
    private Date modifyDate;

    /** 密码修改时间 */
    private Date passModifyDate;

    /** 用户手机号 */
    private String mobile;

    /** 用户邮箱 */
    private String email;

    /** 扩展标识 */
    private String extFlag;

    /** 备注 */
    private String remark;

    /** 扩展字段1 */
    private String extField1;

    /** 扩展字段2 */
    private String extField2;

    /** 扩展字段3 */
    private String extField3;

    /** 扩展字段4 */
    private String extField4;

    /** 扩展字段5 */
    private String extField5;

    /** QA:用户指令 */
    private Integer userOrder;

    /** QA:身份证件类型 */
    private String cIdentitytype;

    /** QA:证件号码 */
    private String cIdentityno;

    /** QA:证书 */
    private String cCredentials;

    //组织编码
    private String orgCode;
    //组织名称
    private String orgName;
    //组织级别
    private String orgLevel;
    //是否分配
    private String isAllocate;
    //角色编码
    private String roleCode;
    //角色名称
    private String roleName;

    public String getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getOrgCode() {
        return orgCode;
    }

    public void setOrgCode(String orgCode) {
        this.orgCode = orgCode;
    }

    public String getOrgLevel() {
        return orgLevel;
    }

    public void setOrgLevel(String orgLevel) {
        this.orgLevel = orgLevel;
    }

    public String getIsAllocate() {
        return isAllocate;
    }

    public void setIsAllocate(String isAllocate) {
        this.isAllocate = isAllocate;
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }


    public String getUserId() {
        return userId;
    }


    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }


    public Integer getTenantId() {
        return tenantId;
    }


    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
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


    public Integer getUserOrder() {
        return userOrder;
    }


    public void setUserOrder(Integer userOrder) {
        this.userOrder = userOrder;
    }


    public String getCIdentitytype() {
        return cIdentitytype;
    }


    public void setCIdentitytype(String cIdentitytype) {
        this.cIdentitytype = cIdentitytype == null ? null : cIdentitytype.trim();
    }


    public String getCIdentityno() {
        return cIdentityno;
    }


    public void setCIdentityno(String cIdentityno) {
        this.cIdentityno = cIdentityno == null ? null : cIdentityno.trim();
    }


    public String getCCredentials() {
        return cCredentials;
    }


    public void setCCredentials(String cCredentials) {
        this.cCredentials = cCredentials == null ? null : cCredentials.trim();
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }
}