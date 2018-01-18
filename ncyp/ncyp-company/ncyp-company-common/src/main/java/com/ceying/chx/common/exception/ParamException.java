package com.ceying.chx.common.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * 功能说明:参数异常 <br>
 *     返回数据类型 ：
 *     {
 *        "timestamp": 1510538653165,
 *        "status": 400,
 *        "error": "Bad Request",
 *        "exception": "com.ceying.chx.cpi.base.exception.ParamException",
 *        "message": "参数有误",
 *        "path": "/cpi/base/login"
 *      }
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl
 * 开发时间: 2017/11/7 6:55<br>
 * <br>
 */
@ResponseStatus(value = HttpStatus.BAD_REQUEST, reason = "参数有误")
public class ParamException extends Exception{

    private static final long serialVersionUID = -4178477777998414744L;

    public ParamException() {
    }

    public ParamException(String message) {
        super(message);
    }

    public ParamException(String message, Throwable cause) {
        super(message, cause);
    }

    public ParamException(Throwable cause) {
        super(cause);
    }

    public ParamException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
