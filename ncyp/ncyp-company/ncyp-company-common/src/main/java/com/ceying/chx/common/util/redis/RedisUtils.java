package com.ceying.chx.common.util.redis;


import com.ceying.chx.common.exception.RedisConnectException;
import com.ceying.chx.common.util.response.RespJson;
import com.ceying.chx.common.util.response.RespJsonFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.DataType;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * 功能说明: redis的使用工具<br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2017/11/14 8:55<br>
 * <br>
 */
@Component
public class RedisUtils {

    @Resource
    private RedisTemplate redisTemplate;

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    /**
     * 获得单个redis数据
     * @param param
     * @return
     * @throws RedisConnectException
     */
    public
    RespJson get(Map<String, Object> param) throws RedisConnectException {
        RespJson respJson = null;
        Object object = null;
        try {
            DataType type = redisTemplate.type(param.get("key"));
            if (DataType.NONE == type) {
                respJson = RespJsonFactory.buildFailure("没有查询到！");
                return respJson;
            } else if (DataType.STRING == type) {
                object = redisTemplate.opsForValue().get(param.get("key"));
            } else if (DataType.LIST == type) {
                object = redisTemplate.opsForList().range(param.get("key"), 0, -1);
            } else if (DataType.HASH == type) {
                object = redisTemplate.opsForHash().entries(param.get("key"));
            }
            respJson = RespJsonFactory.buildSuccess(object);
        }catch (Exception e){
            e.printStackTrace();
            throw new RedisConnectException();
        }
        return respJson;
    }

    /**
     * 保存redis
     * @param param 要存进去的key-value
     * @param dateTime  设置缓存的时间，单位秒,如何设置时间为小于0,即自动不设置缓存时间
     * @return
     * @throws RedisConnectException
     */
    public  RespJson save( Map<String, Object> param,long dateTime) throws RedisConnectException {
        RespJson respJson = null;
        Iterator<Map.Entry<String, Object>> entries = param.entrySet().iterator();//使用这个线程安全
        try {
            if(0 >= dateTime){
                while (entries.hasNext()) {
                    Map.Entry<String, Object> entry = entries.next();
                    redisTemplate.opsForValue().set(entry.getKey(), entry.getValue());//向redis里存入数据和设置缓存时间  后二位数据一个是时间数字，单位
                }
            }else {
                while (entries.hasNext()) {
                    Map.Entry<String, Object> entry = entries.next();
                    redisTemplate.opsForValue().set(entry.getKey(), entry.getValue(),dateTime, TimeUnit.SECONDS);//向redis里存入数据和设置缓存时间  后二位数据一个是时间数字，单位
                }
            }
            respJson = RespJsonFactory.buildSuccess("redis数据存储成功！");
        }catch (Exception e){
            e.printStackTrace();
            throw new RedisConnectException();
        }
        return respJson;
    }

    /**
     * 删除reids数据
     * @param id
     * @return
     * @throws RedisConnectException
     */
    public  RespJson remove(String id) throws RedisConnectException {
        RespJson respJson = null;
        try {
            redisTemplate.delete(id);
            respJson = RespJsonFactory.buildSuccess("删除成功！");
        } catch (Exception e) {
            throw new RedisConnectException();
        }
        return respJson;
    }

}
