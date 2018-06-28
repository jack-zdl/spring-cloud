package com.ceying.common.workflow.controller;

import com.ceying.common.exception.ServiceException;
import com.ceying.common.util.bean.SpringUtil;
import com.ceying.common.workflow.service.WorkflowService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * 功能说明: 工作流后置事件处理借款<br>
 * 系统版本: 1.0 <br>
 * 开发人员: yangxh
 * 开发时间: 2018/4/10<br>
 * <br>
 */
@RestController
@RequestMapping("/workflow")
public class CompleteTaskController  {

    @RequestMapping("/execution/listener/after.do")
    public Map executionListenerAfter(@RequestBody Map<String, Object> variables) throws ServiceException {
        String beanName = variables.get("beanName").toString();
        Map result = null;
        try {
            WorkflowService workflowService = SpringUtil.getBean(beanName, WorkflowService.class);
            result = workflowService.submitCallBack((Map<String, Object>) variables.get("variables"));
        }catch (ServiceException ex){
            throw ex;
        }catch (Exception e){
            e.printStackTrace();
            throw new ServiceException("执行后置事件异常！");
        }
        return result;
    }
}
