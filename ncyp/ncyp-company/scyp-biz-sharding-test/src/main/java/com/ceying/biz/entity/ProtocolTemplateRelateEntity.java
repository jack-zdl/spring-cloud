package com.ceying.biz.entity;

import com.ceying.common.base.CommonBaseObject;

import javax.persistence.Table;
import java.io.Serializable;

/**
 * 功能说明: 协议模板关系表   <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间:2018/6/6 10:57<br>
 * <br>
 */
@Table(name = "t_biz_protocoltemplaterelate")
public class ProtocolTemplateRelateEntity extends CommonBaseObject implements Serializable {
    private String urid;

    private String type;

    private String id;

    private String protocolid;

    private String  ourorgid;

    private String bankid;

    private String coreid;

    private String supplierid;

    private String isactive;

    private String description;

    public String getUrid() {
        return urid;
    }

    public void setUrid(String urid) {
        this.urid = urid;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProtocolid() {
        return protocolid;
    }

    public void setProtocolid(String protocolid) {
        this.protocolid = protocolid;
    }

    public String getOurorgid() {
        return ourorgid;
    }

    public void setOurorgid(String ourorgid) {
        this.ourorgid = ourorgid;
    }

    public String getBankid() {
        return bankid;
    }

    public void setBankid(String bankid) {
        this.bankid = bankid;
    }

    public String getCoreid() {
        return coreid;
    }

    public void setCoreid(String coreid) {
        this.coreid = coreid;
    }

    public String getSupplierid() {
        return supplierid;
    }

    public void setSupplierid(String supplierid) {
        this.supplierid = supplierid;
    }

    public String getIsactive() {
        return isactive;
    }

    public void setIsactive(String isactive) {
        this.isactive = isactive;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
