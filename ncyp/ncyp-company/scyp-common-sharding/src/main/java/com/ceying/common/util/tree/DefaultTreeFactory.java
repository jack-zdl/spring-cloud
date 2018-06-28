package com.ceying.common.util.tree;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * .
 * </p>
 *
 * @author Bruce Lin
 * @version 1.0
 */
public class DefaultTreeFactory implements TreeFactory {

  private String treeName = null;

  public DefaultTreeFactory(String treeName) {
    this.treeName = treeName;
  }

  public TreeNode createNode() {
    return newNode(new HashMap<String, Object>());
  }

  public TreeNode createNode(Map<String, Object> map, Object treeType) {
    TreeNode node = newNode(map);
    node.setAttriubtes(map);
    return node;
  }

  private TreeNode newNode(Map<String, Object> map) {
    if (TREE_NAME_FUI.equals(treeName)) {
      return new FuiTreeNode(map);
    }
    return new EasyUiTreeNode(map);
  }

}
