package com.ceying.chx.biz.base.service.impl;

import com.ceying.chx.biz.base.service.SysParamterService;
import com.ceying.chx.common.dao.SysParamterDao;
import com.ceying.chx.common.dto.DictionaryBean;
import com.ceying.chx.common.dto.Parameter;
import com.ceying.chx.common.dto.SysParameterDto;
import org.apache.commons.lang.StringUtils;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;

import javax.annotation.Resource;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: miaozhenqing
 * 开发时间: 2017/12/21<br>
 * <br>
 */
@Service
public class SysParamterServiceImpl implements SysParamterService {

    @Resource
    private SysParamterDao sysParamterDao;
    @Resource
    private RedisTemplate<String,Parameter> redisTemplate;

    @Override
    public  SysParameterDto getCacheInfo(int tenantId,  String paramCode, String orgId) throws Exception {
        System.out.println(tenantId+" "+paramCode+" "+orgId);
        SysParameterDto sysParameterDto = new SysParameterDto();
        RedisConnection redisconnection = null;
        if(StringUtils.isBlank(paramCode) || StringUtils.isEmpty(paramCode)){
            throw new Exception("系统参数Key不能为空！");
        }

        try {
            List<DictionaryBean> page = new ArrayList<DictionaryBean>();
            List<SysParameterDto>  diclist =  new ArrayList<SysParameterDto>();

            //从缓存获取数据字典
//            redisconnection = redisTemplate.getConnectionFactory().getConnection();//暂时去掉

            //需要针对组织进行优化
            String key = tenantId + "_" + paramCode;
            List<byte[]> paramRedisList=new ArrayList<byte[]>();
//            paramRedisList = redisconnection.lRange(key.getBytes(),0L, -1L);//暂时去掉

            if(paramRedisList.size()==0){

                sysParameterDto.setTenantId(tenantId);
                sysParameterDto.setRelOrg(orgId);
                sysParameterDto.setParamCode(paramCode);
                diclist = sysParamterDao.queryAll(sysParameterDto);
                if(diclist.size()>0){
                    redisconnection.lPush(key.getBytes(), diclist.get(0).getParamValue().getBytes());
                }
            } else {
                for(byte[] paramValByte:paramRedisList) {
                    String paramValue = new String(paramValByte);
                    sysParameterDto.setParamValue(paramValue);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if(redisconnection != null)
                redisconnection.close();
        }
        return sysParameterDto;
    }
}
