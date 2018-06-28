package com.ceying.biz.dao;

import com.ceying.biz.entity.TradeBalancesEntity;
import com.ceying.common.util.mybatis.MyMapper;
import org.apache.ibatis.annotations.Param;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhanghj
 * 开发时间: 2018/3/13<br>
 * <br>
 */
public interface TradeBalancesDao extends MyMapper<TradeBalancesEntity> {

    TradeBalancesEntity selectByTradeaccountsid(@Param("tradeaccountsid") String tradeaccountsid);

    TradeBalancesEntity getTradeBalancesEntityByOrgid(@Param("orgid") String orgid);
}
