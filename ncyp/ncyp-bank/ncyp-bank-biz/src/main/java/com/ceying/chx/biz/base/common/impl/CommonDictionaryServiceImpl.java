package com.ceying.chx.biz.base.common.impl;

import com.ceying.chx.biz.base.common.CommonDictionaryService;
import com.ceying.chx.common.dao.TdictionaryDao;
import com.ceying.chx.common.entity.TdictionaryEntity;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 功能说明: <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/15 23:49<br>
 */
@Service
public class CommonDictionaryServiceImpl implements CommonDictionaryService{

    @Resource
    private TdictionaryDao tdictionaryDao;
    @Override
    public
    List<TdictionaryEntity> list() {
        return null;
    }

    @Override
    public
    List<TdictionaryEntity> list(TdictionaryEntity param) {
        List<TdictionaryEntity> list = tdictionaryDao.list(param);
        return list;
    }

    @Override
    public
    TdictionaryEntity get(String id) {
        return null;
    }

    @Override
    public
    int update(TdictionaryEntity entity) {
        return 0;
    }

    @Override
    public
    int remove(String id) {
        return 0;
    }

    @Override
    public
    int insert(TdictionaryEntity entity) {
        return 0;
    }
}
