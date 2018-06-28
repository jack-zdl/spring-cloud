package com.ceying.biz.query;

import com.ceying.common.constant.CacheKeyConstant;
import com.ceying.common.enums.BusinessTypeEnum;
import com.ceying.common.enums.TaTemplateEnum;
import com.ceying.common.util.annotation.CacheConver;
import com.ceying.common.util.annotation.EnumConver;

/**
 * 功能说明: 三方协议模板待办任务<br>
 * 系统版本: 1.0 <br>
 * 开发人员: yangxh
 * 开发时间: 2018/5/16<br>
 * <br>
 */
public class TripartiteagreementTemplateTaskQuery {

    private String urid;

    private String tatemplatecode;

    @CacheConver(cacheType = CacheKeyConstant.ORGNAMEMAP)
    private String bankid;

    @CacheConver(cacheType = CacheKeyConstant.ORGNAMEMAP)
    private String corecompanyid;


    @EnumConver(enumType = TaTemplateEnum.class)
    private String  lastoperateflag;

    @EnumConver(enumType = BusinessTypeEnum.class)
    private String businesstype;




    private int total;

    /**
     * 流程定义所需字段
     */
    private String id;
    private String name;
    private String formKey;
    private String processInstanceId;

    public String getUrid() {
        return urid;
    }

    public void setUrid(String urid) {
        this.urid = urid;
    }

    public String getTatemplatecode() {
        return tatemplatecode;
    }

    public void setTatemplatecode(String tatemplatecode) {
        this.tatemplatecode = tatemplatecode;
    }

    public String getBankid() {
        return bankid;
    }

    public void setBankid(String bankid) {
        this.bankid = bankid;
    }

    public String getCorecompanyid() {
        return corecompanyid;
    }

    public void setCorecompanyid(String corecompanyid) {
        this.corecompanyid = corecompanyid;
    }

    public String getLastoperateflag() {
        return lastoperateflag;
    }

    public void setLastoperateflag(String lastoperateflag) {
        this.lastoperateflag = lastoperateflag;
    }

    public String getBusinesstype() {
        return businesstype;
    }

    public void setBusinesstype(String businesstype) {
        this.businesstype = businesstype;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFormKey() {
        return formKey;
    }

    public void setFormKey(String formKey) {
        this.formKey = formKey;
    }

    public String getProcessInstanceId() {
        return processInstanceId;
    }

    public void setProcessInstanceId(String processInstanceId) {
        this.processInstanceId = processInstanceId;
    }

    public TripartiteagreementTemplateTaskQuery(String urid, String tatemplatecode, String bankid, String corecompanyid, String businesstype,
                                     String lastoperateflag, String id, String name, String formKey, String processInstanceId) {
        this.urid = urid;
        this.corecompanyid = corecompanyid;
        this.bankid = bankid;
        this.tatemplatecode = tatemplatecode;
        this.businesstype = businesstype;
        this.lastoperateflag = lastoperateflag;
        this.id = id;
        this.name = name;
        this.formKey = formKey;
        this.processInstanceId = processInstanceId;
    }
}
