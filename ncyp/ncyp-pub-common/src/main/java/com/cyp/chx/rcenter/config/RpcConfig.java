package com.cyp.chx.rcenter.config;

import com.cyp.chx.rcenter.bean.Url;
import com.cyp.chx.rcenter.util.UrlUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;

/**
 * @Author：huanghaiyun
 * @Date:2017/12/19
 */

@Component
@Configuration
@ConfigurationProperties(prefix = "rpcServer")
@PropertySource("classpath:application-rpc.properties")
public class RpcConfig {

    private  String localAddress;
    private  String name;
    private  List<String> registAddress=new ArrayList<String>();
    private  long readTimeOut=3*60;
    private  long writeTimeOut=3*60;
    private  long allTimeOut=3*60;//单位秒
    private  long getResultTimeOut=3*60;//单位秒
    private Map<String,Integer> registMap=null;//根据registAddress 计算得出
    public String getLocalAddress(){
        return localAddress;
    }

    public void setLocalAddress(String localAddress) {
        this.localAddress = localAddress;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<String> getRegistAddress() {
        return registAddress;
    }

    public void setRegistAddress(List<String> registAddress) {
        this.registAddress = registAddress;
        decode();
    }

    public long getReadTimeOut() {
        return readTimeOut;
    }

    public void setReadTimeOut(long readTimeOut) {
        this.readTimeOut = readTimeOut;
    }

    public long getWriteTimeOut() {
        return writeTimeOut;
    }

    public void setWriteTimeOut(long writeTimeOut) {
        this.writeTimeOut = writeTimeOut;
    }

    public long getAllTimeOut() {
        return allTimeOut;
    }

    public void setAllTimeOut(long allTimeOut) {
        this.allTimeOut = allTimeOut;
    }

    public long getGetResultTimeOut() {
        return getResultTimeOut;
    }

    public void setGetResultTimeOut(long getResultTimeOut) {
        this.getResultTimeOut = getResultTimeOut;
    }

    /**
     * 平均获取注册中心地址
     * @return
     */
    public String getRegistByAvg(){
        if(registMap==null){
            registMap=new HashMap<>();
            decode();
        }
        return UrlUtil.avgRout(registMap);
    }
    /**
     * 根据权重获取注册中心地址
     * @return
     */
    public String getRegistByWeight(){

        if(registMap==null){
            decode();
        }
        return UrlUtil.weightRout(registMap);
    }
    private void decode(){
        registMap=new HashMap<>();
        CopyOnWriteArrayList<String> list=new CopyOnWriteArrayList<String>(registAddress);
        for(String address:list){
            Map<String, String> map= UrlUtil.urlDecode(address);
            if(map.containsKey("weight")){
                registMap.put(address,Integer.valueOf(map.get("weight")));
            }else{
                registMap.put(address,1);
            }
        }
    }
    @Override
    public String toString() {
        StringBuilder builder=new StringBuilder();
        builder.append("name:").append(name).append("\t")
        .append("url:").append(localAddress).append("\t")
        .append("registAddress:").append(registAddress).append("\t")
        .append("readTimeOut:").append(readTimeOut).append("\t")
        .append("writeTimeOut:").append(writeTimeOut).append("\t")
        .append("writeTimeOut:").append(writeTimeOut).append("\t")
        .append("getResultTimeOut:").append(getResultTimeOut);
        return builder.toString();
    }

    public void addRegist(Url url){
        String oldUrl=null;
        CopyOnWriteArrayList<String> list=new CopyOnWriteArrayList<String>(registAddress);
        for(String add:list){
            if(add.contains(url.getAddress())){//若原先有次注册中心数据 删除他
                oldUrl=add;
            }
        }
        if(!StringUtils.isBlank(oldUrl)){
            registAddress.remove(oldUrl);
        }
        registAddress.add(url.getUrl());
        decode();
    }

    /**
     * 对方掉线了
     * @param url
     */
    public void removeRegist(String url){
        registAddress.remove(url);
        decode();
    }
}
