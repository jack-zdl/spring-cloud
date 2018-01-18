package com.cyp.chx.rcenter.client;

/**
 * @Author：huanghaiyun
 * @Date:2017/12/22
 */
public enum RpcProtocol {
    DEFAULT("default"), PROTOBUFF("protobuff"), HESSIAN("hessian");
    private String value;
    RpcProtocol(String value){
        this.value=value;
    }
    public String getValue(){
        return this.value;
    }
    // 根据value返回枚举类型,主要在switch中使用
    public static RpcProtocol getByValue(String value) {
        for (RpcProtocol proto : values()) {
            if (proto.getValue().equals(value)) {
                return proto;
            }
        }
        return DEFAULT;
    }
}
