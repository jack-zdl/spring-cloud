package com.ceying.chx.config.config;

import com.dangdang.ddframe.rdb.sharding.api.ShardingValue;
import com.dangdang.ddframe.rdb.sharding.api.strategy.database.SingleKeyDatabaseShardingAlgorithm;
import com.google.common.collect.Range;

import java.util.Collection;
import java.util.LinkedHashSet;

/***
 * dataBase分库算法
 * 
 * @author donghuating
 *
 */
public class SingleKeyModuloDatabaseShardingAlgorithm implements SingleKeyDatabaseShardingAlgorithm<Integer> {

    /**
     * 根据分片值和SQL的=运算符计算分片结果名称集合.
     * @param availableTargetNames 所有的可用目标名称集合, 一般是数据源或表名称
     * @param shardingValue        分片值
     * @return 分片后指向的目标名称, 一般是数据源或表名称
     */
    public String doEqualSharding(Collection<String> availableTargetNames, ShardingValue<Integer> shardingValue) {
        for (String each : availableTargetNames) {
            if (each.endsWith(shardingValue.getValue() % 2 + "")) {
                return each;
            }
        }
        throw new UnsupportedOperationException();
    }

    /**
     * IN方法
     * @param availableTargetNames
     * @param shardingValue
     * @return
     */
    public Collection<String> doInSharding(Collection<String> availableTargetNames,
            ShardingValue<Integer> shardingValue) {
        Collection<String> result = new LinkedHashSet<String>(availableTargetNames.size());
        Collection<Integer> values = shardingValue.getValues();
        for (Integer value : values) {
            for (String dataSourceName : availableTargetNames) {
                if (dataSourceName.endsWith(value % 2 + "")) {
                    result.add(dataSourceName);
                }
            }
        }
        return result;
    }

    /**
     * BETWEEN方法
     * @param availableTargetNames
     * @param shardingValue
     * @return
     */
    public Collection<String> doBetweenSharding(Collection<String> availableTargetNames,
            ShardingValue<Integer> shardingValue) {
        Collection<String> result = new LinkedHashSet<String>(availableTargetNames.size());
        Range<Integer> range = shardingValue.getValueRange();
        for (Integer i = range.lowerEndpoint(); i <= range.upperEndpoint(); i++) {
            for (String each : availableTargetNames) {
                if (each.endsWith(i % 2 + "")) {
                    result.add(each);
                }
            }
        }
        return result;
    }

}
