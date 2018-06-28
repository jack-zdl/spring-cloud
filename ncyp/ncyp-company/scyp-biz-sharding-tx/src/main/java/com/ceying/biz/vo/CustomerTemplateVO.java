package com.ceying.biz.vo;

import com.ceying.common.util.annotation.Condition;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: yangxh
 * 开发时间: 2018/6/6<br>
 * <br>
 */
public class CustomerTemplateVO {

    @Condition
    private String urid;

    @Condition
    private String orgid;

    @Condition
    private String templatecode;

    @Condition
    private String templatename;

    @Condition
    private String templatetype;

    @Condition
    private String isactive;

    private Integer rowversion;

    private String description;

    private String container;


    //页码
    private Integer page=1;
    //行数
    private Integer rows=50;


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

    public String getTemplatecode() {
        return templatecode;
    }

    public void setTemplatecode(String templatecode) {
        this.templatecode = templatecode;
    }

    public String getTemplatename() {
        return templatename;
    }

    public void setTemplatename(String templatename) {
        this.templatename = templatename;
    }

    public String getTemplatetype() {
        return templatetype;
    }

    public void setTemplatetype(String templatetype) {
        this.templatetype = templatetype;
    }

    public String getIsactive() {
        return isactive;
    }

    public void setIsactive(String isactive) {
        this.isactive = isactive;
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

    public String getContainer() {
        return container;
    }

    public void setContainer(String container) {
        this.container = container;
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


    public CustomerTemplateVO(){

    }


    public
    String toString() {
        return "CustomerTemplateVO{" +
                "urid='" + urid + '\'' +
                ", orgid='" + orgid + '\'' +
                ", templatecode='" + templatecode + '\'' +
                ", isactive='" + isactive + '\'' +
                ", rowversion=" + rowversion +
                ", templatetype='" + templatetype + '\'' +
                ", description='" + description + '\'' +
                ", templatename='" + templatename + '\'' +
                ", container=" + container +
                '}';
    }
}
