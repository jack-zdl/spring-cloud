package com.cyp.chx.rcenter.util;

import java.util.*;
import java.util.concurrent.ThreadLocalRandom;

/**
 * 路由工具类
 * @Author：huanghaiyun
 * @Date:2018/1/2
 */
public class UrlUtil {
    /**
     * 平均选择
     * @param serverMap
     * @param defaultValue 若传入list 为空 返回 默认值
     * @param <T>
     * @return
     */
    public static <T> T  avgRout(Map<T,Integer> serverMap,T defaultValue){
        List<T> list=new ArrayList<>(serverMap.keySet());
        if(list.isEmpty()){
            return defaultValue;
        }
        return list.get(ThreadLocalRandom.current().nextInt(list.size()));
    }

    /**
     * 根据平均进行选择
     * @param serverMap
     * @param <T>
     * @return
     */
    public static <T> T  avgRout(Map<T,Integer> serverMap){
        List<T> list=new ArrayList<>(serverMap.keySet());
        return avgRout(serverMap,null);
    }

    /**
     * 根据权重路由
     * @param serverMap
     * @param defaultValue  若map 是空 返回默认值
     * @param <T>
     * @return
     */
    public static <T> T  weightRout(Map<T,Integer> serverMap,T defaultValue){
        if(serverMap.isEmpty()){
            return defaultValue;
        }
        List<T> servers = new ArrayList<>(serverMap.keySet());
        int length = serverMap.size(); // 总个数
        int totalWeight = 0; // 总权重
        boolean sameWeight = true; // 权重是否都一样
        for (int i = 0; i < length; i++) {
            int weight = serverMap.get(servers.get(i));
            totalWeight += weight; // 累计总权重
            if (sameWeight && i > 0
                    && weight != serverMap.get(servers.get(i-1))) {
                sameWeight = false; // 计算所有权重是否一样
            }
        }
        if (totalWeight > 0 && ! sameWeight) {
            // 如果权重不相同且权重大于0则按总权重数随机
            int offset = ThreadLocalRandom.current().nextInt(totalWeight);
            // 并确定随机值落在哪个片断上
            for (int i = 0; i < length; i++) {
                offset -= serverMap.get(servers.get(i));
                if (offset < 0) {
                    return servers.get(i);
                }
            }
        }
        // 如果权重相同或权重为0则均等随机
        return servers.get(ThreadLocalRandom.current().nextInt(length));
    }

    /**
     * 根据权重路由
     * @param serverMap
     * @param <T>
     * @return
     */
    public static <T> T  weightRout(Map<T,Integer> serverMap){
        return weightRout(serverMap,null);
    }

    /**
     * 将url中参数 协议 端口号等信息解析出来
     * @param url
     * @return
     */
    public static Map<String, String> urlDecode(String url){
        url=url.toLowerCase();
        Map<String, String> mapRequest = new HashMap<String, String>();
        String params="";
        //将参数与地址分离
        String[] arrSplit=url.split("[?]");
        String heads="";
        if(url.length()>1){
            heads=arrSplit[0];
            if(arrSplit.length>1){
                if(arrSplit[1]!=null){
                    params=arrSplit[1];
                }
            }
        };
        //解析地址与协议
        String[] head=heads.split("://");
        if(head.length>1){
            mapRequest.put("protocol",head[0]);
            String[] addresss=head[1].split(":");
            mapRequest.put("host",addresss[0]);
            mapRequest.put("port",addresss[1]);
        }else{
            mapRequest.put("protocol","default");
            String[] addresss=head[0].split(":");
            mapRequest.put("host",addresss[0]);
            mapRequest.put("port",addresss[1]);
        }
        if(params==null){
            return mapRequest;
        }
        //每个键值为一组 www.2cto.com
        arrSplit=params.split("[&]");
        for(String strSplit:arrSplit){
            String[] arrSplitEqual=null;
            arrSplitEqual= strSplit.split("[=]");
            //解析出键值
            if(arrSplitEqual.length>1){
                //正确解析
                mapRequest.put(arrSplitEqual[0], arrSplitEqual[1]);
            }
            else{
                if(arrSplitEqual[0]!=""){
                    //只有参数没有值，不加入
                    mapRequest.put(arrSplitEqual[0], "");
                }
            }
        }
        return mapRequest;
    }
}
