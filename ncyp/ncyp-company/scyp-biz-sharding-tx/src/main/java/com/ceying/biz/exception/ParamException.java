package com.ceying.biz.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * @author: zhangdl<br>
 * @date: 2018/3/28 17:26<br>
 * @version: 2.0 <br>
 * @description: <br>
 */
@ResponseStatus(value = HttpStatus.BAD_REQUEST, reason = "参数有误")
public class ParamException extends RuntimeException {

}
