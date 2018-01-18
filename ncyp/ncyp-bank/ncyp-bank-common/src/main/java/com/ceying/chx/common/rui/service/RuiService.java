package com.ceying.chx.common.rui.service;

public interface RuiService {

	/**
	   * 按钮权限校验
	   *
	   * @param rightinfo 权限信息
	   * @return boolean
	   */
	  public boolean haveRight(String rightinfo);
}
