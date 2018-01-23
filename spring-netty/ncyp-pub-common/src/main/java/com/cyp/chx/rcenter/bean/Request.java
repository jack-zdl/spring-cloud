package com.cyp.chx.rcenter.bean;

import java.io.Serializable;
import java.util.concurrent.atomic.AtomicLong;

/**
 * 自定义协议request 内容体
 * @Author：huanghaiyun
 * @Date:2017/12/13
 */
public abstract class Request implements Serializable{
    //java 提供的自增长计数器
    private static final AtomicLong INVOKE_ID = new AtomicLong(0);
    //请求的id
    private Long id;
    //方法名
    private String methodName;
    //完整类路径
    private String path;
    //方法的参数
    private Object[] params;
    //方法的参数类型
    private Class<?>[] parameterTypes;
    //版本
    private String version;

    public  Request(){
        this.id=newId();
    }
    private static long newId() {
        // getAndIncrement()增长到MAX_VALUE时，再增长会变为MIN_VALUE，负数也可以做为ID
        return INVOKE_ID.getAndIncrement();
    }
    public  Request(Long id){
        this.id=id;
    }
    public String getMethodName() {
        return methodName;
    }

    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Object[] getParams() {
        return params;
    }

    public void setParams(Object[] params) {
        this.params = params;
    }

    public Class<?>[] getParameterTypes() {
        return parameterTypes;
    }

    public void setParameterTypes(Class<?>[] parameterTypes) {
        this.parameterTypes = parameterTypes;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
