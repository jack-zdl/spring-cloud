package com.ceying.common.util.tree;

/**
 * <p>
 * </p>.
 *
 * @author $Author: Bruce Lin $
 * @version $Revision: 1.1 $
 */
public interface ITreeParser {

  /**
   * Parser.
   *
   * @param data the data
   * @param treeType the tree type
   * @param leaf the leaf
   * @return the tree node
   */
  void parser(TreeNode root, Object data, String treeType, TreeFactory factory);

}
