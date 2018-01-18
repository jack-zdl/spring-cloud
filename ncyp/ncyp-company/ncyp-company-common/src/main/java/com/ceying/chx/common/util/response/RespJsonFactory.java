package com.ceying.chx.common.util.response;

/**
 * 功能说明: 返回对象的静态工厂类<br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl
 * 开发时间: 2017/11/6 15:48<br>
 * <br>
 */

public class RespJsonFactory {
    private static final String NOTLOGIN = "用户未登录";

    public static RespJson buildSuccess() {
        return buildInfo(RespJson.SUCCESS, null, null, null);
    }

    public static RespJson buildSuccess(String msg) {
        return buildInfo(RespJson.SUCCESS, null, msg, null);
    }

    public static RespJson buildWarning(String msg) {
        return buildInfo(RespJson.WARNING, null, msg, null);
    }

    public static RespJson buildSuccess(String msg, Object data) {
        return buildInfo(RespJson.SUCCESS, null, msg, data);
    }

    public static RespJson buildSuccess(Object data) {
        return buildInfo(RespJson.SUCCESS, null, null, data);
    }

    public static RespJson buildFailure(String msg) {
        return buildInfo(RespJson.FAIL, null, msg, null);
    }

    public static RespJson buildNotLogin() {
        return buildInfo(RespJson.NOLOGIN, null, NOTLOGIN, null);
    }

    public static RespJson buildInfo(int result, Integer code, String msg, Object data) {
        RespJson respJson = new RespJson();
        respJson.setResult(result);
        respJson.setCode(code);
        respJson.setMsg(msg);
        respJson.setData(data);
        return respJson;
    }
}
