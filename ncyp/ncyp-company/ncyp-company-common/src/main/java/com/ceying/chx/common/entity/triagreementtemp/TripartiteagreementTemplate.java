package com.ceying.chx.common.entity.triagreementtemp;

import com.ceying.chx.common.config.SaveValid;
import com.ceying.chx.common.config.UpdateValid;

import javax.validation.constraints.NotNull;
import java.util.Date;

public class TripartiteagreementTemplate {
    /**
     *
     */
    private String urid;

    private int tenantId;

    private String tatemplateCode;

    private int tatemplateVersion;

    private String bankId;

    private String corecompanyId;

    private Double creditLimit;

    private String isresourse;

    private String isactive;

    private String createby;

    private Date createdon;

    private String lastModifiedby;

    private Date lastModifiedon;

    private int rowversion;

    private String description;

    private String lastOperateflag;

    private String businesstype;

    private byte[] templateContent;

    public String getUrid() {
        return urid;
    }

    public void setUrid(String urid) {
        this.urid = urid;
    }


    public String getTatemplateCode() {
        return tatemplateCode;
    }

    public void setTatemplateCode(String tatemplateCode) {
        this.tatemplateCode = tatemplateCode;
    }


    public String getBankId() {
        return bankId;
    }

    public void setBankId(String bankId) {
        this.bankId = bankId;
    }

    public String getCorecompanyId() {
        return corecompanyId;
    }

    public void setCorecompanyId(String corecompanyId) {
        this.corecompanyId = corecompanyId;
    }

    public Double getCreditLimit() {
        return creditLimit;
    }

    public void setCreditLimit(Double creditLimit) {
        this.creditLimit = creditLimit;
    }

    public String getIsresourse() {
        return isresourse;
    }

    public void setIsresourse(String isresourse) {
        this.isresourse = isresourse;
    }

    public String getIsactive() {
        return isactive;
    }

    public void setIsactive(String isactive) {
        this.isactive = isactive;
    }

    public String getCreateby() {
        return createby;
    }

    public void setCreateby(String createby) {
        this.createby = createby;
    }

    public Date getCreatedon() {
        return createdon;
    }

    public void setCreatedon(Date createdon) {
        this.createdon = createdon;
    }

    public String getLastModifiedby() {
        return lastModifiedby;
    }

    public void setLastModifiedby(String lastModifiedby) {
        this.lastModifiedby = lastModifiedby;
    }

    public Date getLastModifiedon() {
        return lastModifiedon;
    }

    public void setLastModifiedon(Date lastModifiedon) {
        this.lastModifiedon = lastModifiedon;
    }

    public int getRowversion() {
        return rowversion;
    }

    public void setRowversion(int rowversion) {
        this.rowversion = rowversion;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLastOperateflag() {
        return lastOperateflag;
    }

    public void setLastOperateflag(String lastOperateflag) {
        this.lastOperateflag = lastOperateflag;
    }

    public String getBusinesstype() {
        return businesstype;
    }

    public void setBusinesstype(String businesstype) {
        this.businesstype = businesstype;
    }

    public byte[] getTemplateContent() {
        return templateContent;
    }

    public void setTemplateContent(byte[] templateContent) {
        this.templateContent = templateContent;
    }

    public int getTenantId() {
        return tenantId;
    }

    public void setTenantId(int tenantId) {
        this.tenantId = tenantId;
    }

    public int getTatemplateVersion() {
        return tatemplateVersion;
    }

    public void setTatemplateVersion(int tatemplateVersion) {
        this.tatemplateVersion = tatemplateVersion;
    }
}