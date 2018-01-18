package com.ceying.chx.common.util;
import java.util.UUID;

/**
 * @author zhangdl
 */
public class SequenceUtil {

	/**
	 * 生成doc文档
	 * @return
	 */
	public static String UUID(){
		String uuid = UUID.randomUUID().toString();
		return StringUtil.replaceStringCaseInsensitive(uuid, "-", "");
	}
}
