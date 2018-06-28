package com.ceying.biz.dao;

import com.ceying.biz.entity.TimestampEntity;
import com.ceying.common.util.mybatis.MyMapper;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: yangxh
 * 开发时间: 2018/3/5<br>
 * <br>
 */
public interface TimestampDao extends MyMapper<TimestampEntity> {


//    public
//    TimestampDao(IDBSession session) {
//        super("T_TIMESTAMP", new String[]{"urid"}, Timestamp.class, session);
//    }
//
//    public void saveTimestamp(Timestamp timestamp) throws Exception {
//        this.saveWithBlob(timestamp);
//    }
//
//    public void editTimestamp(Timestamp timestamp) throws Exception {
//        this.updateWithBlob(timestamp);
//    }
}
