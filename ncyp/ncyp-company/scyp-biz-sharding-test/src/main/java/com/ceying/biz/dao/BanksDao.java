package com.ceying.biz.dao;

import com.ceying.biz.entity.BanksEntity;
import com.ceying.biz.vo.BanksVO;
import com.ceying.common.util.mybatis.MyMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author: mzq
 * @date: 2018/4/3
 * @description :
 * @version: 2.0
 */
@Repository
public interface BanksDao extends MyMapper<BanksEntity> {
    List<BanksEntity> list(BanksVO areasVO)  ;
}
