package com.ceying.biz.config.shardingjdbc;

import com.dangdang.ddframe.rdb.sharding.api.MasterSlaveDataSourceFactory;
import com.dangdang.ddframe.rdb.sharding.api.ShardingDataSourceFactory;
import com.dangdang.ddframe.rdb.sharding.api.rule.DataSourceRule;
import com.dangdang.ddframe.rdb.sharding.api.rule.ShardingRule;
import com.dangdang.ddframe.rdb.sharding.api.rule.TableRule;
import com.dangdang.ddframe.rdb.sharding.api.strategy.database.DatabaseShardingStrategy;
import com.dangdang.ddframe.rdb.sharding.api.strategy.table.TableShardingStrategy;
import com.dangdang.ddframe.rdb.sharding.jdbc.core.datasource.ShardingDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.*;

/***
 * sharding-jdbc 配置数据源和分库分表规则
 * 
 * @author donghuating
 *
 */
@Component
public class XbDataSource {

    @Autowired
    private DataSource primaryDataSource;

    @Autowired
    @Qualifier("secondaryDataSource")
    private DataSource secondaryDataSource;

    private DataSource shardingDataSource;


    /**
     * 建立读写分离规则
     * @throws SQLException
     */
    @PostConstruct
    public void init() throws SQLException {
        Map<String, DataSource> map = new HashMap<String, DataSource>();
        map.put("ds",MasterSlaveDataSourceFactory.createDataSource("ds",primaryDataSource,secondaryDataSource));
//        map.put("ncyp-biz", primaryDataSource);
//        map.put("biz", secondaryDataSource);
        DataSourceRule dataSourceRule = new DataSourceRule(map);
        List<TableRule> tableRuleList = new ArrayList<TableRule>();
        List<String> pList = new ArrayList<String>();
        for (int i = 0; i < 1; i++) {
            pList.add("t_biz_tripartiteagreement");
        }
        TableRule tableRule =  TableRule.builder("t_biz_tripartiteagreement").actualTables(pList).dataSourceRule(dataSourceRule).build();
//        TableRule orderItemTableRule = TableRule.builder("t_order_item").actualTables(Arrays.asList("t_order_item_0", "t_order_item_1")).dataSourceRule(dataSourceRule).build();
        tableRuleList.add(tableRule);
        ShardingRule shardingRule = ShardingRule.builder().dataSourceRule(dataSourceRule)
                .tableRules(tableRuleList)
                .databaseShardingStrategy(
                        new DatabaseShardingStrategy("tacontractid", new SingleKeyModuloDatabaseShardingAlgorithm()))
                .tableShardingStrategy(new TableShardingStrategy("tacontractid", new ProgramShardingAlgorithm())).build();
//        shardingDataSource = ShardingDataSourceFactory.createDataSource(shardingRule);
        shardingDataSource = new ShardingDataSource(shardingRule);
    }

    public DataSource getShardingDataSource() {
        return shardingDataSource;
    }
}
