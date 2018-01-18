package com.ceying.chx.common.entity.triagreementtemp;


import com.ceying.chx.common.entity.CommonBaseObject;

import java.io.Serializable;
import java.util.Date;

/**
 * 功能说明: 三方协议模板操作实体类
 *          <p>T_TATEMPLETEOPERATIONS</p><br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl
 * 开发时间: 2018/1/13 11:13<br>
 */
public class TaTemplateOperationsEntity extends CommonBaseObject implements Serializable {

    @Override
    public
    String getTableName() {
        return "T_TATEMPLETEOPERATIONS";
    }
    /**
     * 主键
     */
    private String urid;

    /**
     * 三方协议模板id
     */
    private String tatemplateId;

    /**
     * 操作员key
     */
    private String operator;

    /**
     * 操作员组织id
     */
    private String operateOrgId;

    /**
     * 操作日期
     */
    private Date operateDate;

    /**
     * 操作标识
     */
    private String operateFlag;

    /**
     * 签名信息
     */
    private String signature;

    /**
     * 关联操作id
     */
    private String relateoperateId;

    /**
     * 区块链地址
     */
    private String blockchainaddress;

    /**
     * 获得主键
     */
    public String getUrid() {
        return urid;
    }

    /**
     * 设置主键
     */
    public void setUrid(String urid) {
        this.urid = urid;
    }

    /**
     * 获得三方协议模板id
     */
    public String getTatemplateId() {
        return tatemplateId;
    }

    /**
     * 设置三方协议模板id
     */
    public void setTatemplateId(String tatemplateId) {
        this.tatemplateId = tatemplateId;
    }

    /**
     * 获得操作员key
     */
    public String getOperator() {
        return operator;
    }

    /**
     * 设置操作员key
     */
    public void setOperator(String operator) {
        this.operator = operator;
    }

    /**
     * 获得操作组织id
     */
    public String getOperateOrgId() {
        return operateOrgId;
    }

    /**
     * 设置操作组织id
     */
    public void setOperateOrgId(String operateOrgId) {
        this.operateOrgId = operateOrgId;
    }

    /**
     * 获得操作日期
     */
    public Date getOperateDate() {
        return operateDate;
    }

    /**
     * 设置操作日期
     */
    public void setOperateDate(Date operateDate) {
        this.operateDate = operateDate;
    }

    /**
     * 获得操作标识
     */
    public String getOperateFlag() {
        return operateFlag;
    }

    /**
     * 获得操作标识
     */
    public void setOperateFlag(String operateFlag) {
        this.operateFlag = operateFlag;
    }

    /**
     * 获得签名信息
     */
    public String getSignature() {
        return signature;
    }

    /**
     * 设置签名信息
     */
    public void setSignature(String signature) {
        this.signature = signature;
    }

    /**
     * 获得关联操作id
     */
    public String getRelateoperateId() {
        return relateoperateId;
    }

    /**
     * 设置关联操作id
     */
    public void setRelateoperateId(String relateoperateId) {
        this.relateoperateId = relateoperateId;
    }

    /**
     * 获得区块链地址
     */
    public String getBlockchainaddress() {
        return blockchainaddress;
    }

    /**
     * 设置区块链地址
     */
    public void setBlockchainaddress(String blockchainaddress) {
        this.blockchainaddress = blockchainaddress;
    }


}