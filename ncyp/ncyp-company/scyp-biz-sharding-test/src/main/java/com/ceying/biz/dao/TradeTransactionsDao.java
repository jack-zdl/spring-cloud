package com.ceying.biz.dao;

import com.ceying.biz.entity.TradeTransactionsEntity;
import com.ceying.biz.query.TradeTransactionsQuery;
import com.ceying.common.util.mybatis.MyMapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhanghj
 * 开发时间: 2018/3/13<br>
 * <br>
 */
public interface TradeTransactionsDao extends MyMapper<TradeTransactionsEntity> {

    List<TradeTransactionsQuery> selectByUridList(List<String> uridList);
    boolean existAtTheSameTime(@Param("tradeaccountsid") String tradeaccountsid, @Param("postdatetime") Date postdatetime);
}
