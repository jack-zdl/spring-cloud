package com.ceying.common.constant;

/**
 * 
 * 功能说明: <br>
 * 系统版本: v1.0 <br>
 * 开发人员: chx<br>
 * 开发时间: 2014-8-5<br>
 * 审核人员: <br>
 * 相关文档: <br>
 * 修改记录: <br>
 * 文件名称：AuthorityConstants.java
 * 修改日期 修改人员 修改说明 <br>
 * ======== ====== ============================================ <br>
 *
 * 下一步是把此类型属性配置化
 */
public class AuthorityConstants {	

	/** 缺省密码 */
	//public static final String DEFAULT_USER_PWD = SysParameterUtil.getProperty("defaultUserPassword", "111111");

	/** 用户已注销  */
	public static final String USER_STATUS_LOGOFF = "1";
	
	/** 用户已禁用 */
	public static final String USER_STATUS_FORBIDDEN = "2"; 

	/** 用户未注销 */
	public static final String USER_NOT_LOCKED = "0";

	/** 用户正常状态 */
	public static final String USER_STATUS_NORMAL = "0";
	
	/** 锁定状态[SYS_BIZ_LOCK_STATUS] */
	/** 签退 */
	public static final String USER_IS_SIGNOUT = "0"; 
	
	/** 登录 */
	public static final String USER_IS_SIGNIN = "1";
	
	/** 用户未正常签退 */
	public static final String USER_ISNOT_SIGNOUT = "2";
	
	/** 用户被锁定 */
	public static final String USER_IS_LOCKED = "3";
	
	/** 用户由于密码输错次数达到上限被锁定*/
	public static final String USER_IS_LOCKED_BY_WRONG_PASSWORD = "4";
	
	/*
	 * 菜单常量类
	 */
	/** 用户第一层菜单 */
	public static final String FIRST_LEVEL_MENU = "first_level_menu";
	
	/** 用户第二层菜单 */
	public static final String SECOND_LEVEL_MENU = "second_level_menu";
	
	/** parent_id */
	public static final String COLUMN_PARENT_ID ="PARENT_ID";
	
	/** kind_id */
	public static final String COLUMN_KIND_ID = "KIND_ID";
	
	/*
	 * 权限常量类
	 */
	/** 增加业务授权 */
	public static final String TYPE_RIGHT_BIZ_ADD = "1";
	
	/** 增加授权权限 */
	public static final String TYPE_RIGHT_AUTHORIZE_ADD = "2";
	
	/** 减少业务授权 */
	public static final String TYPE_RIGHT_BIZ_SUB = "3";
	
	/** 减少授权权限 */
	public static final String TYPE_RIGHT_AUTHORIZE_SUB = "4";
	
	/** 操作权限 */
	public static final String VALUE_RIGHT_BIZ = "1";
	
	/** 授权权限 */
	public static final String VALUE_RIGHT_AUTHORIZE = "2";
	
	/** 操作权限 */
	public static final String VALUE_RIGHT_ENABLE = "1";
	
	/** 禁止权限*/
	public static final String VALUE_RIGHT_FORBID = "0";
	
	/** 全部权限 */
	public static final String VALUE_RIGHT_ALL = "3";
	
	/** 权限类型-用户类型 */
	public static final String TYPE_RIGHT_CATE_USER = "0";
	
	/** 权限类型-角色类型 */
	public static final String TYPE_RIGHT_CATE_ROLE = "1";
	
	/** 权限类型-机构类型 */
	public static final String TYPE_RIGHT_CATE_ORG = "2";
	
	public static final String SYS_SUPER_USER="admin";
	
	public static final String SYS_SUPER_ROLE="admin";
	
	/**登录获取用户字段 */
	public static final String SYS_LOGIN_FIELD_NAME="user_id";

	/** 服务开启业务日志 */
	public static final String TYPE_SERVICE_START_LOG = "1";
	
	/** 服务关闭业务日志 */
	public static final String TYPE_SERVICE_STOP_LOG = "0";
	
	/** 授权分类-已授权*/
	public static final String BIZ_AUTH_TYPE_HASH = "1";
	
	/** 授权分类-未授权 */
	public static final String BIZ_AUTH_TYPE_NO = "0";
	
	
	/** 分配分类-已分配*/
	public static final String BIZ_ALLOT_TYPE_HASH = "1";
	
	/** 分配分类-未分配 */
	public static final String BIZ_ALLOT_TYPE_NO = "0";
	
	
}
