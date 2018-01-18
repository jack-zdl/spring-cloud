package com.ceying.chx.controller;

import com.alibaba.fastjson.JSONObject;
import com.ceying.chx.common.constants.UserConstant;
import com.ceying.chx.common.dto.SysUserLoginDto;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

/**
 * 功能说明: <br>
 * 系统版本: 2.0 <br>
 * 开发人员: miaozhenqing
 * 开发时间: 2017/12/22<br>
 * <br>
 */
@Controller
@RequestMapping("/user")
public class LoginController {
    @Value("#{configProperties['ncyp.bank.front.ip']}")
    private String ip;
    @Value("#{configProperties['ncyp.bank.front.port']}")
    private String port;

    @RequestMapping(value = "/login.do",method = RequestMethod.POST, produces = "text/html ;charset=UTF-8")
    @ResponseBody
    public String login(HttpServletRequest request,String userName,String userPwd){
        String HTTP="http://"+ip+":"+port+"/user/login";
        String requestParams="{\"userName\":\""+userName+"\",\"userPwd\":\""+userPwd+"\"}";
        String result= sendHttpData(HTTP,requestParams);
        JSONObject jsonObject = (JSONObject)JSONObject.parse(result);
        if(!"1".equals(jsonObject.get("result").toString())){
            return result.toString();
        }
        Map dataMap = (Map) jsonObject.get("data");
        //获取session将用户信息存入
        HttpSession session = request.getSession();
        SysUserLoginDto sysUserLoginDto=JSONObject.parseObject(dataMap.get(UserConstant.USER_LOGIN_SESSION).toString(),SysUserLoginDto.class);
        session.setAttribute(UserConstant.USER_LOGIN_SESSION,sysUserLoginDto);
        jsonObject.put("data","");
        return result.toString();
    }
    public String sendHttpData(String http, String requestParams){
        HttpURLConnection httpConn = null;
        String str=null;
        JSONObject json=new JSONObject();
        try{
            //发送数据
            httpConn=(HttpURLConnection)new URL(http).openConnection();
            httpConn.setRequestMethod("POST");
            httpConn.setDoOutput(true);
            httpConn.setRequestProperty("Content-Type", "application/json");
            OutputStream os=httpConn.getOutputStream();
            os.write(requestParams.getBytes("utf-8"));
            os.flush();
            os.close();
            //接收数据
            if (httpConn.getResponseCode() == 200){
                str = result2Json(httpConn.getInputStream());
            }
            return str;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if(httpConn!=null){
                httpConn.disconnect();
            }
        }
        return str;
    }
    //inputStream转成String
    public String result2Json(InputStream is){
        JSONObject json=new JSONObject();
        StringBuffer sb = new StringBuffer("");
        try{
            BufferedReader reader = new BufferedReader(new InputStreamReader(is,"utf-8"));
            String lines;
            while ((lines = reader.readLine()) != null) {
                lines = new String(lines.getBytes());
                sb.append(lines);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return sb.toString();
    }
}
