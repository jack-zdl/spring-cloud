package com.ceying.biz.service;



import com.ceying.chx.common.dto.SysUserDto;
import com.ceying.chx.common.util.response.RespJson;

import java.util.Map;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: miaozhenqing
 * 开发时间: 2017/12/18<br>
 * <br>
 */
public interface SysUserService{
    RespJson list(Map<String, Object> params);
    RespJson list(SysUserDto sysUserDto);

    RespJson queryPage(SysUserDto sysUser)throws Exception;


}
