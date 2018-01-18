package com.ceying.chx.common.dto;

import java.io.Serializable;
import java.math.BigDecimal;

public class RoleRightDto implements Serializable {

    private static final long serialVersionUID = 7785469582588145303L;

    private String transCode;

    private String subTransCode;

    private String roleCode;

    private BigDecimal beginDate;

    private BigDecimal endDate;

    private String rightFlag;

    private String createBy;

    private BigDecimal createDate;

    private String rightEnable;

    private BigDecimal tenantId;

    public String getTransCode() {
        return transCode;
    }

    public void setTransCode(String transCode) {
        this.transCode = transCode;
    }

    public String getSubTransCode() {
        return subTransCode;
    }

    public void setSubTransCode(String subTransCode) {
        this.subTransCode = subTransCode;
    }

    public String getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode;
    }

    public BigDecimal getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(BigDecimal beginDate) {
        this.beginDate = beginDate;
    }

    public BigDecimal getEndDate() {
        return endDate;
    }

    public void setEndDate(BigDecimal endDate) {
        this.endDate = endDate;
    }

    public String getRightFlag() {
        return rightFlag;
    }

    public void setRightFlag(String rightFlag) {
        this.rightFlag = rightFlag;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public BigDecimal getCreateDate() {
        return createDate;
    }

    public void setCreateDate(BigDecimal createDate) {
        this.createDate = createDate;
    }

    public String getRightEnable() {
        return rightEnable;
    }

    public void setRightEnable(String rightEnable) {
        this.rightEnable = rightEnable;
    }

    public BigDecimal getTenantId() {
        return tenantId;
    }

    public void setTenantId(BigDecimal tenantId) {
        this.tenantId = tenantId;
    }

    public String getServiceAlias() {
        return this.transCode+"$"+this.subTransCode;
    }
}