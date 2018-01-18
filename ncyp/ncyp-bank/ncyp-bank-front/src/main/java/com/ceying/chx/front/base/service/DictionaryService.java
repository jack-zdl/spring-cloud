package com.ceying.chx.front.base.service;

import com.ceying.chx.common.util.response.RespJson;

import javax.servlet.http.HttpServletRequest;
import javax.validation.constraints.NotNull;

/**
 * 功能说明: <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/15 23:34<br>
 */
public interface DictionaryService {

    /**
     * 根据系统参数来查询字典参数
     * @param request
     * @param keyno
     * @return
     */
    public RespJson selectParam(HttpServletRequest request, Integer keyno);
}
