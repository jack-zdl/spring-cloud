package com.ceying.biz.service;


import com.ceying.chx.common.dto.SysUserDto;
import com.ceying.chx.common.dto.SysUserLoginDto;
import com.ceying.chx.common.util.response.RespJson;

/**
 * Created by mzq on 2017/12/21.
 */
public interface SysUserLoginService {
    RespJson userLogin(SysUserDto sysuserdto);
    SysUserLoginDto selectByPrimaryKey(String userId, Integer tenantId)throws Exception;
}
