package com.ceying.biz.entity;

import com.ceying.common.base.CommonBaseObject;
import com.ceying.common.constant.ConditionTypeConstant;
import com.ceying.common.util.annotation.Condition;

import javax.persistence.Table;
import java.io.Serializable;

/**
 * 功能说明: 协议模板表   <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间:2018/6/6 10:47<br>
 * <br>
 */
@Table(name = "t_biz_protocoltemplate")
public class ProtocolTemplateEntity extends CommonBaseObject implements Serializable {

    @Condition(type=ConditionTypeConstant.IN)
    private String urid;

    private String pdfContent;

    private String type;

    private String isactive;

    private String description;

    private String protocolversion;

    public String getUrid() {
        return urid;
    }

    public void setUrid(String urid) {
        this.urid = urid;
    }

    public String getPdfContent() {
        return pdfContent;
    }

    public void setPdfContent(String pdfContent) {
        this.pdfContent = pdfContent;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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

    public String getProtocolversion() {
        return protocolversion;
    }

    public void setProtocolversion(String protocolversion) {
        this.protocolversion = protocolversion;
    }
}
