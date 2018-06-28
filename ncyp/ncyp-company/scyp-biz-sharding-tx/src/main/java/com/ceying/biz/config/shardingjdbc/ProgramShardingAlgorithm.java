package com.ceying.biz.config.shardingjdbc;

import com.dangdang.ddframe.rdb.sharding.api.ShardingValue;
import com.dangdang.ddframe.rdb.sharding.api.strategy.table.SingleKeyTableShardingAlgorithm;

import java.util.Arrays;
import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.List;

/**
 * table 分片算法
 * 分表算法
 * @author donghuating
 *
 */
public class ProgramShardingAlgorithm implements SingleKeyTableShardingAlgorithm<String> {
    Integer zero =  new Integer(0);

    /**
     * sql == 规则
     */
    @Override
    public String doEqualSharding(Collection<String> availableTargetNames, ShardingValue<String> shardingValue) {
        List list = Arrays.asList(availableTargetNames.toArray());
        for (int i = 0 ;i <list.size(); i++){
            String tableName  = shardingValue.getLogicTableName();
            if (zero.equals(Integer.valueOf(shardingValue.getValue().substring(shardingValue.getValue().length()-4)) < 1000)) {
                return (String) list.get(i);
            }else {
                return (String) list.get(i);
            }
        }
//        for (String each : availableTargetNames) {
//            String tableName  = shardingValue.getLogicTableName();
//            List<TripartiteAgreementEntity> list =tripartiteAgreementDao.selectAll();
//            if (zero.equals(Integer.valueOf(shardingValue.getValue().substring(shardingValue.getValue().length()-4)) < 1000)) {
//                return each;
//            }else {
//                availableTargetNames.
//            }
////            if (zero.equals(Integer.valueOf(shardingValue.getValue().substring(shardingValue.getValue().length()-4)) % 2)) {
////                return each;
////            }
//        }
        throw new UnsupportedOperationException();
    }

    /**
     * sql in 规则
     */
    @Override
    public Collection<String> doInSharding(Collection<String> availableTargetNames,
                                           ShardingValue<String> shardingValue) {
        Collection<String> result = new LinkedHashSet<String>(availableTargetNames.size());
//        Collection<Integer> values = shardingValue.getValues();
//        for (Integer value : values) {
//            for (String tableNames : availableTargetNames) {
//                if (tableNames.endsWith(value % 2 + "")) {
//                    result.add(tableNames);
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
//        Range<Integer> range = shardingValue.getValueRange();
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
