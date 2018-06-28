package com.ceying.common.base;

import com.alibaba.fastjson.JSONObject;
import com.ceying.common.util.bean.SpringUtil;
import com.ceying.common.util.convert.ConvertApi;
import com.github.pagehelper.PageInfo;
import org.springframework.context.ApplicationContext;

import java.io.Serializable;
import java.util.List;

/**
 * 功能说明: 服务层返回控制层结果集<br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhanghj
 * 开发时间: 2018/3/31<br>
 * <br>
 */
public class CypRowSet<T> implements Serializable {

	private static final long serialVersionUID = -1L;
    private static ApplicationContext  applicationContext;

    //返回JSONObject对象
	private JSONObject jsonObject = null;

    public JSONObject getJsonObject() {
        return jsonObject;
    }

    public void setJsonObject(JSONObject jsonObject) {
        this.jsonObject = jsonObject;
    }

    public void setList(List<T> list) {
        ConvertApi convertApi = SpringUtil.getBean(ConvertApi.class);
        PageInfo<T> pageInfo = new PageInfo<>(list);
        JSONObject jsonObject = convertApi.convertByAnnotation(list);
        jsonObject.put("page",pageInfo.getPageNum());
        jsonObject.put("total",pageInfo.getTotal());
        jsonObject.put("totalpage",pageInfo.getPages());
        this.setJsonObject(jsonObject);
    }

}
