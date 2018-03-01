package com.ceying.chx.biz.base.service;


import com.ceying.chx.common.entity.OrganizationEntity;
import com.ceying.chx.common.util.response.RespJson;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: dengqz
 * 开发时间: 2017/12/27<br>
 * <br>
 */
public interface OrganizationService {

    /**
     * 根据用户ID查询用户的组织信息
     * @param UserId
     * @return
     * @throws Exception
     */
    OrganizationEntity selectByUserId(String UserId) throws Exception;

    /**
     * 根据用户id查询所有与之相关的组织
     * @return
     */
    RespJson selectOrgListByUser(String UserId) throws Exception;
}
