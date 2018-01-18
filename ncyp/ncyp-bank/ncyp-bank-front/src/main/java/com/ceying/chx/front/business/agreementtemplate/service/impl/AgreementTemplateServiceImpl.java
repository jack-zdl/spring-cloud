package com.ceying.chx.front.business.agreementtemplate.service.impl;

import ch.qos.logback.classic.Logger;
import com.ceying.chx.common.constants.UserConstant;
import com.ceying.chx.common.dto.SysUserDto;
import com.ceying.chx.common.dto.SysUserLoginDto;
import com.ceying.chx.common.service.BaseService;
import com.ceying.chx.common.util.log.LogContext;
import com.ceying.chx.common.util.response.RespJson;
import com.ceying.chx.common.util.response.RespJsonFactory;
import com.ceying.chx.common.vo.TripartiteagreementTemplateVO;
import com.ceying.chx.front.base.config.SysConstant;
import com.ceying.chx.front.business.agreementtemplate.service.AgreementTemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 功能说明: 三方协议模板<br>
 * 系统版本: 1.0 <br>
 * 开发人员: miaozhenqing
 * 开发时间: 2018/1/9<br>
 * <br>
 */
@Service
public class AgreementTemplateServiceImpl extends BaseService implements AgreementTemplateService {

    @Autowired
    RestTemplate restTemplate;

    @Override
    public RespJson selectList(HttpServletRequest request) {
        RespJson respJson;
        HttpSession session = request.getSession();
        try {
            SysUserDto sysUserDto = (SysUserDto)session.getAttribute(UserConstant.USER_SESSION);
            respJson =  restTemplate.postForObject("http://"+ SysConstant.BIZ_SERVICE_NAME+"/biz/agreementTemplate/selectList",sysUserDto,RespJson.class);
        }catch (Exception e){
            log().error("/front/--三方协议模板查询异常"+e);
            e.printStackTrace();
            respJson = RespJsonFactory.buildFailure("三方协议模板查询异常");
        }
        return respJson;
    }

    @Override
    public
    RespJson insert(HttpServletRequest request, TripartiteagreementTemplateVO tripartiteagreementTemplateVO) {
        HttpSession session = request.getSession();
        RespJson respJson;
        try {
            SysUserDto sysUserDto = (SysUserDto)session.getAttribute(UserConstant.USER_SESSION);
            tripartiteagreementTemplateVO.setUserId(sysUserDto.getUserId());
            tripartiteagreementTemplateVO.setBankId(sysUserDto.getOrgId());
            respJson =  restTemplate.postForObject("http://"+ SysConstant.BIZ_SERVICE_NAME+"/biz/agreementTemplate/add",tripartiteagreementTemplateVO,RespJson.class);
        }catch (Exception e){
            log().error("/front/--三方协议模板新增异常"+e);
            e.printStackTrace();
            respJson = RespJsonFactory.buildFailure("三方协议模板新增异常");
        }
        return respJson;
    }

    @Override
    public
    RespJson select(HttpServletRequest request, TripartiteagreementTemplateVO tripartiteagreementTemplateVO) {
        HttpSession session = request.getSession();
        RespJson respJson;
        try {
            SysUserDto sysUserDto = (SysUserDto)session.getAttribute(UserConstant.USER_SESSION);
            tripartiteagreementTemplateVO.setUserId(sysUserDto.getUserId());
            respJson =  restTemplate.postForObject("http://"+ SysConstant.BIZ_SERVICE_NAME+"/biz/agreementTemplate/select",tripartiteagreementTemplateVO,RespJson.class);
        }catch (Exception e){
            log().error("/front/--三方协议模板查询异常"+e);
            e.printStackTrace();
            respJson = RespJsonFactory.buildFailure("三方协议模板查询异常");
        }
        return respJson;
    }
}
