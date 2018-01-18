package com.ceying.chx.common.entity;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 功能说明: 角色用户<br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl
 * 开发时间: 2017/11/9 11:13<br>
 * <br>
 */

public class RoleUser implements Serializable {

    /**
     * 获得表名
     * @return
     */
    public
    String getTableName() {
        return "TSYS_ROLE_USER";
    }

    /**
     * QA:用户代码，外键TSYS_USER.USER_ID
     */
    private String userCode;

    /**
     * QA:角色编号,外键:TSYS_ROLE.ROLE_CODE
     */
    private String roleCode;

    /**
     * 1-操作角色 2-授权角色
     */
    private String rightFlag;

    /**
     * 租户ID
     */
    private BigDecimal tenantId;

    private static final long serialVersionUID = 1L;

    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode == null ? null : userCode.trim();
    }

    public String getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode == null ? null : roleCode.trim();
    }

    public String getRightFlag() {
        return rightFlag;
    }

    public void setRightFlag(String rightFlag) {
        this.rightFlag = rightFlag == null ? null : rightFlag.trim();
    }

    public BigDecimal getTenantId() {
        return tenantId;
    }

    public void setTenantId(BigDecimal tenantId) {
        this.tenantId = tenantId;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", userCode=").append(userCode);
        sb.append(", roleCode=").append(roleCode);
        sb.append(", rightFlag=").append(rightFlag);
        sb.append(", tenantId=").append(tenantId);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}