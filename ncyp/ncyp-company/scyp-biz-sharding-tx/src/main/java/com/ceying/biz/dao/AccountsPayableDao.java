package com.ceying.biz.dao;

import com.ceying.biz.entity.AccountsPayableEntity;
import com.ceying.biz.query.AccountsPayableTasksQuery;
import com.ceying.biz.query.PayableAndQuoteQuery;
import com.ceying.biz.query.TripartiteAgreementQuery;
import com.ceying.biz.vo.AccountsPayableVo;
import com.ceying.biz.vo.QuoteVO;
import com.ceying.common.util.mybatis.MyMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author: lidf
 * @date: 2018/3/28
 * @description:
 * @version: 2.0
 */

public interface AccountsPayableDao extends MyMapper<AccountsPayableEntity>{

    /**
     * 判断发票号是否已存在
     * @param invoicenumber
     * @return 大于0 则重复
     */
    int existInvoiceNumber(@Param("invoicenumber")String invoicenumber);

    int AccountsPayable(AccountsPayableVo accountsPayableVo);

    AccountsPayableEntity selectByUrid(@Param("urid")String urid);

    PayableAndQuoteQuery selectPayableAndQuote(@Param("urid")String urid, @Param("bankid")String bankid);

    void deleteByUrid(@Param("urid")String urid);

    List<AccountsPayableEntity> selectByUridList( List<String> uridList);

    int updateAccountsPay(AccountsPayableEntity accountsPayableEntity);

    List<AccountsPayableTasksQuery> selectPayableCount(@Param("supplierid")String supplierid,@Param("list") List<String> list);

    List<AccountsPayableEntity> listAccBySql(String sql);

    /**
     * @description 查询到期的应付账款信息
     *
     * @author Meow
     * @date 2018-5-23
     * @param []
     * @return java.util.List<com.ceying.biz.entity.AccountsPayableEntity>
     */
    List<AccountsPayableEntity> listExpireAccountsPayable(@Param("accountsPayableCode")Integer accountsPayableCode);

    List<TripartiteAgreementQuery> listByUrid(@Param("orgId")String orgId);

    List<PayableAndQuoteQuery> listPayableAndQuote(QuoteVO vo);
}
