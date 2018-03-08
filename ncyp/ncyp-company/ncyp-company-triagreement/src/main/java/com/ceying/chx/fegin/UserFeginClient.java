package com.ceying.chx.fegin;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 功能说明: 建立User的api调用feign的接口 <br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2017/11/30 7:31<br>
 * <br>
 */
@FeignClient(name = "ncyp-company-biz")//name赋值微服务名称
public interface UserFeginClient {

    /**
     * 用来指明指向哪个url
     * spring mvc 的注解
     * @return
     */
    @RequestMapping(value = "/app-name",method = RequestMethod.GET)
    public String getAppName();  //2个坑  1 @GetMapping不支持 2 @PathVariable必须设置好值

}
