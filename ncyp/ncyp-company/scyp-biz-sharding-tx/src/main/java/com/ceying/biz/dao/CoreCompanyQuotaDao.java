package com.ceying.biz.dao;

import com.ceying.biz.entity.CoreCompanyQuotaEntity;
import com.ceying.common.util.mybatis.MyMapper;
import org.springframework.stereotype.Repository;

/**
 * 核心企业额度表的Dao层
 * @see CoreCompanyQuotaEntity
 * @author zhangdl
 * @version class v1.0
 * @date 2017/7/17 11:55
 */
@Repository
public interface CoreCompanyQuotaDao extends MyMapper<CoreCompanyQuotaEntity> {
}
