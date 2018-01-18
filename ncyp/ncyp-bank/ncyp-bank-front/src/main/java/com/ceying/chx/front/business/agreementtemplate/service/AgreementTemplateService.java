package com.ceying.chx.front.business.agreementtemplate.service;

import com.ceying.chx.common.util.response.RespJson;
import com.ceying.chx.common.vo.TripartiteagreementTemplateVO;
import com.sun.org.apache.regexp.internal.RE;

import javax.servlet.http.HttpServletRequest;

/**
 * 功能说明: 三方协议模板接口<br>
 * 系统版本: 1.0 <br>
 * 开发人员: miaozhenqing
 * 开发时间: 2018/1/9<br>
 */
public interface AgreementTemplateService {

    /**
     * 请求当前用户相关的三方协议模板
     * @param request http请求
     * @return RespJson
     */
    public RespJson selectList(HttpServletRequest request);

    /**
     * 新增三方协议模板
     * @param request http请求
     * @param tripartiteagreementTemplateVO 三方协议模板VO类
     * @return RespJson
     */
    public RespJson insert(HttpServletRequest request,TripartiteagreementTemplateVO tripartiteagreementTemplateVO);

    /**
     * 查询单条三方协议模板
     * @param request
     * @param tripartiteagreementTemplateVO
     * @return RespJson
     */
    public RespJson select(HttpServletRequest request,TripartiteagreementTemplateVO tripartiteagreementTemplateVO);
}
