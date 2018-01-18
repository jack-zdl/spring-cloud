package com.ceying.chx.login.BaseController;

import com.alibaba.fastjson.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.*;
/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: miaozhenqing
 * 开发时间: 2017/12/20<br>
 * <br>
 */
@RestController
@RequestMapping("/base")
public class BaseController {
    private String loginHttp="https://localhost:8443/ncyp/user/login.do";
    @ResponseBody
    @RequestMapping("/manage.do")
    public void base(HttpServletRequest request){
        StringBuffer buffer=new StringBuffer("{");
        Enumeration enu=request.getParameterNames();
        while(enu.hasMoreElements()){
            String name=(String)enu.nextElement();
            String value = request.getParameter(name);
            buffer.append("\""+name+"\""+":"+"\""+value+"\""+",");
        }
        //去掉最后一个逗号
        int index = buffer.toString().lastIndexOf(",");
        String str=buffer.toString().substring(0, index)+buffer.toString().substring(index+1, buffer.toString().length());
        str=str+"}";
        JSONObject jsonObject = sendParam(loginHttp,str);
        System.out.println(jsonObject.get("msg"));
    }
    public JSONObject sendParam(String http, String requestParams){
        HttpURLConnection httpConn = null;
        JSONObject jsonObject=null;
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
                jsonObject = result2Json(httpConn.getInputStream());
            }
            return jsonObject;
        }catch (Exception e){
        }finally {
            if(httpConn!=null){
                httpConn.disconnect();
            }
        }
        return jsonObject;
    }
    public JSONObject result2Json(InputStream is){
        JSONObject json=new JSONObject();
        try{
            BufferedReader reader = new BufferedReader(new InputStreamReader(is,"utf-8"));
            String lines;
            StringBuffer sb = new StringBuffer("");
            while ((lines = reader.readLine()) != null) {
                lines = new String(lines.getBytes());
                sb.append(lines);
            }
            json=JSONObject.parseObject(sb.toString());
        }catch (Exception e){
        }
        return json;
    }
}
