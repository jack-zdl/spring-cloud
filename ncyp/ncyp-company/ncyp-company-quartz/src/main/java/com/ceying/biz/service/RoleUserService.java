package com.ceying.biz.service;


import com.ceying.chx.common.entity.RoleUser;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: dengqz
 * 开发时间: 2017/12/27<br>
 * <br>
 */
public interface RoleUserService {
    RoleUser selectByUserCode(String userCode);
}
