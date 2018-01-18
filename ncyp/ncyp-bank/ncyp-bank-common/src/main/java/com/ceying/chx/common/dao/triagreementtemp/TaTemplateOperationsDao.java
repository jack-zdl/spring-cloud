package com.ceying.chx.common.dao.triagreementtemp;

import com.ceying.chx.common.dao.CrudDao;
import com.ceying.chx.common.entity.triagreementtemp.TaTemplateOperationsEntity;
import com.ceying.chx.common.entity.triagreementtemp.TripartiteagreementTemplateEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

/**
 * Created by mzq on 2018/1/2.
 */
@Repository
public interface TaTemplateOperationsDao extends CrudDao<TaTemplateOperationsEntity>, Mapper<TaTemplateOperationsEntity> {
//    int deleteByPrimaryKey(@Param(value = "urid") String urid);

//    int insert(TaTemplateOperationsEntity record);

//    int insertSelective(TaTemplateOperationsEntity record);

//    TaTemplateOperationsEntity selectByPrimaryKey(@Param(value = "urid") String urid);

//    int updateByPrimaryKeySelective(TaTemplateOperationsEntity record);

//    int updateByPrimaryKey(TaTemplateOperationsEntity record);

    int deleteByTatemplateId(@Param("tatemplateId") String tatemplateId);
}
