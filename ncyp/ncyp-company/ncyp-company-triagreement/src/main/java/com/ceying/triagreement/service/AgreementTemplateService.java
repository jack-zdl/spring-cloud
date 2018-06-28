package com.ceying.triagreement.service;



//import com.ceying.chx.common.entity.triagreementtemp.TripartiteagreementTemplate;
//import com.ceying.chx.common.util.response.RespJson;

import com.ceying.chx.common.entity.triagreementtemp.TripartiteagreementTemplate;
import com.ceying.chx.common.util.response.RespJson;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by mzq on 2018/1/2.
 */
public interface AgreementTemplateService {
    RespJson agreementTemplateAdd(HttpServletRequest request, TripartiteagreementTemplate tripartiteagreementTemplate);
//    RespJson agreementTemplateEdit(HttpServletRequest request, TripartiteagreementTemplate tripartiteagreementTemplate);
//    RespJson agreementTemplateDel(HttpServletRequest request, TripartiteagreementTemplate tripartiteagreementTemplate);
//    RespJson agreementTemplateSelectOne(HttpServletRequest request, TripartiteagreementTemplate tripartiteagreementTemplate);
//    RespJson agreementTemplateSelectList(HttpServletRequest request, TripartiteagreementTemplate tripartiteagreementTemplate);
//    RespJson agreementTemplateSend(HttpServletRequest request, TripartiteagreementTemplate tripartiteagreementTemplate);
}
