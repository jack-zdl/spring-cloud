package com.ceying.chx.common.dao;

import com.ceying.chx.common.dto.SysUserLoginDto;
import com.ceying.chx.common.entity.LoginUserEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by mzq on 2017/12/21.
 */
@Repository
public interface SysUserLoginDao extends CrudDao<SysUserLoginDto>{

    SysUserLoginDto selectByPrimaryKey(@Param(value="userId")String userId, @Param(value="tenantId")int tenantId)throws Exception;

    int deleteByPrimaryKey(@Param(value="userId")String userId,@Param(value="tenantId")int tenantId) throws Exception;

    int insert(SysUserLoginDto sysUserLoginDto)throws Exception;

    int updateByPrimaryKeySelective(SysUserLoginDto sysUserLoginDto)throws Exception;

    List<SysUserLoginDto> queryAll(SysUserLoginDto sysUserLoginDto) throws Exception;

    int countTotal(SysUserLoginDto sysUserLoginDto) throws Exception;
}
