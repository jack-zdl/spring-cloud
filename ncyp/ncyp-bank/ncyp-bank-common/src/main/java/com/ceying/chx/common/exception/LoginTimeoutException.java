package com.ceying.chx.common.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * 功能说明: 登录超时异常<br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2017/11/15 15:15<br>
 * <br>
 */
@ResponseStatus(value = HttpStatus.BAD_REQUEST, reason = "Login Timeout ")
public class LoginTimeoutException extends Exception{

    private static final long serialVersionUID = -1841039267730569452L;

    public LoginTimeoutException() {
    }

    public LoginTimeoutException(String message) {
        super(message);
    }

    public LoginTimeoutException(String message, Throwable cause) {
        super(message, cause);
    }

    public LoginTimeoutException(Throwable cause) {
        super(cause);
    }

    public LoginTimeoutException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
