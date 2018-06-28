package com.ceying.common.util.cache;

import com.ceying.common.feign.SysBaseDataCacheFeignClient;
import com.ceying.common.util.bean.SpringUtil;

import java.util.Map;

/**
 * 功能说明: <br>
 * 系统版本: 2.0 <br>
 * 开发人员: huanghaiyun
 * 开发时间: 2018/3/22<br>
 * <br>
 */
public class CacheManage {

    public static Map<String, Object> getCache(String cacheName){
        SysBaseDataCacheFeignClient sysBaseDataCacheFeignClient =  SpringUtil.getBean(SysBaseDataCacheFeignClient.class);
        return sysBaseDataCacheFeignClient.getCache(cacheName);
    }

    public static Object getCalendarCache(String cacheName){
        SysBaseDataCacheFeignClient sysBaseDataCacheFeignClient =  SpringUtil.getBean(SysBaseDataCacheFeignClient.class);
        return sysBaseDataCacheFeignClient.getCalendarCache(cacheName);
    }
}
