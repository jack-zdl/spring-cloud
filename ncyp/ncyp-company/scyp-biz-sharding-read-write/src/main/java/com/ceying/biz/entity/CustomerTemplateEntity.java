package com.ceying.biz.entity;

import com.ceying.common.base.CommonBaseObject;
import com.ceying.common.constant.CacheKeyConstant;
import com.ceying.common.enums.AppealIsActiveEnum;
import com.ceying.common.util.annotation.CacheConver;
import com.ceying.common.util.annotation.EnumConver;

import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * 功能说明: 三方协议模板封面<br>
 * 系统版本: 1.0 <br>
 * 开发人员: yangxh
 * 开发时间: 2018/6/6<br>
 * <br>
 */
@Table(name = "T_BIZ_CUSTOMERTEMPLATE")
public class CustomerTemplateEntity extends CommonBaseObject implements Serializable {

    @Id
    private String urid;

    @CacheConver(cacheType = CacheKeyConstant.ORGNAMEMAP)
    private String orgid;  //组织机构id

    private String templatecode;  //模板编号

    private String templatename;  //模板名称

    private byte[] templatecontent;  //模板内容

    private String templatetype; //模板类型：1：三方协议封面

    @EnumConver(enumType = AppealIsActiveEnum.class)
    private String isactive;  //是否有效 :0—无效；1—有效

    private String description;  //描述

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

    public byte[] getTemplatecontent() {
        return templatecontent;
    }

    public void setTemplatecontent(byte[] templatecontent) {
        this.templatecontent = templatecontent;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
