package com.cyp.chx.rcenter.hessian.bean;

import com.cyp.chx.rcenter.bean.Request;

/**
 * 自定义协议request 内容体
 * @Author：huanghaiyun
 * @Date:2017/12/13
 */
public class HessRequest extends Request{

    //是否需要有返回值
    private boolean twoWay = true;
    //是否是事件
    private boolean event = false;
    public HessRequest(){
        super();
    }
    public HessRequest(Long id){
        super.setId(id);
    }

    public boolean isTwoWay() {
        return twoWay;
    }

    public void setTwoWay(boolean twoWay) {
        this.twoWay = twoWay;
    }

    public boolean isEvent() {
        return event;
    }

    public void setEvent(boolean event) {
        this.event = event;
    }
}
