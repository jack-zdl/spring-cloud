package com.ceying.biz.config.shardingjdbc;

import com.dangdang.ddframe.rdb.sharding.util.EventBusInstance;
import com.google.common.base.Preconditions;
import jdk.nashorn.internal.objects.annotations.Getter;

import java.sql.SQLException;

/**
 * 功能说明:    <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间:2018/6/27 23:43<br>
 * <br>
 */
public class SoftTransactionManager {

    // SoftTransactionManager.java
    /**
     * 柔性事务配置对象
     */
//    @Getter
//    private final SoftTransactionConfiguration transactionConfig;
//
//// SoftTransactionManager.java
//    /**
//     * 初始化事务管理器.
//     */
//    public void init() throws SQLException {
//        // 初始化 最大努力送达型事务监听器
//        EventBusInstance.getInstance().register(new BestEffortsDeliveryListener());
//        // 初始化 事务日志数据库存储表
//        if (TransactionLogDataSourceType.RDB == transactionConfig.getStorageType()) {
//            Preconditions.checkNotNull(transactionConfig.getTransactionLogDataSource());
//            createTable();
//        }
//        // 初始化 内嵌的最大努力送达型异步作业
//        if (transactionConfig.getBestEffortsDeliveryJobConfiguration().isPresent()) {
//            new NestedBestEffortsDeliveryJobFactory(transactionConfig).init();
//        }
//    }

}
