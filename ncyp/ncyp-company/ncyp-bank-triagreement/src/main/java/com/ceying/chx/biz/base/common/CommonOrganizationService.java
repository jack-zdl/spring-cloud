package com.ceying.chx.biz.base.common;

import com.ceying.chx.common.dto.organization.OrganizationDto;
import com.ceying.chx.common.entity.OrganizationEntity;
import com.ceying.chx.common.entity.triagreementtemp.TripartiteagreementTemplateEntity;
import com.ceying.chx.common.service.CurdService;

import java.util.List;

/**
 * 功能说明: 组织查询<br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/15 16:16<br>
 */

public interface CommonOrganizationService extends CurdService<OrganizationEntity> {

    /**
     * 根据组织id查询与之相关的组织
     * @param orgId
     * @return list
     */
    public List<OrganizationDto> selectListByOrgId(String orgId);
}
