package com.ceying.biz.controller;

import com.ceying.biz.service.OrganizationService;
import com.ceying.chx.common.entity.OrganizationEntity;
import org.springframework.beans.factory.annotation.Autowired;
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
@RequestMapping("/OrganizationController")
public class OrganizationController {
    @Autowired
    private OrganizationService organizationServiceImpl;
    @RequestMapping("/selectOrganizationByUserID")
    public String selectOrganizationByUserID(HttpServletRequest request,String UserID) throws Exception{
        OrganizationEntity organizationEntity = organizationServiceImpl.selectByUserId(UserID);
        return null;
    }

}
