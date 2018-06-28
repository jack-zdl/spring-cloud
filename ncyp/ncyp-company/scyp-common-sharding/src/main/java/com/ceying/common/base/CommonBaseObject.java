package com.ceying.common.base;

import tk.mybatis.mapper.annotation.Version;

import java.io.Serializable;
import java.util.Date;

public abstract class CommonBaseObject implements Serializable{

    private static final long serialVersionUID = 6421726798046837147L;

    protected String createdby;
    protected Date createdon;
    protected String lastmodifiedby;
    protected Date lastmodifiedon;
    @Version
    protected Integer rowversion;


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

    public CommonBaseObject() {
    }

    public CommonBaseObject(String createdby, Date createdon, Integer rowversion) {
        this.createdby = createdby;
        this.createdon = createdon;
        this.rowversion = rowversion;
    }

    public CommonBaseObject(String createdby, Date createdon, String lastmodifiedby, Date lastmodifiedon, Integer rowversion) {
        this.createdby = createdby;
        this.createdon = createdon;
        this.lastmodifiedby = lastmodifiedby;
        this.lastmodifiedon = lastmodifiedon;
        this.rowversion = rowversion;
    }
}
