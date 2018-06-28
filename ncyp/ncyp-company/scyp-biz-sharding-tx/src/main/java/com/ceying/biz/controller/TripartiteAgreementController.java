/*
 * Copyright (c) 2017 CeYing and/or its affiliates. All rights reserved.
 * CeYing PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 *
 */
package com.ceying.biz.controller;

import com.ceying.biz.config.shardingjdbc.SoftTransactionManager;
import com.ceying.biz.config.shardingjdbc.XbDataSource;
import com.ceying.biz.dao.AccountsPayableDao;
import com.ceying.biz.dao.AccountsPayableQuoteDao;
import com.ceying.biz.dao.TripartiteAgreementDao;
import com.ceying.biz.entity.AccountsPayableEntity;
import com.ceying.biz.entity.TripartiteAgreementEntity;
import com.ceying.common.enums.SysCodeEnum;
import com.ceying.common.enums.TripartiteAgreementEnum;
import com.ceying.common.system.constants.BaseConstants;
import com.ceying.common.util.datetools.DateUtil;
import com.ceying.common.util.properties.MessageUtil;
import com.ceying.common.util.response.BaseReturnResult;
import com.ceying.common.util.sequence.SequenceUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import sun.misc.BASE64Decoder;

import javax.sql.DataSource;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

/**
 * @author: zhangdl <br>
 * @date: 2018/3/28 16:51 <br>
 * @version: 2.0 <br>
 * @description: 三方协议控制层 <br>
 */
@RestController
@RequestMapping("/tripartiteagreement")
public class TripartiteAgreementController implements BaseConstants {

    protected final Logger logger = Logger.getLogger(this.getClass());
    @Autowired
    private AccountsPayableDao accountsPayableDao;
    @Autowired
    private TripartiteAgreementDao tripartiteAgreementDao;


    @GetMapping(value = "/save")
    public BaseReturnResult saveTripartiteAgreement() throws Exception {
        BaseReturnResult result;
        String a = "8f14edd0587b4bec97cb25ee3ad7562a";
        List<TripartiteAgreementEntity> list = tripartiteAgreementDao.payableHaveActiveAgreement(a);
//        //获得三方协议编号
        TripartiteAgreementEntity tripartiteAgreement = new TripartiteAgreementEntity();
        tripartiteAgreement.setUrid(SequenceUtil.UUID());
        tripartiteAgreement.setTenantid(10000);
        tripartiteAgreement.setTacontractid("TA20000021805290004");
        tripartiteAgreement.setTatemplateid("1");
        tripartiteAgreement.setAccountspayableid("11111");
        tripartiteAgreement.setAccountspayablequoteid("11111");
        tripartiteAgreement.setBankid("1111");
        tripartiteAgreement.setCorecompanyid("1111");
        tripartiteAgreement.setSupplierid("1111");
        tripartiteAgreement.setSupplieraccountid("1");

        BigDecimal accountMoney = new BigDecimal(BigInteger.ZERO);
        tripartiteAgreement.setFinancingamount(accountMoney);
        tripartiteAgreement.setFinancingdate(new Date());
        // 有追类型
        tripartiteAgreement.setIsrecourse("1");
        tripartiteAgreement.setIsactive(TripartiteAgreementEnum.EFFECTIVE.getKey());
        tripartiteAgreement.setInterestrate(accountMoney);

        tripartiteAgreement.setEstimatereturndate(new Date());
        tripartiteAgreement.setApprovestate(TripartiteAgreementEnum.waitForApprove.getValue());
        BASE64Decoder decoder = new BASE64Decoder();
        tripartiteAgreement.setSignaturecontent(decoder.decodeBuffer(""));

        tripartiteAgreement.setSupplierrate(accountMoney);
        // 平台付给核心企业的费率
        tripartiteAgreement.setCorecompanyrate(accountMoney);
        tripartiteAgreement.setSupplastoperateflag(String.valueOf(TripartiteAgreementEnum.SUPPLIERINITIALFINANCINGREQUEST.getKey()));
        tripartiteAgreement.setCorelastoperateflag(String.valueOf(TripartiteAgreementEnum.approvetransitsign.getKey()));
        tripartiteAgreement.setBanklastoperateflag(String.valueOf(TripartiteAgreementEnum.approvetransitsign.getKey()));
        tripartiteAgreement.setCreatedby("admin");
        tripartiteAgreement.setCreatedon(DateUtil.getCurrentDateTime());
        tripartiteAgreement.setRowversion(Integer.valueOf(SysCodeEnum.VERSION.getValue()));
        tripartiteAgreement.setDescription( "1111111111:发起三方协议");
        tripartiteAgreement.setPdfContent(decoder.decodeBuffer("1111"));
        tripartiteAgreementDao.insertSelectiveStrictly(tripartiteAgreement);
            result = MessageUtil.Success();
        return result;
    }

    @GetMapping(value = "/saveTri")
    public BaseReturnResult saveTri() throws Exception {
        BaseReturnResult result;
        String a = "8f14edd0587b4bec97cb25ee3ad7562a";
//        List<TripartiteAgreementEntity> list = tripartiteAgreementDao.payableHaveActiveAgreement(a);
//        //获得三方协议编号
        TripartiteAgreementEntity tripartiteAgreement = new TripartiteAgreementEntity();
        tripartiteAgreement.setUrid(SequenceUtil.UUID());
        tripartiteAgreement.setTenantid(10000);
        tripartiteAgreement.setTacontractid("TA20000021805290004");
        tripartiteAgreement.setTatemplateid("1");
        tripartiteAgreement.setAccountspayableid("11111");
        tripartiteAgreement.setAccountspayablequoteid("11111");
        tripartiteAgreement.setBankid("1111");
        tripartiteAgreement.setCorecompanyid("1111");
        tripartiteAgreement.setSupplierid("1111");
        tripartiteAgreement.setSupplieraccountid("1");

        BigDecimal accountMoney = new BigDecimal(BigInteger.ZERO);
        tripartiteAgreement.setFinancingamount(accountMoney);
        tripartiteAgreement.setFinancingdate(new Date());
        // 有追类型
        tripartiteAgreement.setIsrecourse("1");
        tripartiteAgreement.setIsactive(TripartiteAgreementEnum.EFFECTIVE.getKey());
        tripartiteAgreement.setInterestrate(accountMoney);

        tripartiteAgreement.setEstimatereturndate(new Date());
        tripartiteAgreement.setApprovestate(TripartiteAgreementEnum.waitForApprove.getValue());
        BASE64Decoder decoder = new BASE64Decoder();
        tripartiteAgreement.setSignaturecontent(decoder.decodeBuffer(""));

        tripartiteAgreement.setSupplierrate(accountMoney);
        // 平台付给核心企业的费率
        tripartiteAgreement.setCorecompanyrate(accountMoney);
        tripartiteAgreement.setSupplastoperateflag(String.valueOf(TripartiteAgreementEnum.SUPPLIERINITIALFINANCINGREQUEST.getKey()));
        tripartiteAgreement.setCorelastoperateflag(String.valueOf(TripartiteAgreementEnum.approvetransitsign.getKey()));
        tripartiteAgreement.setBanklastoperateflag(String.valueOf(TripartiteAgreementEnum.approvetransitsign.getKey()));
        tripartiteAgreement.setCreatedby("admin");
        tripartiteAgreement.setCreatedon(DateUtil.getCurrentDateTime());
        tripartiteAgreement.setRowversion(Integer.valueOf(SysCodeEnum.VERSION.getValue()));
        tripartiteAgreement.setDescription( "1111111111:发起三方协议");
        tripartiteAgreement.setPdfContent(decoder.decodeBuffer("1111"));
        tripartiteAgreementDao.insertTripartite(tripartiteAgreement);
        result = MessageUtil.Success();
        return result;
    }

    @GetMapping(value = "/listAccount")
    public BaseReturnResult listAccount()  {
        List<AccountsPayableEntity> list = accountsPayableDao.listExpireAccountsPayable(1);
        logger.info(list.size());
        List<AccountsPayableEntity> list1 = accountsPayableDao.selectAll();
        logger.info(list1.size());
        return MessageUtil.Success();
    }

    @GetMapping(value = "/listTripartite")
    public BaseReturnResult listTripartite() throws Exception {
        List<TripartiteAgreementEntity> list1 = tripartiteAgreementDao.selectAll();
        logger.error("------------------------------------------------------");
        logger.info(list1.size());
        List<TripartiteAgreementEntity> list = tripartiteAgreementDao.listAllTest();
        logger.info(list.size());
        logger.error("------------------------------------------------------");
        return MessageUtil.Success(list.size());
    }

    @GetMapping(value = "/doinsharding")
    public BaseReturnResult doinsharding() throws Exception {
        List<TripartiteAgreementEntity> list1 = tripartiteAgreementDao.betTest();
        logger.info(list1.size());
        List<TripartiteAgreementEntity> list = tripartiteAgreementDao.inTest();
        logger.info(list.size());
        return MessageUtil.Success();
    }

    @Autowired
    private XbDataSource xbDataSource;

    @GetMapping(value = "/read")
    public BaseReturnResult readWrite() throws Exception {
        DataSource dataSource = xbDataSource.getShardingDataSource();
        printSimpleSelect(dataSource);
        return MessageUtil.Success();
    }

        private static void printSimpleSelect(final DataSource dataSource) throws SQLException {
            String sql = "SELECT * FROM t_biz_tripartiteagreement";
            try (
                    Connection conn = dataSource.getConnection();
                    PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
                try (ResultSet rs = preparedStatement.executeQuery()) {
                    while (rs.next()) {
                        System.out.println(rs);
                    }
                }
            }
        }

    private static void updateFailure(final DataSource dataSource) throws SQLException {
        String sql1 = "UPDATE t_order SET status='UPDATE_1' WHERE user_id=10 AND order_id=1000";
        String sql2 = "UPDATE t_order SET not_existed_column=1 WHERE user_id=1 AND order_id=?";
        String sql3 = "UPDATE t_order SET status='UPDATE_2' WHERE user_id=10 AND order_id=1000";
//        SoftTransactionManager transactionManager = new SoftTransactionManager(getSoftTransactionConfiguration(dataSource));
//        transactionManager.init();
//        BEDSoftTransaction transaction = (BEDSoftTransaction) transactionManager.getTransaction(SoftTransactionType.BestEffortsDelivery);
//        Connection conn = null;
//        try {
//            conn = dataSource.getConnection();
//            transaction.begin(conn);
//            PreparedStatement preparedStatement1 = conn.prepareStatement(sql1);
//            PreparedStatement preparedStatement2 = conn.prepareStatement(sql2);
//            preparedStatement2.setObject(1, 1000);
//            PreparedStatement preparedStatement3 = conn.prepareStatement(sql3);
//            preparedStatement1.executeUpdate();
//            preparedStatement2.executeUpdate();
//            preparedStatement3.executeUpdate();
//        } finally {
//            transaction.end();
//            if (conn != null) {
//                conn.close();
//            }
//        }
    }

}
