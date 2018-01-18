package com.cyp.chx.rcenter.bean;

import java.util.concurrent.TimeoutException;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * 仓库
 * @Author：huanghaiyun
 * @Date:2017/12/15
 */
public class Storage2 {
    private Object response=null;
    private final Lock lock = new ReentrantLock();
    private final Condition full = lock.newCondition();
    public Object get() throws TimeoutException {
        //获得锁
        lock.lock();
        while(response==null){
            try {
                //阻塞
                full.await();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        if(response==null){
            throw new TimeoutException();
        }
        //释放锁
        lock.unlock();
        return response;
    }
    public void set(Object res) throws TimeoutException {
        //获得锁
        lock.lock();
        this.response=res;
        //唤醒
        full.signalAll();
        //释放锁
        lock.unlock();
    }
}
