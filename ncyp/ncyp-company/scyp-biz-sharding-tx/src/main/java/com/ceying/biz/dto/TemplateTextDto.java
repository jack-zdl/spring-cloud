package com.ceying.biz.dto;

import com.ceying.biz.entity.AccountsPayableEntity;
import com.ceying.biz.entity.AccountsPayableQuoteEntity;
import com.ceying.common.entity.OrganizationEntity;

import java.util.Map;

/**
 * 添加助手类的参数对象（data transition object）
 * @author: zhangdl<br>
 * @date: 2018/4/9 11:13<br>
 * @version: 2.0 <br>
 */

public class TemplateTextDto {

    private String templateContext;

    private OrganizationEntity supplierOrganization;

    private OrganizationEntity bankOrganization;

    private OrganizationEntity coreOrganization;

    private AccountsPayableEntity accountsPayable;

    private AccountsPayableQuoteEntity accountsPayableQuoteEntity;

    private Map<String, Object> map;

    public
    String getTemplateContext() {
        return templateContext;
    }

    public TemplateTextDto setTemplateContext(String templateContext) {
        this.templateContext = templateContext;
        return this;
    }

    public
    OrganizationEntity getSupplierOrganization() {
        return supplierOrganization;
    }

    public
    void setSupplierOrganization(OrganizationEntity supplierOrganization) {
        this.supplierOrganization = supplierOrganization;
    }

    public
    OrganizationEntity getBankOrganization() {
        return bankOrganization;
    }

    public
    void setBankOrganization(OrganizationEntity bankOrganization) {
        this.bankOrganization = bankOrganization;
    }

    public
    OrganizationEntity getCoreOrganization() {
        return coreOrganization;
    }

    public
    void setCoreOrganization(OrganizationEntity coreOrganization) {
        this.coreOrganization = coreOrganization;
    }

    public
    AccountsPayableEntity getAccountsPayable() {
        return accountsPayable;
    }

    public
    void setAccountsPayable(AccountsPayableEntity accountsPayable) {
        this.accountsPayable = accountsPayable;
    }

    public
    AccountsPayableQuoteEntity getAccountsPayableQuoteEntity() {
        return accountsPayableQuoteEntity;
    }

    public
    void setAccountsPayableQuoteEntity(AccountsPayableQuoteEntity accountsPayableQuoteEntity) {
        this.accountsPayableQuoteEntity = accountsPayableQuoteEntity;
    }

    public
    Map<String, Object> getMap() {
        return map;
    }

    public
    void setMap(Map<String, Object> map) {
        this.map = map;
    }

    public
    TemplateTextDto() {
    }

    public
    TemplateTextDto(OrganizationEntity supplierOrganization, OrganizationEntity bankOrganization, OrganizationEntity coreOrganization, AccountsPayableEntity accountsPayable, AccountsPayableQuoteEntity accountsPayableQuoteEntity, Map<String, Object> map) {
        this.supplierOrganization = supplierOrganization;
        this.bankOrganization = bankOrganization;
        this.coreOrganization = coreOrganization;
        this.accountsPayable = accountsPayable;
        this.accountsPayableQuoteEntity = accountsPayableQuoteEntity;
        this.map = map;
    }
}
