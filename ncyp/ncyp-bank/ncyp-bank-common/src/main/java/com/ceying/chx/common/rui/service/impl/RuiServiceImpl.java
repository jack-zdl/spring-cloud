package com.ceying.chx.common.rui.service.impl;

import com.ceying.chx.common.rui.service.RuiService;

public class RuiServiceImpl implements RuiService{

	/**
	   * 按钮权限校验
	   *
	   * @param rightinfo 权限信息
	   * @return boolean
	   */
	  public boolean haveRight(String rightinfo) {
		    boolean flag = false;
		    if(rightinfo!=null&&!"".equals(rightinfo)){
		    	String[] infos = rightinfo.split("#");
		    	if(infos.length==2){
		    		//UserInfo userInfo = HttpUtil.getUserInfo(infos[0]);
				    //flag = userInfo.getTransCache().checkRight(infos[1]);
		    	}		    
		    }
		    		
		    return flag;	    
	  }
}
