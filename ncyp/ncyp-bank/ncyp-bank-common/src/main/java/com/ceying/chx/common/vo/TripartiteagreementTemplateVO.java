package com.ceying.chx.common.vo;

import com.ceying.chx.common.config.DeleteBizValid;
import com.ceying.chx.common.config.DeleteValid;
import com.ceying.chx.common.config.SaveBizValid;
import com.ceying.chx.common.config.SaveValid;

import javax.validation.constraints.NotNull;

/**
 * 功能说明: 三方协议模板vo类<br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/11 21:26<br>
 */

public class TripartiteagreementTemplateVO {

    /**
     * 用户id
     * 通过用户id基本上可以获得用户所有信息
     */
    @NotNull(message = "用户id为空",groups = {SaveBizValid.class})
    private String userId;

    /**
     * 三方协议模板ID
     */
    @NotNull(message = "三方协议模板ID不能为空",groups = {DeleteValid.class, DeleteBizValid.class})
    private String urid;

    /**
     * 融资提供方ID
     */
    @NotNull(message = "银行组织id为空",groups = { SaveBizValid.class})
    private String bankId;

    /**
     * 核心企业ID
     */
    @NotNull(message = "核心企业组织id为空",groups = {SaveValid.class, SaveBizValid.class})
    private String corecompanyId;


    /**
     * 有追无追
     */
    private String isresourse;

    /**
     * 有效无效
     */
    private String isactive;

    /**
     * 业务类型
     */
    @NotNull(message = "业务类型为空",groups = {SaveValid.class, SaveBizValid.class})
    private String businesstype;

    /**
     * 模板内容
     */
    @NotNull(message = "模板内容为空",groups = {SaveValid.class, SaveBizValid.class})
    private String templateContent;

    /**
     * 描述
     */
    private String description;

    /**
     * 修改版本
     */
    private Integer rowversion;

    public
    String getUserId() {
        return userId;
    }

    public
    TripartiteagreementTemplateVO setUserId(String userId) {
        this.userId = userId;
        return this;
    }

    /**
     *  得到三方协议模板ID
     * @return
     */
    public String getUrid() {
        return urid;
    }

    /**
     *  设置三方协议模板ID
     * @param urid
     */
    public
    TripartiteagreementTemplateVO setUrid(String urid) {
        this.urid = urid;
        return this;
    }

    /**
     *
     * @return 得到融资提供方ID
     */
    public
    String getBankId() {
        return bankId;
    }

    /**
     * 设置融资提供方ID
     * @param bankId
     */
    public
    TripartiteagreementTemplateVO setBankId(String bankId) {
        this.bankId = bankId;
        return this;
    }

    /**
     * 得到核心企业ID
     * @return
     */
    public
    String getCorecompanyId() {
        return corecompanyId;
    }

    /**
     * 设置核心企业ID
     * @param corecompanyId
     */
    public
    TripartiteagreementTemplateVO setCorecompanyId(String corecompanyId) {
        this.corecompanyId = corecompanyId;
        return this;
    }

    /**
     * 得到是否有追无追
     * @return
     */
    public
    String getIsresourse() {
        return isresourse;
    }

    /**
     * 设置是否有追无追
     * @param isresourse
     */
    public
    TripartiteagreementTemplateVO setIsresourse(String isresourse) {
        this.isresourse = isresourse;
        return this;
    }

    /**
     * 得到是否有效
     * @return
     */
    public
    String getIsactive() {
        return isactive;
    }

    /**
     * 设置是否有效
     * @param isactive
     */
    public
    TripartiteagreementTemplateVO setIsactive(String isactive) {
        this.isactive = isactive;
        return this;
    }

    /**
     * 获得业务类型
     * @return
     */
    public
    String getBusinesstype() {
        return businesstype;
    }

    /**
     * 设置业务类型
     * @param businesstype
     * @return
     */
    public
    TripartiteagreementTemplateVO setBusinesstype(String businesstype) {
        this.businesstype = businesstype;
        return this;
    }

    /**
     *  得到模板内容
     * @return
     */
    public
    String getTemplateContent() {
        return templateContent;
    }

    /**
     * 设置模板内容
     * @param templateContent
     * @return
     */
    public
    TripartiteagreementTemplateVO setTemplateContent(String templateContent) {
        this.templateContent = templateContent;
        return this;
    }

    /**
     * 得到描述
     * @return
     */
    public
    String getDescription() {
        return description;
    }

    /**
     * 设置描述
     * @param description
     */
    public
    TripartiteagreementTemplateVO setDescription(String description) {
        this.description = description;
        return this;
    }

    /**
     * 得到版本号
     * @return
     */
    public
    Integer getRowversion() {
        return rowversion;
    }

    /**
     * 设置版本号
     * @param rowversion
     */
    public
    TripartiteagreementTemplateVO setRowversion(Integer rowversion) {
        this.rowversion = rowversion;
        return this;
    }
}
