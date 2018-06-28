package com.ceying.chx.front.service;

import com.ceying.chx.common.dto.SysMenuDto;
import com.ceying.chx.common.util.response.RespJson;

/**
 * 功能说明: 系统菜单接口<br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/8 14:35<br>
 * <br>
 */
public interface SysMenuService {
    /**
     * 系统菜单方法
     * @param sysMenuDto 系统菜单dto
     * @return
     */
    public RespJson queryMenu(SysMenuDto sysMenuDto);
}
