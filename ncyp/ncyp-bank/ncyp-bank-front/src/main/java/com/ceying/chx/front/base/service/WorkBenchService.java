package com.ceying.chx.front.base.service;

import com.ceying.chx.common.dto.SysMenuDto;
import com.ceying.chx.common.dto.SysUserDto;
import com.ceying.chx.common.dto.TripartiteagreementTemplateDto;
import com.ceying.chx.common.util.response.RespJson;

/**
 * 功能说明:工作台接口 <br>
 * 系统版本: 2.0 <br>
 * 开发人员: huanghaiyun
 * 开发时间: 2018/1/9<br>
 * <br>
 */
public interface WorkBenchService {

    /**
     *
     * @param dto
     * @return
     */
    public RespJson agreementTempTodo(TripartiteagreementTemplateDto dto);

    /**
     *
     * @param sysMenuDto
     * @return
     */
    public RespJson queryUserMenuWithParentCode(SysMenuDto sysMenuDto);
}
