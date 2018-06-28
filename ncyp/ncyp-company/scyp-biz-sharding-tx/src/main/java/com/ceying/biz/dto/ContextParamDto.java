package com.ceying.biz.dto;

import com.ceying.biz.entity.AccountsPayableEntity;
import com.ceying.biz.entity.AccountsPayableQuoteEntity;
import com.ceying.biz.entity.TripartiteAgreementEntity;
import com.ceying.biz.vo.TripartiteAgreementVO;

/**
 * @author: zhangdl<br>
 * @date: 2018/4/8 11:07<br>
 * @version: 2.0 <br>
 * @description: 包装类，来包装这些参数类 <br>
 */
public class ContextParamDto {

    private AccountsPayableEntity accountsPayable;

    private AccountsPayableQuoteEntity accountsPayableQuoteEntity;

    private TripartiteAgreementVO tripartiteAgreementVO;

    private TripartiteAgreementEntity tripartiteAgreementEntity;

    public AccountsPayableEntity getAccountsPayable() {
        return accountsPayable;
    }

    public void setAccountsPayable(AccountsPayableEntity accountsPayable) {
        this.accountsPayable = accountsPayable;
    }

    public AccountsPayableQuoteEntity getAccountsPayableQuoteEntity() {
        return accountsPayableQuoteEntity;
    }

    public void setAccountsPayableQuoteEntity(AccountsPayableQuoteEntity accountsPayableQuoteEntity) {
        this.accountsPayableQuoteEntity = accountsPayableQuoteEntity;
    }

    public TripartiteAgreementVO getTripartiteAgreementVO() {
        return tripartiteAgreementVO;
    }

    public void setTripartiteAgreementVO(TripartiteAgreementVO tripartiteAgreementVO) {
        this.tripartiteAgreementVO = tripartiteAgreementVO;
    }

    public TripartiteAgreementEntity getTripartiteAgreementEntity() {
        return tripartiteAgreementEntity;
    }

    public ContextParamDto setTripartiteAgreementEntity(TripartiteAgreementEntity tripartiteAgreementEntity) {
        this.tripartiteAgreementEntity = tripartiteAgreementEntity;
        return this;
    }
}
