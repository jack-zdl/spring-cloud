package com.ceying.chx.biz.business.agreementtemplate.service;



import com.ceying.chx.common.dto.SysUserDto;
import com.ceying.chx.common.entity.triagreementtemp.TripartiteagreementTemplateEntity;
import com.ceying.chx.common.util.response.RespJson;
import com.ceying.chx.common.vo.TripartiteagreementTemplateVO;
import org.springframework.validation.annotation.Validated;

import javax.servlet.http.HttpServletRequest;
import javax.validation.constraints.NotNull;

/**
 * 功能说明: 三方协议模板<br>
 * 系统版本: 2.0 <br>
 * 开发人员: miaozhenqing <br>
 * 开发时间: 2018/1/2<br>
 */
@Validated
public interface AgreementTemplateService {

    /**
     * 新增三方协议模板
     * @param request aa
     * @param tripartiteagreementTemplateVO  三方协议模板vo类
     * @return RespJson
     */
    RespJson agreementTemplateAdd(HttpServletRequest request, @NotNull TripartiteagreementTemplateVO tripartiteagreementTemplateVO) throws Exception;

    /**
     * 修改三方协议模板
     * @param request
     * @param tripartiteagreementTemplateVO
     * @return
     */
    RespJson agreementTemplateEdit(HttpServletRequest request, TripartiteagreementTemplateVO tripartiteagreementTemplateVO);

    /**
     * 删除三方协议模板
     * @param request
     * @param tripartiteagreementTemplateVO
     * @return RespJson
     */
    RespJson agreementTemplateDel(HttpServletRequest request, TripartiteagreementTemplateVO tripartiteagreementTemplateVO);

    /**
     * 查询单条三方协议模板
     * @param request
     * @param tripartiteagreementTemplateVO
     * @return
     */
    RespJson agreementTemplateSelectOne(HttpServletRequest request, TripartiteagreementTemplateVO tripartiteagreementTemplateVO);

    /**
     * 查询三方协议集合
     * @param request
     * @param sysUserDto
     * @return
     */
    RespJson agreementTemplateSelectList(HttpServletRequest request, SysUserDto sysUserDto);

    /**
     * 发布三方协议模板
     * @param request
     * @param tripartiteagreementTemplateVO
     * @return
     */
    RespJson agreementTemplateSend(HttpServletRequest request, TripartiteagreementTemplateVO tripartiteagreementTemplateVO);

    /**
     * 三方协议模板待审批信息查询
     * @param request
     * @param tripartiteagreementTemplateVO
     * @return
     */
    RespJson agreementTemplateSelect(HttpServletRequest request, TripartiteagreementTemplateVO tripartiteagreementTemplateVO);

}
