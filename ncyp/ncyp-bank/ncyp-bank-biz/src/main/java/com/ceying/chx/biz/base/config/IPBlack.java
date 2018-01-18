package com.ceying.chx.biz.base.config;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.ArrayList;

/**
 * 功能说明: 映射配置参数的实体类<br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2017/11/14 22:10<br>
 * <br>
 */

@Component
@ConfigurationProperties(prefix="ip")
public class IPBlack {

    /**
     * 黑名单集合
     */

//    @Value("${port}")
//    private String port;
    @NotEmpty
    public static ArrayList<String> blacklist = new ArrayList<String>();
//   private List blacklist ;

    /**
     * 端口
     */
    public static String port;

    /**
     * 获得黑名单集合
     * @return
     */
    public
    ArrayList<String> getBlacklist() {
        return blacklist;
    }

    /**
     * 设置黑名单集合
     * @param blacklist
     * @return
     */
    public
    IPBlack setBlacklist(ArrayList<String> blacklist) {
        this.blacklist = blacklist;
        return this;
    }

    public static
    String getPort() {
        return port;
    }

    public static
    void setPort(String port) {
        IPBlack.port = port;
    }
}
