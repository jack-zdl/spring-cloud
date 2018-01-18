package com.ceying.chx.common.entity;

import javax.persistence.Table;
import java.io.Serializable;

/**
 * 功能说明: 系统子交易实体类<br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl
 * 开发时间: 2018/1/13 11:13<br>
 */
@Table(name = "tsys_subtrans")
public class SubTransEntity implements Serializable {

    private static final long serialVersionUID = -494095452300357527L;

    public
    String getTableName() {
        return "tsys_subtrans";
    }

    /**
     *  交易编号
     */
    private String transCode;

    /**
     * 子交易编号
     */
    private String subTransCode;

    /**
     *
     */
    private String subTransName;

    /**
     *
     */
    private String relServ;

    /**
     *
     */
    private String relUrl;

    /**
     *
     */
    private String ctrlFlag;

    /**
     *
     */
    private String loginFlag;

    /**
     *
     */
    private String remark;

    /**
     *
     */
    private String extField1;

    /**
     *
     */
    private String extField2;

    /**
     *
     */
    private String extField3;

    /**
     *
     * @return
     */
    public String getTransCode() {
        return transCode;
    }

    /**
     *
     * @param transCode
     */
    public void setTransCode(String transCode) {
        this.transCode = transCode == null ? null : transCode.trim();
    }

    /**
     *
     * @return
     */
    public String getSubTransCode() {
        return subTransCode;
    }

    /**
     *
     * @param subTransCode
     */
    public void setSubTransCode(String subTransCode) {
        this.subTransCode = subTransCode == null ? null : subTransCode.trim();
    }

    /**
     *
     * @return
     */
    public String getSubTransName() {
        return subTransName;
    }

    /**
     *
     * @param subTransName
     */
    public void setSubTransName(String subTransName) {
        this.subTransName = subTransName == null ? null : subTransName.trim();
    }

    /**
     *
     * @return
     */
    public String getRelServ() {
        return relServ;
    }

    /**
     *
     * @param relServ
     */
    public void setRelServ(String relServ) {
        this.relServ = relServ == null ? null : relServ.trim();
    }

    /**
     *
     * @return
     */
    public String getRelUrl() {
        return relUrl;
    }

    /**
     *
     * @param relUrl
     */
    public void setRelUrl(String relUrl) {
        this.relUrl = relUrl == null ? null : relUrl.trim();
    }

    /**
     *
     * @return
     */
    public String getCtrlFlag() {
        return ctrlFlag;
    }

    /**
     *
     * @param ctrlFlag
     */
    public void setCtrlFlag(String ctrlFlag) {
        this.ctrlFlag = ctrlFlag == null ? null : ctrlFlag.trim();
    }

    /**
     *
     * @return
     */
    public String getLoginFlag() {
        return loginFlag;
    }

    /**
     *
     * @param loginFlag
     */
    public void setLoginFlag(String loginFlag) {
        this.loginFlag = loginFlag == null ? null : loginFlag.trim();
    }

    /**
     *
     * @return
     */
    public String getRemark() {
        return remark;
    }

    /**
     *
     * @param remark
     */
    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    /**
     *
     * @return
     */
    public String getExtField1() {
        return extField1;
    }

    /**
     *
     * @param extField1
     */
    public void setExtField1(String extField1) {
        this.extField1 = extField1 == null ? null : extField1.trim();
    }

    /**
     *
     * @return
     */
    public String getExtField2() {
        return extField2;
    }

    /**
     *
     * @param extField2
     */
    public void setExtField2(String extField2) {
        this.extField2 = extField2 == null ? null : extField2.trim();
    }

    /**
     *
     * @return
     */
    public String getExtField3() {
        return extField3;
    }

    /**
     *
     * @param extField3
     */
    public void setExtField3(String extField3) {
        this.extField3 = extField3 == null ? null : extField3.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", transCode=").append(transCode);
        sb.append(", subTransCode=").append(subTransCode);
        sb.append(", subTransName=").append(subTransName);
        sb.append(", relServ=").append(relServ);
        sb.append(", relUrl=").append(relUrl);
        sb.append(", ctrlFlag=").append(ctrlFlag);
        sb.append(", loginFlag=").append(loginFlag);
        sb.append(", remark=").append(remark);
        sb.append(", extField1=").append(extField1);
        sb.append(", extField2=").append(extField2);
        sb.append(", extField3=").append(extField3);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}