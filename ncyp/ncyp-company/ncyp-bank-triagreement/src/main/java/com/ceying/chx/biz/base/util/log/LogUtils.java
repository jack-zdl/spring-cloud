package com.ceying.chx.biz.base.util.log;

import ch.qos.logback.classic.Logger;
import ch.qos.logback.classic.LoggerContext;
import org.slf4j.LoggerFactory;

/**
 * 功能说明: <br>
 * 系统版本: 0.1 <br>
 * 开发人员: chx
 * 开发时间: 2016-8-1<br>
 * <br>
 */
public class LogUtils {
    private Logger logger = null;

    /**
     * 获取日志记录器
     */
    public Logger getLogger() {
        return logger;
    }

    public void setLogger(String logurl,String defaultlogurl){
        //判断是否定义过日志，若未定义则取默认的system日志
        Logger logger = ((LoggerContext) LoggerFactory.getILoggerFactory()).getLogger(logurl);
        if (logger == null) {
            logger = ((LoggerContext) LoggerFactory.getILoggerFactory()).getLogger(defaultlogurl);
        }
        LogContext.getInstance().setLogger(logger);
    }

    /**
     * 根据日志URL，获取日志记录器
     */
    public Logger getLogger(String logurl) {
        //判断是否定义过日志，若未定义则取默认的system日志
        Logger logger = ((LoggerContext) LoggerFactory.getILoggerFactory()).getLogger(logurl);
        if (logger == null) {
            logger = ((LoggerContext) LoggerFactory.getILoggerFactory()).getLogger("system");
        }
        return logger;
    }

    public void setTaskLogger(String logurl){
        LogUtils.getInstance().setLogger(logurl,"task");
    }

    /**
     * 构造函数.
     */
    private LogUtils() {
        logger = ((LoggerContext) LoggerFactory
                .getILoggerFactory()).getLogger("system");
    }

    /**
     * 获得唯一实例
     *
     * @return
     */
    public static LogUtils getInstance() {
        return Holder.instance;
    }

    private static class Holder {
        private static final LogUtils instance = new LogUtils();
    }
}
