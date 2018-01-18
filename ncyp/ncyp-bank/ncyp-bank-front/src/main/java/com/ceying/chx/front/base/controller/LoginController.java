package com.ceying.chx.front.base.controller;

import com.ceying.chx.common.constants.UserConstant;
import com.ceying.chx.common.dto.SysUserLoginDto;
import com.ceying.chx.common.util.response.RespJson;
import com.ceying.chx.common.util.response.RespJsonFactory;
import com.ceying.chx.common.vo.UserLoginVO;
import com.ceying.chx.front.base.service.SysLoginService;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: miaozhenqing
 * 开发时间: 2017/12/22<br>
 * <br>
 */
@RestController
@RequestMapping("/user")
public class LoginController {
    @Resource
    private SysLoginService sysLoginService;

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public RespJson login(HttpServletRequest request,@Valid @RequestBody UserLoginVO userLoginVO , Errors errors) throws Exception {
        if (errors.hasErrors()) {
            return RespJsonFactory.buildFailure("输入参数有误！");
        }
        RespJson respJson = sysLoginService.login(request,userLoginVO);
        return respJson;
    }

    @GetMapping(value = "/check")
    public RespJson check(HttpServletRequest request) throws Exception {
        RespJson respJson = null;
        try {
            HttpSession session = request.getSession();
            String userId = ((SysUserLoginDto)session.getAttribute(UserConstant.USER_LOGIN_SESSION)).getUserId();
            respJson = RespJsonFactory.buildSuccess("已经登录！");
        }catch (Exception e){
            e.printStackTrace();
            respJson = RespJsonFactory.buildNotLogin();
        }
        return respJson;
    }
}
