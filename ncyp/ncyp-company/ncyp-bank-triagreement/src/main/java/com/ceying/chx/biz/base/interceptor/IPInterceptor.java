package com.ceying.chx.biz.base.interceptor;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.ceying.chx.biz.base.config.IPBlack;
import com.ceying.chx.common.util.IPUtil;
import com.ceying.chx.common.util.response.RespJsonFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 功能说明: IP拦截器，拦截指定IP的访问者<br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2017/11/14 20:04<br>
 * <br>
 */
//@Component
public class IPInterceptor  extends HandlerInterceptorAdapter{

    /**
     * 根据IpConfig.properties中得到IP黑名单集合
     */
      @Resource
      private IPBlack ipBlack;


    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {
        System.out.println("进入IPInterceptor拦截器");
        System.out.println("黑名单目录："+ IPBlack.blacklist);
        System.out.println("端口号："+IPBlack.port);
        String ipAdress = IPUtil.getIp(request);
        for (String ip : IPBlack.blacklist){
            if(ipAdress.equals(ip)){
                return true;
            }
        }
  //      response.getWriter().write(JSONObject.toJSONString(RespJsonFactory.buildNotLogin(), SerializerFeature.WriteMapNullValue));
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request,
                           HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
//        System.out.println("controller执行之后渲染页面之前进入postHander拦截器");
    }

    @Override
    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        // TODO Auto-generated method stub
//        System.out.println("渲染页面之后进入afterCompletion拦截器");
    }
}
