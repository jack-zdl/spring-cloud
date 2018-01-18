package com.ceying.chx.common.service;

import ch.qos.logback.classic.Logger;
import com.ceying.chx.common.util.log.LogContext;

/**
 * 功能说明: <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/14 14:41<br>
 */

public abstract  class BaseService {
    public Logger log() {
        return LogContext.getInstance().getLogger();
    }
}
