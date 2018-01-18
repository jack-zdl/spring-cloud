package com.ceying.chx.common.entity;


import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 功能说明: 角色 <br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl
 * 开发时间: 2017/11/9 11:13<br>
 * <br>
 */
public class Role extends CommonBaseObject implements Serializable {

    private static final long serialVersionUID = 6975234925745501590L;

    /**
     * 获得表名
     * @return
     */
    @Override
    public
    String getTableName() {
        return "TSYS_ROLE";
    }

    /**
     * 角色编号
     */
    private String roleCode;

    /**
     * 角色编号
     */
    private String roleName;

    /**
     * 创建者
     */
    private String creator;

    /**
     * 备注
     */
    private String remark;

    /**
     * 角色父节点标识
     */
    private String parentId;

    /**
     * 角色父节点标识
     */
    private String rolePath;

    /**
     *  QA:角色命令
     */
    private BigDecimal roleOrder;

    /**
     * QA:分配时间
     */
    private Date createDate;

    /**
     * QA:最后修改时间
     */
    private Date modifyDate;

    /**
     * 组织ID
     */
    private String orgId;

    /**
     * 租户ID
     */
    private BigDecimal tenantId;

    /**
     *
     */
    public String getRoleCode() {
        return roleCode;
    }

    /**
     *
     */
    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode == null ? null : roleCode.trim();
    }

    /**
     *
     */
    public String getRoleName() {
        return roleName;
    }

    /**
     *
     */
    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    /**
     *
     */
    public String getCreator() {
        return creator;
    }

    /**
     *
     */
    public void setCreator(String creator) {
        this.creator = creator == null ? null : creator.trim();
    }

    /**
     *
     */
    public String getRemark() {
        return remark;
    }

    /**
     *
     */
    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    /**
     *
     */
    public String getParentId() {
        return parentId;
    }

    /**
     *
     */
    public void setParentId(String parentId) {
        this.parentId = parentId == null ? null : parentId.trim();
    }

    /**
     *
     */
    public String getRolePath() {
        return rolePath;
    }

    /**
     *
     */
    public void setRolePath(String rolePath) {
        this.rolePath = rolePath == null ? null : rolePath.trim();
    }

    /**
     *
     */
    public BigDecimal getRoleOrder() {
        return roleOrder;
    }

    /**
     *
     */
    public void setRoleOrder(BigDecimal roleOrder) {
        this.roleOrder = roleOrder;
    }

    /**
     *
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     *
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     *
     */
    public Date getModifyDate() {
        return modifyDate;
    }

    /**
     *
     */
    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    /**
     *
     */
    public String getOrgId() {
        return orgId;
    }

    /**
     *
     */
    public void setOrgId(String orgId) {
        this.orgId = orgId == null ? null : orgId.trim();
    }

    /**
     *
     */
    public BigDecimal getTenantId() {
        return tenantId;
    }

    /**
     *
     */
    public void setTenantId(BigDecimal tenantId) {
        this.tenantId = tenantId;
    }


    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", roleCode=").append(roleCode);
        sb.append(", roleName=").append(roleName);
        sb.append(", creator=").append(creator);
        sb.append(", remark=").append(remark);
        sb.append(", parentId=").append(parentId);
        sb.append(", rolePath=").append(rolePath);
        sb.append(", roleOrder=").append(roleOrder);
        sb.append(", createDate=").append(createDate);
        sb.append(", modifyDate=").append(modifyDate);
        sb.append(", orgId=").append(orgId);
        sb.append(", tenantId=").append(tenantId);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}