package com.cyp.chx.rcenter.regist;

import java.util.List;
import java.util.Map;

/**
 * @Author：huanghaiyun
 * @Date:2017/12/7
 */
public interface RegistService {

    /**
     * 服务注册注册
     * @param url
     * @param name
     * @return
     */
    List<String> regist(String url, String name);

    /**
     * 清除
     * @param name
     * @return
     */
    long clean(String name);

    /**
     * 根据 服务名 获取连接地址
     * @param name
     * @return
     */
    String getUrl(String name);

    /**
     * 注册通知  注册中心同步数据
     * @param url
     * @param name
     */
    void registNotify(String url, String name);
    /**
     * 同步服务数据
     * @param map
     */
    void registNotify(Map<Object,Object>map);

    /**
     * 获取当前服务器状态
     * @return 权重值
     */
    long getState();

}
