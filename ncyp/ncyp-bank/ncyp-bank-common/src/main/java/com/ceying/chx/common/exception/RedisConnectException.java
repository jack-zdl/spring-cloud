package com.ceying.chx.common.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * 功能说明: 链接redis异常<br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl
 * 开发时间: 2017/11/6 16:30<br>
 * <br>
 */
@ResponseStatus(value = HttpStatus.INSUFFICIENT_STORAGE, reason = "not connect redis db")
public class RedisConnectException   extends Exception{


    private static final long serialVersionUID = 5628718398389057841L;

    public RedisConnectException () {
    }

    public RedisConnectException (String message) {
        super(message);
    }

    public RedisConnectException (String message, Throwable cause) {
        super(message, cause);
    }

    public RedisConnectException (Throwable cause) {
        super(cause);
    }

    public RedisConnectException (String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
