package com.ceying.chx.common.entity;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 功能说明: 系统交易表<br>
 * 系统版本: 1.0 <br>
 * 开发人员: dengqz
 * 开发时间: 2018/1/17<br>
 * <br>
 */
@Table(name="tsys_trans")
public class TsysTransEntity {
    @Id
    @Column(name="trans_code")
    private String transCode;
    private String transName;
    private String kindCode;
    private String modelCode;
    private String remark;
    private String extField_1;
    private String extField_2;
    private String extField_3;

    public String getTransCode() {
        return transCode;
    }

    public void setTransCode(String transCode) {
        this.transCode = transCode;
    }

    public String getTransName() {
        return transName;
    }

    public void setTransName(String transName) {
        this.transName = transName;
    }

    public String getKindCode() {
        return kindCode;
    }

    public void setKindCode(String kindCode) {
        this.kindCode = kindCode;
    }

    public String getModelCode() {
        return modelCode;
    }

    public void setModelCode(String modelCode) {
        this.modelCode = modelCode;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getExtField_1() {
        return extField_1;
    }

    public void setExtField_1(String extField_1) {
        this.extField_1 = extField_1;
    }

    public String getExtField_2() {
        return extField_2;
    }

    public void setExtField_2(String extField_2) {
        this.extField_2 = extField_2;
    }

    public String getExtField_3() {
        return extField_3;
    }

    public void setExtField_3(String extField_3) {
        this.extField_3 = extField_3;
    }
}
