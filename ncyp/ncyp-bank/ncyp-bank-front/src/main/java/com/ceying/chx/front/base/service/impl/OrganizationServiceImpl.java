package com.ceying.chx.front.base.service.impl;

import com.ceying.chx.common.constants.UserConstant;
import com.ceying.chx.common.dto.SysUserLoginDto;
import com.ceying.chx.common.util.response.RespJson;
import com.ceying.chx.front.base.config.SysConstant;
import com.ceying.chx.front.base.service.OrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * 功能说明: <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/15 15:28<br>
 */

@Service
public class OrganizationServiceImpl implements OrganizationService{

    @Autowired
    RestTemplate restTemplate;

    @Override
    public
    RespJson selectOrgListById(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String userId = ((SysUserLoginDto)session.getAttribute(UserConstant.USER_LOGIN_SESSION)).getUserId();
        Map<String,Object> hashMap  = new HashMap<String,Object>();
        hashMap.put("userId",userId);
        RespJson respJson = restTemplate.getForObject("http://"+ SysConstant.BIZ_SERVICE_NAME+"/biz/OrganizationController/selectOrgList?userId={userId}", RespJson.class,hashMap);
        return respJson;
    }
}
