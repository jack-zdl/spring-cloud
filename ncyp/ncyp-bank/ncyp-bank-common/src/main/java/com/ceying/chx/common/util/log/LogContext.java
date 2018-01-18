package com.ceying.chx.common.util.log;

import ch.qos.logback.classic.Logger;

/**
 * 功能说明: <br>
 * 系统版本: 0.1 <br>
 * 开发人员: chx
 * 开发时间: 2016-8-1<br>
 */
public final class LogContext {

    public static LogContext getInstance() {
        return Holder.instance;
    }

    private static class Holder {
        private static final LogContext instance = new LogContext();
    }

    private static final ThreadLocal<Logger> loggerHolder = new ThreadLocal();
    private static final ThreadLocal<Boolean> isInitHolder = new ThreadLocal();

    /**
     * 设置当前线程的日志句柄
     * @param logger  日志
     */
    public void setLogger(Logger logger) {
        //只允许初始一次
    	loggerHolder.set(logger);
        isInitHolder.set(true);
    }

    /**
     * 获取当前线程的日志句柄
     * @return  Logger
     */
    public Logger getLogger() {
        //未初始则返回默认的日志句柄
        if (isInitHolder.get() != null && isInitHolder.get() == true) {
            return loggerHolder.get();
        } else {
            return LogUtils.getInstance().getLogger();
        }
    }

    /**
     * 判断是否已初始
     * @return boolean
     */
    public boolean exists() {
        return loggerHolder.get() != null && isInitHolder.get() != null;
    }
}
