package com.ceying.chx.gateway.listener;


import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;

/**
 * 功能说明: 自制监听器 <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2017/12/28 16:01<br>
 * <br>
 */
//@WebListener  这个注解必须通过注解方式启动
public class CustomListener implements ServletRequestListener {

    public void requestDestroyed(ServletRequestEvent sre) {

    }

    public void requestInitialized(ServletRequestEvent sre) {
        System.out.println("------ CustomListener ------");
    }

}
