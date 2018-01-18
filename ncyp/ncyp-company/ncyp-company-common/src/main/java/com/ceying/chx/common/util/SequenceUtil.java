package com.ceying.chx.common.util;
import java.util.UUID;

public class SequenceUtil {

	public static String UUID(){
		String uuid = UUID.randomUUID().toString();
		return StringUtil.replaceStringCaseInsensitive(uuid, "-", "");
	}
}
