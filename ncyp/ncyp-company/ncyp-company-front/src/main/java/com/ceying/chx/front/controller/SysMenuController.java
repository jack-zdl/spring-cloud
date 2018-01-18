package com.ceying.chx.front.controller;

import com.alibaba.fastjson.JSONObject;
import com.ceying.chx.common.dto.SysMenuDto;
import com.ceying.chx.common.util.response.RespJson;
import com.ceying.chx.front.service.impl.SysMenuServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

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
}
