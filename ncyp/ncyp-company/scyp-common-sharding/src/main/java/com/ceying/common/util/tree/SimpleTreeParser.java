package com.ceying.common.util.tree;


import com.ceying.common.util.service.ComRowSet;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * .
 * </p>
 *
 * @author $Author: Bruce Lin $
 * @version $Revision: 1.1 $
 */
public class SimpleTreeParser implements ITreeParser {

  /*
   * @see ITreeParser#parser(java.lang.Object, java.lang.String,
   * java.lang.Boolean)
   */
  public void parser(TreeNode root, Object data, String treeType, TreeFactory factory) {
    ComRowSet rowSet = (ComRowSet) data;
    if (rowSet.isEmpty()) {
      return;
    }
    String[] config = rowSet.getTreeInfo().split(",");
    for (int i = 0, n = rowSet.getRowCount(); i < n; i++) {
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("id", rowSet.getValue(i, config[0]));
      map.put("name", rowSet.getValue(i, config[1]));
      String otherStr = config[3];
      if (!"null".equals(otherStr)) {
        String[] others = otherStr.split("\\|");
        for (String other : others) {
          map.put(other, rowSet.getValue(i, other));
        }
      }
      root.addChild(factory.createNode(map, treeType));
    }
  }

}
