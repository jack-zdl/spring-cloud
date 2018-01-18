package com.ceying.chx.biz.base.service;

import com.ceying.chx.common.util.response.RespJson;

/**
 * 功能说明: 获取组织信息<br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2017/12/27 9:45<br>
 * <br>
 */
public interface OrgService {

    /**
     * 根据用户ID查询当前组织信息
     * @param userId 用户ID
     * @return
     */
    public RespJson getOrgByUserId(String userId);
}
