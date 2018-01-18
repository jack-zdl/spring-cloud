package com.ceying.chx.biz.base.service.impl;


import com.ceying.chx.biz.base.service.NavBarService;
import com.ceying.chx.common.dao.NavBarDao;
import com.ceying.chx.common.dto.NavBarDto;
import com.ceying.chx.common.util.response.RespJson;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: dengqz
 * 开发时间: 2018/1/5<br>
 * <br>
 *
 */
@Service
public class NavBarServiceImpl implements NavBarService {
    @Resource
    private NavBarDao navBarDao;
    @Override
    public RespJson queryNavBar(String menuCode,String userId) {
        RespJson respJson=new RespJson();
        try {
            Map<String, Object> m = new HashMap<String, Object>();
            m.put("menuCode", menuCode);
            m.put("userId", userId);
            List<NavBarDto> list = navBarDao.queryNavBar(m);
            //JSONObject.toJSON
            respJson.setData(list);
            respJson.setCode(1);
        }catch (Exception e){
            e.printStackTrace();
            respJson.setData(-1);
            respJson.setMsg("查询失败");
        }
        return respJson;
    }
}
