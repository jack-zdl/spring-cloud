package com.ceying.chx.biz.business.agreementtemplate.controller;


import com.ceying.chx.biz.business.agreementtemplate.service.AgreementTemplateService;
import com.ceying.chx.common.config.*;
import com.ceying.chx.common.dto.SysUserDto;
import com.ceying.chx.common.entity.triagreementtemp.TripartiteagreementTemplateEntity;
import com.ceying.chx.common.util.response.RespJson;
import com.ceying.chx.common.util.response.RespJsonFactory;
import com.ceying.chx.common.vo.TripartiteagreementTemplateVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.cache.CacheManager;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

/**
 * 功能说明: 三方协议模板<br>
 * 系统版本: 1.0 <br>
 * 开发人员: miaozhenqing
 * 开发时间: 2018/1/2<br>
 * <br>
 */
@RestController
@RequestMapping("/biz/agreementTemplate")
public class AgreementTemplateController {
    @Resource
    private AgreementTemplateService agreementTemplateServiceImpl;

//    @Autowired
//    private CacheManager cacheManager;
    /**
     * 新增一条三方协议模板
     * @param request
     * @param tripartiteagreementTemplateVO
     * @return
     */
    @PostMapping(value="/add")
    public
    RespJson agreementTemplateAdd(HttpServletRequest request,
                                  @Validated({SaveBizValid.class, SaveValid.class}) @RequestBody TripartiteagreementTemplateVO tripartiteagreementTemplateVO, Errors errors) throws Exception {
        if (errors.hasErrors()) {
            return RespJsonFactory.buildFailure("输入参数有误！");
        }
        RespJson respJson = agreementTemplateServiceImpl.agreementTemplateAdd(request,tripartiteagreementTemplateVO);
        return respJson;
    }

    /**
     * 三方协议模板修改
     * @param request
     * @param agreementTemplate
     * @return
     */
    @RequestMapping(value="/edit",method = RequestMethod.POST)
    public RespJson agreementTemplateEdit(HttpServletRequest request,
                                          @Validated({SaveBizValid.class, SaveValid.class,DeleteValid.class}) @RequestBody TripartiteagreementTemplateVO agreementTemplate, Errors errors){
        if (errors.hasErrors()) {
            return RespJsonFactory.buildFailure("输入参数有误！");
        }
        RespJson respJson = agreementTemplateServiceImpl.agreementTemplateEdit(request,agreementTemplate);
        return respJson;
    }

    /**
     * 三方协议模板删除
     * @param request
     * @param agreementTemplate
     * @param errors
     * @return RespJson
     */
    @RequestMapping(value="/del",method = RequestMethod.POST)
    public RespJson agreementTemplateDel(HttpServletRequest request,  @Validated({SaveBizValid.class, DeleteValid.class}) @RequestBody TripartiteagreementTemplateVO agreementTemplate, Errors errors){
        if (errors.hasErrors()) {
            return RespJsonFactory.buildFailure("输入参数有误！");
        }
        RespJson respJson = agreementTemplateServiceImpl.agreementTemplateDel(request,agreementTemplate);
        return respJson;
    }

    /**
     * 三方协议模板查询单条信息
     * @param request http请求
     * @param agreementTemplate 三方协议模板vo类
     * @param errors 错误
     * @return RespJson
     */
    @RequestMapping(value="/selectOne",method = RequestMethod.POST)
    public RespJson agreementTemplateSelectOne(HttpServletRequest request,   @Validated({SaveBizValid.class, DeleteValid.class}) @RequestBody TripartiteagreementTemplateVO agreementTemplate, Errors errors){
        if (errors.hasErrors()) {
            return RespJsonFactory.buildFailure("输入参数有误！");
        }
        String ss=request.getParameter("urid");
        RespJson respJson = null;
        try {
            respJson = agreementTemplateServiceImpl.agreementTemplateSelectOne(request,agreementTemplate);
        }catch (Exception e){
            respJson = RespJsonFactory.buildFailure(e.getMessage());
        }
        return respJson;
    }

    /**
     * 三方协议模板查询多条信息
     * @param request 请求
     * @param sysUserDto 参数系统用户类
     * @param errors 错误
     * @return RespJson
     */
    @PostMapping(value="/selectList")
    public RespJson agreementTemplateSelectList(HttpServletRequest request,
                                                 @RequestBody SysUserDto sysUserDto, Errors errors){
        if (errors.hasErrors()) {
            return RespJsonFactory.buildFailure("输入参数有误！");
        }
        RespJson respJson = agreementTemplateServiceImpl.agreementTemplateSelectList(request,sysUserDto);
        return respJson;
    }

    /**
     * 三方协议模板发布
     * @param request
     * @param agreementTemplate
     * @param errors
     * @return
     */
    @RequestMapping(value="/send",method = RequestMethod.POST)
    @ResponseBody
    public RespJson agreementTemplateSend(HttpServletRequest request,
                                          @Validated({SaveBizValid.class, DeleteValid.class})  @RequestBody TripartiteagreementTemplateVO agreementTemplate, Errors errors){
        if (errors.hasErrors()) {
            return RespJsonFactory.buildFailure("输入参数有误！");
        }
        String sign = request.getParameter("signs");
        RespJson respJson = agreementTemplateServiceImpl.agreementTemplateSend(request,agreementTemplate);
        return respJson;
    }

    /**
     * 三方协议模板待审批信息查询
     * @param request
     * @param agreementTemplate
     * @return
     */
    @PostMapping(value="/select")
    @ResponseBody
    public RespJson agreementTemplateApprove(HttpServletRequest request, @Validated({DeleteValid.class, DeleteBizValid.class}) @RequestBody TripartiteagreementTemplateVO agreementTemplate, Errors errors){
        if (errors.hasErrors()) {
            return RespJsonFactory.buildFailure("输入参数有误！");
        }
        RespJson respJson;
//        if("".equals(agreementTemplate.getBankId())&&"".equals(agreementTemplate.getCorecompanyId())){
//            respJson.setResult(0);
//            respJson.setMsg("输入参数有误");
//            return respJson;
//        }
        respJson = agreementTemplateServiceImpl.agreementTemplateSelect(request,agreementTemplate);
        return respJson;
    }
}
