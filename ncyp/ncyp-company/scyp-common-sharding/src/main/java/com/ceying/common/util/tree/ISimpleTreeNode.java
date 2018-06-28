package com.ceying.common.util.tree;

import java.util.Map;

/**
 * <p>
 * </p>.
 *
 * @author $Author: Bruce Lin $
 * @version $Revision: 1.1 $
 */
public interface ISimpleTreeNode {

  /**
   * Gets the attributes for tree.
   *
   * @param map the map
   * @return the attributes for tree
   */
  Map<String, Object> getAttributesForTree(Map<String, Object> map);

}
