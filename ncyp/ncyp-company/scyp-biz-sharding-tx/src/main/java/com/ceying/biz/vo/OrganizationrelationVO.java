package com.ceying.biz.vo;

import java.util.List;

/**
 * @author: mzq
 * @date: 2018/4/11
 * @description : 合作菜单下供应商查看查询入参
 * @version: 2.0
 */
public class OrganizationrelationVO {
    //排序字段
    private String sidx;
    //排序类型(降序,升序)
    private String sord;
    //页码
    private Integer page=1;
    //行数
    private Integer rows=50;

    private String ourorgid;

    private String opporgid;

    private String organizationrelationid;

    private String urid;

    private String issupport;

    private String corecompanysupplierrate;

    private String orgCode;

    private String orgName;

    private List<String> priority;

    private String category;

    private String isblack;

    public String getIsblack() {
        return isblack;
    }

    public void setIsblack(String isblack) {
        this.isblack = isblack;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public List<String> getPriority() {
        return priority;
    }

    public void setPriority(List<String> priority) {
        this.priority = priority;
    }

    public String getUrid() {
        return urid;
    }

    public void setUrid(String urid) {
        this.urid = urid;
    }

    public String getIssupport() {
        return issupport;
    }

    public void setIssupport(String issupport) {
        this.issupport = issupport;
    }

    public String getCorecompanysupplierrate() {
        return corecompanysupplierrate;
    }

    public void setCorecompanysupplierrate(String corecompanysupplierrate) {
        this.corecompanysupplierrate = corecompanysupplierrate;
    }

    public String getOrganizationrelationid() {
        return organizationrelationid;
    }

    public void setOrganizationrelationid(String organizationrelationid) {
        this.organizationrelationid = organizationrelationid;
    }

    public String getOpporgid() {
        return opporgid;
    }

    public void setOpporgid(String opporgid) {
        this.opporgid = opporgid;
    }

    public String getOurorgid() {
        return ourorgid;
    }

    public void setOurorgid(String ourorgid) {
        this.ourorgid = ourorgid;
    }

    public String getSidx() {
        return sidx;
    }

    public void setSidx(String sidx) {
        this.sidx = sidx;
    }

    public String getSord() {
        return sord;
    }

    public void setSord(String sord) {
        this.sord = sord;
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

    public String getOrgCode() {
        return orgCode;
    }

    public void setOrgCode(String orgCode) {
        this.orgCode = orgCode;
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }
}
