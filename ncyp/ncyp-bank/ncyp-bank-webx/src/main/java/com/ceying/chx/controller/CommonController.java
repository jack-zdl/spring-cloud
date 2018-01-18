package com.ceying.chx.controller;

import org.springframework.beans.factory.annotation.Value;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhanghj
 * 开发时间: 2018/1/10<br>
 * <br>
 */
public class CommonController {

    @Value("#{configProperties['ncyp.bank.front.name']}")
    private static String frontname;

    public static String getFrontName(){
        return "/"+frontname;
    }
}
