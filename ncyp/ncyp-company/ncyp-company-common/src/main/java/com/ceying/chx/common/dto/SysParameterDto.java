package com.ceying.chx.common.dto;


import java.io.Serializable;

/**
 * 系统参数类
 *
 */


public class SysParameterDto implements Serializable {

	private int tenantId;

	/** QA:分类编号，外键TSYS_KIND.KIND_CODE */
	private String kindCode;

	/** 参数名称 */
	private String paramName;

	/** 参数值 */
	private String paramValue;

	/** QA:扩展标识 */
	private String extFlag;

	/** 生命周期 */
	private String lifecycle;

	/** 平台标识 */
	private String platform;

	/** 参数说明 */
	private String paramDesc;

	/** 参数正则验证规则 */
	private String paramRegex;

	/** 参数编号 */
	private String paramCode;

	/** 关联组织 */
	private String relOrg;
	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column ATSCLOUD.TSYS_PARAMETER.TENANT_ID
	 *
	 * @return the value of ATSCLOUD.TSYS_PARAMETER.TENANT_ID
	 *
	 * @mbggenerated
	 */
	public int getTenantId() {
		return tenantId;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column ATSCLOUD.TSYS_PARAMETER.TENANT_ID
	 *
	 * @param tenantId the value for ATSCLOUD.TSYS_PARAMETER.TENANT_ID
	 *
	 * @mbggenerated
	 */
	public void setTenantId(int tenantId) {
		this.tenantId = tenantId;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column ATSCLOUD.TSYS_PARAMETER.KIND_CODE
	 *
	 * @return the value of ATSCLOUD.TSYS_PARAMETER.KIND_CODE
	 *
	 * @mbggenerated
	 */
	public String getKindCode() {
		return kindCode;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column ATSCLOUD.TSYS_PARAMETER.KIND_CODE
	 *
	 * @param kindCode the value for ATSCLOUD.TSYS_PARAMETER.KIND_CODE
	 *
	 * @mbggenerated
	 */
	public void setKindCode(String kindCode) {
		this.kindCode = kindCode == null ? null : kindCode.trim();
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column ATSCLOUD.TSYS_PARAMETER.PARAM_NAME
	 *
	 * @return the value of ATSCLOUD.TSYS_PARAMETER.PARAM_NAME
	 *
	 * @mbggenerated
	 */
	public String getParamName() {
		return paramName;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column ATSCLOUD.TSYS_PARAMETER.PARAM_NAME
	 *
	 * @param paramName the value for ATSCLOUD.TSYS_PARAMETER.PARAM_NAME
	 *
	 * @mbggenerated
	 */
	public void setParamName(String paramName) {
		this.paramName = paramName == null ? null : paramName.trim();
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column ATSCLOUD.TSYS_PARAMETER.PARAM_VALUE
	 *
	 * @return the value of ATSCLOUD.TSYS_PARAMETER.PARAM_VALUE
	 *
	 * @mbggenerated
	 */
	public String getParamValue() {
		return paramValue;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column ATSCLOUD.TSYS_PARAMETER.PARAM_VALUE
	 *
	 * @param paramValue the value for ATSCLOUD.TSYS_PARAMETER.PARAM_VALUE
	 *
	 * @mbggenerated
	 */
	public void setParamValue(String paramValue) {
		this.paramValue = paramValue == null ? null : paramValue.trim();
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column ATSCLOUD.TSYS_PARAMETER.EXT_FLAG
	 *
	 * @return the value of ATSCLOUD.TSYS_PARAMETER.EXT_FLAG
	 *
	 * @mbggenerated
	 */
	public String getExtFlag() {
		return extFlag;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column ATSCLOUD.TSYS_PARAMETER.EXT_FLAG
	 *
	 * @param extFlag the value for ATSCLOUD.TSYS_PARAMETER.EXT_FLAG
	 *
	 * @mbggenerated
	 */
	public void setExtFlag(String extFlag) {
		this.extFlag = extFlag == null ? null : extFlag.trim();
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column ATSCLOUD.TSYS_PARAMETER.LIFECYCLE
	 *
	 * @return the value of ATSCLOUD.TSYS_PARAMETER.LIFECYCLE
	 *
	 * @mbggenerated
	 */
	public String getLifecycle() {
		return lifecycle;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column ATSCLOUD.TSYS_PARAMETER.LIFECYCLE
	 *
	 * @param lifecycle the value for ATSCLOUD.TSYS_PARAMETER.LIFECYCLE
	 *
	 * @mbggenerated
	 */
	public void setLifecycle(String lifecycle) {
		this.lifecycle = lifecycle == null ? null : lifecycle.trim();
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column ATSCLOUD.TSYS_PARAMETER.PLATFORM
	 *
	 * @return the value of ATSCLOUD.TSYS_PARAMETER.PLATFORM
	 *
	 * @mbggenerated
	 */
	public String getPlatform() {
		return platform;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column ATSCLOUD.TSYS_PARAMETER.PLATFORM
	 *
	 * @param platform the value for ATSCLOUD.TSYS_PARAMETER.PLATFORM
	 *
	 * @mbggenerated
	 */
	public void setPlatform(String platform) {
		this.platform = platform == null ? null : platform.trim();
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column ATSCLOUD.TSYS_PARAMETER.PARAM_DESC
	 *
	 * @return the value of ATSCLOUD.TSYS_PARAMETER.PARAM_DESC
	 *
	 * @mbggenerated
	 */
	public String getParamDesc() {
		return paramDesc;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column ATSCLOUD.TSYS_PARAMETER.PARAM_DESC
	 *
	 * @param paramDesc the value for ATSCLOUD.TSYS_PARAMETER.PARAM_DESC
	 *
	 * @mbggenerated
	 */
	public void setParamDesc(String paramDesc) {
		this.paramDesc = paramDesc == null ? null : paramDesc.trim();
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column ATSCLOUD.TSYS_PARAMETER.PARAM_REGEX
	 *
	 * @return the value of ATSCLOUD.TSYS_PARAMETER.PARAM_REGEX
	 *
	 * @mbggenerated
	 */
	public String getParamRegex() {
		return paramRegex;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column ATSCLOUD.TSYS_PARAMETER.PARAM_REGEX
	 *
	 * @param paramRegex the value for ATSCLOUD.TSYS_PARAMETER.PARAM_REGEX
	 *
	 * @mbggenerated
	 */
	public void setParamRegex(String paramRegex) {
		this.paramRegex = paramRegex == null ? null : paramRegex.trim();
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column ATSCLOUD.TSYS_PARAMETER.PARAM_CODE
	 *
	 * @return the value of ATSCLOUD.TSYS_PARAMETER.PARAM_CODE
	 *
	 * @mbggenerated
	 */
	public String getParamCode() {
		return paramCode;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column ATSCLOUD.TSYS_PARAMETER.PARAM_CODE
	 *
	 * @param paramCode the value for ATSCLOUD.TSYS_PARAMETER.PARAM_CODE
	 *
	 * @mbggenerated
	 */
	public void setParamCode(String paramCode) {
		this.paramCode = paramCode == null ? null : paramCode.trim();
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column ATSCLOUD.TSYS_PARAMETER.REL_ORG
	 *
	 * @return the value of ATSCLOUD.TSYS_PARAMETER.REL_ORG
	 *
	 * @mbggenerated
	 */
	public String getRelOrg() {
		return relOrg;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column ATSCLOUD.TSYS_PARAMETER.REL_ORG
	 *
	 * @param relOrg the value for ATSCLOUD.TSYS_PARAMETER.REL_ORG
	 *
	 * @mbggenerated
	 */
	public void setRelOrg(String relOrg) {
		this.relOrg = relOrg == null ? null : relOrg.trim();
	}


}
