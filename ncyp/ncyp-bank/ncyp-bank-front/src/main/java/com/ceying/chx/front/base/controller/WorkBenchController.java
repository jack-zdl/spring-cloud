package com.ceying.chx.front.base.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ceying.chx.common.dto.SysMenuDto;
import com.ceying.chx.common.dto.TripartiteagreementTemplateDto;
import com.ceying.chx.common.util.response.RespJson;
import com.ceying.chx.front.base.service.SysMenuService;
import com.ceying.chx.front.base.service.WorkBenchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * 功能说明: 工作台<br>
 * 系统版本: 2.0 <br>
 * 开发人员: huanghaiyun
 * 开发时间: 2018/01/09<br>
 * <br>
 */
@RestController
@RequestMapping("/workbench")
public class WorkBenchController {

    @Autowired
    private WorkBenchService workBenchService;
    @ResponseBody
    @RequestMapping("/agreementTempTodo.do")
    public String agreementTempTodo(TripartiteagreementTemplateDto dto){
        RespJson respJson=workBenchService.agreementTempTodo(dto);
        return JSONObject.toJSONString(respJson.getData());
    }

    //查询系统菜单
    @RequestMapping(value = "/queryUserMenu",method= RequestMethod.POST)
    public RespJson queryUserMenu(String parentCode,String userId){
        SysMenuDto sysMenuDto=new SysMenuDto();
        sysMenuDto.setParentCode(parentCode);
        sysMenuDto.setUserId(userId);
        RespJson respJson = workBenchService.queryUserMenuWithParentCode(sysMenuDto);
        return respJson;
    }
}
