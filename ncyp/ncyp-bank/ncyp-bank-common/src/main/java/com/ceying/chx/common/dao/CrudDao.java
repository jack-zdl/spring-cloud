package com.ceying.chx.common.dao;

import java.util.List;
import java.util.Map;

/**
 * 功能说明: 这是使用了泛型，具体根据传入的值来判断传入类型
 *          <p>使用这些方法是为了避免跟mybatis的通用mapper中默认的方法冲突</p><br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl
 * 开发时间: 2017/11/6 16:42<br>
 * <br>
 */
public interface CrudDao<T> {

    /**
     * 查询所有的元素
     * @return
     */
    List<T> list();

    /**
     * 根据实体类参数查询所有的元素
     * @param param 实体类
     * @return list
     */
    List<T> list(T param);

    /**
     * 根据实体类参数查询所有的元素
     * @param param map参数
     * @return list
     */
    List<T> list(Map param);

    /**
     * 查询单个记录
     * @param id 主键id
     * @return T
     */
    T get(String id);

    /**
     *  新增对象
     * @param entiry 实体类
     * @return int
     */
    int save(T entiry);

    /**
     *  更新记录
     * @param entity 实体类
     * @return int
     */
    int update(T entity);
    //int update(Map param);
    /**
     *  删除
     * @param id 主键id
     * @return int
     */
    int remove(String id);
}
