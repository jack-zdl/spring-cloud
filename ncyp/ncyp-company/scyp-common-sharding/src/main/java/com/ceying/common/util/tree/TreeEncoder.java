package com.ceying.common.util.tree;

/**
 * <p>
 * </p>
 *
 * @author $Author: Bruce Lin $
 * @version $Revision: 1.1 $
 */
public class TreeEncoder {

  /** The Constant ROOT_NODE_ID. */
  public static final String ROOT_NODE_ID = "";

  /** The Constant ROOT_NODE_TEXT. */
  public static final String ROOT_NODE_TEXT = "全部";

  /** The root text. */
  private Object rootText = ROOT_NODE_TEXT;

  /** The data. */
  private Object data = null;

  /** The parser. */
  private ITreeParser parser = null;

  private TreeFactory factory = null;

  /** The tree type. */
  private String treeType = TreeNode.CHECKED_NUN;

  /** The need leaf. */
  private Boolean needLeaf = Boolean.TRUE;

  private Boolean needRoot = Boolean.FALSE;

  /**
   * Instantiates a new tree encoder.
   *
   * @param data the data
   */
  public TreeEncoder(Object data) {
    this(data, new SimpleTreeParser());
  }

  /**
   * Instantiates a new tree encoder.
   *
   * @param data the data
   * @param parser the parser
   */
  public TreeEncoder(Object data, ITreeParser parser) {
    this(data, parser, new DefaultTreeFactory(TreeFactory.TREE_NAME_EASYUI), TreeNode.CHECKED_NUN);
  }

  public TreeEncoder(Object data, ITreeParser parser, TreeFactory factory) {
    this(data, parser, factory, TreeNode.CHECKED_NUN);
  }

  /**
   * Instantiates a new tree encoder.
   *
   * @param data the data
   * @param parser the parser
   * @param treeType the tree type
   */
  public TreeEncoder(Object data, ITreeParser parser, TreeFactory factory, String treeType) {
    this.data = data;
    this.parser = parser;
    this.factory = factory;
    this.treeType = treeType == null ? TreeNode.CHECKED_NUN : treeType;
  }

  /**
   * Instantiates a new tree encoder.
   *
   * @param data the data
   * @param parser the parser
   * @param needLeaf the need leaf
   */
  public TreeEncoder(Object data, ITreeParser parser, TreeFactory factory, Boolean needLeaf) {
    this.data = data;
    this.parser = parser;
    this.factory = factory;
    this.needLeaf = needLeaf == null ? Boolean.TRUE : needLeaf;
  }

  /**
   * Sets the root text.
   *
   * @param rootText The rootText to set.
   */
  public void setRootText(Object rootText) {
    this.rootText = rootText;
  }

  /**
   * Sets the tree type.
   *
   * @param treeType The treeType to set.
   */
  public void setTreeType(String treeType) {
    this.treeType = treeType;
  }

  /**
   * Sets the need leaf.
   *
   * @param needLeaf The needLeaf to set.
   */
  public void setNeedLeaf(Boolean needLeaf) {
    this.needLeaf = needLeaf;
  }

  /**
   * Sets the need root.
   *
   * @param needRoot the new need root
   */
  public void setNeedRoot(Boolean needRoot) {
    this.needRoot = needRoot;
  }

  /*
   * @see java.lang.Object#toString()
   */
  public String toString() {
    return toJson();
  }

  public String toJson() {
    TreeNode root = factory.createNode();
    parser.parser(root, data, treeType, factory);
    root.setId(ROOT_NODE_ID);
    root.setText(rootText);
    root.setChecked(treeType);
    root.setLeaf(needLeaf);
    root.setExpanded(Boolean.TRUE);
    StringBuilder result = new StringBuilder();
    String roottn = root.toString();
    String roottnr =  "";
    if(roottn.length()>=116){
    	roottnr = needRoot.booleanValue() ? roottn : roottn.substring(114, roottn.length() - 2);
    }
    
    result.append("[").append(roottnr).append("]");
    return result.toString();
  }

}
