package com.ceying.chx.common.dao.triagreementtemp;


import com.ceying.chx.common.dao.CrudDao;
import com.ceying.chx.common.entity.triagreementtemp.TripartiteagreementTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by mzq on 2018/1/2.
 */
@Repository
public interface TripartiteagreementTemplateDao extends CrudDao<TripartiteagreementTemplate> {
    int selectForSame (TripartiteagreementTemplate TripartiteAgreementTemplate);

    int deleteByPrimaryKey(String urid);

    int insert(TripartiteagreementTemplate record);

    int insertSelective(TripartiteagreementTemplate record);

    TripartiteagreementTemplate selectByPrimaryKey(String urid);

    int updateByPrimaryKeySelective(TripartiteagreementTemplate record);

    int updateByPrimaryKeyWithBLOBs(TripartiteagreementTemplate record);

    int updateByPrimaryKey(TripartiteagreementTemplate record);

    List<TripartiteagreementTemplate> selectListBySelective(TripartiteagreementTemplate TripartiteAgreementTemplate);
}
