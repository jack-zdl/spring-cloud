package com.ceying.biz.dao;

import com.ceying.biz.entity.UniqueCodesEntity;
import com.ceying.common.util.mybatis.MyMapper;
import org.springframework.stereotype.Repository;

/**
 * @author: zhangdl<br>
 * @date: 2018/3/30 11:28<br>
 * @version: 2.0 <br>
 * @description: 唯一键表<br>
 */
@Repository
public interface UniqueCodesDao extends MyMapper<UniqueCodesEntity> {
}
