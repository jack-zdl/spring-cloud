package com.ceying.biz.vo;


import com.ceying.common.util.annotation.Condition;
import com.ceying.common.util.annotation.Isolation;
import com.ceying.common.util.annotation.TenantIsolation;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhanghj
 * 开发时间: 2018/3/13<br>
 * <br>
 */
public class TradeAccountsVO{


    @Condition
    private String urid;

    @Isolation
    private String orgid;

    @TenantIsolation
    private String tenantid;

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

    public String getOrgid() {
        return orgid;
    }

    public void setOrgid(String orgid) {
        this.orgid = orgid;
    }

    public String getTenantid() {
        return tenantid;
    }

    public void setTenantid(String tenantid) {
        this.tenantid = tenantid;
    }
}