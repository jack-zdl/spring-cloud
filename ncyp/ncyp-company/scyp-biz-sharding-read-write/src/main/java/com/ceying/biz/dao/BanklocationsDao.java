package com.ceying.biz.dao;

import com.ceying.biz.entity.BanklocationsEntity;
import com.ceying.biz.vo.BanklocationsVO;
import com.ceying.common.util.mybatis.MyMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author: mzq
 * @date: 2018/4/3
 * @description : 开户行dao层
 * @version: 2.0
 */
@Repository
public interface BanklocationsDao extends MyMapper<BanklocationsEntity> {
    List<BanklocationsEntity> list(BanklocationsVO banklocationsVO)  ;

}
