package com.ceying.biz.dao;

import com.ceying.biz.entity.AccountsPayableQuoteEntity;
import com.ceying.biz.vo.AccountsPayableQuoteVo;
import com.ceying.common.util.mybatis.MyMapper;
import org.springframework.stereotype.Repository;

import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author: lidf
 * @date: 2018/3/29
 * @description:
 */
@Repository
public interface AccountsPayableQuoteDao extends MyMapper<AccountsPayableQuoteEntity> {

    List<AccountsPayableQuoteEntity> selectByParams(AccountsPayableQuoteVo vo);

    AccountsPayableQuoteEntity selectByUrid(@Param("urid") String urid);

    
}
