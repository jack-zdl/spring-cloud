/*
 * Copyright (c) 2017 CeYing and/or its affiliates. All rights reserved.
 * CeYing PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 *
 */
package com.ceying.biz.controller;

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
import java.math.BigDecimal;
import java.math.BigInteger;
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
        logger.info(list1.size());
        List<TripartiteAgreementEntity> list = tripartiteAgreementDao.listAllTest();
        logger.info(list.size());
        return MessageUtil.Success();
    }

    @GetMapping(value = "/doinsharding")
    public BaseReturnResult doinsharding() throws Exception {
        List<TripartiteAgreementEntity> list1 = tripartiteAgreementDao.betTest();
        logger.info(list1.size());
        List<TripartiteAgreementEntity> list = tripartiteAgreementDao.inTest();
        logger.info(list.size());
        return MessageUtil.Success();
    }

}
