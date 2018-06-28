package com.ceying.chx.biz.base.dao;

import com.ceying.chx.biz.base.entity.TOrder;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

/**
 * 功能说明: <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/3/15 15:24<br>
 */
@Mapper
public interface TOrderMapper {
    @Insert("INSERT INTO t_order (order_id,user_id) VALUES (#{orderId},#{userId})")
    public void save(TOrder order);
//    public TOrder findById(int id);
}
