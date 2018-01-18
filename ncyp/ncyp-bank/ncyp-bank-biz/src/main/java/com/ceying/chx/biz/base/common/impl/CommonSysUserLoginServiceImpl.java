package com.ceying.chx.biz.base.common.impl;

import com.ceying.chx.biz.base.common.CommonSysUserLoginService;
import com.ceying.chx.common.dao.SysUserLoginDao;
import com.ceying.chx.common.dto.SysUserLoginDto;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 功能说明: 基础系统登录用户方法实现类<br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/11 22:18<br>
 */
@Service
public class CommonSysUserLoginServiceImpl implements CommonSysUserLoginService {

    @Resource
    private SysUserLoginDao sysUserLoginDao;

    @Override
    public
    List<SysUserLoginDto> list() {
        return null;
    }

    @Override
    public
    List<SysUserLoginDto> list(SysUserLoginDto param) {
        return null;
    }

    @Override
    public SysUserLoginDto get(String id) {
        SysUserLoginDto sysUserLoginDto =  sysUserLoginDao.get(id);
        return sysUserLoginDto;
    }

    @Override
    public
    int update(SysUserLoginDto entity) {
        return 0;
    }

    @Override
    public
    int remove(String id) {
        return 0;
    }

    @Override
    public
    int insert(SysUserLoginDto entity) {
        return 0;
    }
}
