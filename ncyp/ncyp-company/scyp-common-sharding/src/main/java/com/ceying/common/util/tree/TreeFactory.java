package com.ceying.common.util.tree;

import java.util.Map;

/**
 * <p>
 * .
 * </p>
 *
 * @author Bruce Lin
 * @version 1.0
 */
public interface TreeFactory {

  String TREE_NAME_EASYUI = "1";

  String TREE_NAME_FUI = "2";

  TreeNode createNode();

  TreeNode createNode(Map<String, Object> map, Object treeType);

}
