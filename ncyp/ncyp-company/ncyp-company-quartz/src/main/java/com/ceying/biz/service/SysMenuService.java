package com.ceying.biz.service;


import com.ceying.chx.common.dto.SysMenuDto;
import com.ceying.chx.common.util.response.RespJson;

/**
 * Created by mzq on 2017/12/27.
 */
public interface SysMenuService {
    RespJson queryMenu(SysMenuDto sysMenuDto);
}
