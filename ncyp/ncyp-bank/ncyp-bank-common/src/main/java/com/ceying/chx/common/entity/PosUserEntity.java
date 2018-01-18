package com.ceying.chx.common.entity;

import org.omg.CORBA.PRIVATE_MEMBER;

import javax.persistence.Table;

/**
 * 功能说明: 岗位用户关系表<br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/16 10:17<br>
 */
@Table(name = "tsys_pos_user")
public class PosUserEntity {

    /**
     * 岗位编号
     */
    private String positionCode;

    /**
     * 用户id
     */
    private String userId;

    /**
     * 获得岗位编号
     * @return
     */
    public String getPositionCode() {
        return positionCode;
    }

    /**
     * 设置岗位编号
     * @param positionCode
     * @return
     */
    public PosUserEntity setPositionCode(String positionCode) {
        this.positionCode = positionCode;
        return this;
    }

    /**
     * 获得用户id
     * @return
     */
    public String getUserId() {
        return userId;
    }

    /**
     * 设置用户id
     * @param userId
     * @return
     */
    public PosUserEntity setUserId(String userId) {
        this.userId = userId;
        return this;
    }

}
