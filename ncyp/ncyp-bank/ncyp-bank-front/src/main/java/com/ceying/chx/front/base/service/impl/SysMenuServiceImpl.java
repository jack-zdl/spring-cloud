package com.ceying.chx.front.base.service.impl;

import com.ceying.chx.common.dto.NavBarDto;
import com.ceying.chx.common.dto.SysMenuDto;
import com.ceying.chx.common.util.response.RespJson;
import com.ceying.chx.front.base.service.SysMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: miaozhenqing
 * 开发时间: 2017/12/27<br>
 * <br>
 */
@Service
public class SysMenuServiceImpl implements SysMenuService {
    @Autowired
    RestTemplate restTemplate;

    @Override
    public RespJson queryMenu(SysMenuDto sysMenuDto){
        RespJson respJson = restTemplate.postForObject("http://ncyp-bank-biz/biz/menu/queryMenu.do",sysMenuDto, RespJson.class);
//        String s =restTemplate.getForObject("http://ncyp-bank-biz/biz/menu/queryMenu.do",String.class);
        return respJson;
    }
    @Override
    public RespJson queryNavBar(String menuCode, String userId){
        NavBarDto navBarDto=new NavBarDto();
        navBarDto.setMenuCode(menuCode);
        navBarDto.setUserId(userId);
        RespJson respJson =  restTemplate.postForObject("http://ncyp-bank-biz/NavBarController/queryNavBar.do",navBarDto,RespJson.class);
        return respJson;
    }
}
