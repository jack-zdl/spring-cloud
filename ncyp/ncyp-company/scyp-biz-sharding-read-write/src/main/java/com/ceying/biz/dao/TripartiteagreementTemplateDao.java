package com.ceying.biz.dao;


import com.ceying.biz.entity.TripartiteagreementTemplateEntity;
import com.ceying.common.util.mybatis.MyMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface TripartiteagreementTemplateDao extends MyMapper<TripartiteagreementTemplateEntity>{


    List<TripartiteagreementTemplateEntity>  getTripartiagreementTemplateList(@Param("bankId") String bankId, @Param("corecompanyId") String corecompanyId, @Param("businessType") String businessType);

    List<TripartiteagreementTemplateEntity>  getAllTripartiagreementTemplateList(@Param("orgId") String orgId);

    TripartiteagreementTemplateEntity getByCode(Map<String,Object> param);

    List<TripartiteagreementTemplateEntity> selectByUridList(List<String> uridList);
}