package com.cyp.chx.common.util.constants;


/**
 * 
 * 功能说明: <br>
 * 系统版本: v1.0 <br>
 * 开发人员: chx<br>
 * 开发时间: 2011-11-10<br>
 * 审核人员: <br>
 * 相关文档: <br>
 * 修改记录: <br>
 * 文件名称：UserGroupConstants.java
 * 修改日期 修改人员 修改说明 <br>
 * ======== ====== ============================================ <br>
 *
 */
public class UserGroupConstants {

	public static final String USERGROUP_ROOT="bizroot";
	
	/**
	 * 机构类型
	 */
	public static final String ORG_TYPE="org";
	
	/**
	 * 机构类型
	 */
	public static final String ORG_NAME="组织机构";
	
	/**
	 * 机构类型
	 */
	public static final String BRANCH_TYPE="branch";
	
	/**
	 * 机构类型
	 */
	public static final String BRANCH_NAME="机构";
	
	/**
	 * 部门类型
	 */
	public static final String DEP_TYPE="dep";
	
	/**
	 * 部门类型
	 */
	public static final String DEP_NAME="部门";
	/**
	 * 岗位类型
	 */
	public static final String OFFICE_TYPE="office";
	/**
	 * 岗位类型
	 */
	public static final String OFFICE_NAME="岗位";
	
	/**
	 * 角色类型
	 */
	public static final String ROLE_TYPE="role";
	
	/**
	 * 角色类型
	 */
	public static final String ROLE_NAME="角色";
	
	/**
	 * 团队类型
	 */
	public static final String TEAM_TYPE="team";
	
	/**
	 * 团队类型
	 */
	public static final String TEAM_NAME="团队";
	
	/**
	 * 岗位类型
	 */
	public static final String POSITION_TYPE="pos";
	/**
	 * 岗位类型
	 */
	public static final String POSITION_NAME="岗位";
	
	/**
	 * 岗位名称扩展名
	 * 新增组织时主管岗位的扩展名
	 */
	public static final String MANAGER_POSITION_NAME_SUFFIX="主管";//SysParameterUtil.getProperty("managerPositionNameSuffix", "主管");
	
	/**
	 * 岗位编码扩展名
	 * 新增组织时主管岗位编码的扩展名
	 */
	public static final String MANAGER_POSITION_CODE_SUFFIX="head";//SysParameterUtil.getProperty("managerPositionCodeSuffix", "head");

	/**
	 * 岗位名称扩展名
	 * 新增组织时普通岗位的扩展名
	 */
	public static final String COMMON_POSITION_NAME_SUFFIX="普通岗";//SysParameterUtil.getProperty("commonPositionNameSuffix", "普通岗");
	
	/**
	 * 岗位编码扩展名
	 * 新增组织时普通岗位编码的扩展名
	 */
	public static final String COMMON_POSITION_CODE_SUFFIX="common";//SysParameterUtil.getProperty("commonPositionCodeSuffix", "common");

	
	/**
	 * 组织编码是否唯一<br>
	 * false:不唯一，不同纬度可以能重复，同一纬度不能重复<br>
	 * true :唯一  ，不同纬度组织编码不能重复<br>
	 */
	public static final String UNIQUE_ORG_CODE="false";//SysParameterUtil.getProperty("uniqueOrgCode", "false");
	
	
	public static final String KEY_ORG_DIMENSION="dimension";
	
	
	public static final String KEY_ORG_CODE="org_code";
	
	/**
	 * 注销组织 2013.8.23 add by zhouzx
	 */
	public static final String WITHDRAW_ORG_TYPE="withdraw_org";
	/**
	 * 激活组织 2013.8.23 add by zhouzx
	 */
	public static final String ACTIVE_ORG_TYPE="active_org";
	
}
