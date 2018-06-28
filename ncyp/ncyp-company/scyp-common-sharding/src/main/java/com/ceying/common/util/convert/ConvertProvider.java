package com.ceying.common.util.convert;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ceying.common.enums.BaseEnum;
import com.ceying.common.util.annotation.CacheConver;
import com.ceying.common.util.annotation.EnumConver;
import com.ceying.common.util.cache.CacheManage;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.lang.reflect.Field;
import java.util.*;

/**
 * @author : Cheese
 * @date : 2018/4/2
 * @description : 注解翻译接口的实现类
 */
@Service
public class ConvertProvider<E extends BaseEnum> implements ConvertApi{

    private Logger logger = LoggerFactory.getLogger(getClass());

    /***
     * @description 注解翻译，获取配置注解的属性，并调用翻译方法
     *
     * @author Cheese
     * @date 2018/4/4
     * @param [list]
     * @return com.alibaba.fastjson.JSONObject
     */
    @Override
    public JSONObject convertByAnnotation(List<?> list){
        if(list.size()==0){
            JSONObject jsonObject =new JSONObject();
            jsonObject.put("rows",new JSONArray());
            return jsonObject;
        }
        //获取list中的泛型的所有属性信息
        Field[] fs = list.get(0).getClass().getDeclaredFields();
        Map<String,Object> enumMap =new HashMap<>();
        Map<String,String> cacheMap =new HashMap<>();
        for(Field f:fs){
            //获取类中使用了@EnumConver注解的属性域并将枚举类型放入map
            if(f.isAnnotationPresent(EnumConver.class)){
                EnumConver annotation = f.getAnnotation(EnumConver.class);
                //获取注解中的属性值
                Class enumType = annotation.enumType();
                enumMap.put(f.getName(),enumType);
            }
            //获取类中使用了@CacheConver注解的属性域并将缓存类型放入map
            if(f.isAnnotationPresent(CacheConver.class)){
                CacheConver annotation = f.getAnnotation(CacheConver.class);
                //获取注解中的属性值
                String cacheType = annotation.cacheType();
                cacheMap.put(f.getName(),cacheType);
            }
        }

        //调用翻译方法
        return convert(list,enumMap,cacheMap);
    }
    /***
     * @description 注解翻译方法
     *
     * @author Cheese
     * @date 2018/4/4
     * @param [list, enumMap, cacheMap]
     * @return com.alibaba.fastjson.JSONObject
     */
    public JSONObject convert(List<?> list, Map<String,Object> enumMap, Map<String,String> cacheMap){
        //将PageView转换成JSON对象并进行翻译
        try {
            JSONObject jsonObject = new JSONObject();
            //获取列表内容
            JSONArray jsonArray = (JSONArray)JSONObject.toJSON(list);
            //获取列表内容迭代器
            Iterator<Object> it = jsonArray.iterator();
            //开始迭代
            while(it.hasNext()){
                JSONObject ob = (JSONObject)it.next();
                //遍历enumMap，并根据枚举类型翻译
                for (Map.Entry<String, Object> entry : enumMap.entrySet()) {
                    Class map =(Class)entry.getValue();
                    E[] enums = (E[])map.getEnumConstants();
                    if(ob.get(entry.getKey())==null){
                        ob.put(entry.getKey()+"value",ob.get(entry.getKey()));
                    }else{
                        for(E e : enums) {
                            if(e.getKey().equals(ob.get(entry.getKey())+"")) {
                                ob.put(entry.getKey()+"value",ob.get(entry.getKey()));
                                ob.put(entry.getKey(), e.getValue());
                            }
                        }
                    }
                }
                //遍历cacheMap,并根据缓存类型翻译
                for (Map.Entry<String, String> entry : cacheMap.entrySet()) {
                    //获取注解指定的缓存map集合
                    Map<String,Object> map = CacheManage.getCache(entry.getValue());
                    //判断源值是否在集合中有对应的映射，如果有将对应的值取出
                    if(map.containsKey(ob.get(entry.getKey())==null?"":ob.get(entry.getKey()).toString())){
                        ob.put(entry.getKey().substring(0,entry.getKey().length()-2)+"name",map.get(ob.get(entry.getKey())));
                    }else {
                        ob.put(entry.getKey().substring(0,entry.getKey().length()-2)+"name","");
                    }
                }
            }
            jsonObject.put("rows",jsonArray);
            return jsonObject;
        } catch (Exception e) {
            logger.error("结果转换异常， Exception{}",e.getMessage(), e);
            return null;
        }
    }
    @Override
    public  String getDicOptionToJsonByKeynoByEnum(String keyno, String keyvalue) throws ClassNotFoundException {
        List<String> allowKeyValues = null;
        if(StringUtils.isNotBlank(keyvalue)){
            allowKeyValues = Arrays.asList(keyvalue.split(","));
        }
        Map<Object, String> map=new HashMap<>();
        E[] enums = (E[]) Class.forName("com.ceying.common.enums."+keyno).getEnumConstants();
        for(E e : enums) {
            map.put(e.getKey(),e.getValue());
        }
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        if (map!=null) {
            Set set = map.keySet();
            Iterator it = set.iterator();
            //判断是否需要过滤字典项
            if(allowKeyValues == null){
                while(it.hasNext()){
                    String key= it.next().toString();
                    String value = map.get(key);
                    sb.append("{\"text\":\"").append(value).append("\",\"value\":\"").append(key).append("\"},");
                }
            }else{
                while(it.hasNext()){
                    String key= it.next().toString();
                    //若key包含在allowKeyValues则加入返回的结果中
                    if(allowKeyValues.contains(key)){
                        String value = map.get(key);
                        sb.append("{\"text\":\"").append(value).append("\",\"value\":\"").append(key).append("\"},");
                    }
                }
            }
            sb.deleteCharAt(sb.length() - 1);
        }
        sb.append("]");
        return sb.toString();
    }
}
