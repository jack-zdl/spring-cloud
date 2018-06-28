package com.ceying.common.feign;

import com.alibaba.fastjson.JSONObject;
import com.ceying.common.workflow.vo.FlowableTasksVo;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * Created by Energie on 2018/3/29.
 */
@FeignClient(name = "scyp-modeler")
public interface WorkflowFeignClient {
    /**
     * 发起流程
     * @param processDefinitionKey  流程key
     * @param businessKey  业务主键
     * @param map  传入参数
     * @return
     */
    @RequestMapping(value = "/flowable-modeler/workflow/start/processInstance/byKey.do",method = RequestMethod.POST)
    Map startProcessInstanceByKey(@RequestParam("processDefinitionKey") String processDefinitionKey,@RequestParam("businessKey") String businessKey,
                                  @RequestBody Map map);


    /**
     * 撤销删除流程[不进行权限校验]
     * @param processInstanceId 流程id
     */
    @RequestMapping(value = "/flowable-modeler/app-api/rest/process-instances/{processInstanceId}",method = RequestMethod.DELETE)
    void deleteProcessInstance(@PathVariable("processInstanceId") String processInstanceId);

    /**
     * 撤销删除流程[严格校验是否有撤销删除流程权限]
     * @param processInstanceId 流程id
     */
    @RequestMapping(value = "/flowable-modeler/app-api/rest/process-instances/{processInstanceId}/strictly",method = RequestMethod.DELETE)
    void deleteProcessInstanceStrictly(@PathVariable("processInstanceId") String processInstanceId);

    /**
     * 根据业务主键ID删除流程实例[不进行权限校验]
     * @param businessKey
     */
    @RequestMapping(value = "/flowable-modeler/app-api/rest/process-instances/business-key/{businessKey}", method = RequestMethod.DELETE)
    void deleteProcessInstanceByBusinessKey(@PathVariable("businessKey") String businessKey);

    /**
     * 根据业务主键ID删除流程实例[严格校验是否有撤销删除流程权限]
     * @param businessKey
     */
    @RequestMapping(value = "/flowable-modeler/app-api/rest/process-instances/business-key/{businessKey}/strictly", method = RequestMethod.DELETE)
    void deleteProcessInstanceByBusinessKeyStrictly(@PathVariable("businessKey") String businessKey);

    /**
     * 批量删除流程[不进行权限校验]
     * @param processInstanceIds 流程id集合
     */
    @RequestMapping(value = "/flowable-modeler/app-api/rest/process-instances/batch-delete",method = RequestMethod.POST)
    void batchDeleteProcessInstance(@RequestParam("processInstanceIds") List<String> processInstanceIds);

    /**
     * 批量删除流程[严格校验是否有撤销删除流程权限]
     * @param processInstanceIds 流程id集合
     */
    @RequestMapping(value = "/flowable-modeler/app-api/rest/process-instances/batch-delete/strictly",method = RequestMethod.POST)
    void batchDeleteProcessInstanceStrictly(@RequestParam("processInstanceIds") List<String> processInstanceIds);

    /**
     * 根据业务主键ID获取流程实例ID
     * @param businessKey
     * @return
     */
    @RequestMapping(value = "/flowable-modeler/workflow/get/process-instance/by/business-key.do",method = RequestMethod.GET)
    String getProcessInstanceIdByBusinessKey(@RequestParam("businessKey") String businessKey);

    /**
     * 查询待办任务
     * @param processDefinitionKey
     * @param page
     * @param rows
     * @param isNeedListPage
     * @return
     */
    @RequestMapping(value = "/flowable-modeler/rest/query/tasks.do")
    JSONObject listTasks(@RequestParam(value = "processDefinitionKey",required = false)String processDefinitionKey,
                          @RequestParam(value = "page",required = false)String page,
                          @RequestParam(value = "rows",required = false)String rows,
                          @RequestParam(value = "isNeedListPage",required = false)String isNeedListPage);


    /**
     * 查询待办任务详情和应付账款urid
     * @param flowableTasksVo
     * @return
     */
    @RequestMapping(value = "/flowable-modeler/workflow/statistics/detail.do",method = RequestMethod.GET)
    Map<String,Object> statisticsDetail(@RequestBody FlowableTasksVo flowableTasksVo);

    /**
     * 查询银行待办任务详情和应付账款urid
     * @param flowableTasksVo
     * @return
     */
    @RequestMapping(value = "/flowable-modeler/workflow/select/task/by/operation-flag.do",method = RequestMethod.GET)
    Map<String,Object> selectTaskByOperationFlag(@RequestParam(value = "flowableTasksVo") FlowableTasksVo flowableTasksVo);


    /**
     * 根据执行ID添加全局变量
     * @param executionId
     * @param variable
     */
    @RequestMapping(value = "/flowable-modeler/app-api/rest/process-instances/variables/add",method = RequestMethod.POST)
    void addVariablesByExecutionId(@RequestParam("executionId") String executionId, @RequestBody Map<String,Object> variable);


    /**
     * 校验流程是否存在
     * @param processDefinitionKey
     * @return
     */
    @RequestMapping(value = "/flowable-modeler/workflow/check/process-definition.do", method = RequestMethod.GET)
    boolean checkProcessDefinition(@RequestParam("processDefinitionKey") String processDefinitionKey);
}
