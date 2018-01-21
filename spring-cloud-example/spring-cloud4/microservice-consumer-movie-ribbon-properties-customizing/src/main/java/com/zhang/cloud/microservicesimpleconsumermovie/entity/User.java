package com.zhang.cloud.microservicesimpleconsumermovie.entity;

import java.math.BigDecimal;

/**
 * @author zhangdl
 * @version class v1.0
 * @date 2017/10/11 7:33
 */
public
class User {

    private Long id;

    private String username;

    private String name;

    private short age;

    private BigDecimal balance;

    public
    Long getId() {
        return id;
    }

    public
    User setId(Long id) {
        this.id = id;
        return this;
    }

    public
    String getUsername() {
        return username;
    }

    public
    User setUsername(String username) {
        this.username = username;
        return this;
    }

    public
    String getName() {
        return name;
    }

    public
    User setName(String name) {
        this.name = name;
        return this;
    }

    public
    short getAge() {
        return age;
    }

    public
    User setAge(short age) {
        this.age = age;
        return this;
    }

    public
    BigDecimal getBalance() {
        return balance;
    }

    public
    User setBalance(BigDecimal balance) {
        this.balance = balance;
        return this;
    }
}
