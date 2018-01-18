package com.ceying.chx.front.base.service.impl;

import ch.qos.logback.classic.Logger;
import com.alibaba.fastjson.JSONObject;
import com.ceying.chx.common.constants.UserConstant;
import com.ceying.chx.common.dto.SysUserDto;
import com.ceying.chx.common.dto.SysUserLoginDto;
import com.ceying.chx.common.util.log.LogContext;
import com.ceying.chx.common.util.response.RespJson;
import com.ceying.chx.common.util.response.RespJsonFactory;
import com.ceying.chx.common.vo.UserLoginVO;
import com.ceying.chx.front.base.config.SysConstant;
import com.ceying.chx.front.base.service.SysLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;
/**
 * Created by mzq on 2017/12/22.
 */
@Service
public class SysLoginServiceImpl implements SysLoginService {

    public Logger log() {
        return LogContext.getInstance().getLogger();
    }

    @Autowired
    RestTemplate restTemplate;

    //登录
    @Override
    public RespJson login(HttpServletRequest request, UserLoginVO userLoginVO){
        RespJson respJson;
        try{
            SysUserDto sysUserDto=new SysUserDto();
            sysUserDto.setUserName(userLoginVO.getUserName());
            sysUserDto.setUserPwd(userLoginVO.getUserPwd());
            respJson =  restTemplate.postForObject("http://"+ SysConstant.BIZ_SERVICE_NAME+"/biz/user/login",sysUserDto,RespJson.class);
        }catch (Exception e){
            log().error("用户登录异常"+e);
            e.printStackTrace();
            respJson = RespJsonFactory.buildFailure("登录失败");
        }
        return respJson.getResult() != RespJson.SUCCESS? respJson :  saveSession(request,respJson);
    }

    /**
     * 登录成功后保存session信息
     * @param request http请求
     * @param respJson 返回结果
     * @return RespJson
     */
    private RespJson saveSession(HttpServletRequest request,RespJson respJson){
        Map map = (Map)respJson.getData();
        String str = JSONObject.toJSONString(map.get(UserConstant.USER_LOGIN_SESSION));
        String str2 = JSONObject.toJSONString(map.get(UserConstant.USER_SESSION));
        SysUserLoginDto userLoginDto = JSONObject.parseObject(str, SysUserLoginDto.class);
        SysUserDto userDto = JSONObject.parseObject(str2, SysUserDto.class);
        HttpSession session=request.getSession();
        session.setAttribute(UserConstant.USER_LOGIN_SESSION,userLoginDto);
        session.setAttribute(UserConstant.USER_SESSION,userDto);
        return respJson;
    }

}