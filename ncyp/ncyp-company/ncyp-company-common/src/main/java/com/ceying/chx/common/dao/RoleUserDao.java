package com.ceying.chx.common.dao;

import com.ceying.chx.common.entity.RoleUser;
import org.springframework.stereotype.Repository;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: dengqz
 * 开发时间: 2017/12/27<br>
 * <br>
 */
@Repository
public interface RoleUserDao extends CrudDao<RoleUser> {
    RoleUser selectByUserCode(String userCode);
}
