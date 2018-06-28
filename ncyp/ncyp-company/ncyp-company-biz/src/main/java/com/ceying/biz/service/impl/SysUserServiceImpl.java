package com.ceying.biz.service.impl;

import com.ceying.biz.service.SysUserService;
import com.ceying.chx.common.dao.SysTenantDao;
import com.ceying.chx.common.dao.SysUserDao;
import com.ceying.chx.common.dao.SysUserLoginDao;
import com.ceying.chx.common.dto.SysUserDto;
import com.ceying.chx.common.util.response.RespJson;
import com.ceying.chx.common.util.response.RespJsonFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: miaozhenqing
 * 开发时间: 2017/12/18<br>
 * <br>
 */
@Service
public class SysUserServiceImpl implements SysUserService {

    @Override
    public RespJson list(Map<String, Object> params){
        return null;
    }

    @Override
    public RespJson list(SysUserDto sysUserDto){
        return null;
    }


    @Override
    public RespJson queryPage(SysUserDto sysUserDto) throws Exception {
        return null;
    }
}
