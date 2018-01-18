package com.ceying.chx.common.dao;

import com.ceying.chx.common.dto.SysUserDto;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.annotations.Param;
import java.util.List;
import java.util.Map;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: miaozhenqing
 * 开发时间: 2017/12/18<br>
 * <br>
 */
@Repository
public interface SysUserDao extends CrudDao<SysUserDto> {
    List<SysUserDto> list(SysUserDto sysRoleDto);
    int countTotal(Map<String, Object> params);
    int countTotal(SysUserDto sysRoleDto);
    SysUserDto selectByPrimaryKey(@Param(value="userId")String userId, @Param(value="tenantId")int tenantId)throws Exception;
    SysUserDto selectByPrimaryKey(@Param(value="userId")String userId)throws Exception;

    int deleteByPrimaryKey(@Param(value="userId")String userId,@Param(value="tenantId")int tenantId) throws Exception;
    int deleteByPrimaryKey(@Param(value="userId")String userId) throws Exception;

    int insert(SysUserDto sysuserdto)throws Exception;

    int updateByPrimaryKeySelective(SysUserDto sysuserdto)throws Exception;

    List<SysUserDto> queryAll(SysUserDto sysuserdto) throws Exception;



    int countOrgAllocate(SysUserDto sysUser) throws Exception;


    int countRoleAllocate(SysUserDto sysUser) throws Exception;

    int countByMobile(@Param(value="userId")String userId, @Param(value="mobile")String mobile) throws Exception;

    /**
     * 查询用户对应的角色
     * @param userId
     * @return
     * @throws Exception
     */
    List<SysUserDto> queryUserRole(@Param(value="userId")String userId,@Param(value="roleCode")String roleCode) throws Exception;
}
