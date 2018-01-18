package com.ceying.chx.common.service;

import java.util.List;
import java.util.Map;

/**
 * 功能说明: 基础增删改查接口方法<br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/11 22:16<br>
 */
public interface CurdService<T>  {
    /**
     * 查询所有的元素
     * @return  List<T>
     */
    List<T> list();

    /**
     * 根据类参数查询所有的元素
     * @param param 参数
     * @return list
     */
    List<T> list(T param);

    /**
     * 根据主键id查询单个记录
     * @param id 主键
     * @return T
     */
    T get(String id);

    /**
     * 更新记录
     * @param entity T
     * @return int
     */
    int update(T entity);

    /**
     * 根据主键id删除
     * @param id 主键
     * @return int
     */
    int remove(String id);

    /**
     * 新增实体类
     * @param entity
     * @return
     */
    int insert(T entity);
}
