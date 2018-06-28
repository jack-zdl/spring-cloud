package com.ceying.biz.vo;

/**
 * @author: mzq
 * @date: 2018/4/3
 * @description :开户行vo类
 * @version: 2.0
 */
public class BanklocationsVO {
    //页码
    private Integer page=1;
    //行数
    private Integer rows=50;

    private String urid;

    private String areaid;

    private String name;

    private String bankid;

    public String getBankid() {
        return bankid;
    }

    public void setBankid(String bankid) {
        this.bankid = bankid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAreaid() {
        return areaid;
    }

    public void setAreaid(String areaid) {
        this.areaid = areaid;
    }

    public String getUrid() {
        return urid;
    }

    public void setUrid(String urid) {
        this.urid = urid;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }
}
