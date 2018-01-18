package com.ceying.chx.biz.base.common.impl;

import com.ceying.chx.biz.base.common.CommonOrganizationService;
import com.ceying.chx.common.dao.OrganizationDao;
import com.ceying.chx.common.dto.organization.OrganizationDto;
import com.ceying.chx.common.entity.OrganizationEntity;
import com.ceying.chx.common.entity.triagreementtemp.TripartiteagreementTemplateEntity;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 功能说明:基础组织查询 <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/15 16:19<br>
 */
@Service
public class CommonOrganizationServiceImpl implements CommonOrganizationService{

    @Resource
    private OrganizationDao organizationDao;

    @Override
    public List<OrganizationEntity> list() {
        return null;
    }

    @Override
    public
    List<OrganizationEntity> list(OrganizationEntity param) {
        return null;
    }

    @Override
    public
    OrganizationEntity get(String id) {
        return null;
    }

    @Override
    public
    int update(OrganizationEntity entity) {
        return 0;
    }

    @Override
    public
    int remove(String id) {
        return 0;
    }

    @Override
    public
    int insert(OrganizationEntity entity) {
        return 0;
    }

    @Override
    public
    List<OrganizationDto> selectListByOrgId(String orgId) {
        List<OrganizationDto> list = organizationDao.selectOrgListByOrgId(orgId);
        return list;
    }
}
