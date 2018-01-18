package com.ceying.chx.biz.base.service.impl;

import com.ceying.chx.biz.base.common.CommonDictionaryService;
import com.ceying.chx.biz.base.service.DictionaryService;
import com.ceying.chx.common.entity.TdictionaryEntity;
import com.ceying.chx.common.util.response.ParamRespJson;
import com.ceying.chx.common.util.response.RespJson;
import com.ceying.chx.common.util.response.RespJsonFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.awt.image.Kernel;
import java.util.ArrayList;
import java.util.List;

/**
 * 功能说明: <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/15 23:43<br>
 */
@Service
public class DictionaryServiceImpl implements DictionaryService{

    @Resource
    private CommonDictionaryService commonDictionaryServiceImpl;

    @Override
    public
    RespJson selectParam(HttpServletRequest request, Integer keyno) {
        TdictionaryEntity tdictionaryEntity = new TdictionaryEntity();
        tdictionaryEntity.setlKeyno(keyno);
        List<TdictionaryEntity> list = commonDictionaryServiceImpl.list(tdictionaryEntity);
        List<ParamRespJson> paramRespJsonlist = new ArrayList<ParamRespJson>();
        for (int a = 0;a<list.size();a++) {
            if(list.get(a).getcKeyvalue().equals("#")){
                continue;
            }
            ParamRespJson paramRespJson = RespJsonFactory.buildSuccess(list.get(a).getcCaption(),
                    list.get(a).getcKeyvalue());
            paramRespJsonlist.add(paramRespJson);
        }
        RespJson respJson = RespJsonFactory.buildSuccess(paramRespJsonlist);
        return respJson;
    }
}
