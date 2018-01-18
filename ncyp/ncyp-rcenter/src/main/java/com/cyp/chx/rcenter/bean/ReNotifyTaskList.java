package com.cyp.chx.rcenter.bean;

import java.util.List;
import java.util.concurrent.ConcurrentLinkedDeque;

/**
 * 需要重新通知的数据的集合
 * @Author：huanghaiyun
 * @Date:2018/1/4
 */
public class ReNotifyTaskList {
    private ConcurrentLinkedDeque<NotifyTaskBean> list=new ConcurrentLinkedDeque<NotifyTaskBean>();
    private static final ReNotifyTaskList INSTANCE=new ReNotifyTaskList();
    private ReNotifyTaskList(){

    }
    public static ReNotifyTaskList getINSTANCE() {
        return INSTANCE;
    }

    /**
     * 添加任务
     * @param regist
     * @param address
     * @param name
     */
    public void add(String regist,String address,String name){
        add(regist,address,name,0);
    }

    /**
     * 添加任务
     * @param list
     */
    public void addAll(List<NotifyTaskBean> list){
        this.list.addAll(list);
    }
    /**
     *
     * @param regist
     * @param address
     * @param name
     * @param times
     */
    public void add(String regist,String address,String name,int times){
        NotifyTaskBean bean=new NotifyTaskBean(regist,address,name,times);
        this.list.add(bean);
    }
    public int size(){
        return list.size();
    }

    /**
     * 获取第一个任务
     * @return
     */
    public NotifyTaskBean poll(){
        if(!list.isEmpty()){
            return  list.poll();
        }
        return null;
    }


}
