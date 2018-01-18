package com.ceying.chx.front.business.agreementtemplate.controller;

import com.alibaba.fastjson.JSONObject;
import com.ceying.chx.common.config.DeleteValid;
import com.ceying.chx.common.config.SaveValid;
import com.ceying.chx.common.entity.triagreementtemp.TripartiteagreementTemplateEntity;
import com.ceying.chx.common.util.response.RespJson;
import com.ceying.chx.common.util.response.RespJsonFactory;
import com.ceying.chx.common.vo.TripartiteagreementTemplateVO;
import com.ceying.chx.front.business.agreementtemplate.service.AgreementTemplateService;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

/**
 * 功能说明: 三方协议模板<br>
 * 系统版本: 1.0 <br>
 * 开发人员: miaozhenqing
 * 开发时间: 2018/1/9<br>
 * <br>
 */
@RestController
@RequestMapping("/template")
public class AgreementTemplateController {
    @Resource
    private AgreementTemplateService agreementTemplateServiceImpl;

    /**
     * 检索出跟用户相关的三方协议模板
     * <p>注意为了跟前端Grid插件相匹配，必须使用post接口</p>
     * @param request
     * @return
     */
    @PostMapping(value = "/selectList")
    public JSONObject selectList(HttpServletRequest request){
        JSONObject jsonObject=new JSONObject();
        RespJson respJson = agreementTemplateServiceImpl.selectList(request);
        jsonObject.put("rows",(ArrayList<TripartiteagreementTemplateEntity>)respJson.getData());
        return jsonObject;
    }

    /**
     * 新增三方协议模板
     * @param request
     * @param tripartiteagreementTemplateVO
     * @return
     */
    @PostMapping(value = "/insert")
    public RespJson insert(HttpServletRequest request, @Validated(SaveValid.class) @RequestBody TripartiteagreementTemplateVO tripartiteagreementTemplateVO, Errors errors){
        if (errors.hasErrors()) {
            return RespJsonFactory.buildFailure("输入参数有误！");
        }
        RespJson respJson = agreementTemplateServiceImpl.insert(request,tripartiteagreementTemplateVO);
        return respJson;
    }

    /**
     * 修改三方协议模板
     * @param request
     * @param tripartiteagreementTemplateVO
     * @return
     */
    @PostMapping(value = "/edit")
    public RespJson edit(HttpServletRequest request, @Validated(SaveValid.class) @RequestBody TripartiteagreementTemplateVO tripartiteagreementTemplateVO, Errors errors){
        if (errors.hasErrors()) {
            return RespJsonFactory.buildFailure("输入参数有误！");
        }
        RespJson respJson = agreementTemplateServiceImpl.insert(request,tripartiteagreementTemplateVO);
        return respJson;
    }

    /**
     * 删除三方协议模板
     * @param request
     * @param tripartiteagreementTemplateVO
     * @return
     */
    @PostMapping(value = "/delete")
    public RespJson delete(HttpServletRequest request, @Validated(SaveValid.class) @RequestBody TripartiteagreementTemplateVO tripartiteagreementTemplateVO, Errors errors){
        if (errors.hasErrors()) {
            return RespJsonFactory.buildFailure("输入参数有误！");
        }
        RespJson respJson = agreementTemplateServiceImpl.insert(request,tripartiteagreementTemplateVO);
        return respJson;
    }

    /**
     * 查询单个三方协议模板
     * @param request
     * @param tripartiteagreementTemplateVO
     * @return
     */
    @PostMapping(value = "/select")
    public RespJson select(HttpServletRequest request, @Validated(DeleteValid.class) @RequestBody TripartiteagreementTemplateVO tripartiteagreementTemplateVO, Errors errors){
        if (errors.hasErrors()) {
            return RespJsonFactory.buildFailure("输入参数有误！");
        }
        RespJson respJson = agreementTemplateServiceImpl.select(request,tripartiteagreementTemplateVO);
        return respJson;
    }

    /**
     * 发布单个三方协议模板
     * @param request
     * @param tripartiteagreementTemplateVO
     * @return
     */
    @PostMapping(value = "/send")
    public RespJson send(HttpServletRequest request, @Validated(SaveValid.class) @RequestBody TripartiteagreementTemplateVO tripartiteagreementTemplateVO, Errors errors){
        if (errors.hasErrors()) {
            return RespJsonFactory.buildFailure("输入参数有误！");
        }
        RespJson respJson = agreementTemplateServiceImpl.insert(request,tripartiteagreementTemplateVO);
        return respJson;
    }
    //approve

    /**
     * 审批三方协议模板
     * 发布即审批，应该是六个步骤应该一样
     * @param request
     * @param tripartiteagreementTemplateVO
     * @return
     */
    @PostMapping(value = "/approve")
    public RespJson approve(HttpServletRequest request, @Validated(SaveValid.class) @RequestBody TripartiteagreementTemplateVO tripartiteagreementTemplateVO, Errors errors){
        if (errors.hasErrors()) {
            return RespJsonFactory.buildFailure("输入参数有误！");
        }
        RespJson respJson = agreementTemplateServiceImpl.insert(request,tripartiteagreementTemplateVO);
        return respJson;
    }



}
