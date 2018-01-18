package com.ceying.chx.front.base.aspect;

import ch.qos.logback.classic.Logger;
import com.alibaba.fastjson.JSONArray;
import com.ceying.chx.common.util.log.LogContext;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * 功能说明:日志切面-记录service方法异常时记录日志<br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl
 * 开发时间: 2017/11/8 9:19<br>
 * <br>
 */
@Aspect
@Component
public class LogAspect {

    public
    Logger log() {
        return LogContext.getInstance().getLogger();
    }

//    @Pointcut("execution(public * com.ceying.chx.front.business.agreementtemplate.service.impl.*.*(..))"+"&& execution(public * com.ceying.chx.front.base.service.impl.*.*(..))")
@Pointcut(" execution(public * com.ceying.chx.front.base.service.impl.*.*(..))")
    public void PointCut() {
    }

    /**
     * 异常通知 用于拦截service层记录异常日志
     * @param joinPoint
     * @param e
     */
    @AfterThrowing(pointcut="PointCut()", throwing="e")
    public void doAfterThrowing(JoinPoint joinPoint, Throwable e) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
                .getRequestAttributes()).getRequest();
        // 获取用户请求方法的参数并序列化为JSON格式字符串
        String params = "";
        Object[] args = joinPoint.getArgs();
        if (args != null) {
            JSONArray jsonArray = new JSONArray();
            params = jsonArray.toString();
            log().info("请求参数=:"+params);
        }
        try {
            System.out.println("=====================异常通知开始=======================");
            System.out.println("请求协议http或https="+request.getScheme()+"://");
            System.out.println("请求服务器="+request.getHeader("host"));
            System.out.println("工程名="+request.getRequestURI());
            log().error("异常方法："+ (joinPoint.getTarget().getClass().getName() + "."
                    + joinPoint.getSignature().getName() + "()"));
            log().error("异常类:"+e.getClass().getName());
            log().error("异常信息", e); //指出外层和内层的异常
            System.out.println("=====================异常通知结束=========================");
        } catch (Exception ex) {
            log().error("==异常通知异常==");
            log().error("异常信息:{}", ex);
        }
    }

}
