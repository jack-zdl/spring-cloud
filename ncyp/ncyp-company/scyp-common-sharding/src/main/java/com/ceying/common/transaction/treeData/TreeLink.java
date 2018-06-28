package com.ceying.common.transaction.treeData;

import com.ceying.common.util.sequence.SequenceUtil;

import java.io.Serializable;
import java.util.*;

/**
 * 功能说明: 分布式事物 链路节点数据 <br>
 * 系统版本: 2.0 <br>
 * 开发人员: huanghaiyun
 * 开发时间: 2018/5/31<br>
 * <br>
 */
public class TreeLink implements Serializable {
    /**
     * 当前步骤id
     */
    private String treeId= SequenceUtil.UUID();
    /**
     * 是否需要roolback
     */
    private Boolean isRollBack=false;
    private String rollbackUrl;
    private String url;
    /**
     * 父节点情况
     */
    private String treeIndex;
    /**
     * 父节点
     */
    private String parentId;
    /**
     * 子节点 key:步骤id  value:子节点
     */
    private List<TreeLink> childens=new LinkedList<>();
    /**
     *
     */
    private String serviceName;
    /**
     *   feign 的requestparam
     */
    private Map<String, Collection<String>> queries;
    /**
     * feign 的requestBody
     */
    private byte[] body;
    /**
     * feign 请求类型 POST/GET
     */
    private String method;

    /**
     * feign 的头信息
     */
    private Map<String, Collection<String>> headers;

    public String getTreeId() {
        return treeId;
    }

    public void setTreeId(String treeId) {
        this.treeId = treeId;
    }

    public String getTreeIndex() {
        return treeIndex;
    }

    public void setTreeIndex(String treeIndex) {
        this.treeIndex = treeIndex;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public List<TreeLink> getChildens() {
        return childens;
    }

    public void setChildens(List<TreeLink> childens) {
        this.childens = childens;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public void addChilden(TreeLink childer) {
        childens.add(childer);
    }

    public Boolean getRollBack() {
        return isRollBack;
    }

    public void setRollBack(Boolean rollBack) {
        isRollBack = rollBack;
    }

    public String getRollbackUrl() {
        return rollbackUrl;
    }

    public void setRollbackUrl(String rollbackUrl) {
        this.rollbackUrl = rollbackUrl;
    }

    public Map<String, Collection<String>> getQueries() {
        return queries;
    }

    public void setQueries(Map<String, Collection<String>> queries) {
        this.queries = queries;
    }

    public byte[] getBody() {
        return body;
    }

    public void setBody(byte[] body) {
        this.body = body;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public Map<String, Collection<String>> getHeaders() {
        return headers;
    }

    public void setHeaders(Map<String, Collection<String>> headers) {
        this.headers = headers;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
