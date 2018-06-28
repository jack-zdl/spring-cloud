/*
 * The MIT License (MIT)
 *
 * Copyright (c) 2014-2016 abel533@gmail.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package com.ceying.common.util.mybatis;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ceying.common.constant.*;
import com.ceying.common.enums.ExceptionCodeEnum;
import com.ceying.common.util.annotation.*;
import com.ceying.common.util.cache.CacheManage;
import com.ceying.common.util.stringtools.FString;
import com.ceying.common.util.user.GetUserUtil;
import com.github.pagehelper.PageHelper;
import tk.mybatis.mapper.common.Marker;
import tk.mybatis.mapper.common.base.delete.DeleteByPrimaryKeyMapper;
import tk.mybatis.mapper.common.base.delete.DeleteMapper;
import tk.mybatis.mapper.common.base.insert.InsertSelectiveMapper;
import tk.mybatis.mapper.common.base.select.*;
import tk.mybatis.mapper.common.base.update.UpdateByPrimaryKeySelectiveMapper;
import tk.mybatis.mapper.common.example.*;
import tk.mybatis.mapper.entity.Example;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * 继承自己的MyMapper
 * <p>
 * 开发人员: Cheese
 * 开发时间: 2018/2/1<br>
 */
public interface MyMapper<T> extends
        ExistsWithPrimaryKeyMapper<T>,//根据主键字段查询总数，方法参数必须包含完整的主键属性，查询条件使用等号
        SelectAllMapper<T>,//查询全部结果
        SelectByPrimaryKeyMapper<T>,//根据主键字段进行查询，方法参数必须包含完整的主键属性，查询条件使用等号
        SelectCountMapper<T>,//根据实体中的属性查询总数，查询条件使用等号
        SelectMapper<T>,//根据实体中的属性值进行查询，查询条件使用等号
        SelectOneMapper<T>,//根据实体中的属性进行查询，只能有一个返回值，有多个结果是抛出异常，查询条件使用等号
        InsertSelectiveMapper<T>,//保存一个实体，null的属性不会保存，会使用数据库默认值
        UpdateByPrimaryKeySelectiveMapper<T>,//根据主键更新属性不为null的值
        DeleteByPrimaryKeyMapper<T>,//根据主键字段进行删除，方法参数必须包含完整的主键属性
        DeleteMapper<T>,//根据实体属性作为条件进行删除，查询条件使用等号
        DeleteByExampleMapper<T>,//根据Example条件删除数据
        SelectByExampleMapper<T>,//根据Example条件进行查询
        SelectCountByExampleMapper<T>,//根据Example条件进行查询总数
        SelectOneByExampleMapper<T>,//根据Example条件进行查询
        UpdateByExampleSelectiveMapper<T>,//根据Example条件更新实体`record`包含的不是null的属性值

        Marker {

    default int insertSelectiveStrictly(T record) throws Exception {
        int result = insertSelective(record);
        if (result == 0) {
            throw new Exception(ExceptionCodeEnum.COM0006.getKey());
        }
        return result;
    }

    default int updateByPrimaryKeySelectiveStrictly(T record) throws Exception {
        int result = updateByPrimaryKeySelective(record);
        if (result == 0) {
            throw new Exception(ExceptionCodeEnum.COM0007.getKey());
        }
        return result;
    }

    default int deleteByPrimaryKeyStrictly(Object key) throws Exception {
        int result = deleteByPrimaryKey(key);
        if (result == 0) {
            throw new Exception(ExceptionCodeEnum.COM0008.getKey());
        }
        return result;
    }

    default int deleteStrictly(T record) throws Exception {
        int result = delete(record);
        if (result == 0) {
            throw new Exception(ExceptionCodeEnum.COM0009.getKey());
        }
        return result;
    }

    default int deleteByExampleStrictly(Object key) throws Exception {
        int result = deleteByExample(key);
        if (result == 0) {
            throw new Exception(ExceptionCodeEnum.COM0010.getKey());
        }
        return result;
    }

    default int updateByExampleSelectiveStrictly(T var1, Object var2) throws Exception {
        int result = updateByExampleSelective(var1, var2);
        if (result == 0) {
            throw new Exception(ExceptionCodeEnum.COM0011.getKey());
        }
        return result;
    }

    default List<T> selectByExampleAuto(Object vo, Class<?> entityClass) {
        JSONObject jsonObject = (JSONObject) JSON.toJSON(vo);
        PageHelper.startPage((Integer) jsonObject.get("page"), (Integer) jsonObject.get("rows"));
        Example example = new Example(entityClass);
        Example.Criteria criteria = example.createCriteria();
        StringBuffer orderStr = new StringBuffer();
        String sidx = "";
        String sord = "";
        Field[] fs = vo.getClass().getDeclaredFields();
        for (Field f : fs) {
            String name = f.getName();
            Object obj = jsonObject.get(name);
            //判断是否有查询标签注解
            if (f.isAnnotationPresent(Condition.class)) {
                if (obj != null && FString.isNotBlank(obj.toString())) {
                    Condition con = f.getAnnotation(Condition.class);
                    switch (con.type()) {
                        case ConditionTypeConstant.EQUAL:
                            criteria.andEqualTo(name, obj);
                            break;
                        case ConditionTypeConstant.NOT_EQUAL:
                            criteria.andNotEqualTo(name, obj);
                            break;
                        case ConditionTypeConstant.IN:
                            String[] valueArr = obj.toString().split(",");
                            criteria.andIn(name, Arrays.asList(valueArr));
                            break;
                        case ConditionTypeConstant.NOT_IN:
                            String[] valueArr2 = obj.toString().split(",");
                            criteria.andNotIn(name, Arrays.asList(valueArr2));
                            break;
                        case ConditionTypeConstant.LIKE:
                            criteria.andLike(name, "%" + obj + "%");
                            break;
                        case ConditionTypeConstant.LEFT_LIKE:
                            criteria.andLike(name, "%" + obj);
                            break;
                        case ConditionTypeConstant.RIGHT_LIKE:
                            criteria.andLike(name, obj + "%");
                            break;
                        case ConditionTypeConstant.IS_NULL:
                            criteria.andIsNull(name);
                            break;
                        case ConditionTypeConstant.IS_NOT_NULL:
                            criteria.andIsNotNull(name);
                            break;
                        default:
                            break;
                    }
                }
            }
            //判断是否设置数据隔离
            if (f.isAnnotationPresent(Isolation.class)) {
                Isolation iso = f.getAnnotation(Isolation.class);
                switch (iso.level()) {
                    case IsolationLevelConstant.ORG:
                        criteria.andEqualTo(name, GetUserUtil.getLoginUser().getOrgId());
                        break;
                    case IsolationLevelConstant.RELATE_ORG:
                        criteria.andIn(name, (List<String>) CacheManage.getCache(CacheKeyConstant.ALLRELORG).get(GetUserUtil.getLoginUser().getOrgId()));
                    default:
                        break;
                }
            }
            //租户隔离
            if (f.isAnnotationPresent(TenantIsolation.class)) {
                criteria.andEqualTo(name, GetUserUtil.getLoginUser().getTenantId());
            }
            //判断是否有极值注解
            if (f.isAnnotationPresent(Extreme.class)) {
                Extreme extreme = f.getAnnotation(Extreme.class);
                String field = extreme.field();
                if (obj != null) {
                    switch (extreme.type()) {
                        case ExtremeTypeConstant.GREATER:
                            criteria.andGreaterThan(field, obj);
                            break;
                        case ExtremeTypeConstant.GREATER_EQUAL:
                            criteria.andGreaterThanOrEqualTo(field, obj);
                            break;
                        case ExtremeTypeConstant.LESS:
                            criteria.andLessThan(field, obj);
                            break;
                        case ExtremeTypeConstant.LESS_EQUAL:
                            criteria.andLessThanOrEqualTo(field, obj);
                            break;
                        default:
                            break;
                    }
                }
            }
            if("sidx".equals(name)){
                if (obj != null && FString.isNotBlank(obj.toString())){
                    sidx = obj.toString();
                }
            }else if("sord".equals(name)){
                if (obj != null && FString.isNotBlank(obj.toString())){
                    sord = obj.toString();
                }
            }
            //判断是否是排序条件
            if (f.isAnnotationPresent(Order.class)) {
                Order order = f.getAnnotation(Order.class);
                if (order.type().equals(OrderTypeConstant.ASC)) {
                    orderStr.append(f.getName()).append(" ").append(OrderTypeConstant.ASC);
                } else {
                    orderStr.append(f.getName()).append(" ").append(OrderTypeConstant.DESC);
                }
            }
        }
        if(FString.isNotBlank(sidx) && FString.isNotBlank(sord)){
            if (orderStr.length() != 0) {
                orderStr.append(",").append(sidx).append(" ").append(sord);
            }else {
                orderStr.append(sidx).append(" ").append(sord);
            }
        }

        if (orderStr.length() != 0) {
            example.setOrderByClause(orderStr.toString());
        }
        example.setDistinct(false);
        return selectByExample(example);
    }

    /** 
    * 根据实体类参数来查询所有的集合，就是讲某个属性变为String集合，然后将遍历查询
    * @Param: [vo, entityClass] 
    * @return: java.util.List<T> 
    * @Author: zhangdl
    * @Date: 2018/4/19 
    */ 
    default List<T> selectByParamAuto(Object vo, Class<?> entityClass) {
        JSONObject jsonObject = (JSONObject) JSON.toJSON(vo);
        Example example = new Example(entityClass);
        Example.Criteria criteria = example.createCriteria();
        StringBuffer orderStr = new StringBuffer();
        String sidx = "";
        String sord = "";
        Field[] fs = vo.getClass().getDeclaredFields();  //得到所有的属性集合
        for (Field f : fs) {
            String name = f.getName();
            Object obj = jsonObject.get(name);
            //判断是否有查询标签注解
            if (f.isAnnotationPresent(Condition.class)) {
                if (obj != null && FString.isNotBlank(obj.toString())) {
                    Condition con = f.getAnnotation(Condition.class);
                    switch (con.type()) {
                        case ConditionTypeConstant.EQUAL:
                            criteria.andEqualTo(name, obj);
                            break;
                        case ConditionTypeConstant.NOT_EQUAL:
                            criteria.andNotEqualTo(name, obj);
                            break;
                        case ConditionTypeConstant.IN:
                            String[] valueArr = obj.toString().split(",");
                            criteria.andIn(name, Arrays.asList(valueArr));
                            break;
                        case ConditionTypeConstant.NOT_IN:
                            String[] valueArr2 = obj.toString().split(",");
                            criteria.andNotIn(name, Arrays.asList(valueArr2));
                            break;
                        case ConditionTypeConstant.LIKE:
                            criteria.andLike(name, "%" + obj + "%");
                            break;
                        case ConditionTypeConstant.LEFT_LIKE:
                            criteria.andLike(name, "%" + obj);
                            break;
                        case ConditionTypeConstant.RIGHT_LIKE:
                            criteria.andLike(name, obj + "%");
                            break;
                        case ConditionTypeConstant.IS_NULL:
                            criteria.andIsNull(name);
                            break;
                        case ConditionTypeConstant.IS_NOT_NULL:
                            criteria.andIsNotNull(name);
                            break;
                        default:
                            break;
                    }
                }
            }
            //判断是否设置数据隔离
            if (f.isAnnotationPresent(Isolation.class)) {
                List<String> list = new ArrayList<>();
                list.add(GetUserUtil.getLoginUser().getOrgId());
                list.add("6000001");
                Isolation iso = f.getAnnotation(Isolation.class);
                switch (iso.level()) {
                    case IsolationLevelConstant.ORG:
                        criteria.andIn(name, list);
                        break;
                    case IsolationLevelConstant.RELATE_ORG:
                        criteria.andIn(name, (List<String>) CacheManage.getCache(CacheKeyConstant.ALLRELORG).get(GetUserUtil.getLoginUser().getOrgId()));
                    default:
                        break;
                }
            }

            //判断是否设置数据隔离
            if (f.isAnnotationPresent(OrgInsulation.class)) {
                List<String> list = new ArrayList<>();
                list.add("6000001");
                OrgInsulation iso = f.getAnnotation(OrgInsulation.class);
                switch (iso.level()) {
                    case IsolationLevelConstant.ROOTlEVEL:
                        if("6000001".equals(GetUserUtil.getLoginUser().getOrgId())){
                            criteria.orIsNotNull(name);
                        }
                        break;
                    default:
                        break;
                }
            }
            //判断是否是排序条件
            if (f.isAnnotationPresent(Order.class)) {
                Order order = f.getAnnotation(Order.class);
                if (order.type().equals(OrderTypeConstant.ASC)) {
                    orderStr.append(f.getName()).append(" ").append(OrderTypeConstant.ASC);
                } else {
                    orderStr.append(f.getName()).append(" ").append(OrderTypeConstant.DESC);
                }
            }

        }



        if(FString.isNotBlank(sidx) && FString.isNotBlank(sord)){
            if (orderStr.length() != 0) {
                orderStr.append(",").append(sidx).append(" ").append(sord);
            }else {
                orderStr.append(sidx).append(" ").append(sord);
            }
        }
        if (orderStr.length() != 0) {
            example.setOrderByClause(orderStr.toString());
        }
        example.setDistinct(false);
        return selectByExample(example);
    }

    //TODO
    //FIXME 特别注意，该接口不能被扫描到，否则会出错
}
