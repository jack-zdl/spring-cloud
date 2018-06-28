package com.ceying.biz.vo;


import com.ceying.common.util.annotation.TablesCondition;
import com.ceying.common.util.annotation.TablesIsolation;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhanghj
 * 开发时间: 2018/3/13<br>
 * <br>
 */
public class TradeBalancesVO {


    @TablesCondition(table = "t1")
    private String urid;

    @TablesCondition(table = "t1")
    private String  tradeaccountsid ;

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

    public String getOrgid() {
        return orgid;
    }

    public void setOrgid(String orgid) {
        this.orgid = orgid;
    }
}