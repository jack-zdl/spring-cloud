package com.cyp.chx.rcenter.bean;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.concurrent.TimeoutException;

/**
 * 仓库 用于 netty 客户端同步返回数据
 * @Author：huanghaiyun
 * @Date:2017/12/15
 */
public class Storage {
    private static final Logger LOGGER = LoggerFactory.getLogger(Storage.class);
    private Object response=null;
    private Object obj=new Object();
    private long timeOut=5;//5秒
    private boolean isTimeOut=false;
    public Storage(){

    }
    /**
     * 设置超时
     * @param timeOut
     */
    public Storage(long timeOut){
        isTimeOut=true;
        this.timeOut=timeOut;
    }
    public Object get() throws TimeoutException {
        synchronized (obj){
            while(response==null){
                try {
                    if(isTimeOut){
                        long t1=System.currentTimeMillis();
                        obj.wait(timeOut*1000);
                        if(response==null){
                            throw new TimeoutException("获取结果超时");
                        }
                    }else{
                        obj.wait();
                    }
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            if(response==null){
                throw new TimeoutException();
            }
            return response;
        }
    }
    public void set(Object res) throws TimeoutException {
        synchronized (obj){
            this.response=res;
            obj.notifyAll();
        }
    }
}
