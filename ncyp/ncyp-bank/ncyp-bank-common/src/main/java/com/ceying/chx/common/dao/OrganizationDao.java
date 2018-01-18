package com.ceying.chx.common.dao;

import com.ceying.chx.common.dto.organization.OrganizationDto;
import com.ceying.chx.common.entity.OrganizationEntity;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 功能说明: 组织dao层<br>
 * 系统版本: 1.0 <br>
 * 开发人员: dengqz
 * 开发时间: 2017/12/27<br>
 * <br>
 */
@Repository
public interface OrganizationDao extends CrudDao<OrganizationEntity> {

    /**
     * 根据组织ID查询当前组织
     * @param orgId 组织ID
     * @return
     */
    OrganizationEntity selectByPrimaryKey(String orgId);

    /**
     * 通过自身组织id查询与之相关的组织
     * @param orgId
     * @return
     */
    List<OrganizationDto> selectOrgListByOrgId(String orgId);
}
