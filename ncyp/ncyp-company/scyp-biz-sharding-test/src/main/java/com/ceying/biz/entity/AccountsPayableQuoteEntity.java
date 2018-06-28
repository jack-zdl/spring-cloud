package com.ceying.biz.entity;

import com.ceying.common.base.CommonBaseObject;
import com.ceying.common.constant.ConditionTypeConstant;
import com.ceying.common.enums.IsActiveEnum;
import com.ceying.common.util.annotation.Condition;
import com.ceying.common.util.annotation.EnumConver;
import com.ceying.common.util.datetools.DateUtil;
import com.ceying.common.util.sequence.SequenceUtil;
import org.dozer.Mapping;

import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @author: lidf
 * @date: 2018/3/28
 * @description: 报价表
 * @version: 2.0
 */
@Table(name = "t_biz_accountspayablequote")
public class AccountsPayableQuoteEntity extends CommonBaseObject implements Serializable {
    private static final long serialVersionUID = -1457546644171915416L;

    /**
     * 主键ID
     */
    @Id
    private String  urid;

    /**
     * 租户ID
     */
    private String tenantid;

    /**
     * 三方协议模板ID
     */
    private String tatemplateid ;

    /**
     * 应付账款ID
     */
    @Condition(type = ConditionTypeConstant.IN)
    private String accountspayableid;

    /**
     * 融资提供方ID
     */
    private String bankid;

    /**
     * 供应商专户ID
     */
    private String supplieraccountid;

    /**
     * 融资金额
     */
    private BigDecimal financingamount;

    /**
     * 融资期限
     */
    private Date financingdate;

    /**
     * 预计还款日期
     */
    private Date estimatereturndate;

    /**
     * 是否为优先行报价
     */
    private String isfirstquote;

    /**
     * 最近一次操作标志
     */
    @Condition
    private String lastoperationflag;

    /**
     * 预计融资成本
     */
    private BigDecimal financingcost;

    /**
     * 有追无追
     */
    private String isrecourse ;

    /**
     * 有追利率
     */
    private BigDecimal recourseinterestrate ;

    /**
     * 无追利率
     */
    @Mapping("interestrate")
    protected BigDecimal nonrecourseinterestrate ;

    /**
     * 有追折扣
     */
    private BigDecimal recoursediscount  ;

    /**
     * 无追折扣
     */
    private BigDecimal nonrecoursediscount  ;

    /**
     * 是否有效
     */
    @EnumConver(enumType = IsActiveEnum.class)
    @Condition
    private String isactive  ;

    /**
     * 描述
     */
    private String description  ;

    /**
     * 融资确认书
     */
    private byte[] signaturecontent;


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

    public String getTatemplateid() {
        return tatemplateid;
    }

    public void setTatemplateid(String tatemplateid) {
        this.tatemplateid = tatemplateid;
    }

    public String getAccountspayableid() {
        return accountspayableid;
    }

    public void setAccountspayableid(String accountspayableid) {
        this.accountspayableid = accountspayableid;
    }

    public String getBankid() {
        return bankid;
    }

    public void setBankid(String bankid) {
        this.bankid = bankid;
    }

    public String getSupplieraccountid() {
        return supplieraccountid;
    }

    public void setSupplieraccountid(String supplieraccountid) {
        this.supplieraccountid = supplieraccountid;
    }

    public BigDecimal getFinancingamount() {
        return financingamount;
    }

    public void setFinancingamount(BigDecimal financingamount) {
        this.financingamount = financingamount;
    }

    public Date getFinancingdate() {
        return financingdate;
    }

    public void setFinancingdate(Date financingdate) {
        this.financingdate = financingdate;
    }

    public Date getEstimatereturndate() {
        return estimatereturndate;
    }

    public void setEstimatereturndate(Date estimatereturndate) {
        this.estimatereturndate = estimatereturndate;
    }

    public String getIsfirstquote() {
        return isfirstquote;
    }

    public void setIsfirstquote(String isfirstquote) {
        this.isfirstquote = isfirstquote;
    }

    public String getLastoperationflag() {
        return lastoperationflag;
    }

    public void setLastoperationflag(String lastoperationflag) {
        this.lastoperationflag = lastoperationflag;
    }

    public BigDecimal getFinancingcost() {
        return financingcost;
    }

    public void setFinancingcost(BigDecimal financingcost) {
        this.financingcost = financingcost;
    }

    public String getIsrecourse() {
        return isrecourse;
    }

    public void setIsrecourse(String isrecourse) {
        this.isrecourse = isrecourse;
    }

    public BigDecimal getRecourseinterestrate() {
        return recourseinterestrate;
    }

    public void setRecourseinterestrate(BigDecimal recourseinterestrate) {
        this.recourseinterestrate = recourseinterestrate;
    }

    public BigDecimal getNonrecourseinterestrate() {
        return nonrecourseinterestrate;
    }

    public void setNonrecourseinterestrate(BigDecimal nonrecourseinterestrate) {
        this.nonrecourseinterestrate = nonrecourseinterestrate;
    }

    public BigDecimal getRecoursediscount() {
        return recoursediscount;
    }

    public void setRecoursediscount(BigDecimal recoursediscount) {
        this.recoursediscount = recoursediscount;
    }

    public BigDecimal getNonrecoursediscount() {
        return nonrecoursediscount;
    }

    public void setNonrecoursediscount(BigDecimal nonrecoursediscount) {
        this.nonrecoursediscount = nonrecoursediscount;
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

    public byte[] getSignaturecontent() {
        return signaturecontent;
    }

    public void setSignaturecontent(byte[] signaturecontent) {
        this.signaturecontent = signaturecontent;
    }

    public AccountsPayableQuoteEntity() {
    }

    /**
     * 全参构造函数（除去修改人修改时间）
     * @param tenantid 租户ID
     * @param tatemplateid 三方协议模板id
     * @param accountspayableid 应付账款ID
     * @param bankid 融资提供方ID
     * @param supplieraccountid 供应商专户ID
     * @param financingamount 融资金额
     * @param financingdate 融资期限
     * @param estimatereturndate 预计还款日期
     * @param isfirstquote 是否优先行报价
     * @param lastoperationflag 最后一次操作标识
     * @param financingcost 预计融资成本
     * @param isrecourse 有追无追
     * @param recourseinterestrate 有追利率
     * @param nonrecourseinterestrate 无追利率
     * @param recoursediscount 有追折扣
     * @param nonrecoursediscount 无追折扣
     * @param isactive 是否有效
     * @param createdby 创建人
     * @param description  描述
     */
    public AccountsPayableQuoteEntity( String tenantid, String tatemplateid, String accountspayableid, String bankid,
                          String supplieraccountid, BigDecimal financingamount, Date financingdate, Date estimatereturndate,
                          String isfirstquote, String lastoperationflag, BigDecimal financingcost, String isrecourse,
                          BigDecimal recourseinterestrate, BigDecimal nonrecourseinterestrate, BigDecimal recoursediscount,
                          BigDecimal nonrecoursediscount, String isactive, String createdby,  String description) {
        this.urid = SequenceUtil.UUID();
        this.tenantid = tenantid;
        this.tatemplateid = tatemplateid;
        this.accountspayableid = accountspayableid;
        this.bankid = bankid;
        this.supplieraccountid = supplieraccountid;
        this.financingamount = financingamount;
        this.financingdate = financingdate;
        this.estimatereturndate = estimatereturndate;
        this.isfirstquote = isfirstquote;
        this.lastoperationflag = lastoperationflag;
        this.financingcost = financingcost;
        this.isrecourse = isrecourse;
        this.recourseinterestrate = recourseinterestrate;
        this.nonrecourseinterestrate = nonrecourseinterestrate;
        this.recoursediscount = recoursediscount;
        this.nonrecoursediscount = nonrecoursediscount;
        this.isactive = isactive;
        this.createdby = createdby;
        this.createdon = new Date();
        this.rowversion = 1;
        this.description = description;
    }

    /**
     * 修改应付账款报价对象
     * @param financingamount
     * @param financingdate
     * @param estimatereturndate
     * @param lastoperationflag
     * @param financingcost
     * @param isrecourse
     * @param recourseinterestrate
     * @param nonrecourseinterestrate
     * @param recoursediscount
     * @param nonrecoursediscount
     * @param isactive
     * @param lastmodifiedby
     * @param description
     */
    public void setAccountsPayableQuote(AccountsPayableQuoteEntity accountsPayableQuote,
                                        BigDecimal financingamount, Date financingdate, Date estimatereturndate,
                                        String lastoperationflag, BigDecimal financingcost, String isrecourse, BigDecimal recourseinterestrate,
                                        BigDecimal nonrecourseinterestrate, BigDecimal recoursediscount, BigDecimal nonrecoursediscount, String isactive,
                                        String lastmodifiedby, String description) {
        accountsPayableQuote.setFinancingamount(financingamount == null?accountsPayableQuote.getFinancingamount():financingamount);
        accountsPayableQuote.setFinancingdate(financingdate == null?accountsPayableQuote.getFinancingdate():financingdate);
        accountsPayableQuote.setEstimatereturndate(estimatereturndate == null?accountsPayableQuote.getEstimatereturndate():estimatereturndate);
        accountsPayableQuote.setLastoperationflag(lastoperationflag == null?accountsPayableQuote.getLastoperationflag():lastoperationflag);
        accountsPayableQuote.setFinancingcost(financingcost == null?accountsPayableQuote.getFinancingcost():financingcost);
        accountsPayableQuote.setIsrecourse(isrecourse == null?accountsPayableQuote.getIsrecourse():isrecourse);
        accountsPayableQuote.setRecourseinterestrate(recourseinterestrate == null?accountsPayableQuote.getRecourseinterestrate():recourseinterestrate);
        accountsPayableQuote.setNonrecourseinterestrate(nonrecourseinterestrate == null?accountsPayableQuote.getNonrecourseinterestrate():nonrecourseinterestrate);
        accountsPayableQuote.setRecoursediscount(recoursediscount == null?accountsPayableQuote.getRecoursediscount():recoursediscount);
        accountsPayableQuote.setNonrecoursediscount(nonrecoursediscount == null?accountsPayableQuote.getNonrecoursediscount():nonrecoursediscount);
        accountsPayableQuote.setIsactive(isactive == null?accountsPayableQuote.getIsactive():isactive);
        accountsPayableQuote.setLastmodifiedby(lastmodifiedby  == null?accountsPayableQuote.getLastmodifiedby():lastmodifiedby);
        accountsPayableQuote.setLastmodifiedon(new Date());
        accountsPayableQuote.setDescription(description  == null?accountsPayableQuote.getDescription():description);
    }

    /**
     * 修改应付账款报价对象
     * @param accountsPayableQuote
     * @param isactive
     * @param lastmodifiedby
     * @param description
     */
    public void setAccountsPayableQuote(AccountsPayableQuoteEntity accountsPayableQuote,String isactive,
                                        String lastmodifiedby, String description) {
        accountsPayableQuote.setIsactive(isactive == null?accountsPayableQuote.getIsactive():isactive);
        accountsPayableQuote.setLastmodifiedby(lastmodifiedby  == null?accountsPayableQuote.getLastmodifiedby():lastmodifiedby);
        accountsPayableQuote.setLastmodifiedon(DateUtil.getCurrentDateTime());
        accountsPayableQuote.setDescription(description  == null?accountsPayableQuote.getDescription():description);
    }
}
