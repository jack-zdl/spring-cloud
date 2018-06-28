package com.ceying.biz.service.impl;

import com.ceying.biz.service.SysMenuService;
import com.ceying.chx.common.dao.SysMenuDao;
import com.ceying.chx.common.dto.SysMenuDto;
import com.ceying.chx.common.util.response.RespJson;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: miaozhenqing
 * 开发时间: 2017/12/27<br>
 * <br>
 */
@Service
public class SysMenuServiceImpl implements SysMenuService {
    @Resource
    private SysMenuDao sysMenuDao;
    @Override
    public
    RespJson queryMenu(SysMenuDto sysMenuDto) {
        RespJson respJson=new RespJson();
        try {
            List<SysMenuDto> list = sysMenuDao.queryByParentCode(sysMenuDto);
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
