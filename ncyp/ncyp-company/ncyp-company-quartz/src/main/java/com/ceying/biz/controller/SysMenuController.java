package com.ceying.biz.controller;

import com.ceying.biz.service.SysMenuService;
import com.ceying.chx.common.dto.SysMenuDto;
import com.ceying.chx.common.util.response.RespJson;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 功能说明: 查询系统菜单<br>
 * 系统版本: 1.0 <br>
 * 开发人员: miaozhenqing
 * 开发时间: 2017/12/27<br>
 * <br>
 */
@RestController
@RequestMapping("/biz/menu")
public class SysMenuController {
    @Resource
    private SysMenuService SysMenuServiceImpl;
    @RequestMapping(value="/queryMenu",method = RequestMethod.POST)
    public
    RespJson queryMenu(HttpServletRequest request, @RequestBody SysMenuDto sysMenuDto){
        RespJson respJson = SysMenuServiceImpl.queryMenu(sysMenuDto);
        return respJson;
    }
}
