package com.ceying.common.util.tree;

/**
 * <p>
 * </p>.
 *
 * @author $Author: Bruce Lin $
 * @version $Revision: 1.1 $
 */
public interface ILevelTreeNode extends ISimpleTreeNode {

  /**
   * Gets the id.
   *
   * @return the id
   */
  Object getId();

  /**
   * Gets the parent id.
   *
   * @return the parent id
   */
  Object getParentId();

}
