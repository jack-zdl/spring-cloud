package com.ceying.chx.front.base.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ceying.chx.common.util.response.RespJson;
import com.ceying.chx.front.base.service.OrganizationService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


/**
 * 功能说明: 组织查询<br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl
 * 开发时间: 2018/1/15<br>
 * <br>
 */
@RestController
@RequestMapping("/Organization")
public class OrganizationController {

    @Resource
    private OrganizationService organizationServiceImpl;
    /**
     * 根据用户组织查询与之相关的组织
     * @return
     */
    @PostMapping("/selectList")
    public JSONObject selectOrgListBuUserId(HttpServletRequest request){
        JSONObject jsonObject=new JSONObject();
        RespJson respJson =organizationServiceImpl.selectOrgListById(request);
        System.out.println(respJson.toString());
        JSONObject jsonObj = (JSONObject) JSON.toJSON(respJson.getData());
        //jsonObject = JSON.parseObject((String) respJson.getData());
        return jsonObj;
    }


}
