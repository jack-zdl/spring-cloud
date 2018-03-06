package com.ceying.chx.biz.tripartiteAgreementTemplate.controller;


import com.ceying.chx.biz.tripartiteAgreementTemplate.service.AgreementTemplateService;
//import com.ceying.chx.common.entity.triagreementtemp.TripartiteagreementTemplateEntity;
import com.ceying.chx.common.util.response.RespJson;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 功能说明: 三方协议模板<br>
 * 系统版本: 1.0 <br>
 * 开发人员: miaozhenqing
 * 开发时间: 2018/1/2<br>
 * <br>
 */
@RestController
@RequestMapping("/biz/AgreementTemplate")
public class AgreementTemplateController {
    @Resource
    private AgreementTemplateService agreementTemplateServiceImpl;

    //三方协议模板新增
//    @RequestMapping(value="/add",method = RequestMethod.POST)
//    public
//    RespJson agreementTemplateAdd(HttpServletRequest request, @RequestBody TripartiteagreementTemplateEntity agreementTemplate){
//        RespJson respJson = agreementTemplateServiceImpl.agreementTemplateAdd(request,agreementTemplate);
//        return respJson;
//    }
//    //三方协议模板修改
//    @RequestMapping(value="/edit",method = RequestMethod.POST)
//    public RespJson agreementTemplateEdit(HttpServletRequest request, @RequestBody TripartiteagreementTemplateEntity agreementTemplate){
//        RespJson respJson = agreementTemplateServiceImpl.agreementTemplateEdit(request,agreementTemplate);
//        return respJson;
//    }
//    //三方协议模板删除
//    @RequestMapping(value="/del",method = RequestMethod.POST)
//    public RespJson agreementTemplateDel(HttpServletRequest request, @RequestBody TripartiteagreementTemplateEntity agreementTemplate){
//        RespJson respJson = agreementTemplateServiceImpl.agreementTemplateDel(request,agreementTemplate);
//        return respJson;
//    }
//    //三方协议模板查询单条信息
//        @RequestMapping(value="/selectOne",method = RequestMethod.POST)
//    public RespJson agreementTemplateSelectOne(HttpServletRequest request, @RequestBody TripartiteagreementTemplateEntity agreementTemplate){
//        String ss=request.getParameter("urid");
//        RespJson respJson = agreementTemplateServiceImpl.agreementTemplateSelectOne(request,agreementTemplate);
//        return respJson;
//    }
//    //三方协议模板查询多条信息
//    @RequestMapping(value="/selectList",method = RequestMethod.POST)
//    public RespJson agreementTemplateSelectList(HttpServletRequest request, @RequestBody TripartiteagreementTemplateEntity agreementTemplate){
//        RespJson respJson = agreementTemplateServiceImpl.agreementTemplateSelectList(request,agreementTemplate);
//        return respJson;
//    }
//    //三方协议模板发布
//    @RequestMapping(value="/send",method = RequestMethod.POST)
//    @ResponseBody
//    public RespJson agreementTemplateSend(HttpServletRequest request, @RequestBody TripartiteagreementTemplateEntity agreementTemplate){
//        String sign = request.getParameter("signs");
//        RespJson respJson = agreementTemplateServiceImpl.agreementTemplateSend(request,agreementTemplate);
//        return respJson;
//    }
}
