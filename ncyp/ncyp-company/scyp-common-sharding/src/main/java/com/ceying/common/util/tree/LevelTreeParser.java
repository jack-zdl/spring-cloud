package com.ceying.common.util.tree;

import com.ceying.common.util.service.ComRowSet;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * </p>
 * .
 *
 * @author $Author: Bruce Lin $
 * @version $Revision: 1.1 $
 */
public class LevelTreeParser implements ITreeParser {

  /*
   * @see ITreeParser#parser(java.lang.Object, java.lang.String,
   * java.lang.Boolean)
   */
  public void parser(TreeNode root, Object data, String treeType, TreeFactory factory) {
    ComRowSet rowSet = (ComRowSet) data;
    if (rowSet.isEmpty()) {
      return;
    }

    Map<Object, TreeNode> tmp = new HashMap<Object, TreeNode>();

    String[] config = rowSet.getTreeInfo().split(",");
    for (int i = 0, n = rowSet.getRowCount(); i < n; i++) {
      String id = rowSet.getValue(i, config[0]);
      String text = rowSet.getValue(i, config[1]);
      String parentId = rowSet.getValue(i, config[2]);
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("id", id);
      map.put("name", text);
      map.put("parentId", parentId);
      String otherStr = config[3];
      if(!"null".equals(otherStr)){
    	  String[] others = otherStr.split("\\|");
          for (String other : others) {
            map.put(other, rowSet.getValue(i, other));
          }
      }
      TreeNode node = factory.createNode(map, treeType);
      tmp.put(parentId + "#" + id, node);
      tmp.put(id, node);
    }

    for (int i = 0, n = rowSet.getRowCount(); i < n; i++) {
      String id = rowSet.getValue(i, config[0]);
      String parentId = rowSet.getValue(i, config[2]);
      TreeNode current = tmp.get(parentId + "#" + id);
      TreeNode parent = tmp.get(parentId);
      if (parent == null) {
        root.addChild(current);
      }
      else {
        parent.addChild(current);
      }
    }
  }

}
