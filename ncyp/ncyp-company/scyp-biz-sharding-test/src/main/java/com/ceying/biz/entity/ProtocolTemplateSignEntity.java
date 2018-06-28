package com.ceying.biz.entity;

import com.ceying.common.base.CommonBaseObject;
import tk.mybatis.mapper.annotation.Version;

import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
 * 功能说明:  协议模板签名 <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间:2018/6/6 11:03<br>
 * <br>
 */
@Table(name = "t_biz_protocoltemplatesign")
public class ProtocolTemplateSignEntity implements Serializable {

    private String urid;

    private String id;

    private String signature;

    private String operateFlag;

    private String isactive;

    protected String createdby;

    protected Date createdon;
    @Version
    protected Integer rowversion;

    private String description;

    public String getUrid() {
        return urid;
    }

    public void setUrid(String urid) {
        this.urid = urid;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public String getOperateFlag() {
        return operateFlag;
    }

    public void setOperateFlag(String operateFlag) {
        this.operateFlag = operateFlag;
    }

    public String getIsactive() {
        return isactive;
    }

    public void setIsactive(String isactive) {
        this.isactive = isactive;
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
}
