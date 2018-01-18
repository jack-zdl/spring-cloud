package com.ceying.chx.biz.base.controller;

import com.ceying.chx.biz.base.service.impl.NavBarServiceImpl;
import com.ceying.chx.common.dto.NavBarDto;
import com.ceying.chx.common.util.response.RespJson;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: dengqz
 * 开发时间: 2018/1/5<br>
 * <br>
 */
@RestController
@RequestMapping("/NavBarController")
public class NavBarController {
    @Resource
    private NavBarServiceImpl navBarService;

    @SuppressWarnings("unchecked")
    @RequestMapping("/queryNavBar")
    public RespJson queryMenu(HttpServletRequest request,@RequestBody NavBarDto navBarDto){
        String menuCode=navBarDto.getMenuCode();
        String userId=navBarDto.getUserId();
        RespJson respJson = navBarService.queryNavBar(menuCode,userId);
        return respJson;
    }
}
