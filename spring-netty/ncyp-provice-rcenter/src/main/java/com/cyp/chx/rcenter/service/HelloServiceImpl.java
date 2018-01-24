package com.cyp.chx.rcenter.service;

import com.cyp.chx.rcenter.server.RpcService;

import java.util.ArrayList;

/**
 * rpc服务提供方可以继承多个接口
 * @Author：zhangdelei000@gmail.com
 * @Date:2017/12/7
 */
@RpcService(HelloService.class)
public class HelloServiceImpl implements TestCommon,HelloService {
    @Override
    public String hello(String name) {
        return "Hello! " + name;
    }

    @Override
    public Person helloPerson(Person person) {
        person.setAge(22);
        System.out.println("调用成功======="+person);
        return person;
    }

    @Override
    public void test1() {
        int i=0;
        int j=1;
        int a=j/i;
    }

    @Override
    public void test2() throws Exception {

    }

    @Override
    public
    void aa() {

    }
}
