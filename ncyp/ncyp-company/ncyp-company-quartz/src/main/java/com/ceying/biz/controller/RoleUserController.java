package com.ceying.biz.controller;

import com.ceying.biz.service.RoleUserService;
import com.ceying.chx.common.entity.RoleUser;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: dengqz
 * 开发时间: 2017/12/27<br>
 * <br>
 */
@RestController
@RequestMapping("RoleUserController")
public class RoleUserController {
    @Resource
    private RoleUserService roleUserServiceImpl;
    @RequestMapping("/selectRoleByUserCode")
    public String selectRoleByUserCode(HttpServletRequest request, String UserID){
        RoleUser roleUser = roleUserServiceImpl.selectByUserCode(UserID);
        return null;
    }

}
