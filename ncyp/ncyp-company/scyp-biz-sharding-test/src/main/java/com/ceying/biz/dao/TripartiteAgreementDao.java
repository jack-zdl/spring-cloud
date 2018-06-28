/*
 * Copyright (c) 2017 CeYing and/or its affiliates. All rights reserved.
 * CeYing PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 *
 */
package com.ceying.biz.dao;

import com.ceying.biz.dto.TripartiteDoneDto;
import com.ceying.biz.entity.TripartiteAgreementEntity;
import com.ceying.biz.query.TripartiteAgreementDoneQuery;
import com.ceying.biz.query.TripartiteAgreementQuery;
import com.ceying.biz.query.TripartiteAgreementTaskQuery;
import com.ceying.common.util.mybatis.MyMapper;
import feign.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 三方协议表DAO层
 * @author zhangdl
 * @version v1.0
 * @date 2017/7/14
 */
@Repository
public interface TripartiteAgreementDao extends MyMapper<TripartiteAgreementEntity> {

    /** 
    * 查询在途的三方协议
    * @Param: [orgId] 
    * @return: java.util.List<com.ceying.biz.entity.TripartiteAgreementEntity> 
    * @Author: zhangdl
    * @Date: 2018/4/10 
    */ 
    List<TripartiteAgreementQuery> listTripartiteAgreement(TripartiteDoneDto doneDto );

    /**
     * 查询已完成的三方协议
     * @Param: [orgId]
     * @return: java.util.List<com.ceying.biz.entity.TripartiteAgreementEntity>
     * @Author: zhangdl
     * @Date: 2018/4/10
     */
    List<TripartiteAgreementDoneQuery> listDoneTripartiteAgreement(TripartiteDoneDto doneDto);
    List<TripartiteAgreementDoneQuery> selectDoneTripartiteAgreement(@Param("urid") String urid);

    /**
     * 查询指定三方协议
     * @Param: [orgId]
     * @return: java.util.List<com.ceying.biz.entity.TripartiteAgreementEntity>
     * @Author: zhangdl
     * @Date: 2018/4/10
     */
    List<TripartiteAgreementEntity> listTripartiteAgreementById(Map<String,Object> paramMap );


    /**
     *
     * @Param: []  所有的三方协议id
     * @return: java.util.List<com.ceying.biz.entity.TripartiteAgreementEntity>
     * @Author: zhangdl
     * @Date: 2018/4/19
     */
    List<TripartiteAgreementTaskQuery> selectByUridList(List<String> uridList);

    Boolean isApprovedById(String id);

    int updateLendingdate(String urid);

    /**
     * 查询应付账款的有效三方协议
     * @param accountspayableid
     * @return
     */
    List<TripartiteAgreementEntity> payableHaveActiveAgreement(String accountspayableid);
    String sumFinancingamount(@Param("bankid") String var1, @Param("corecompanyid") String var2);

    List<TripartiteAgreementEntity> listAllTest();

    List<TripartiteAgreementEntity> betTest();

    List<TripartiteAgreementEntity> inTest();

    int insertTripartite(TripartiteAgreementEntity tripartiteAgreementEntity);
}
