package com.ceying.chx.biz.base.entity;

/**
 * 功能说明: <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/3/13 17:19<br>
 */
public class TestEntity {

    private Integer id;

    private String userId;

    public
    Integer getId() {
        return id;
    }

    public
    TestEntity setId(Integer id) {
        this.id = id;
        return this;
    }

    public
    String getUserId() {
        return userId;
    }

    public
    TestEntity setUserId(String userId) {
        this.userId = userId;
        return this;
    }

    public TestEntity() {
    }

    @Override
    public
    String toString() {
        return "TestEntity{" +
                "id=" + id +
                ", userId='" + userId + '\'' +
                '}';
    }
}
