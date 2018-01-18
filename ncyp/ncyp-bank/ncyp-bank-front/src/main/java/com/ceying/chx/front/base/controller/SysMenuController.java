package com.ceying.chx.front.base.controller;

import com.alibaba.fastjson.JSONObject;
import com.ceying.chx.common.constants.UserConstant;
import com.ceying.chx.common.dto.NavBarDto;
import com.ceying.chx.common.dto.SysMenuDto;
import com.ceying.chx.common.dto.SysUserLoginDto;
import com.ceying.chx.common.util.response.RespJson;
import com.ceying.chx.front.base.service.impl.SysMenuServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;


/**
 * 功能说明: 查询系统菜单<br>
 * 系统版本: 1.0 <br>
 * 开发人员: miaozhenqing
 * 开发时间: 2017/12/27<br>
 * <br>
 */
@RestController
@RequestMapping("/menu")
public class SysMenuController {
    @Autowired
    private SysMenuServiceImpl sysMenuServiceImpl;
    //查询系统菜单
    @RequestMapping(value = "/queryMenu",method= RequestMethod.POST)
    public JSONObject queryMenu(SysMenuDto sysMenuDto){
        RespJson respJson = sysMenuServiceImpl.queryMenu(sysMenuDto);
        JSONObject jsonObject=new JSONObject();
        jsonObject.put("menuList",(ArrayList<SysMenuDto>)respJson.getData());
        return jsonObject;
    }

    //查询系统菜单
    @RequestMapping(value = "/queryMenu",method= RequestMethod.GET)
    public JSONObject Menu(SysMenuDto sysMenuDto){
        RespJson respJson = sysMenuServiceImpl.queryMenu(sysMenuDto);
        JSONObject jsonObject=new JSONObject();
        jsonObject.put("menuList",(ArrayList<SysMenuDto>)respJson.getData());
        return jsonObject;
    }
    //查询导航栏菜单
    @RequestMapping(value = "/queryNavBar.do",method = RequestMethod.POST)
    public JSONObject queryNavBar(HttpServletRequest request, String menuCode) {
        HttpSession session = request.getSession();
        String userId = ((SysUserLoginDto)session.getAttribute(UserConstant.USER_LOGIN_SESSION)).getUserId();
        RespJson respJson = sysMenuServiceImpl.queryNavBar(menuCode,userId);
        JSONObject jsonObject=new JSONObject();
        jsonObject.put("data",(ArrayList<NavBarDto>)respJson.getData());
        return jsonObject;
    }
}
