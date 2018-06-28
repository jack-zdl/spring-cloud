package com.ceying.chx.config.config;

import com.ceying.chx.config.algorithm.ModuloDatabaseShardingAlgorithm;
import com.ceying.chx.config.algorithm.ModuloTableShardingAlgorithm;
import com.dangdang.ddframe.rdb.sharding.api.ShardingDataSourceFactory;
import com.dangdang.ddframe.rdb.sharding.api.rule.DataSourceRule;
import com.dangdang.ddframe.rdb.sharding.api.rule.ShardingRule;
import com.dangdang.ddframe.rdb.sharding.api.rule.TableRule;
import com.dangdang.ddframe.rdb.sharding.api.strategy.database.DatabaseShardingStrategy;
import com.dangdang.ddframe.rdb.sharding.api.strategy.table.TableShardingStrategy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;
import java.util.*;

/***
 * sharding-jdbc 配置数据源和分库分表规则
 * 
 * @author donghuating
 *
 */
@Component
public class XbDataSource {

//    @Autowired
//    private DataSource primaryDataSource;
//
//    @Autowired
//    @Qualifier("secondaryDataSource")
//    private DataSource secondaryDataSource;
//
//    private DataSource shardingDataSource;
//
//    @PostConstruct
//    public void init() {
//        Map<String, DataSource> map = new HashMap<String, DataSource>();
//        map.put("testdb0", primaryDataSource);
//        map.put("testdb1", secondaryDataSource);
//        DataSourceRule dataSourceRule = new DataSourceRule(map);
//        List<TableRule> tableRuleList = new ArrayList<TableRule>();
//        List<String> pList = new ArrayList<String>();
//
//        for (int i = 0; i < 1; i++) {
//            pList.add("t_test");//表名 t_order_0  t_order_1
//        }
//        tableRuleList.add(new TableRule.TableRuleBuilder("test").actualTables(pList).dataSourceRule(dataSourceRule)
//                .tableShardingStrategy(new TableShardingStrategy("id", new ProgramShardingAlgorithm())).build());
//        //规则配置包括数据源配置、表规则配置、分库策略和分表策略组成。这只是最简单的配置方式，实际使用可更加灵活，如：多分片键，分片策略直接和表规则配置绑定等
//        ShardingRule shardingRule = ShardingRule.builder().dataSourceRule(dataSourceRule)
//                .databaseShardingStrategy(
//                        new DatabaseShardingStrategy("id", new SingleKeyModuloDatabaseShardingAlgorithm()))
//                .tableRules(tableRuleList).build();
//        shardingDataSource = ShardingDataSourceFactory.createDataSource(shardingRule);
//    }
//
//    public DataSource getShardingDataSource() {
//        return shardingDataSource;
//    }

    //---------------------------------------------------------------------------------

//    @Autowired
//    private DataSource primaryDataSource;
//
//    @Autowired
//    @Qualifier("secondaryDataSource")
//    private DataSource secondaryDataSource;
//
//    private DataSource shardingDataSource;
//
//    @PostConstruct
//    public void init() {
//        Map<String, DataSource> map = new HashMap<String, DataSource>();
//        map.put("testdb0", primaryDataSource);
//        map.put("testdb1", secondaryDataSource);
//        DataSourceRule dataSourceRule = new DataSourceRule(map);
//        List<TableRule> tableRuleList = new ArrayList<TableRule>();
//        List<String> pList = new ArrayList<String>();
//
//        for (int i = 0; i < 1; i++) {
//            pList.add("t_order_" + "0");//表名 t_order_0  t_order_1
//        }
//        tableRuleList.add(new TableRule.TableRuleBuilder("t_order").actualTables(pList).dataSourceRule(dataSourceRule)
//                .tableShardingStrategy(new TableShardingStrategy("order_id", new ProgramShardingAlgorithm())).build());
//        //规则配置包括数据源配置、表规则配置、分库策略和分表策略组成。这只是最简单的配置方式，
//          实际使用可更加灵活，如：多分片键，分片策略直接和表规则配置绑定等
//        ShardingRule shardingRule = ShardingRule.builder().dataSourceRule(dataSourceRule)
//                .databaseShardingStrategy(
//                        new DatabaseShardingStrategy("user_id", new SingleKeyModuloDatabaseShardingAlgorithm()))
//                .tableRules(tableRuleList).build();
//        shardingDataSource = ShardingDataSourceFactory.createDataSource(shardingRule);
//    }
//
//    public DataSource getShardingDataSource() {
//        return shardingDataSource;
//    }

    //---------------------------------------------------------------------------------
    @Autowired
    private DataSource primaryDataSource;

    @Autowired
    @Qualifier("secondaryDataSource")
    private DataSource secondaryDataSource;

    private DataSource shardingDataSource;

    @PostConstruct
    public void init() {
        Map<String, DataSource> map = new HashMap<String, DataSource>();
        map.put("testdb0", primaryDataSource);
        map.put("testdb1", secondaryDataSource);
        DataSourceRule dataSourceRule = new DataSourceRule(map);
        List<TableRule> tableRuleList = new ArrayList<TableRule>();
        List<String> pList = new ArrayList<String>();

        //给分库分表的同类表 增加逻辑表
        TableRule orderTableRule  = TableRule.builder("t_order").actualTables(Arrays.asList("t_order_0",
                "t_order_1")).dataSourceRule(dataSourceRule).build();

        ShardingRule shardingRule = ShardingRule.builder()

                .dataSourceRule(dataSourceRule)

                .tableRules(Arrays.asList(orderTableRule)) // 添加逻辑表集合
                // 以什么字段来分库
                .databaseShardingStrategy(new DatabaseShardingStrategy("user_id", new ModuloDatabaseShardingAlgorithm()))
                // 以什么字段来分表
                .tableShardingStrategy(new TableShardingStrategy("order_id", new ModuloTableShardingAlgorithm()))
                .build();
        shardingDataSource = ShardingDataSourceFactory.createDataSource(shardingRule);
    }

    public DataSource getShardingDataSource() {
        return shardingDataSource;
    }

}
