package com.ceying.chx.common.dao;

import com.ceying.chx.common.entity.RoleUser;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 功能说明: 角色用户Dao层<br>
 * 系统版本: 1.0 <br>
 * 开发人员: dengqz
 * 开发时间: 2017/12/27<br>
 * <br>
 */
@Repository
public interface RoleUserDao extends CrudDao<RoleUser> {

    /**
     * 根据用户编码查询当前用户所持有的角色
     * @param userCode 用户编码
     * @return
     */
    List<RoleUser> selectByUserCode(String userCode);
}
