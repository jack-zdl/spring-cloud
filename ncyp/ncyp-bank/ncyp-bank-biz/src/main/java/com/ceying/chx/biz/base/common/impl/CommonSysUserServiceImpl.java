package com.ceying.chx.biz.base.common.impl;

import com.ceying.chx.biz.base.common.CommonSysUserLoginService;
import com.ceying.chx.biz.base.common.CommonSysUserService;
import com.ceying.chx.common.dao.SysUserDao;
import com.ceying.chx.common.dto.SysUserDto;
import com.ceying.chx.common.dto.SysUserDto;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 功能说明: 基础系统用户方法实现类<br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/14 16:49<br>
 */
@Service
public class CommonSysUserServiceImpl  implements CommonSysUserService{

    @Resource
    private
    SysUserDao sysUserDao;

    @Override
    public
    List<SysUserDto> list() {
        return null;
    }

    @Override
    public
    List<SysUserDto> list(SysUserDto param) {
        return null;
    }

    @Override
    public
    SysUserDto get(String id) {
        SysUserDto sysUserDto = sysUserDao.get(id);
        return sysUserDto;
    }

    @Override
    public
    int update(SysUserDto entity) {
        return 0;
    }

    @Override
    public
    int remove(String id) {
        return 0;
    }

    @Override
    public
    int insert(SysUserDto entity) {
        return 0;
    }
}
