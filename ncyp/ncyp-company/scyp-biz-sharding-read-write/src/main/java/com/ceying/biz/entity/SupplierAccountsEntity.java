package com.ceying.biz.entity;

import com.ceying.common.constant.CacheKeyConstant;
import com.ceying.common.constant.ConditionTypeConstant;
import com.ceying.common.enums.IsActiveEnum;
import com.ceying.common.util.annotation.CacheConver;
import com.ceying.common.util.annotation.Condition;
import com.ceying.common.util.annotation.EnumConver;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
/**
 * @author: mzq
 * @date: 2018/4/2
 * @description : 表 t_acc_supplieraccounts 对应实体类   供应商专户账户 (结算账户)
 * @version: 2.0
 */
@Table(name = "t_biz_supplieraccounts")
public class SupplierAccountsEntity {
    @Id
    private String urid;

    private String accountnumber;

    private String accountname;
    @CacheConver(cacheType = CacheKeyConstant.ORGNAMEMAP)
    @Condition
    private String supplierid;
    @EnumConver(enumType = IsActiveEnum.class)
    @Condition
    private String isactive;

    private String createdby;

    private Date createdon;

    private String lastmodifiedby;

    private Date lastmodifiedon;

    private Integer rowversion;

    private String description;

    private String banklocationid;
    @Condition
    @CacheConver(cacheType = CacheKeyConstant.ORGNAMEMAP)
    private String bankid;

    @Condition(type = ConditionTypeConstant.IN)
    private String businesstype;

    public String getUrid() {
        return urid;
    }

    public void setUrid(String urid) {
        this.urid = urid;
    }

    public String getAccountnumber() {
        return accountnumber;
    }

    public void setAccountnumber(String accountnumber) {
        this.accountnumber = accountnumber;
    }

    public String getAccountname() {
        return accountname;
    }

    public void setAccountname(String accountname) {
        this.accountname = accountname;
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

    public String getCreatedby() {
        return createdby;
    }

    public void setCreatedby(String createdby) {
        this.createdby = createdby;
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

    public Integer getRowversion() {
        return rowversion;
    }

    public void setRowversion(Integer rowversion) {
        this.rowversion = rowversion;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getBanklocationid() {
        return banklocationid;
    }

    public void setBanklocationid(String banklocationid) {
        this.banklocationid = banklocationid;
    }

    public String getBankid() {
        return bankid;
    }

    public void setBankid(String bankid) {
        this.bankid = bankid;
    }

    public String getBusinesstype() {
        return businesstype;
    }

    public void setBusinesstype(String businesstype) {
        this.businesstype = businesstype;
    }
}