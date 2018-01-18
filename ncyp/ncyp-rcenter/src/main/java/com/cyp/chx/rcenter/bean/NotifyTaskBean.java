package com.cyp.chx.rcenter.bean;

import com.alibaba.fastjson.JSONObject;

/**
 * @Author：huanghaiyun
 * @Date:2018/1/4
 */
public class NotifyTaskBean {
    private String regist;//注册中心
    private String address;//需要通知的数据
    private String name;//需要通知的数据
    private int times=0;
    public NotifyTaskBean(String regist,String address,String name){
        this.regist=regist;
        this.address=address;
        this.name=name;
    }
    public NotifyTaskBean(String regist,String address,String name,int times){
        this.regist=regist;
        this.address=address;
        this.name=name;
        this.times=times;
    }
    public String getRegist() {
        return regist;
    }

    public void setRegist(String regist) {
        this.regist = regist;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getTimes() {
        return times;
    }

    public void setTimes(int times) {
        this.times = times;
    }

    @Override
    public String toString() {
        return JSONObject.toJSONString(this);
    }
}
