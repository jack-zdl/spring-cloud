package com.ceying.biz.query;

import com.ceying.common.enums.AccountOperateFlagEnum;
import com.ceying.common.enums.ApproveStateEnum;
import com.ceying.common.util.annotation.EnumConver;
import tk.mybatis.mapper.annotation.Version;

import javax.persistence.Id;
import javax.persistence.Table;
import java.math.BigDecimal;
import java.util.Date;

@Table(name = "t_biz_tradetransactions")
public class TradeTransactionsTaskQuery {


    @Id
    private String urid;
    /**
     * 交易账户ID
     */
    private String  tradeaccountsid ;
    /**
     * 交易金额
     */
    private BigDecimal ledgeramount ;
    /**
     * 交易时间
     */
    private Date postdatetime;
    /**
     * 余额
     */
    private BigDecimal balance;
    /**
     * 操作类型
     */
    @EnumConver(enumType = AccountOperateFlagEnum.class)
    private String  operateflag ;
    /**
     * 审批状态
     */
    @EnumConver(enumType = ApproveStateEnum.class)
    private String approvestate;

    /**
     * 订单号
     * */
    private String ordernumber;

    /**
     * 业务编号
     */
    private String businessnumber;

    /**
     * 创建人
     */
    private String  createdby;
    /**
     * 创建时间
     */
    private Date  createdon;
    /**
     * 修改人
     */
    private String  lastmodifiedby;
    /**
     * 修改时间
     */
    private Date lastmodifiedon;
    /**
     * 版本号
     */
    @Version
    private Integer rowversion;
    /**
     * 描述
     */
    private String  description ;

    private String  accountnumber ;

    private String  accountname ;

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

    public String getTradeaccountsid() {
        return tradeaccountsid;
    }

    public void setTradeaccountsid(String tradeaccountsid) {
        this.tradeaccountsid = tradeaccountsid;
    }

    public BigDecimal getLedgeramount() {
        return ledgeramount;
    }

    public void setLedgeramount(BigDecimal ledgeramount) {
        this.ledgeramount = ledgeramount;
    }

    public Date getPostdatetime() {
        return postdatetime;
    }

    public void setPostdatetime(Date postdatetime) {
        this.postdatetime = postdatetime;
    }

    public BigDecimal getBalance() {
        return balance;
    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
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

    public String getOperateflag() {
        return operateflag;
    }

    public void setOperateflag(String operateflag) {
        this.operateflag = operateflag;
    }

    public String getApprovestate() {
        return approvestate;
    }

    public void setApprovestate(String approvestate) {
        this.approvestate = approvestate;
    }

    public String getOrdernumber() {
        return ordernumber;
    }

    public void setOrdernumber(String ordernumber) {
        this.ordernumber = ordernumber;
    }

    public String getBusinessnumber() {
        return businessnumber;
    }

    public void setBusinessnumber(String businessnumber) {
        this.businessnumber = businessnumber;
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
}
