package com.ceying.chx.front.base.service;

import com.ceying.chx.common.util.response.RespJson;

import javax.servlet.http.HttpServletRequest;

/**
 * 功能说明: 组织相关的接口<br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/15 15:24<br>
 */
public interface OrganizationService {

    /**
     * 根据当前用户查询相关组织
     * @return
     */
    public RespJson selectOrgListById(HttpServletRequest request);
}
