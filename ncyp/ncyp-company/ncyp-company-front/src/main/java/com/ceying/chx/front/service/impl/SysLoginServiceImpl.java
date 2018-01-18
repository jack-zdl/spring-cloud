package com.ceying.chx.front.service.impl;

import com.ceying.chx.common.dto.SysUserDto;
import com.ceying.chx.common.util.response.RespJson;
import com.ceying.chx.front.service.SysLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

/**
 * Created by mzq on 2017/12/22.
 */
@Service
public class SysLoginServiceImpl implements SysLoginService{

    @Autowired
    RestTemplate restTemplate;
    //登录
    public RespJson login(String userName, String userPwd){
        SysUserDto sysUserDto=new SysUserDto();
        sysUserDto.setUserName(userName);
        sysUserDto.setUserPwd(userPwd);
        RespJson respJson =  restTemplate.postForObject("http://ncyp-bank-biz/biz/user/login",sysUserDto,RespJson.class);
        return respJson;
    }
}
