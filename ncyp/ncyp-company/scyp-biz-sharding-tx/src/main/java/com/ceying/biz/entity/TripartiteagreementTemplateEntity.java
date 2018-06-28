package com.ceying.biz.entity;

import com.ceying.common.base.CommonBaseObject;
import com.ceying.common.constant.CacheKeyConstant;
import com.ceying.common.enums.AppealIsActiveEnum;
import com.ceying.common.enums.BusinessTypeEnum;
import com.ceying.common.enums.TaTemplateEnum;
import com.ceying.common.enums.TripartiteAgreementEnum;
import com.ceying.common.util.annotation.CacheConver;
import com.ceying.common.util.annotation.EnumConver;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.math.BigDecimal;


/**
 * 三方协议模板实体类 pojo类——辅助类 属性名全部小写
 * 对应的数据库的T_TRIPARTITEAGREEMENTTEMPLETE（三方协议模板表）
 * @author lidf
 * @version v1.0
 * @date 2017/6/20 9:55
 */
@Table(name = "t_biz_tripartiteagreementtemplate")
public class TripartiteagreementTemplateEntity extends CommonBaseObject implements Serializable {

    private static final long serialVersionUID = 2222517755217978818L;

    /**
     * 三方协议模板ID
     */
    @Id
    @Column(name="urid")
    private String urid;

    /**
     * 租户ID
     */
    private String tenantid;

    /**
     * 三方协议模板编号
     */
    private String tatemplatecode;

    /**
     * 三方协议模板版本
     */
    private BigDecimal tatemplateversion;

    /**
     * 融资提供方ID
     */
    @CacheConver(cacheType = CacheKeyConstant.ORGNAMEMAP)
    private String bankid;

    /**
     * 核心企业ID
     */
    @CacheConver(cacheType = CacheKeyConstant.ORGNAMEMAP)
    private String corecompanyid;

    /**
     * 模板内容
     */
        private byte[] templatecontent;

    /**
     * 最后一个操作ID
     */
    @EnumConver(enumType = TaTemplateEnum.class)
    private String  lastoperateflag;
    /**

     * 是否有效
     */
    @EnumConver(enumType = AppealIsActiveEnum.class)
    private String isactive;

    /**
     * 描述
     */
    private String description;

    /**
     * 业务类型
     */
    @EnumConver(enumType = BusinessTypeEnum.class)
    private String businesstype;

    public String getUrid() {
        return urid;
    }

    public void setUrid(String urid) {
        this.urid = urid;
    }


    public String getTenantid() {return tenantid;}

    public void setTenantid(String tenantid) {this.tenantid = tenantid;}

    public String getTatemplatecode() {
        return tatemplatecode;
    }

    public void setTatemplatecode(String tatemplatecode) {
        this.tatemplatecode = tatemplatecode;
    }

    public BigDecimal getTatemplateversion() {
        return tatemplateversion;
    }

    public void setTatemplateversion(BigDecimal tatemplateversion) {
        this.tatemplateversion = tatemplateversion;
    }

    public String getBankid() {
        return bankid;
    }

    public void setBankid(String bankid) {
        this.bankid = bankid;
    }

    public String getCorecompanyid() {
        return corecompanyid;
    }

    public void setCorecompanyid(String corecompanyid) {
        this.corecompanyid = corecompanyid;
    }

    public byte[] getTemplatecontent() {
        return templatecontent;
    }

    public void setTemplatecontent(byte[] templatecontent) {
        this.templatecontent = templatecontent;
    }

    public String getLastoperateflag() {
        return lastoperateflag;
    }

    public void setLastoperateflag(String lastoperateflag) {
        this.lastoperateflag = lastoperateflag;
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

    public String getBusinesstype() {return businesstype;}

    public void setBusinesstype(String businesstype) {this.businesstype = businesstype;}
}
