package com.ceying.chx.biz.base.controller;

import com.alibaba.fastjson.JSONObject;
import com.ceying.chx.biz.base.service.OrganizationService;
import com.ceying.chx.common.entity.OrganizationEntity;
import com.ceying.chx.common.util.response.RespJson;
import com.ceying.chx.common.util.response.RespJsonFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: dengqz
 * 开发时间: 2017/12/27<br>
 * <br>
 */
@RestController
@RequestMapping("/biz/OrganizationController")
public class OrganizationController {

    @Autowired
    private OrganizationService organizationServiceImpl;

    @RequestMapping("/selectOrganizationByUserID")
    @Deprecated
    public String selectOrganizationByUserID(HttpServletRequest request,String UserID) throws Exception{
        OrganizationEntity organizationEntity = organizationServiceImpl.selectByUserId(UserID);
        return null;
    }

    /**
     * 根据当前用户查询相关联的组织
     * @param request
     * @param userId
     * @return RespJson
     * @throws Exception
     */
    @GetMapping(value = "/selectOrgList")
    public RespJson selectOrgListBuUserId(HttpServletRequest request,String userId) throws Exception {
        RespJson respJson;
        try {
            respJson = organizationServiceImpl.selectOrgListByUser(userId);
        }catch (Exception e){
            e.printStackTrace();
            respJson = RespJsonFactory.buildFailure("查询相关联的组织异常");
        }
        return respJson;
    }


}
