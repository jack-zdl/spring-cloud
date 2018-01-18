package com.ceying.chx.biz.base.service.impl;

import com.ceying.chx.biz.base.service.OrganizationService;

import com.ceying.chx.common.dao.OrganizationDao;
import com.ceying.chx.common.dao.SysUserDao;
import com.ceying.chx.common.dto.SysUserDto;
import com.ceying.chx.common.entity.OrganizationEntity;
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
public class OrganizationServiceImpl implements OrganizationService {

    @Resource
    private OrganizationDao organizationDao;
    @Resource
    private SysUserDao sysUserDao;

    /**
     * 根据用户ID查询用户的组织信息
     * @param UserId
     * @return
     * @throws Exception
     */
    @Override
    public
    OrganizationEntity selectByUserId(String UserId) throws Exception{
        SysUserDto sysUserDto=sysUserDao.selectByPrimaryKey(UserId);
        OrganizationEntity organizationEntity =organizationDao.selectByPrimaryKey(sysUserDto.getOrgId());
        return organizationEntity;
    }
}
