package com.ceying.common.feign;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

/**
 * 功能说明: <br>
 * 系统版本: 2.0 <br>
 * 开发人员: huanghaiyun
 * 开发时间: 2018/3/26<br>
 * <br>
 */
@FeignClient(value = "scyp-system")
public interface SysBaseDataCacheFeignClient {

    @RequestMapping(value = "/cache/getCache")
    Map<String,Object> getCache(@RequestParam("cacheName") String cacheName);

    @RequestMapping(value = "/cache/getCalendarCache")
    Object getCalendarCache(@RequestParam("cacheName")String cacheName);
}