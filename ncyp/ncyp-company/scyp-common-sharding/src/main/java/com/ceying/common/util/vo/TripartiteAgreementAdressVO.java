package com.ceying.common.util.vo;

import java.io.Serializable;

/**
 * 功能说明:  三方协议区块链VO类  <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间:2018/5/15 14:54<br>
 * <br>
 */
public class TripartiteAgreementAdressVO implements Serializable {
    private String id;
    private String tacontractid;
    private String result;
    private String supplierid;
    private String corecompanyid;
    private String bankid;

    public String getId() {
        return id;
    }

    public TripartiteAgreementAdressVO setId(String id) {
        this.id = id;
        return this;
    }

    public String getTacontractid() {
        return tacontractid;
    }

    public void setTacontractid(String tacontractid) {
        this.tacontractid = tacontractid;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getSupplierid() {
        return supplierid;
    }

    public void setSupplierid(String supplierid) {
        this.supplierid = supplierid;
    }

    public String getCorecompanyid() {
        return corecompanyid;
    }

    public void setCorecompanyid(String corecompanyid) {
        this.corecompanyid = corecompanyid;
    }

    public String getBankid() {
        return bankid;
    }

    public void setBankid(String bankid) {
        this.bankid = bankid;
    }
}
