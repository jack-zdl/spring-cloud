package com.ceying.chx.common.dto;

import java.io.Serializable;

/**
* @author 作者 : wuch 
* @version 创建时间：2017年6月6日 下午2:17:10
* 类说明
*/
public class DictionaryBean implements Serializable{
	
	private static final long serialVersionUID = 4361029236489321259L;
	/**
	 * 字典名称
	 */
	private String text;
	/**
	 * 字典值
	 */
	private String value;
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	

}
