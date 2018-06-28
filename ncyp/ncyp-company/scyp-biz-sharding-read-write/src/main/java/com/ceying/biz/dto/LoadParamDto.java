package com.ceying.biz.dto;

import com.ceying.biz.entity.AccountsPayableEntity;
import com.ceying.biz.entity.AccountsPayableQuoteEntity;
import com.ceying.biz.entity.TripartiteAgreementEntity;

import java.util.Date;

/**
 *
 * @author: zhangdl<br>
 * @date: 2018/4/24 15:43<br>
 * @version: 2.0 <br>
 */

public class LoadParamDto {

    private AccountsPayableQuoteEntity accountsPayableQuoteEntity;
    private TripartiteAgreementEntity agreementEntity;
    private AccountsPayableEntity accountsPayableEntity;
    private Date lendingDate;
    private Date workdate;
    private String userId;
    private String orgId;

    public
    AccountsPayableQuoteEntity getAccountsPayableQuoteEntity() {
        return accountsPayableQuoteEntity;
    }

    public
    void setAccountsPayableQuoteEntity(AccountsPayableQuoteEntity accountsPayableQuoteEntity) {
        this.accountsPayableQuoteEntity = accountsPayableQuoteEntity;
    }

    public
    TripartiteAgreementEntity getAgreementEntity() {
        return agreementEntity;
    }

    public
    void setAgreementEntity(TripartiteAgreementEntity agreementEntity) {
        this.agreementEntity = agreementEntity;
    }

    public
    AccountsPayableEntity getAccountsPayableEntity() {
        return accountsPayableEntity;
    }

    public
    void setAccountsPayableEntity(AccountsPayableEntity accountsPayableEntity) {
        this.accountsPayableEntity = accountsPayableEntity;
    }

    public
    Date getLendingDate() {
        return lendingDate;
    }

    public
    void setLendingDate(Date lendingDate) {
        this.lendingDate = lendingDate;
    }

    public
    Date getWorkdate() {
        return workdate;
    }

    public
    void setWorkdate(Date workdate) {
        this.workdate = workdate;
    }

    public
    String getUserId() {
        return userId;
    }

    public
    void setUserId(String userId) {
        this.userId = userId;
    }

    public
    String getOrgId() {
        return orgId;
    }

    public
    void setOrgId(String orgId) {
        this.orgId = orgId;
    }
}
