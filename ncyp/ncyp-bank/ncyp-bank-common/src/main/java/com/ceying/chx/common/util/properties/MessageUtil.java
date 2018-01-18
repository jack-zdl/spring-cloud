/*
 * 系统名称: cyp
 * 模块名称: JRES内核
 * 类 名 称: ErrorNoStore.java
 * 软件版权: ceyingfintech
 * 相关文档:
 * 修改记录:
 * 修改日期      修改人员                     修改说明<BR>
 * ========     ======  ============================================
 *   
 * ========     ======  ============================================
 * 评审记录：
 * 
 * 评审人员：
 * 评审日期：
 * 发现问题：
 */
package com.ceying.chx.common.util.properties;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.text.MessageFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

/**
 * 功能说明: 异常信息工具类<br>
 * 系统版本: V0.1 <br>
 * 开发人员: chx <br>
 * 开发时间: 2010-7-19<br>
 * <br>
 */
public class MessageUtil {
	/**
	 * 异常信息配置文件路径
	 */
	private static final String EXCEPTION_PROPERTIES_FILE_PATH = "/message_biz_zh.properties"; 
	
	/**
	 * 异常信息配置
	 */
	private static Properties exceptionProperties = new Properties();
	static {
		try {
			InputStream stream = MessageUtil.class
					.getResourceAsStream(EXCEPTION_PROPERTIES_FILE_PATH);
			exceptionProperties.load(stream);
			stream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 格式化异常信息
	 * @param code
	 * @param message
	 * @return
	 */
	public static String format(String code, Object... message) {
		String pattern = exceptionProperties.getProperty(code);
		if (pattern != null) {
			return MessageFormat.format(pattern, message);
		} else {
			return MessageFormat.format("{0}", message);
		}

	}
	
	/**
	 * 打印信息
	 * @param resp
	 * @param code
	 * @param message
	 * @return
	 */
	public static void print(HttpServletResponse resp,Object code, Object... message) {
        resp.setContentType("text/json;charset=utf-8");
        String pattern = exceptionProperties.getProperty((String) code);
        String msg = "";
        if (pattern != null) {
            msg = MessageFormat.format(pattern, message);
        } else {
            msg = MessageFormat.format("{0}", message);
        }
        try {
            if("PUB0001".equals(code)){
                //保存成功，并且需要附加提示信息，如密码重置后，需要提示开户修改后的密码
                if(message[0] != null){
                    msg +=(String)message[0];
                }
                    resp.getWriter().print("{\"success\":true,\"code\":\"" + code + "\",\"msg\":\"" + msg + "\"}");
                }
            else{
                resp.getWriter().print("{\"success\":false,\"code\":\"" + code + "\",\"msg\":\"操作失败！"+msg.replaceAll("\\\"", "\\\'").replaceAll("\n", "")+"\"}");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
	}

    /**
     * 打印信息
     * @param resp
     * @param flag
     * @param code
     * @param message
     * @return
     */
    public static void printf( List<String> cfzflist, HashMap<String,Object> dezfmap, Object flag, HttpServletResponse resp, Object code, Object... message) {
        resp.setContentType("text/json;charset=utf-8");
        String pattern = exceptionProperties.getProperty((String) code);
        String msg = "";
        if (pattern != null) {
            msg = MessageFormat.format(pattern, message);
        } else {
            msg = MessageFormat.format("{0}", message);
        }

        try {
            if("PUB0001".equals(code)){
                //保存成功，并且需要附加提示信息，如密码重置后，需要提示开户修改后的密码
                if(message[0] != null){
                    msg +=(String)message[0];
                }
                if(flag=="false") {
                    resp.getWriter().print("{\"success\":true,\"msg\":\"" + msg + "\"}");
                }else{
                    //String key = dezfmap.keySet().iterator().next();
                  //  String flagmsg="{\"" + key + "\":\"" + dezfmap.get(key) + "\"}";
                    String flagmsg_ready = "{";
                    for (Map.Entry<String, Object> entry : dezfmap.entrySet()) {
                        flagmsg_ready = flagmsg_ready +"\"" + entry.getKey()+"\"" +
                                ":" +"\""+ ((String) entry.getValue()).substring(0,((String) entry.getValue()).length()-1)+"\""+",";
                    }

                    flagmsg_ready = flagmsg_ready.substring(0,flagmsg_ready.length()-1) + "}";
                    String cfzfmsg="";
                    if(cfzflist!=null&&cfzflist.size()>0) {

                        for (int i = 0; i < cfzflist.size(); i++) {
                            cfzfmsg = cfzfmsg + cfzflist.get(i);
                        }

                    }
                    String Test = "{\"success\":true,\"msg\":\"" + msg + "\",\"flag\":\"true\",\"flagmsg\":" + flagmsg_ready  +",\"cfzfmsg\":\"" + cfzfmsg + "\"}";
                    resp.getWriter().print("{\"success\":true,\"msg\":\"" + msg + "\",\"flag\":\"true\",\"flagmsg\":" + flagmsg_ready +",\"cfzfmsg\":\"" + cfzfmsg + "\"}");

                }

            }else{
                resp.getWriter().print("{\"success\":false,\"msg\":\"操作失败！"+msg.replaceAll("\\\"", "\\\'").replaceAll("\n", "")+"\"}");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
	
}
