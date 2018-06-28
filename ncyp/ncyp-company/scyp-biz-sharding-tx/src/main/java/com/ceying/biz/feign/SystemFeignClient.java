package com.ceying.biz.feign;

import com.alibaba.fastjson.JSONObject;
import com.ceying.common.entity.OrganizationEntity;
import com.ceying.common.entity.UserEntity;
import com.ceying.common.util.properties.MessageUtil;
import com.ceying.common.util.response.BaseReturnResult;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

/**
 * @author: lidf
 * @date: 2018/3/29
 * @description:
 * @version: 2.0
 */
@FeignClient(name = "scyp-system")
public interface SystemFeignClient {

    /**
     * 获取优先行
     *
     * @param ourOrgId
     * @return
     */
    @RequestMapping(value = "/orgrelation/getPriorityBank", method = RequestMethod.GET)
    String getPriorityBank(@RequestParam("ourOrgId") String ourOrgId);

    /**
     * 银行是否支持该笔应付账款的业务类型
     * @param corecompanyid
     * @param bankid
     * @param supplierid
     * @param bussinesstype
     * @return
     */
    @RequestMapping(value = "/orgrelation/bankSupportBussinesstype", method = RequestMethod.GET)
    boolean bankSupportBussinesstype(@RequestParam("corecompanyid") String corecompanyid,
                                     @RequestParam("bankid") String bankid,
                                     @RequestParam("supplierid") String supplierid,
                                     @RequestParam("bussinesstype") String bussinesstype);

    /**
     *
     * @param ourOrgId
     * @param oppOrgId
     * @return
     */
    @RequestMapping(value = "/orgrelation/isClosePriority", method = RequestMethod.GET)
    boolean isClosePriority(@RequestParam("ourOrgId") String ourOrgId,
                            @RequestParam("oppOrgId") String oppOrgId);

    /**
     * @Description: 获取单个组织信息
     * @Param: [orgId]
     * @return: com.alibaba.fastjson.JSONObject
     * @Author: zhangdl
     * @Date: 2018/4/4
     */
    @RequestMapping(value = "/organization/get", method = RequestMethod.POST)
    JSONObject get(@RequestParam(value = "orgId") String orgId);

    /**
     * @Description: 获取单个组织信息
     * @Param: [orgId]
     * @return: com.alibaba.fastjson.JSONObject
     * @Author: zhangdl
     * @Date: 2018/4/4
     */
    @RequestMapping(value = "/organizationrole/list", method = RequestMethod.POST)
    JSONObject list(@RequestParam(value = "orgid") String orgid);

    /**
     * 获取组织名称
     *
     * @return
     */
    @RequestMapping(value = "/organization/getOrgNameMapCache", method = RequestMethod.POST)
    Map<String, String> getOrgNameMapCache();

    /**
     * 新增或更新组织信息
     *
     * @Param: [entity]
     * @return: com.ceying.common.util.response.BaseReturnResult
     * @Author: zhangdl
     * @Date: 2018/4/16
     */
    @RequestMapping(value = "/organization/addorupdate", method = RequestMethod.POST)
    BaseReturnResult saveOrUpdate(OrganizationEntity entity);

    /**
     * 修改组织融资次数
     * @param orgid
     * @param financenumber
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/organization/updateFinancenumber", method = RequestMethod.POST)
    BaseReturnResult updateFinancenumber(@RequestParam("orgid") String orgid,@RequestParam("financenumber") int financenumber) throws Exception;

    /**
     * @param [org]
     * @return boolean
     * @description 查询组织是否存在
     * @author Meow
     * @date 2018-5-8
     */
    @RequestMapping(value = "/organization/listOrg", method = RequestMethod.POST)
    List<OrganizationEntity> listOrg(OrganizationEntity org);

    /**
     * @Description: 判断核心企业是否把供应商拉入黑名单
     * @Param: [corecompanyid, supplierid]
     * @return: boolean
     * @Author: zhangdl
     * @Date: 2018/4/4
     */
    @RequestMapping(value = "/cooperation/listsupplierblacklist", method = RequestMethod.POST)
    JSONObject listSupplierBlacklist(@RequestParam("ourorgid") String ourorgid, @RequestParam("opporgid") String opporgid,
                                     @RequestParam("category") String category);

    /**
     * 根据模板编码获取模板信息
     *
     * @param templateCode
     * @return
     */
    @RequestMapping("/platformTemplate/getPlatTemByTemCode")
    byte[] getPlatformTemplateByTemplateCode(@RequestParam("templateCode") String templateCode);

    /**
     * 根据用户urid获取用户信息
     *
     * @param userId
     * @return
     */
    @RequestMapping(value = "/sysuser/getUserById", method = RequestMethod.POST)
    UserEntity getUserById(@RequestParam("userId") String userId);


    @RequestMapping("/dopost")
    void doPost(@RequestParam("actiontype") String actiontype, @RequestParam("ids") String ids);

    @RequestMapping(value = "/getCalendar", method = RequestMethod.GET)
    JSONObject getCalendar(@RequestParam("year") String year);

    /**
     * @param [urid]
     * @return com.ceying.system.entity.CalendarEntity
     * @description 查询单个日历
     * @author Meow
     * @date 2018-3-27
     */
    @RequestMapping(value = "/getCalendarSpecial", method = RequestMethod.GET)
    JSONObject getCalendarSpecial(@RequestParam("year") String calendarid);

    /**
     * 获取核心企业对供应商可支持的业务类型
     * @param ourOrgid
     * @param oppOrgid
     * @return
     */
    @RequestMapping(value = "/orgrelation/getAllowedBussinessType", method = RequestMethod.GET)
     List<String> getAllowedBussinessType(@RequestParam("ourOrgid")String ourOrgid,
                                          @RequestParam("oppOrgid") String oppOrgid);

    @RequestMapping(value = "/role/user/get/role-code",method = {RequestMethod.GET})
    public Map<String,String> getRoleCodeByUserId(@RequestParam("userId") String userId);
}
