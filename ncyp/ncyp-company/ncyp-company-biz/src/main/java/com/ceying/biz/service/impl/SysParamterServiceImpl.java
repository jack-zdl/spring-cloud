package com.ceying.biz.service.impl;

import com.ceying.biz.service.SysParamterService;
import com.ceying.chx.common.dao.SysParamterDao;
import com.ceying.chx.common.dto.DictionaryBean;
import com.ceying.chx.common.dto.Parameter;
import com.ceying.chx.common.dto.SysParameterDto;
import org.apache.commons.lang.StringUtils;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: miaozhenqing
 * 开发时间: 2017/12/21<br>
 * <br>
 */
@Service
public class SysParamterServiceImpl implements SysParamterService {

    @Override
    public
    SysParameterDto getCacheInfo(int tenantId, String paramCode, String orgId){
        return null;
    }
}
