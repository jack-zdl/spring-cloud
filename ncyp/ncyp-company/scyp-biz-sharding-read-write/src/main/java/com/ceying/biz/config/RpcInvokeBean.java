package com.ceying.biz.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 功能说明:    <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间:2018/5/14 16:51<br>
 * <br>
 */
@Component
@ConfigurationProperties(prefix="blockchain")
public class RpcInvokeBean {
    private static boolean enabled;
    private static String rpcAddr;
    private static String fromAddr;
    private static String toAddr;

    public static boolean isEnabled() {
        return enabled;
    }

    public static void setEnabled(boolean enabled) {
        RpcInvokeBean.enabled = enabled;
    }

    public static String getRpcAddr() {
        return rpcAddr;
    }

    public static void setRpcAddr(String rpcAddr) {
        RpcInvokeBean.rpcAddr = rpcAddr;
    }

    public static String getFromAddr() {
        return fromAddr;
    }

    public static void setFromAddr(String fromAddr) {
        RpcInvokeBean.fromAddr = fromAddr;
    }

    public static String getToAddr() {
        return toAddr;
    }

    public static void setToAddr(String toAddr) {
        RpcInvokeBean.toAddr = toAddr;
    }
}
