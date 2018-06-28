package com.ceying.biz.service;


import com.ceying.chx.common.dto.SysParameterDto;

/**
 * Created by mzq on 2017/12/21.
 */
public interface SysParamterService {
    SysParameterDto getCacheInfo(int tenantId, String paramCode, String orgId) throws Exception;
    //SysUserLoginDto selectByPrimaryKey(String userId, Integer tenantId)throws Exception;
}
