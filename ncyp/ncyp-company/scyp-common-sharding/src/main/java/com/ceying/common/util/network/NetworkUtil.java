package com.ceying.common.util.network;

import javax.servlet.http.HttpServletRequest;

public class NetworkUtil {
	
	/**
	 * 获取请求IP地址
	 * @param request
	 * @return
	 */
	public static String getIpAddr(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        if(ip.equals("0:0:0:0:0:0:0:1")){
    		ip = "127.0.0.1";
    	}
        return ip;
    }

    /**
     * 判断字符串是否为合法IP
     * @param ip 待校验的IP
     * @return
     */
    public static boolean isIp(String ip){
	    if(ip.matches("\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}")){
	        String[] s = ip.split("\\.");
	        if(Integer.parseInt(s[0])<=255)
                if(Integer.parseInt(s[1])<=255)
                    if(Integer.parseInt(s[2])<=255)
                        if(Integer.parseInt(s[3])<=255)
                            return true;
        }
        return false;
    }

    /**
     * 校验IP是否在合法IP列表中
     * @param ip 待校验的IP
     * @param legalIp 合法IP列表，各IP以逗号","相隔，IP段以横杆"-"连接(例:127.0.0.1,10.60.44.1-10.60.44.255)
     * @return
     */
    public static boolean checkIp(String ip, String legalIp){
        String[] legalIps = legalIp.split(",");
        //遍历合法IP列表
        for(String tempIp : legalIps){
            //判断是单个IP还是IP段
            if(tempIp.contains("-")){
                String[] tempIpArray = tempIp.split("-");
                if(tempIpArray.length == 2){
                    String minIp = tempIpArray[0];
                    String maxIp = tempIpArray[1];
                    if(isIp(minIp) && isIp(maxIp)){
                        String[] minIpArray = minIp.split("\\.");
                        String[] maxIpArray = maxIp.split("\\.");
                        int minIpLast = Integer.parseInt(minIpArray[3]);
                        int maxIpLast = Integer.parseInt(maxIpArray[3]);
                        String minPrefix = minIpArray[0]+"."+minIpArray[1]+"."+minIpArray[2]+".";
                        String maxPrefix = maxIpArray[0]+"."+maxIpArray[1]+"."+maxIpArray[2]+".";
                        //只有IP前3位完全相同，且‘-’后的IP大于前面的IP才是合法的IP段
                        if(minIpLast <= maxIpLast && minPrefix.equals(maxPrefix)){
                            //逐一判断IP段中的IP
                            for(int i = minIpLast; i<=maxIpLast; i++){
                                if((minPrefix+i).equals(ip)){
                                    return true;
                                }
                            }
                        }
                    }
                }
            }else{
                if(tempIp.equals(ip)){
                    return true;
                }
            }
        }

        return false;
    }
}
