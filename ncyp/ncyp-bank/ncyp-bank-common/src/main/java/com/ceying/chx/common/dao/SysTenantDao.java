package com.ceying.chx.common.dao;

import com.ceying.chx.common.dto.SysTenantDto;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by mzq on 2017/12/21.
 */
@Repository
public interface SysTenantDao {
    SysTenantDto selectByPrimaryKey(@Param(value="tenantId")Integer tenantId)throws Exception;

    int deleteByPrimaryKey(@Param(value="tenantId")Integer tenantId) throws Exception;

    int insert(SysTenantDto sysTenantDto)throws Exception;

    int updateByPrimaryKeySelective(SysTenantDto sysTenantDto)throws Exception;

    List<SysTenantDto> queryAll(SysTenantDto sysTenantDto) throws Exception;

    int countTotal(SysTenantDto sysTenantDto) throws Exception;

    int getNextSequenct() throws Exception;
}
