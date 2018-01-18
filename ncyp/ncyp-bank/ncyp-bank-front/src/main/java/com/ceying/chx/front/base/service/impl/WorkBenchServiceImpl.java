package com.ceying.chx.front.base.service.impl;

import com.ceying.chx.common.dto.SysMenuDto;
import com.ceying.chx.common.dto.SysUserDto;
import com.ceying.chx.common.dto.TripartiteagreementTemplateDto;
import com.ceying.chx.common.util.response.RespJson;
import com.ceying.chx.front.base.service.WorkBenchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

/**
 * 功能说明: <br>
 * 系统版本: 2.0 <br>
 * 开发人员: huanghaiyun
 * 开发时间: 2018/1/9<br>
 * <br>
 */
@Service
public class WorkBenchServiceImpl implements WorkBenchService {
    @Autowired
    RestTemplate restTemplate;
    @Override
    public RespJson agreementTempTodo(TripartiteagreementTemplateDto dto) {
        RespJson respJson = restTemplate.postForObject("http://ncyp-bank-biz/biz/workbench/agreementTempTodo.do",dto, RespJson.class);
        return respJson;
    }

    @Override
    public RespJson queryUserMenuWithParentCode(SysMenuDto sysMenuDto) {
        RespJson respJson = restTemplate.postForObject("http://ncyp-bank-biz/biz/workbench/queryUserMenu.do",sysMenuDto, RespJson.class);
        return respJson;
    }
}
