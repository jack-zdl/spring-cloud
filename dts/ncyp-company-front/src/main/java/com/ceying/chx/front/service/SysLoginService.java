package com.ceying.chx.front.service;

import com.ceying.chx.common.util.response.RespJson;

/**
 * 功能说明: 系统登录接口<br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/8 14:25<br>
 * <br>
 */
public
interface SysLoginService {

    /**
     * 登录方法
     * @param userName 用户名称
     * @param userPwd 用户密码
     * @return RespJson
     */
    public RespJson login( String userName, String userPwd);
}
