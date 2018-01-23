package com.ceying.chx.biz.base.config;


import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.session.ResultHandler;

import java.sql.Statement;
import java.util.Properties;

/**
 * 功能说明: 打印每条SQL语句及其执行时间<br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/23 14:24<br>
 */

@Intercepts({@Signature(type = StatementHandler.class, method = "query", args = {Statement.class, ResultHandler.class}),
@Signature(type = StatementHandler.class, method = "update", args = {Statement.class}),
@Signature(type = StatementHandler.class, method = "batch", args = { Statement.class })})
public class SqlCostInterceptor implements Interceptor {
    @Override
    public
    Object intercept(Invocation invocation) throws Throwable {
        return null;
    }

    @Override
    public
    Object plugin(Object o) {
        return null;
    }

    @Override
    public
    void setProperties(Properties properties) {

    }
}
