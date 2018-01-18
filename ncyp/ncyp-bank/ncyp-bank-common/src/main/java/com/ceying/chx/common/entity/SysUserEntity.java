package com.ceying.chx.common.entity;

import com.ceying.chx.common.config.LoginValid;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;

/**
 * 功能说明: 系统用户实体类
 *          <p>表名tsys_user</p><br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/11 17:27<br>
 */
public class SysUserEntity implements Serializable {

    private static final long serialVersionUID = -930187321640922986L;

    /**
     * 返回表名
     * @return
     */
    public String getTableName() {
        return "tsys_user";
    }
    /**
     *  用户代码
     */
    private String userId;

    /**
     * 用户名称
     */
    @NotNull(message = "用户名称不能为空",groups  = {LoginValid.class})
    private String userName;

    /**
     * 用户密码
     */
    @NotNull(message = "用户密码不能为空",groups = {LoginValid.class})
    private String userPwd;

    /**
     * QA:组织ID,外键:TSYS_ORGANIZATION.ORG_ID
     */
    private String orgId;

    /** 取数据字典[SYS_BIZ_USER_CATE] 0-柜员 1-用户 */
    private String userType;

    /** 用于表示此用户状态 取数据字典[SYS_BIZ_USER_STATUS] 0-正常 1-注销 2-禁用 */
    private String userStatus;

    /** 用于表示此用户是否被锁定 取数据字典[SYS_BIZ_LOCK_STATUS] 0-签退 1-登录 2-非正常签退 3-锁定 */
    private String lockStatus;

    /** 创建时间 */
    private Date createDate;

    /** 最后修改时间 */
    private Date modifyDate;

    /** 密码修改时间 */
    private Date passModifyDate;

    /** 用户手机号 */
    private String mobile;

    /** 用户邮箱 */
    private String email;

    /** 扩展标识 */
    private String extFlag;

    /** 备注 */
    private String remark;

    /** 扩展字段1 */
    private String extField1;

    /** 扩展字段2 */
    private String extField2;

    /** 扩展字段3 */
    private String extField3;

    /** 扩展字段4 */
    private String extField4;

    /** 扩展字段5 */
    private String extField5;

    /** QA:用户指令 */
    private Integer userOrder;

    /** QA:身份证件类型 */
    private String cIdentitytype;

    /** QA:证件号码 */
    private String cIdentityno;

    /**
     * QA:证书
     */
    private String cCredentials;

    /**
     * 租户ID
     */
    private Integer tenantId;


}
