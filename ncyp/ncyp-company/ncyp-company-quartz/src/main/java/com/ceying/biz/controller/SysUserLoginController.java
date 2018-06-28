package com.ceying.biz.controller;

import com.ceying.biz.service.SysParamterService;
import com.ceying.biz.service.SysUserLoginService;
import com.ceying.biz.service.SysUserService;
import com.ceying.chx.common.constants.UserConstant;
import com.ceying.chx.common.dto.SysParameterDto;
import com.ceying.chx.common.dto.SysUserDto;
import com.ceying.chx.common.dto.SysUserLoginDto;
import com.ceying.chx.common.enums.EnumMsgCode;
import com.ceying.chx.common.util.network.NetworkUtil;
import com.ceying.chx.common.util.response.RespJson;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: miaozhenqing
 * 开发时间: 2017/12/22<br>
 * <br>
 */

@RestController
@RequestMapping("/biz/user")
public class SysUserLoginController {
    @Resource
    private SysUserService sysUserServiceImpl;
    @Resource
    private SysUserLoginService sysUserLoginServiceImpl;
    @Resource
    private SysParamterService sysParamterServiceImpl;
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public
    RespJson login(HttpServletRequest request, @RequestBody SysUserDto sysUserDto){
        //暂存入参，待后面使用
        String userName=sysUserDto.getUserName();
        String userPwd=sysUserDto.getUserPwd();
        int tenantId = 10001;
        SysParameterDto sysParameterDto = null;
        // 获得session
        HttpSession session = request.getSession();
        RespJson respJson=null;
        try {
            sysParameterDto = sysParamterServiceImpl.getCacheInfo(tenantId,"loginModel", "6000000");
            sysUserDto.setLockStatus(sysParameterDto.getParamValue());
            sysUserDto.setExtField5(NetworkUtil.getIpAddr(request));
            //用户登录逻辑校验
            respJson = sysUserLoginServiceImpl.userLogin(sysUserDto);
            //执行以上方法后，sysUserDto里的userName会清空，boss系统里面不会清空，待解决。用暂存里的数据恢复一下sysUserDto
            sysUserDto.setUserName(userName);
            sysUserDto.setUserPwd(userPwd);
            System.out.println(respJson.getResult());
            if(!StringUtils.equals(respJson.getResult()+"", EnumMsgCode.Success.getValue())){
                return respJson;
            }
            sysUserDto.setUserPwd("");
            sysUserDto.setUserId(sysUserDto.getUserName());
            sysUserDto.setUserName("");
            RespJson pageview = sysUserServiceImpl.queryPage(sysUserDto);
            //非空校验
            List<SysUserDto> list=(ArrayList<SysUserDto>)pageview.getData();
            if(list.size()==0){
                respJson.setMsg("登录失败，获取用户信息失败！");
                respJson.setResult(Integer.parseInt(EnumMsgCode.Middle.getValue()));
            }
            SysUserDto user = list.get(0);
            if(user==null){
                respJson.setMsg("登录失败，获取用户信息失败！");
                respJson.setResult(Integer.parseInt(EnumMsgCode.Middle.getValue()));
            }
            //获取用户登录详细信息
            SysUserLoginDto loginUser = sysUserLoginServiceImpl.selectByPrimaryKey(user.getUserId(), user.getTenantId());
            session.setAttribute(UserConstant.USER_LOGIN_SESSION, loginUser);
            //把登录信息传回front，front中存入session
            Map<String,Object> map=new HashMap();
            map.put(UserConstant.USER_LOGIN_SESSION, loginUser);
            respJson.setData(map);
        } catch (Exception e) {
            e.printStackTrace();
            respJson.setResult(-1);
            respJson.setMsg("登录异常:"+e.getMessage());
        }
        return respJson;
    }
}
