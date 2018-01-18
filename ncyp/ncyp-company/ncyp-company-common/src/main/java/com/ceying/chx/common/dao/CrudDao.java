package com.ceying.chx.common.dao;

import java.util.List;
import java.util.Map;

/**
 * 功能说明: 这是使用了泛型，具体根据传入的值来判断传入类型<br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl
 * 开发时间: 2017/11/6 16:42<br>
 * <br>
 */
public interface CrudDao<T> {
    /**
     *@description 查询所有的元素
     * @return
     */
    List<T> list();

    /**
     *@description 查询所有的元素
     * @param param
     * @return
     */
    List<T> list(Map<String, Object> param);

    /**
     * @description 查询单个记录
     * @param id
     * @return
     */
    T get(String id);

    /**
     * @description 新增对象
     * @param entiry
     * @return
     */
    int save(T entiry);

    /**
     * @description 更新记录
     * @param entity
     * @return
     */
    int update(T entity);
    //int update(Map param);
    /**
     * @description 删除
     * @param id
     * @return
     */
    int remove(String id);
}
