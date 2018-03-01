package com.ceying.chx.biz.base.service.impl;

import com.ceying.chx.biz.base.service.SysUserService;
import com.ceying.chx.common.dao.SysTenantDao;
import com.ceying.chx.common.dao.SysUserDao;
import com.ceying.chx.common.dao.SysUserLoginDao;
import com.ceying.chx.common.dto.SysUserDto;
import com.ceying.chx.common.util.response.RespJson;
import com.ceying.chx.common.util.response.RespJsonFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: miaozhenqing
 * 开发时间: 2017/12/18<br>
 * <br>
 */
@Service
public class SysUserServiceImpl implements SysUserService {
    @Resource
    private SysUserDao sysUserDao;
    @Resource
    private SysTenantDao sysTenantDao;
    @Resource
    private SysUserLoginDao sysUserLoginDao;
    public
    RespJson list(Map<String, Object> params){
        List<SysUserDto> list = sysUserDao.list(params);
        int total = sysUserDao.countTotal(params);
        return RespJsonFactory.buildSuccess(list); // buildInfo(total,null,null,list);
    }
    public RespJson list(SysUserDto sysUserDto){
        List<SysUserDto> list = sysUserDao.list(sysUserDto);
        int total = sysUserDao.countTotal(sysUserDto);
        return RespJsonFactory.buildSuccess(list); //buildInfo(total,null,null,list);
    }


    @Override
    public RespJson queryPage(SysUserDto sysUserDto) throws Exception {
        RespJson respJson=new RespJson();
        List<SysUserDto> list = sysUserDao.list(sysUserDto);
        int total = sysUserDao.countTotal(sysUserDto);
        respJson.setData(list);
        respJson.setResult(total);
        return respJson;
    }
}
