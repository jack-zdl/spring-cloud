package com.ceying.chx.front.base.service;

import com.ceying.chx.common.util.response.RespJson;
import com.ceying.chx.common.vo.UserLoginVO;

import javax.servlet.http.HttpServletRequest;

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
     * @param request 获得请求信息
     * @param userLoginVO 用户vo类
     * @return RespJson
     */
    public RespJson login(HttpServletRequest request, UserLoginVO userLoginVO) throws Exception;
}
