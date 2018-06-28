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
public class EasyUiTreeNode extends TreeNode {

  public EasyUiTreeNode(Map<String, Object> map) {
    super(map);
  }

  public String toJson() {
    StringBuilder ret = new StringBuilder();
    ret.append("{\"").append(ATTRIBUTE_ID).append("\":\"").append(id).append("\",\"")
        .append(ATTRIBUTE_TEXT).append("\":\"").append(text).append("\"");
    if (!childs.isEmpty()) {
      ret.append(",\"").append(ATTRIBUTE_LEAF).append("\":false");
      ret.append(",\"children\":[");
      for (int i = 0, n = childs.size(); i < n; i++) {
        ret.append(childs.get(i).toString());
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
