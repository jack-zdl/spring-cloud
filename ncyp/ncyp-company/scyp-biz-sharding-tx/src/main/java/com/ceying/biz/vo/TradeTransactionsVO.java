package com.ceying.biz.vo;


import com.ceying.common.constant.ExtremeTypeConstant;
import com.ceying.common.util.annotation.TablesCondition;
import com.ceying.common.util.annotation.TablesExtreme;
import com.ceying.common.util.annotation.TablesIsolation;
import com.ceying.common.util.annotation.TablesOrder;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhanghj
 * 开发时间: 2018/3/13<br>
 * <br>
 */
public class TradeTransactionsVO {


    @TablesCondition(table = "t1")
    private String urid;
    @TablesCondition(table = "t1")
    private String  tradeaccountsid ;
    @TablesExtreme(table = "t1",type = ExtremeTypeConstant.GREATER_EQUAL,column = "ledgeramount")
    private BigDecimal startledgeramount ;
    @TablesExtreme(table = "t1",type = ExtremeTypeConstant.LESS_EQUAL,column = "ledgeramount")
    private BigDecimal endledgeramount ;

    @TablesExtreme(table = "t1",type = ExtremeTypeConstant.GREATER_EQUAL,column = "postdatetime")
    private Date startpostdatetime;
    @TablesExtreme(table = "t1",type = ExtremeTypeConstant.LESS_EQUAL,column = "postdatetime")
    private Date endpostdatetime;

    @TablesOrder(table = "t1")
    private Date postdatetime;

    @TablesCondition(table = "t1")
    private String  operateflag ;

    @TablesIsolation(table = "t2")
    private String orgid;

    private int page;
    private int rows;

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

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

    public BigDecimal getStartledgeramount() {
        return startledgeramount;
    }

    public void setStartledgeramount(BigDecimal startledgeramount) {
        this.startledgeramount = startledgeramount;
    }

    public BigDecimal getEndledgeramount() {
        return endledgeramount;
    }

    public void setEndledgeramount(BigDecimal endledgeramount) {
        this.endledgeramount = endledgeramount;
    }

    public Date getStartpostdatetime() {
        return startpostdatetime;
    }

    public void setStartpostdatetime(Date startpostdatetime) {
        this.startpostdatetime = startpostdatetime;
    }

    public Date getEndpostdatetime() {
        return endpostdatetime;
    }

    public void setEndpostdatetime(Date endpostdatetime) {
        this.endpostdatetime = endpostdatetime;
    }

    public String getOperateflag() {
        return operateflag;
    }

    public void setOperateflag(String operateflag) {
        this.operateflag = operateflag;
    }

    public Date getPostdatetime() {
        return postdatetime;
    }

    public void setPostdatetime(Date postdatetime) {
        this.postdatetime = postdatetime;
    }

    public String getOrgid() {
        return orgid;
    }

    public void setOrgid(String orgid) {
        this.orgid = orgid;
    }
}