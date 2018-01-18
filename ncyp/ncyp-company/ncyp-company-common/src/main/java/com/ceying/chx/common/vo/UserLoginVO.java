package com.ceying.chx.common.vo;


import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * 功能说明: 用户登录vo类<br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/8 14:49<br>
 * <br>
 */

public class UserLoginVO implements Serializable {


    /**
     * 用户名称
     */
    @NotNull(message = "用户名称不能为空")
    public String userName;

    /**
     * 用户密码
     */
    @NotNull(message = "用户密码不能为空")
    public String userPwd;

    public
    String getUserName() {
        return userName;
    }

    public
    UserLoginVO setUserName(String userName) {
        this.userName = userName;
        return this;
    }

    public
    String getUserPwd() {
        return userPwd;
    }

    public
    UserLoginVO setUserPwd(String userPwd) {
        this.userPwd = userPwd;
        return this;
    }

    public
    UserLoginVO(String userName, String userPwd) {
        this.userName = userName;
        this.userPwd = userPwd;
    }

    public
    UserLoginVO() {
    }

    @Override
    public
    String toString() {
        return "UserLoginVO{" +
                "userName='" + userName + '\'' +
                ", userPwd='" + userPwd + '\'' +
                '}';
    }
}
