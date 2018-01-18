package com.ceying.chx.biz.base.service.impl;

import com.ceying.chx.biz.base.service.SysUserLoginService;
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
    @Resource
    private SysUserDao sysUserDao;
    @Resource
    private SysTenantDao sysTenantDao;
    @Resource
    private SysUserLoginDao sysUserLoginDao;
    @Autowired
    private TransactionTemplate transactionTemplate;
    //用户登录逻辑校验
    @Override
    public
    RespJson userLogin(SysUserDto sysuserdto) {
        //事物控制
        RespJson respJson = transactionTemplate.execute(new TransactionCallback<RespJson>() {
            public RespJson doInTransaction(TransactionStatus transactionStatus) {
                RespJson msgobject = executeUserLogin(sysuserdto);
                if (StringUtils.equals(msgobject.getResult()+"", EnumMsgCode.Fail.getValue())) {
                    transactionStatus.setRollbackOnly();
                }
                return msgobject;
            }
        });
        return respJson;
    }

    /**
     *  执行用户登录
     * @param sysuserdto
     * @return
     */
    private RespJson executeUserLogin(SysUserDto sysuserdto) {
        RespJson msgobject = new RespJson();
        msgobject.setMsg("操作失败！");
        msgobject.setResult(Integer.parseInt(EnumMsgCode.Fail.getValue()));
        try {

            //用户名校验
            String username = sysuserdto.getUserName();
            String userpsd = sysuserdto.getUserPwd();
            if(StringUtils.isBlank(username)){
                msgobject.setMsg("用户名不能为空！");
                msgobject.setResult(Integer.parseInt(EnumMsgCode.Middle.getValue()));
                return msgobject;
            }
            if(StringUtils.isBlank(userpsd)){
                msgobject.setMsg("密码不能为空！");
                msgobject.setResult(Integer.parseInt(EnumMsgCode.Middle.getValue()));
                return msgobject;
            }
            sysuserdto.setUserPwd(EncryptUtils.encryptString("MD5", sysuserdto.getUserName()+sysuserdto.getUserPwd()));
            sysuserdto.setUserId(username);
            sysuserdto.setUserName("");
            List<SysUserDto> userlist  = sysUserDao.list(sysuserdto);

            sysuserdto.setUserPwd("");
            List<SysUserDto> userexitlist  = sysUserDao.list(sysuserdto);

            //用户是否存在
            if(userexitlist.size()==0){
                msgobject.setMsg("用户不存在！");
                msgobject.setResult(Integer.parseInt(EnumMsgCode.Middle.getValue()));
                return msgobject;
            }
            //用户是否被锁定
            if(StringUtils.equals(userexitlist.get(0).getUserStatus(), EnumUserStatus.Disable.getValue())){
                msgobject.setMsg("密码输入错误次数超过5次，用户被禁用，请联系管理员！");
                msgobject.setResult(Integer.parseInt(EnumMsgCode.Middle.getValue()));
                return msgobject;
            }
            if(StringUtils.equals(userexitlist.get(0).getUserStatus(), EnumUserStatus.Cancellation.getValue())){
                msgobject.setMsg("用户已被注销，请联系管理员！");
                msgobject.setResult(Integer.parseInt(EnumMsgCode.Middle.getValue()));
                return msgobject;
            }

            //登录记录
            SysUserLoginDto updatelogin = new SysUserLoginDto();
            updatelogin = sysUserLoginDao.selectByPrimaryKey(userexitlist.get(0).getUserId(), userexitlist.get(0).getTenantId());

            if(updatelogin==null){
                //查询租户
                int tenantId = userexitlist.get(0).getTenantId();
                SysTenantDto systenantdto = sysTenantDao.selectByPrimaryKey(tenantId);
                if(systenantdto==null){
                    msgobject.setMsg("获取租户信息失败！");
                    msgobject.setResult(Integer.parseInt(EnumMsgCode.Middle.getValue()));
                    return msgobject;
                }

                SysUserLoginDto  savelogin = new SysUserLoginDto();
                savelogin.setUserId(userexitlist.get(0).getUserId());
                savelogin.setTenantId(tenantId);
                savelogin.setOrgId(userexitlist.get(0).getOrgId());
                savelogin.setUserName(userexitlist.get(0).getUserName());
                savelogin.setLastLoginDate(new Date());
                savelogin.setLoginFailTimes(0);
                savelogin.setTenantCnshortname(systenantdto.getTenantCnshortname());
                savelogin.setTenantShortname(systenantdto.getTenantShortname());
                savelogin.setLastLoginIp(sysuserdto.getExtField5());
                int logininsert = sysUserLoginDao.insert(savelogin);
                if(logininsert<1){
                    msgobject.setMsg("保存登录记录失败！");
                    msgobject.setResult(Integer.parseInt(EnumMsgCode.Middle.getValue()));
                    return msgobject;
                }
                updatelogin = savelogin;
            }else{
                //校验登录密码错误是不是超过5次,超过5次锁定用户
                if(updatelogin.getLoginFailTimes()>3){
                    SysUserDto sysuserdtocheck = sysUserDao.selectByPrimaryKey(updatelogin.getUserId(),updatelogin.getTenantId());
                    if(sysuserdtocheck==null){
                        msgobject.setMsg("获取用户信息失败！");
                        msgobject.setResult(Integer.parseInt(EnumMsgCode.Middle.getValue()));
                        return msgobject;
                    }
                    sysuserdtocheck.setUserStatus(EnumUserStatus.Disable.getValue());
                    sysuserdtocheck.setModifyDate(new Date());

                    int updateuser =  sysUserDao.updateByPrimaryKeySelective(sysuserdtocheck);
                    if(updateuser<1){
                        msgobject.setMsg("登录超过次数，锁定用户失败！");
                        msgobject.setResult(Integer.parseInt(EnumMsgCode.Middle.getValue()));
                        return msgobject;
                    }
                }
            }

            //密码校验
            if(userlist.size()==0){
                //密码错误更新失败登录日期和累加错误次数
                updatelogin.setLastFailDate(new Date());
                updatelogin.setLoginFailTimes(updatelogin.getLoginFailTimes()+1);
                int loginupdate = sysUserLoginDao.updateByPrimaryKeySelective(updatelogin);
                if(loginupdate<1){
                    msgobject.setMsg("更新登录记录失败！");
                    msgobject.setResult(Integer.parseInt(EnumMsgCode.Middle.getValue()));
                    return msgobject;
                }
                msgobject.setMsg("密码错误！");
                msgobject.setResult(Integer.parseInt(EnumMsgCode.Middle.getValue()));
                return msgobject;
            }else{
                updatelogin.setLastLoginDate(new Date());;
                updatelogin.setLoginFailTimes(0);
                int loginupdate = sysUserLoginDao.updateByPrimaryKeySelective(updatelogin);
                if(loginupdate<1){
                    msgobject.setMsg("更新登录记录失败！");
                    msgobject.setResult(Integer.parseInt(EnumMsgCode.Middle.getValue()));
                    return msgobject;
                }
            }
            msgobject = RespJsonFactory.buildSuccess("登录成功！");
            return msgobject;
        } catch (Exception e) {
            e.printStackTrace();
            return msgobject;
        }
    }

    @Override
    public SysUserLoginDto selectByPrimaryKey(String userId, Integer tenantId) throws Exception {
        try {
            SysUserLoginDto sysUserLoginDto = sysUserLoginDao.selectByPrimaryKey(userId, tenantId);
            return sysUserLoginDto;
        }catch (Exception e){
            throw new Exception(e);
        }
    }
}
