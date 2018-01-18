package com.cyp.chx.rcenter.hessian.bean;

import com.cyp.chx.rcenter.bean.Response;


/**
 * @Author：huanghaiyun
 * @Date:2017/12/13
 */
public class HessResponse extends Response {
    //是否是事件
    private boolean event = false;
    public HessResponse(Long id){
        super(id);
    }

    public HessResponse(){

    }

    public boolean isEvent() {
        return event;
    }

    public void setEvent(boolean event) {
        this.event = event;
    }

}
