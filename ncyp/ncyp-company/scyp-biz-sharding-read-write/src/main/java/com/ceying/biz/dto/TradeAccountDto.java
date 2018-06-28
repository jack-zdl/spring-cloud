package com.ceying.biz.dto;

import com.ceying.biz.entity.AccountsPayableEntity;
import com.ceying.biz.entity.TripartiteAgreementEntity;
import com.ceying.common.enums.TripartiteAgreementCommentEnum;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author: zhangdl<br>
 * @date: 2018/4/26 11:43<br>
 * @version: 2.0 <br>
 */
public class TradeAccountDto {
    /**
     * 发起三方协议优先行失效
     */
    public final static int firstAbateType = 1;
    /**
     * 发起三方协议支持行失效
     */
    public final static int notFirstAbate = 2;
    /**
     * 供应商撤销，优先行
     */
    public final static int CALL_FIRST_TYPE = 3;
    /**
     * 供应商撤销，支持行
     */
    public final static int CALL_NO_FIRST_TYPE = 4;
    /**
     * 供应商签约同意，但是优先行失效
     */
    public final static int ON_SUPPLIER_FIRST_TYPE = 5;
    /**
     * 供应商签约同意，支持行失效
     */
    public final static int ON_SUPPLIER_No_FIRST_TYPE = 6;
    /**
     * 供应商否决，优先行
     */
    public final static int OFF_SUPPLIER_FIRST_TYPE = 7;
    /**
     * 供应商否决,支持行
     */
    public final static int OFF_SUPPLIER_NO_FIRST_TYPE = 8;
    /**
     * 银行和核心企业否决
     */
    public final static int OFF_BANK_TYPE = 9;

    /**
     * 银行拒绝放款 ，供应商
     */
    public final static int BANK_OFF_SUPPLIER = 10;
    /**
     * 银行拒绝放款 ，银行问题
     */
    public final static int BANK_OFF_BANK = 11;
    /**
     * 银行放款
     */
    public final static int BANK_ON =12;

    private AccountsPayableEntity accountsPayable;

    private TripartiteAgreementEntity agreement;

    private BigDecimal coreTrueFreezeAmount;

    /**
    *  解冻类型
    */
    private List<TripartiteAgreementCommentEnum> type;

    /**
    *  解冻注释
    */
    private TripartiteAgreementCommentEnum releaseComment;

    /**
    * 扣除注释
    */
    private TripartiteAgreementCommentEnum deductComment;

    /**
    * 增加平台注释
    */
    private TripartiteAgreementCommentEnum raisetComment;

    public AccountsPayableEntity getAccountsPayable() {
        return accountsPayable;
    }

    public void setAccountsPayable(AccountsPayableEntity accountsPayable) {
        this.accountsPayable = accountsPayable;
    }

    public
    TripartiteAgreementEntity getAgreement() {
        return agreement;
    }

    public
    void setAgreement(TripartiteAgreementEntity agreement) {
        this.agreement = agreement;
    }

    public
    BigDecimal getCoreTrueFreezeAmount() {
        return coreTrueFreezeAmount;
    }

    public
    void setCoreTrueFreezeAmount(BigDecimal coreTrueFreezeAmount) {
        this.coreTrueFreezeAmount = coreTrueFreezeAmount;
    }

    public
    List<TripartiteAgreementCommentEnum> getType() {
        return type;
    }

    public
    void setType(List<TripartiteAgreementCommentEnum> type) {
        this.type = type;
    }

    public
    TripartiteAgreementCommentEnum getReleaseComment() {
        return releaseComment;
    }

    public
    void setReleaseComment(TripartiteAgreementCommentEnum releaseComment) {
        this.releaseComment = releaseComment;
    }

    public
    TripartiteAgreementCommentEnum getDeductComment() {
        return deductComment;
    }

    public
    void setDeductComment(TripartiteAgreementCommentEnum deductComment) {
        this.deductComment = deductComment;
    }

    public
    TripartiteAgreementCommentEnum getRaisetComment() {
        return raisetComment;
    }

    public
    void setRaisetComment(TripartiteAgreementCommentEnum raisetComment) {
        this.raisetComment = raisetComment;
    }

    /**
    * 根据条件获得不同的注释，提供给Service使用
     * @// TODO: 2018/4/26  并没有具体写好方法，注释错误
    * @Author: zhangdl
    * @Date:
    */
    public TradeAccountDto(Integer status,AccountsPayableEntity accountsPayable) {
        String[] list = {"1","2"};
        List<TripartiteAgreementCommentEnum> typeList = null;
        TripartiteAgreementCommentEnum releaseComment = null;
        TripartiteAgreementCommentEnum deductComment = null;
        TripartiteAgreementCommentEnum raisetComment = null;
        switch (status){
            case firstAbateType:
                typeList = Arrays.asList(TripartiteAgreementCommentEnum.RELEASE_BAIL);
                releaseComment = TripartiteAgreementCommentEnum.ADD_FIRST_RELEASE_BAIL;
                deductComment = TripartiteAgreementCommentEnum.ADD_FIRST_DEDUCT_BAIL;
                raisetComment = TripartiteAgreementCommentEnum.ADD_FIRST_RAISET_TERRACE;
                break;
            case notFirstAbate:
                typeList =  Arrays.asList(TripartiteAgreementCommentEnum.RELEASE_BAIL);
                releaseComment = TripartiteAgreementCommentEnum.ADD_NOFIRST_RELEASE_BAIL;
                deductComment = TripartiteAgreementCommentEnum.ADD_NOFIRST_DEDUCT_BAIL;
                raisetComment = TripartiteAgreementCommentEnum.ADD_NOFIRST_RAISET_TERRACE;
                break;
            case CALL_FIRST_TYPE:
                typeList =  Arrays.asList(TripartiteAgreementCommentEnum.RELEASE_BAIL);
                releaseComment = TripartiteAgreementCommentEnum.ADD_NOFIRST_RELEASE_BAIL;
                deductComment = TripartiteAgreementCommentEnum.ADD_NOFIRST_DEDUCT_BAIL;
                raisetComment = TripartiteAgreementCommentEnum.ADD_NOFIRST_RAISET_TERRACE;
                break;
            case CALL_NO_FIRST_TYPE:
                typeList =  Arrays.asList(TripartiteAgreementCommentEnum.RELEASE_BAIL);
                releaseComment = TripartiteAgreementCommentEnum.ADD_NOFIRST_RELEASE_BAIL;
                deductComment = TripartiteAgreementCommentEnum.ADD_NOFIRST_DEDUCT_BAIL;
                raisetComment = TripartiteAgreementCommentEnum.ADD_NOFIRST_RAISET_TERRACE;
                break;
            case ON_SUPPLIER_FIRST_TYPE:
                typeList =  Arrays.asList(TripartiteAgreementCommentEnum.RELEASE_BAIL);
                releaseComment = TripartiteAgreementCommentEnum.AGREEMENT_FIRST_RELEASE_COVER_CHARGE;
                deductComment = TripartiteAgreementCommentEnum.AGREEMENT_FIRST_DEDUCT_BAIL;
                raisetComment = TripartiteAgreementCommentEnum.AGREEMENT_FIRST_RAISET_TERRACE;
                break;
            case ON_SUPPLIER_No_FIRST_TYPE:
                typeList =  Arrays.asList(TripartiteAgreementCommentEnum.RELEASE_BAIL);
                releaseComment = TripartiteAgreementCommentEnum.AGREEMENT_NOTFIRST_RELEASE_COVER_CHARGE;
                deductComment = TripartiteAgreementCommentEnum.AGREEMENT_NOFIRST_DEDUCT_BAIL;
                raisetComment = TripartiteAgreementCommentEnum.AGREEMENT_NOFIRST_RAISET_TERRACE;
                break;
            case OFF_SUPPLIER_FIRST_TYPE:
                typeList =  Arrays.asList(TripartiteAgreementCommentEnum.RELEASE_BAIL);
                releaseComment = TripartiteAgreementCommentEnum.AGREEMENT_NOTFIRST_RELEASE_COVER_CHARGE;
                deductComment = TripartiteAgreementCommentEnum.AGREEMENT_NOFIRST_DEDUCT_BAIL;
                raisetComment = TripartiteAgreementCommentEnum.AGREEMENT_NOFIRST_RAISET_TERRACE;
                break;
            case OFF_SUPPLIER_NO_FIRST_TYPE:
                typeList =  Arrays.asList(TripartiteAgreementCommentEnum.RELEASE_BAIL);
                releaseComment = TripartiteAgreementCommentEnum.AGREEMENT_NOTFIRST_RELEASE_COVER_CHARGE;
                deductComment = TripartiteAgreementCommentEnum.AGREEMENT_NOFIRST_DEDUCT_BAIL;
                raisetComment = TripartiteAgreementCommentEnum.AGREEMENT_NOFIRST_RAISET_TERRACE;
                break;
            case OFF_BANK_TYPE:
                typeList =  Arrays.asList(TripartiteAgreementCommentEnum.RELEASE_BAIL);
                releaseComment = TripartiteAgreementCommentEnum.AGREEMENT_NOTFIRST_RELEASE_COVER_CHARGE;
                deductComment = TripartiteAgreementCommentEnum.AGREEMENT_NOFIRST_DEDUCT_BAIL;
                raisetComment = TripartiteAgreementCommentEnum.AGREEMENT_NOFIRST_RAISET_TERRACE;
                break;
            case BANK_OFF_BANK:
                typeList =  Arrays.asList(TripartiteAgreementCommentEnum.RELEASE_BAIL);
                releaseComment = TripartiteAgreementCommentEnum.AGREEMENT_NOTFIRST_RELEASE_COVER_CHARGE;
                deductComment = TripartiteAgreementCommentEnum.AGREEMENT_NOFIRST_DEDUCT_BAIL;
                raisetComment = TripartiteAgreementCommentEnum.AGREEMENT_NOFIRST_RAISET_TERRACE;
                break;
            case BANK_OFF_SUPPLIER:
                typeList =  Arrays.asList(TripartiteAgreementCommentEnum.RELEASE_BAIL);
                releaseComment = TripartiteAgreementCommentEnum.BANKREJECTCREDITFREE;
                deductComment = TripartiteAgreementCommentEnum.BANKREJECTDITCHARGEFEE;
                raisetComment = TripartiteAgreementCommentEnum.BANKREJECTCREDIT;
                break;
            case BANK_ON:
                typeList =  Arrays.asList(TripartiteAgreementCommentEnum.RELEASE_COVER_CHARGE,TripartiteAgreementCommentEnum.DEDUCTION_COVER_CHARGE,TripartiteAgreementCommentEnum.DEDUCTION_BAIL);
                releaseComment = TripartiteAgreementCommentEnum.BANKCREDITFREE;
                deductComment = TripartiteAgreementCommentEnum.BANKCREDITCHARGEFEE;
                raisetComment = TripartiteAgreementCommentEnum.BANKCREDIT;
                break;
            default:
                break;
        }
        this.accountsPayable = accountsPayable;
        this.type = typeList;
        this.releaseComment = releaseComment;
        this.deductComment = deductComment;
        this.raisetComment = raisetComment;
    }

    public TradeAccountDto() {
    }
}
