package com.ceying.biz.entity;

import com.ceying.common.constant.CacheKeyConstant;
import com.ceying.common.enums.CertTypeEnum;
import com.ceying.common.enums.OrgCateEnum;
import com.ceying.common.enums.UserStatusEnum;
import com.ceying.common.util.annotation.CacheConver;
import com.ceying.common.util.annotation.EnumConver;
import tk.mybatis.mapper.annotation.Version;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Table(name = "t_biz_tradeaccounts")
public class TradeAccountsEntity {
    @Id
    private String urid;

    private String tenantid;

    private String accountnumber;

    private String accountname;

    @EnumConver(enumType = OrgCateEnum.class)
    private String accountcategory;

    @EnumConver(enumType = UserStatusEnum.class)
    private String accountstate;

    @CacheConver(cacheType = CacheKeyConstant.ORGNAMEMAP)
    private String orgid;

    private String contactname;

    private String cellphone;

    @EnumConver(enumType = CertTypeEnum.class)
    private String certtype;

    private String certnumber;

    private String email;

    private String address;

    private String createdby;

    private Date createdon;

    private String lastmodifiedby;

    private Date lastmodifiedon;

    @Version
    private Integer rowversion;

    private String description;

    public String getUrid() {
        return urid;
    }

    public void setUrid(String urid) {
        this.urid = urid;
    }

    public String getTenantid() {
        return tenantid;
    }

    public void setTenantid(String tenantid) {
        this.tenantid = tenantid;
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

    public String getAccountcategory() {
        return accountcategory;
    }

    public void setAccountcategory(String accountcategory) {
        this.accountcategory = accountcategory;
    }

    public String getAccountstate() {
        return accountstate;
    }

    public void setAccountstate(String accountstate) {
        this.accountstate = accountstate;
    }

    public String getOrgid() {
        return orgid;
    }

    public void setOrgid(String orgid) {
        this.orgid = orgid;
    }

    public String getContactname() {
        return contactname;
    }

    public void setContactname(String contactname) {
        this.contactname = contactname;
    }

    public String getCellphone() {
        return cellphone;
    }

    public void setCellphone(String cellphone) {
        this.cellphone = cellphone;
    }

    public String getCerttype() {
        return certtype;
    }

    public void setCerttype(String certtype) {
        this.certtype = certtype;
    }

    public String getCertnumber() {
        return certnumber;
    }

    public void setCertnumber(String certnumber) {
        this.certnumber = certnumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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
}