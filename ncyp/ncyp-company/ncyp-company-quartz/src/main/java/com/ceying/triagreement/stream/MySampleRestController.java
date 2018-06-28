package com.ceying.triagreement.stream;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
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

    @RequestMapping("/app-name")
    public String getAppName() {
        System.out.println(appName);
        return appName;
    }
}
