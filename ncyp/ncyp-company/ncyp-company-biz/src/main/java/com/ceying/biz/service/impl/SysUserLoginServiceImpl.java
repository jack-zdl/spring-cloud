package com.ceying.biz.service.impl;

import com.ceying.biz.service.SysUserLoginService;
import com.ceying.chx.common.dao.SysTenantDao;
import com.ceying.chx.common.dao.SysUserDao;
import com.ceying.chx.common.dao.SysUserLoginDao;
import com.ceying.chx.common.dto.SysTenantDto;
import com.ceying.chx.common.dto.SysUserDto;
import com.ceying.chx.common.dto.SysUserLoginDto;
import com.ceying.chx.common.enums.EnumMsgCode;
import com.ceying.chx.common.enums.EnumUserStatus;
import com.ceying.chx.common.util.Encryption.EncryptUtils;
import com.ceying.chx.common.util.response.RespJson;
import com.ceying.chx.common.util.response.RespJsonFactory;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: miaozhenqing
 * 开发时间: 2017/12/21<br>
 * <br>
 */
@Service
public class SysUserLoginServiceImpl implements SysUserLoginService {

    //用户登录逻辑校验
    @Override
    public
    RespJson userLogin(SysUserDto sysuserdto) {
        return null;
    }

    /**
     *  执行用户登录
     * @param sysuserdto
     * @return
     */
    private RespJson executeUserLogin(SysUserDto sysuserdto) {
        return null;
    }

    @Override
    public SysUserLoginDto selectByPrimaryKey(String userId, Integer tenantId) throws Exception {
       return null;
    }
}
