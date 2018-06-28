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
public class FuiTreeNode extends TreeNode {

  public FuiTreeNode(Map<String, Object> map) {
    super(map);
  }

  public String toJson() {
    StringBuilder ret = new StringBuilder();
    ret.append("{\"").append(ATTRIBUTE_ID).append("\":\"").append(id).append("\",\"")
    .append(ATTRIBUTE_ISCHECK).append("\":\"").append(ischeck).append("\",\"")
    .append(ATTRIBUTE_1).append("\":\"").append(attribute1).append("\",\"")
    .append(ATTRIBUTE_2).append("\":\"").append(attribute2).append("\",\"")
    .append(ATTRIBUTE_TEXT).append("\":\"").append(text).append("\",\"").append(ATTRIBUTE_PID)
    .append("\":\"").append(getParent() != null ? getParent().getId() : "01").append("\"");
    if (!childs.isEmpty()) {
      ret.append(",\"").append(ATTRIBUTE_LEAF).append("\":false");
      ret.append(",\"children\":[");
      for (int i = 0, n = childs.size(); i < n; i++) {
        ret.append(childs.get(i).toJson());
        if (i < n - 1) {
          ret.append(",");
        }
      }
      ret.append("]");
    }
    else {
      ret.append(",\"").append(ATTRIBUTE_LEAF).append("\":true");
    }
    ret.append("}");
    return ret.toString();
  }

}
