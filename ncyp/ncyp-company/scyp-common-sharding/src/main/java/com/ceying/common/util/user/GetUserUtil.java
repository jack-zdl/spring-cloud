package com.ceying.common.util.user;

import com.ceying.common.constant.UserStatusConstant;
import com.ceying.common.entity.UserLoginEntity;
import com.ceying.common.entity.UserLoginEntity;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 功能说明: 获取登录用户<br>
 * 系统版本: 2.0 <br>
 * 开发人员: huanghaiyun
 * 开发时间: 2018/3/27<br>
 * <br>
 */
public class GetUserUtil {
    /**
     * 获取登录用户
     * @return
     */
    public static UserLoginEntity getLoginUser(){
        UserLoginEntity user=null;
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        if(request!=null){
            //为了兼容 web 项目，过滤掉原有自带 session ，统一使用 spring session
            HttpSession session = (HttpSession) request.getAttribute("org.springframework.session.SessionRepository.CURRENT_SESSION");
            if(session!=null){
                user= (UserLoginEntity) session.getAttribute(UserStatusConstant.USER_LOGIN_SESSION);
            }
        }
        return  user;
    }
}
