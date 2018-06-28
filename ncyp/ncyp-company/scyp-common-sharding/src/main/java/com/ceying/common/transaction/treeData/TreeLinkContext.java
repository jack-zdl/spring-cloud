package com.ceying.common.transaction.treeData;

import org.springframework.core.NamedThreadLocal;

/**
 * 功能说明: <br>
 * 系统版本: 2.0 <br>
 * 开发人员: huanghaiyun
 * 开发时间: 2018/5/31<br>
 * <br>
 */
public class TreeLinkContext {

    private static final ThreadLocal<TreeLink> TREE = new NamedThreadLocal("Feign Tree");//当前请求的整个 链路数据
    private static final ThreadLocal<TreeLink> NOWNODE = new NamedThreadLocal("NOW Tree NODE");//当前线程 所在的 链路节点数据

    public static TreeLink getTree() {
        return TREE.get();
    }
    public static void setTree(TreeLink feignLink) {
        TREE.set(feignLink);
    }
    public static void remove() {
        TREE.remove();
        NOWNODE.remove();
    }

    public static TreeLink getNowNode() {
        return NOWNODE.get();
    }
    public static void setNownode(TreeLink feignLink) {
        NOWNODE.set(feignLink);
    }



}
