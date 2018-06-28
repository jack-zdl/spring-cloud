package com.ceying.common.workflow.service;

import java.util.Map;

/**
 * Created by Energie on 2018/4/12.
 */
public interface WorkflowService {

    /**
     * 调用后置事件接口方法
     * @param data
     * @return 返回值将会存储到当前执行ID下的流程变量中去
     * @throws Exception
     */
    Map<String,Object> submitCallBack(Map<String, Object> data) throws Exception;
}
