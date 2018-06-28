package com.ceying.chx.front.controller;

import com.ceying.chx.common.util.response.RespJson;
import com.ceying.chx.common.util.response.RespJsonFactory;
import com.ceying.chx.common.vo.UserLoginVO;
import com.ceying.chx.front.service.SysLoginService;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import javax.annotation.Resource;
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
    public RespJson login(@Valid @RequestBody UserLoginVO userLoginVO , Errors errors){
        if (errors.hasErrors()) {
            return RespJsonFactory.buildFailure("输入参数有误！");
        }
        RespJson str = sysLoginService.login(userLoginVO.getUserName(),userLoginVO.getUserPwd());
        return str;
    }
}
