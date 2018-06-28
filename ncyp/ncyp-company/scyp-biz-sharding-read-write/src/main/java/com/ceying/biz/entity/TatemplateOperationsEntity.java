package com.ceying.biz.entity;

import com.ceying.common.base.CommonBaseObject;

import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
 * 功能说明: 三方协议模板操作表<br>
 * 系统版本: 1.0 <br>
 * 开发人员: yangxh
 * 开发时间: 2018/6/6<br>
 * <br>
 */
@Table(name = "T_BIZ_TATEMPLATEOPERATIONS")
public class TatemplateOperationsEntity extends CommonBaseObject implements Serializable {


    @Id
    private String urid;
    private String tatemplateid;   //三方协议模板编号
    private String operator;  //操作员
    private String operateorgid;  //操作组织id
    private Date operatedate;  //操作日期
    /**
     * 操作标志:100-银行经办待发布,101-银行经办已发布,102-银行复核签约,103-银行审核签约,201-核心企业经办签约,202-核心企业复核签约,
     * 203-核心企业审核签约8101-银行经办撤销,8102-银行复核否决,8103-银行审核否决,8201-核心企业经办否决,8202-核心企业复核否决,8203-核心企业审核否决
     */
    private String operateflag;
    private String signature;  //签名信息
    private String description;  //描述


    public String getUrid() {
        return urid;
    }

    public void setUrid(String urid) {
        this.urid = urid;
    }

    public String getTatemplateid() {
        return tatemplateid;
    }

    public void setTatemplateid(String tatemplateid) {
        this.tatemplateid = tatemplateid;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getOperateorgid() {
        return operateorgid;
    }

    public void setOperateorgid(String operateorgid) {
        this.operateorgid = operateorgid;
    }

    public Date getOperatedate() {
        return operatedate;
    }

    public void setOperatedate(Date operatedate) {
        this.operatedate = operatedate;
    }

    public String getOperateflag() {
        return operateflag;
    }

    public void setOperateflag(String operateflag) {
        this.operateflag = operateflag;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}

