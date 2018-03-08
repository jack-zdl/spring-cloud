package com.ceying.chx.config;

import com.ceying.chx.fegin.UserFeginClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 功能说明: <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/3/6 14:50<br>
 */
@RestController
@RefreshScope
public class MySampleRestController {

    @Value("${my-config.appName}")
    private String appName;

    /**
     * 使用feign的方式调用api
     */
    @Autowired
    private
    UserFeginClient userFeginClient;

    @RequestMapping("/app-name")
    public String getAppName() {
        System.out.println(appName);
        return appName;
    }


    @GetMapping("/hi")
    public String hi(){
        return userFeginClient.getAppName();
    }
}
