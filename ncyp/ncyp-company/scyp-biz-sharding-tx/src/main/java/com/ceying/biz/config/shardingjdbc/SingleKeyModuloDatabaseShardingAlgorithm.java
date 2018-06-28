package com.ceying.biz.config.shardingjdbc;

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
public class SingleKeyModuloDatabaseShardingAlgorithm implements SingleKeyDatabaseShardingAlgorithm<String> {

    Integer zero =  new Integer(0);

    /**
     * sql == 规则
     */
    @Override
    public String doEqualSharding(Collection<String> availableTargetNames, ShardingValue<String> shardingValue) {
        System.out.println(shardingValue.getValue());
        System.out.println(shardingValue.getValue().length()-1);
        System.out.println(shardingValue.getValue().substring(shardingValue.getValue().length()-1));
        System.out.println(Integer.valueOf(shardingValue.getValue().substring(shardingValue.getValue().length()-1)));
        for (String each : availableTargetNames) {
            System.out.println(Integer.valueOf(shardingValue.getValue().substring(shardingValue.getValue().length()-1)) % 2+"");
            if (zero.equals(Integer.valueOf(shardingValue.getValue().substring(shardingValue.getValue().length()-1)) % 2)) {
                return each;
            }
        }
        throw new UnsupportedOperationException();
    }


    /**
     * sql in 规则
     */
    @Override
    public Collection<String> doInSharding(Collection<String> availableTargetNames,
                                           ShardingValue<String> shardingValue) {
        Collection<String> result = new LinkedHashSet<String>(availableTargetNames.size());
        Collection<String> values = shardingValue.getValues();
//        for (String value : values) {
//            for (String dataSourceName : availableTargetNames) {
//                if (dataSourceName.endsWith(value % 2 + "")) {
//                    result.add(dataSourceName);
//                }
//            }
//        }
        return result;
    }

    /**
     * sql between 规则
     */
    @Override
    public Collection<String> doBetweenSharding(Collection<String> availableTargetNames,
                                                ShardingValue<String> shardingValue) {
        Collection<String> result = new LinkedHashSet<String>(availableTargetNames.size());
        Range<String> range = shardingValue.getValueRange();
//        for (Integer i = range.lowerEndpoint(); i <= range.upperEndpoint(); i++) {
//            for (String each : availableTargetNames) {
//                if (each.endsWith(i % 2 + "")) {
//                    result.add(each);
//                }
//            }
//        }
        return result;
    }

}
