package com.ceying.chx.common.entity.triagreementtemp;

import java.io.Serializable;
import java.util.Date;


public class TaTemplateOperations implements Serializable {

    private String urid;

    private String tatemplateId;

    private String operator;

    private String operateOrgId;

    private Date operateDate;

    private String operateFlag;

    private String signature;

    private String createby;

    private Date createdon;

    private String lastmodifiedby;

    private Date lastmodifiedon;

    private int rowversion;

    private String description;

    private String relateoperateId;

    private String blockchainaddress;

    public String getUrid() {
        return urid;
    }

    public void setUrid(String urid) {
        this.urid = urid;
    }

    public String getTatemplateId() {
        return tatemplateId;
    }

    public void setTatemplateId(String tatemplateId) {
        this.tatemplateId = tatemplateId;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getOperateOrgId() {
        return operateOrgId;
    }

    public void setOperateOrgId(String operateOrgId) {
        this.operateOrgId = operateOrgId;
    }

    public Date getOperateDate() {
        return operateDate;
    }

    public void setOperateDate(Date operateDate) {
        this.operateDate = operateDate;
    }

    public String getOperateFlag() {
        return operateFlag;
    }

    public void setOperateFlag(String operateFlag) {
        this.operateFlag = operateFlag;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
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

    public String getLastmodifiedby() {
        return lastmodifiedby;
    }

    public void setLastmodifiedby(String lastmodifiedby) {
        this.lastmodifiedby = lastmodifiedby;
    }

    public Date getLastmodifiedon() {
        return lastmodifiedon;
    }

    public void setLastmodifiedon(Date lastmodifiedon) {
        this.lastmodifiedon = lastmodifiedon;
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

    public String getRelateoperateId() {
        return relateoperateId;
    }

    public void setRelateoperateId(String relateoperateId) {
        this.relateoperateId = relateoperateId;
    }

    public String getBlockchainaddress() {
        return blockchainaddress;
    }

    public void setBlockchainaddress(String blockchainaddress) {
        this.blockchainaddress = blockchainaddress;
    }
}