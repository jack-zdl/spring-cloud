package com.ceying.chx.common.entity.triagreementtemp;




import com.ceying.chx.common.entity.CommonBaseObject;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 功能说明: 三方协议模板实体类<br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl
 * 开发时间: 2018/1/13 11:13<br>
 */
@Table(name = "t_tripartiteagreementtemplate")
public class TripartiteagreementTemplateEntity extends CommonBaseObject implements Serializable {

    private static final long serialVersionUID = -6570576736584654452L;

    @Override
    public
    String getTableName() {
        return "T_TRIPARTITEAGREEMENTTEMPLATE";
    }

    /**
     * 主键
     */
    @Id
    @Column(name = "urid")
    private String urid;

    /**
     * 租户id
     */
    private String tenantId;

    /**
     * 三方协议模板编码
     */
    private String tatemplateCode;

    /**
     * 三方协议模板版本
     */
    private Integer tatemplateVersion;

    /**
     * 银行id
     */
    private String bankId;

    /**
     * 核心企业id
     */
    private String corecompanyId;

    /**
     * 授信额度
     */
    private BigDecimal creditLimit;

    /**
     * 有追无追
     */
    private String isresourse;

    /**
     * 是否有效
     */
    private String isactive;

    /**
     * 最后一次操作标识
     */
    private String lastOperateflag;

    /**
     * 业务类型
     */
    private String businesstype;

    /**
     * 模板内容
     */
    private byte[] templateContent;

    /**
     * 获得主键
     * @return
     */
    public String getUrid() {
        return urid;
    }

    /**
     * 设置主键
     * @param urid
     */
    public void setUrid(String urid) {
        this.urid = urid == null ? null : urid.trim();
    }

    /**
     * 设置租户id
     * @return
     */
    public String getTenantId() {
        return tenantId;
    }

    /**
     * 获得租户id
     * @param tenantId
     */
    public void setTenantId(String tenantId) {
        this.tenantId = tenantId == null ? null : tenantId.trim();
    }

    /**
     * 获得模板编码
     * @return
     */
    public String getTatemplateCode() {
        return tatemplateCode;
    }

    /**
     * 设置模板编码
     * @param tatemplateCode
     */
    public void setTatemplateCode(String tatemplateCode) {
        this.tatemplateCode = tatemplateCode == null ? null : tatemplateCode.trim();
    }

    /**
     * 获得模板版本号
     * @return
     */
    public Integer getTatemplateVersion() {
        return tatemplateVersion;
    }

    /**
     * 设置模板版本
     * @param tatemplateVersion
     */
    public void setTatemplateVersion(Integer tatemplateVersion) {
        this.tatemplateVersion = tatemplateVersion;
    }

    /**
     * 获得银行id
     * @return
     */
    public String getBankId() {
        return bankId;
    }

    /**
     * 设置银行id
     * @param bankId
     */
    public void setBankId(String bankId) {
        this.bankId = bankId == null ? null : bankId.trim();
    }

    /**
     * 获得核心企业id
     * @return
     */
    public String getCorecompanyId() {
        return corecompanyId;
    }

    /**
     * 设置核心企业id
     * @param corecompanyId
     */
    public void setCorecompanyId(String corecompanyId) {
        this.corecompanyId = corecompanyId == null ? null : corecompanyId.trim();
    }

    /**
     * 获得授信额度
     * @return
     */
    public BigDecimal getCreditLimit() {
        return creditLimit;
    }

    /**
     * 设置授信额度
     * @param creditLimit
     */
    public void setCreditLimit(BigDecimal creditLimit) {
        this.creditLimit = creditLimit;
    }

    /**
     * 获得有追无追
     * @return
     */
    public String getIsresourse() {
        return isresourse;
    }

    /**
     * 设置有追无追
     * @param isresourse
     */
    public void setIsresourse(String isresourse) {
        this.isresourse = isresourse == null ? null : isresourse.trim();
    }

    /**
     * 获得有效
     * @return
     */
    public String getIsactive() {
        return isactive;
    }

    /**
     * 设置有效
     * @param isactive
     */
    public void setIsactive(String isactive) {
        this.isactive = isactive == null ? null : isactive.trim();
    }

    /**
     * 获得最后一次标识
     * @return
     */
    public String getLastOperateflag() {
        return lastOperateflag;
    }

    /**
     * 设置最后一次标识
     * @param lastOperateflag
     */
    public void setLastOperateflag(String lastOperateflag) {
        this.lastOperateflag = lastOperateflag == null ? null : lastOperateflag.trim();
    }

    /**
     * 获得业务类型
     * @return
     */
    public String getBusinesstype() {
        return businesstype;
    }

    /**
     * 设置业务类型
     * @param businesstype
     */
    public void setBusinesstype(String businesstype) {
        this.businesstype = businesstype == null ? null : businesstype.trim();
    }

    /**
     * 获得模板内容
     * @return
     */
    public byte[] getTemplateContent() {
        return templateContent;
    }

    /**
     * 设置模板内容
     * @param templateContent
     */
    public void setTemplateContent(byte[] templateContent) {
        this.templateContent = templateContent;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", urid=").append(urid);
        sb.append(", tenantId=").append(tenantId);
        sb.append(", tatemplateCode=").append(tatemplateCode);
        sb.append(", tatemplateVersion=").append(tatemplateVersion);
        sb.append(", bankId=").append(bankId);
        sb.append(", corecompanyId=").append(corecompanyId);
        sb.append(", creditLimit=").append(creditLimit);
        sb.append(", isresourse=").append(isresourse);
        sb.append(", isactive=").append(isactive);
        sb.append(", lastOperateflag=").append(lastOperateflag);
        sb.append(", businesstype=").append(businesstype);
        sb.append(", templateContent=").append(templateContent);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }

}