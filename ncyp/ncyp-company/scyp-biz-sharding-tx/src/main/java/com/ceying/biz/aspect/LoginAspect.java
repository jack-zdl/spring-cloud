package com.ceying.biz.aspect;

import com.ceying.common.util.user.GetUserUtil;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.List;

/**
 * @author: zhangdl<br>
 * @date: 2018/3/29 11:23<br>
 * @version: 2.0 <br>
 * @description: <br>
 */
@Order(1)
@Component("login")
@Aspect
public class LoginAspect {

    @Pointcut("execution(public * com.ceying.biz.controller.*.*(..))")
    public void pointcut() {
    }

//    @Around("pointcut()")
    public Object around(ProceedingJoinPoint pjp) throws Throwable {
        HttpServletRequest request = null;
        String methodName = pjp.getSignature().getName();
        List<Object> list = Arrays.asList(pjp.getArgs());
        /**
         * 得到用户的token token就是这样使用的
         * 1 无法得到token
         */
        HttpServletRequest httpServletRequest = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
                .getRequest();
        String token = getUserToken(httpServletRequest);
        if (!token.equalsIgnoreCase("123456")) {
            System.out.println( "错误, 权限不合法!");
        } else {
            System.out.println("正确，权限合法");
        }

        for (int i = 0; i < list.size(); i++) {
            if (list.get(i) instanceof HttpServletRequest) {
                request = (HttpServletRequest) list.get(i);
            }
        }
        if (request != null && GetUserUtil.getLoginUser() == null) {
            return null;
//            return RespJsonFactory.buildWarning("用户未登录");
        } else {
            return pjp.proceed();
        }

    }

    private String getUserToken(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies == null) {
            return "";
        }
        for (Cookie cookie : cookies) {
            if (cookie.getName().equalsIgnoreCase("user_token")) {
                return cookie.getValue();
            }
        }
        return "";
    }
}
