package com.zhang.cloud.entity;

import javax.persistence.*;
import java.math.BigDecimal;

/**
 * 实体类
 * @author zhangdl
 * @version class v1.0
 * @date 2017/10/10 7:59
 */

@Entity
public
class User  {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column
    private String username;

    @Column
    private String name;

    @Column
    private short age;

    @Column
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
    BigDecimal getBigDecimal() {
        return balance;
    }

    public
    User setBigDecimal(BigDecimal balance) {
        this.balance = balance;
        return this;
    }

    public
    User() {
    }

    public
    User(String username, String name, short age, BigDecimal balance) {
        this.username = username;
        this.name = name;
        this.age = age;
        this.balance = balance;
    }
}
