package com.ceying.biz.service.impl;

import com.ceying.biz.service.RoleUserService;
import com.ceying.chx.common.dao.RoleUserDao;
import com.ceying.chx.common.dao.SysUserDao;
import com.ceying.chx.common.entity.RoleUser;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: dengqz
 * 开发时间: 2017/12/27<br>
 * <br>
 */
@Service
public class RoleUserServiceImpl implements RoleUserService {

    @Override
    public
    RoleUser selectByUserCode(String userCode) {
        return null;
    }
}
