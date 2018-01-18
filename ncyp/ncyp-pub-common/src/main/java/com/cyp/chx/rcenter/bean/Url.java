package com.cyp.chx.rcenter.bean;

import com.cyp.chx.rcenter.client.RpcProtocol;
import com.cyp.chx.rcenter.util.UrlUtil;
import org.apache.commons.lang3.StringUtils;

import java.util.HashMap;
import java.util.Map;

import static com.cyp.chx.rcenter.client.RpcProtocol.PROTOBUFF;

/**
 * @Author：huanghaiyun
 * @Date:2017/12/22
 */
public class Url {
    private String url;
    private String host;
    private int port;
    private RpcProtocol protocol;
    private Map<String, String> paramMap;

    public Url(String url){
        this.url=url;
        decode();
    }

    /**
     * 原始的url
     * @return
     */
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public int getPort() {
        return port;
    }

    public void setPort(int port) {
        this.port = port;
    }

    public RpcProtocol getProtocol() {
        return protocol;
    }

    public void setProtocol(RpcProtocol protocol) {
        this.protocol = protocol;
    }
    private void decode(){
        try {
            paramMap= UrlUtil.urlDecode(url);
            switch (RpcProtocol.getByValue(paramMap.get("protocol"))){
                case PROTOBUFF:protocol= PROTOBUFF;break;
                case HESSIAN:protocol=RpcProtocol.HESSIAN;break;
                default:protocol=RpcProtocol.DEFAULT;break;

            }
            host=paramMap.get("host");
            port=Integer.valueOf(paramMap.get("port"));
        } catch (Exception e) {
            throw new RuntimeException("url 格式不正确",e);
        }
    }
    public String getAddress(){
        return host+":"+port;
    }

    public String getParam(String param) {
        return paramMap.get(param.toLowerCase());
    }

    /**
     * 是否是注册中心
     * @return
     */
    public boolean isRegistCenter(){
        String type=getParam("isRegistCenter");
        if(!StringUtils.isBlank(type)&&type.equals("true")){
            return true;//是注册中心
        }
        return false;
    }
    /**
     * 设置value
     * @return
     */
    public void setParam(String key,Object value){
        paramMap.put(key,value.toString());
    }

    /**
     *  对url 重新开始编码
     * @return
     */
    public String encode(){
        StringBuilder builder=new StringBuilder();
        builder.append(paramMap.get("protocol")).append("://")
                .append(paramMap.get("host")).append(":")
                .append(paramMap.get("port")).append("?");
        for(String key:paramMap.keySet()){
            if(!"protocol||host||port".contains(key.toLowerCase())){
                builder.append(key).append("=").append(paramMap.get(key)).append("&");
            }
        }
        return builder.toString();
    }
}
