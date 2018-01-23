package com.cyp.chx.rcenter.service;

import java.io.Serializable;
import java.util.List;

/**
 * @Author：huanghaiyun
 * @Date:2017/12/12
 */
public class Person implements Serializable{
    private String name;
    private int age;
    private Person fa;

    private List<String>list;

    public Person getFa() {
        return fa;
    }

    public void setFa(Person fa) {
        this.fa = fa;
    }

    public List<String> getList() {
        return list;
    }

    public void setList(List<String> list) {
        this.list = list;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return "name:"+name+"\tage:"+age+"\tlist:"+list+"\tfather ;["+fa+"]";
    }
}
