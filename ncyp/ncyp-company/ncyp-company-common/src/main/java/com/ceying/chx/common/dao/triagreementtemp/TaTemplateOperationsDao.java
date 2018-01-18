package com.ceying.chx.common.dao.triagreementtemp;

import com.ceying.chx.common.dao.CrudDao;
import com.ceying.chx.common.entity.triagreementtemp.TaTemplateOperations;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * Created by mzq on 2018/1/2.
 */
@Repository
public interface TaTemplateOperationsDao extends CrudDao<TaTemplateOperations> {
    int deleteByPrimaryKey(String urid);

    int insert(TaTemplateOperations record);

    int insertSelective(TaTemplateOperations record);

    TaTemplateOperations selectByPrimaryKey(String urid);

    int updateByPrimaryKeySelective(TaTemplateOperations record);

    int updateByPrimaryKey(TaTemplateOperations record);

    int deleteByTatemplateId(@Param("tatemplateId") String tatemplateId);
}
