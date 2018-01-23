package com.cyp.chx.rcenter.bean;

import java.io.Serializable;

/**
 * @Author：huanghaiyun
 * @Date:2017/12/13
 */
public abstract class Response implements Serializable {
    private static final long serialVersionUID = 4560695987432388537L;
    private Long id;
    private Object result;
    private boolean isOk=true;
    public Response(Long id){
        this.id=id;
    }
    public Response(){

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Object getResult() {
        return result;
    }

    public void setResult(Object result) {
        this.result = result;
    }

    public boolean isOk() {
        return isOk;
    }

    public void setOk(boolean ok) {
        isOk = ok;
    }
}
