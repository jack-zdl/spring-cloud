package com.ceying.common.util.sequence;


import com.ceying.common.util.stringtools.FString;

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
		return FString.replaceStringCaseInsensitive(uuid, "-", "");
	}
}
