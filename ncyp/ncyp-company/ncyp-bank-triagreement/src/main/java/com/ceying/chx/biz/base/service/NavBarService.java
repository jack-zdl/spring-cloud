package com.ceying.chx.biz.base.service;

import com.ceying.chx.common.util.response.RespJson;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: dengqz
 * 开发时间: 2018/1/5<br>
 * <br>
 */
public interface NavBarService {
    RespJson queryNavBar(String menuCode, String userId);
}
