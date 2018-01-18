/*
 * 系统名称: cyp
 * 模块名称: 基础业务框架common组件
 * 类 名 称:  UIExtendPropertiesUtil.java
 * 软件版权: ceyingfintech
 * 相关文档:
 * 修改记录: 
 * 修改日期                       修改人员                     修改说明<BR>
 * ===========     ===========  ======================================================
 * 2010.11.19      胡海亮                       新增 UIExtendPropertiesUtil类读取UI扩展配置文件
 * ===========     ===========  ======================================================
 * 评审记录：
 * 
 * 评审人员：
 * 评审日期：
 * 发现问题：
 */
package com.ceying.chx.common.util.properties;

//import com.ceying.chx.common.exception.BizframeException;

import java.io.IOException;
import java.io.InputStream;
import java.text.MessageFormat;
import java.util.Properties;

/**
 * 
 * 功能说明:
 *
 * 系统版本：V0.1
 *
 * 开发人员：chx
 *
 * 开发时间:2010-上午10:59:00
 * 
 * TODO
 */
public class UIExtendPropertiesUtil {
	
//	/**
//	 * UI扩展信息配置文件路径
//	 */
//	private static final String UIEXT_PROPERTIES_FILE_PATH = "/ui-ext.properties";
//
//	/**
//	 * UI扩展信息配置
//	 */
//	private static Properties uiExtProperties = new Properties();
//	static {
//		try {
//			InputStream stream = BizframeException.class
//					.getResourceAsStream(UIEXT_PROPERTIES_FILE_PATH);
//			uiExtProperties.load(stream);
//			stream.close();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
//
//
//	/**
//	 * 根据key值获取配置文件中的属性值
//	 *
//	 * @param key
//	 * 			配置键值
//	 * @return
//	 *          配置值，若无key键值配置 还回空字符串：""
//	 */
//	public static String getProperty(String key){
//		return uiExtProperties.getProperty(key, "");
//	}
//
//
//	/**
//	 * 根据key值获取配置文件中的属性值
//	 *
//	 * @param key
//	 * 			配置键值
//	 * @param defaultValue
//	 * 			无此配置时的默认值
//	 * @return
//	 *          配置值,若无key值配置则返回 defaultValue
//	 */
//	public static String getProperty(String key,String defaultValue){
//		return uiExtProperties.getProperty(key, defaultValue);
//	}
//
//
//	/**
//	 * 根据key值获取配置文件中的boolean属性值
//	 *
//	 * @param key
//	 * 			配置键值
//	 * @return
//	 *          配置值，若无key键值配置 还回false
//	 */
//	public static boolean getBoolProperty(String key){
//		String bool=uiExtProperties.getProperty(key);
//		return (null!=bool&&"true".equals(bool.toLowerCase()));
//	}
//
//	/**
//	 * 根据key值获取配置文件中的boolean属性值
//	 *
//	 * @param key
//	 * 			配置键值
//	 * @param defaultValue
//	 * 			无此配置时的默认值
//	 * @return
//	 *          配置值,若无key值配置则返回 defaultValue
//	 */
//	public static boolean getBoolProperty(String key,boolean defaultValue){
//		String bool=uiExtProperties.getProperty(key);
//		if(null==bool||"".equals(bool)){
//			return defaultValue;
//		}else{
//			return "true".equals(bool.toLowerCase());
//		}
//
//	}
//
//
//	/**
//	 *
//	 * @param key
//	 * @param message
//	 * @return
//	 */
//	public static String getProperty(String key, Object... message){
//		String pattern = uiExtProperties.getProperty(key);
//		if (pattern != null) {
//			return MessageFormat.format(pattern, message);
//		} else {
//			return MessageFormat.format("{0}", message);
//		}
//	}
}
