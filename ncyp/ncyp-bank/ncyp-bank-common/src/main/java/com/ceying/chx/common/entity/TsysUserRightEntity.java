package com.ceying.chx.common.entity;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.math.BigDecimal;

/**
 * 功能说明: 用户授权表<br>
 * 系统版本: 1.0 <br>
 * 开发人员: dengqz
 * 开发时间: 2018/1/17<br>
 * <br>
 */
@Table(name="tsys_user_right")
public class TsysUserRightEntity {
    @Id
    @Column(name="trans_code")
    private String transCode;
    private String subTransCode;
    private String userId;
    private String createBy;
    private BigDecimal createDate;
    private String rightFlag;
    private String rightEnable;
    private String tenantId;

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

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
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

    public String getRightFlag() {
        return rightFlag;
    }

    public void setRightFlag(String rightFlag) {
        this.rightFlag = rightFlag;
    }

    public String getRightEnable() {
        return rightEnable;
    }

    public void setRightEnable(String rightEnable) {
        this.rightEnable = rightEnable;
    }

    public String getTenantId() {
        return tenantId;
    }

    public void setTenantId(String tenantId) {
        this.tenantId = tenantId;
    }
}
