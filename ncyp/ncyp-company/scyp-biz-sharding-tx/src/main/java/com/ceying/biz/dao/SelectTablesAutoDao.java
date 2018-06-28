package com.ceying.biz.dao;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ceying.common.constant.*;
import com.ceying.common.util.annotation.TablesCondition;
import com.ceying.common.util.annotation.TablesExtreme;
import com.ceying.common.util.annotation.TablesIsolation;
import com.ceying.common.util.annotation.TablesOrder;
import com.ceying.common.util.cache.CacheManage;
import com.ceying.common.util.stringtools.FString;
import com.ceying.common.util.user.GetUserUtil;
import com.github.pagehelper.PageHelper;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.SqlSource;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.SystemMetaObject;
import org.apache.ibatis.scripting.xmltags.XMLLanguageDriver;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Field;
import java.util.List;

/**
 * @author: mzq
 * @date: 2018/4/17
 * @description : 联表查询方法
 * @version: 2.0
 */
@Service
public class SelectTablesAutoDao<T> {
    @Autowired
    private SqlSession sqlSession;
    protected final XMLLanguageDriver XML_LANGUAGE_DRIVER = new XMLLanguageDriver();
    /*
     * @description 联表查询方法
     * @author mzq
     * @date 2018/4/17
     * @param clazz1 : 查询的接口
     * @param methodName : 查询方法的名称
     * @param vo ：查询的入参 vo类
     * @param clazz ：查询的出参 query类
     * @return java.util.List<T>
     */
    public List<T> selectTablesAuto(Class<?> clazz1,String methodName, Object vo, Class<? extends T> clazz) {
        String selectMethodPath = clazz1.getName()+"."+methodName;
        MappedStatement ms  = sqlSession.getConfiguration().getMappedStatement(selectMethodPath);
        BoundSql boundSql = ms.getBoundSql(null);
        String sql = boundSql.getSql();
        SqlSource sqlSourceInit = ms.getSqlSource();
        JSONObject jsonObject = (JSONObject) JSON.toJSON(vo);
        PageHelper.startPage((Integer) jsonObject.get("page"), (Integer) jsonObject.get("rows"));
        Field[] fs = vo.getClass().getDeclaredFields();
        StringBuffer buffer=new StringBuffer(" ");
        StringBuffer orderBybuffer=new StringBuffer(" ");
        for (Field f : fs) {
            String name = f.getName();
            Object obj = jsonObject.get(name);
            //判断是否有查询标签注解
            if (f.isAnnotationPresent(TablesCondition.class)) {
                TablesCondition con = f.getAnnotation(TablesCondition.class);
                if(con!=null&&FString.isNull(con.table())){
                    continue;
                }
                if(FString.isNull(con.type()+"")){
                    continue;
                }
                if(FString.isNotNull(con.column())){
                    name=con.column();
                }
                buffer.append(buildCondition(con.table(),name,obj,con.type()));
            }
            //判断是否有极值注解
            if (f.isAnnotationPresent(TablesExtreme.class)) {
                TablesExtreme extreme = f.getAnnotation(TablesExtreme.class);
                if(extreme!=null&&FString.isNull(extreme.table())){
                    continue;
                }
                if(FString.isNull(extreme.type()+"")){
                    continue;
                }
                if(FString.isNotNull(extreme.column())){
                    name=extreme.column();
                }
                buffer.append(buildExtremeCondition(extreme.table(),name,obj,extreme.type()));
            }
            //数据隔离
            if (f.isAnnotationPresent(TablesIsolation.class)) {
                TablesIsolation iso = f.getAnnotation(TablesIsolation.class);
                if(iso!=null&&FString.isNull(iso.table())){
                    continue;
                }
                if(FString.isNull(iso.level()+"")){
                    continue;
                }
                switch (iso.level()) {
                    case IsolationLevelConstant.ORG:
                        buffer.append(buildCondition(iso.table(),name,GetUserUtil.getLoginUser().getOrgId(),ConditionTypeConstant.EQUAL));
                        break;
                    case IsolationLevelConstant.RELATE_ORG:
                        List<String> list=(List<String>) CacheManage.getCache(CacheKeyConstant.ALLRELORG).get(GetUserUtil.getLoginUser().getOrgId());
                        if(list!=null){
                            buffer.append(buildCondition(iso.table(),name,list.toString().replace("[","").replace("]","").replace(" ",""),ConditionTypeConstant.IN));
                        }
                        break;
                    default:
                        break;
                }
            }
        }
        for (Field f : fs) {
            String name = f.getName();
            //注解排序
            if (f.isAnnotationPresent(TablesOrder.class)) {
                TablesOrder order = f.getAnnotation(TablesOrder.class);
                if(order!=null&&FString.isNull(order.table())){
                    continue;
                }
                if(FString.isNull(order.type()+"")){
                    continue;
                }
                if (order.type().equals(OrderTypeConstant.ASC)) {
                    orderBybuffer.append(buildOrderCondition(order.table(),name,order.type()));
                } else {
                    orderBybuffer.append(buildOrderCondition(order.table(),name,order.type()));
                }
            }
        }
        String sidx = jsonObject.get("sidx")!=null?jsonObject.get("sidx").toString():"";
        String sord = jsonObject.get("sord")!=null?jsonObject.get("sord").toString():"";
        if(FString.isNotNull(sidx)&&FString.isNotNull(sord)){
            orderBybuffer=new StringBuffer();
            orderBybuffer.append(buildOrderCondition("",sidx,sord));
        }
        String querySql = sql+buffer+orderBybuffer;
        System.out.println(querySql);
        SqlSource sqlSource = XML_LANGUAGE_DRIVER.createSqlSource(ms.getConfiguration(),querySql,clazz);
        MetaObject msObject = SystemMetaObject.forObject(ms);
        msObject.setValue("sqlSource", sqlSource);
        List<T> list = sqlSession.selectList(selectMethodPath);
        msObject.setValue("sqlSource", sqlSourceInit);
        return list;
    }
    public String buildCondition(String table,String field,Object value,int conditionType){
        StringBuffer stringBuffer = new StringBuffer();
        switch (conditionType) {
            case ConditionTypeConstant.EQUAL:
                if(value!=null&&FString.isNotNull(value.toString())){
                    stringBuffer.append(" and "+table+"."+field+" = '"+value+"'");
                }
                break;
            case ConditionTypeConstant.NOT_EQUAL:
                if(value!=null&&FString.isNotNull(value.toString())) {
                    stringBuffer.append(" and " + table + "." + field + " <> '" + value + "'");
                }
                break;
            case ConditionTypeConstant.IN:
                if(value!=null) {
                    value = value.toString().replace(",", "','");
                    stringBuffer.append(" and " + table + "." + field + " in ('" + value + "')");
                }
                break;
            case ConditionTypeConstant.NOT_IN:
                if(value!=null) {
                    value = value.toString().replace(",", "','");
                    stringBuffer.append(" and " + table + "." + field + " not in (" + value + ")");
                }
                break;
            case ConditionTypeConstant.LIKE:
                if(value!=null) {
                    stringBuffer.append(" and " + table + "." + field + " like '%" + value + "%'");
                }
                break;
            case ConditionTypeConstant.LEFT_LIKE:
                if(value!=null&&FString.isNotNull(value.toString())) {
                    stringBuffer.append(" and " + table + "." + field + " like '%" + value + "'");
                }
                break;
            case ConditionTypeConstant.RIGHT_LIKE:
                if(value!=null&&FString.isNotNull(value.toString())) {
                    stringBuffer.append(" and " + table + "." + field + " like '" + value + "%'");
                }
                break;
            case ConditionTypeConstant.IS_NULL:
                stringBuffer.append(" and "+table+"."+field+" is null ");
                break;
            case ConditionTypeConstant.IS_NOT_NULL:
                stringBuffer.append(" and "+table+"."+field+" is not null ");
                break;
            case ConditionTypeConstant.IS_EMPTY:
                stringBuffer.append(" and "+table+"."+field+" = '' ");
                break;
            case ConditionTypeConstant.IS_NOT_EMPTY:
                stringBuffer.append(" and "+table+"."+field+" <> '' ");
                break;
            default:
                break;
        }
        return stringBuffer.toString();
    }
    public String buildExtremeCondition(String table,String field,Object value,int conditionType){
        StringBuffer stringBuffer = new StringBuffer();
        switch (conditionType) {
            case ExtremeTypeConstant.GREATER:
                if(value!=null&&FString.isNotNull(value.toString())) {
                    stringBuffer.append(" and " + table + "." + field + " > '" + value + "'");
                }
                break;
            case ExtremeTypeConstant.GREATER_EQUAL:
                if(value!=null&&FString.isNotNull(value.toString())) {
                    stringBuffer.append(" and " + table + "." + field + " >= '" + value + "'");
                }
                break;
            case ExtremeTypeConstant.LESS:
                if(value!=null&&FString.isNotNull(value.toString())) {
                    stringBuffer.append(" and " + table + "." + field + " < '" + value + "'");
                }
                break;
            case ExtremeTypeConstant.LESS_EQUAL:
                if(value!=null&&FString.isNotNull(value.toString())) {
                    stringBuffer.append(" and " + table + "." + field + " <= '" + value + "'");
                }
                break;
            default:
                break;
        }
        return stringBuffer.toString();
    }
    public String buildOrderCondition(String table,String field,String conditionType){
        StringBuffer stringBuffer = new StringBuffer();
        if(FString.isNotNull(table)){
            stringBuffer.append(" order by " + table + "." + field + " "+conditionType);
        }else{
            stringBuffer.append("order by " + field + " " + conditionType);
        }
        return stringBuffer.toString();
    }
}
