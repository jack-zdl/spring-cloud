package com.ceying.chx.common.entity;

/**
 * 功能说明:基础父类的对象 <br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl
 * 开发时间: 2017/11/6 14:45<br>
 * <br>
 */

import java.io.Serializable;
import java.util.Date;

public abstract class CommonBaseObject implements Serializable {

    private static final long serialVersionUID = 6421726798046837147L;

    /**
     * 创建人
     */
    protected String createdby;

    /**
     * 创建时间
     */
    protected Date createdon;

    /**
     * 最后修改时间
     */
    protected String lastmodifiedby;

    /**
     * 最后修改时间
     */
    protected Date lastmodifiedon;

    /**
     * 版本号
     */
    protected Integer rowversion;

    /**
     * 描述
     */
    private String description;

    /**
     * 获得该实体类的表名
     * @return
     */
    public abstract String getTableName();

    /**
     * 获得创建人
     * @return
     */
    public String getCreatedby() {
        return createdby;
    }

    /**
     * 设置创建人
     * @param createdby
     */
    public void setCreatedby(String createdby) {
        this.createdby = createdby;
    }

    /**
     * 获得创建时间
     * @return
     */
    public Date getCreatedon() {
        return createdon;
    }

    /**
     * 设置创建时间
     * @param createdon
     */
    public void setCreatedon(Date createdon) {
        this.createdon = createdon;
    }

    /**
     * 获得最后修改人
     * @return
     */
    public String getLastmodifiedby() {
        return lastmodifiedby;
    }

    /**
     * 设置最后修改人
     * @param lastmodifiedby
     */
    public void setLastmodifiedby(String lastmodifiedby) {
        this.lastmodifiedby = lastmodifiedby;
    }

    /**
     * 获得最后修改时间
     * @return
     */
    public Date getLastmodifiedon() {
        return lastmodifiedon;
    }

    /**
     * 设置最后修改时间
     * @param lastmodifiedon
     */
    public void setLastmodifiedon(Date lastmodifiedon) {
        this.lastmodifiedon = lastmodifiedon;
    }

    /**
     * 获得版本号
     * @return
     */
    public Integer getRowversion() {
        return rowversion;
    }

    /**
     * 设置版本号
     * @param rowversion
     */
    public void setRowversion(Integer rowversion) {
        this.rowversion = rowversion;
    }

    /**
     * 获得描述
     * @return
     */
    public String getDescription() {
        return description;
    }

    /**
     * 设置描述
     * @param description
     * @return
     */
    public void setDescription(String description) {
        this.description = description;
    }

    public
    CommonBaseObject() {
    }

    public CommonBaseObject(String createdby, Date createdon, Integer rowversion) {
        this.createdby = createdby;
        this.createdon = createdon;
        this.rowversion = rowversion;
    }

    public
    CommonBaseObject(String createdby, Date createdon, String lastmodifiedby, Date lastmodifiedon, Integer rowversion, String description) {
        this.createdby = createdby;
        this.createdon = createdon;
        this.lastmodifiedby = lastmodifiedby;
        this.lastmodifiedon = lastmodifiedon;
        this.rowversion = rowversion;
        this.description = description;
    }
}
