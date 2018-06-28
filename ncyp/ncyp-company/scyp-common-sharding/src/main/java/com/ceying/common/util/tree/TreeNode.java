package com.ceying.common.util.tree;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * </p>.
 *
 * @author $Author: Bruce Lin $
 * @version $Revision: 1.1 $
 */
public abstract class TreeNode {

  /** The Constant ATTRIBUTE_ID. */
  protected static final String ATTRIBUTE_ID = "id";

  /** The Constant ATTRIBUTE_TEXT. */
  protected static final String ATTRIBUTE_TEXT = "name";

  /** The Constant ATTRIBUTE_LEAF. */
  protected static final String ATTRIBUTE_LEAF = "leaf";

  /** The Constant ATTRIBUTE_PID. */
  protected static final String ATTRIBUTE_PID = "pid";

  /** The Constant ATTRIBUTE_ISCHECK. */
  protected static final String ATTRIBUTE_ISCHECK = "checked";
  
  /** The Constant ATTRIBUTE_1. */
  protected static final String ATTRIBUTE_1 = "attribute1";
  
  /** The Constant ATTRIBUTE_2. */
  protected static final String ATTRIBUTE_2 = "attribute2";
  
  /** The Constant CHECKED_NUN. */
  public static final String CHECKED_NUN = "1";

  /** The Constant CHECKED_CAN. */
  public static final String CHECKED_CAN = "2";

  /** The Constant CHECKED_BE. */
  public static final String CHECKED_BE = "3";

  /** The id. */
  protected Object id;

  /** The text. */
  protected Object text;

  /** The ischeck. */
  protected Object ischeck;
  
  /** The attribute1. */
  protected Object attribute1;
  
  /** The attribute2. */
  protected Object attribute2;
  
  /** The attriubtes. */
  private Map<String, Object> attriubtes = null;

  /** The parent. */
  private TreeNode parent = null;

  /** The childs. */
  protected List<TreeNode> childs = null;

  /**
   * Instantiates a new tree node.
   */
  public TreeNode() {
    attriubtes = new HashMap<String, Object>();
    childs = new ArrayList<TreeNode>();
  }

  /**
   * Instantiates a new tree node.
   *
   * @param id the id
   * @param text the text
   */
  public TreeNode(Object id, Object text) {
    attriubtes = new HashMap<String, Object>();
    childs = new ArrayList<TreeNode>();
    this.id = id;
    this.text = text;
  }

  /**
   * Instantiates a new tree node.
   *
   * @param id the id
   * @param text the text
   * @param treeType the tree type
   */
  public TreeNode(Object id, Object text, String treeType) {
    attriubtes = new HashMap<String, Object>();
    childs = new ArrayList<TreeNode>();
    this.id = id;
    this.text = text;
  }

  /**
   * Instantiates a new tree node.
   *
   * @param treeNode the tree node
   */
  public TreeNode(ISimpleTreeNode treeNode) {
    attriubtes = treeNode.getAttributesForTree(new HashMap<String, Object>());
    childs = new ArrayList<TreeNode>();
    this.id = attriubtes.get(ATTRIBUTE_ID);
    this.text = attriubtes.get(ATTRIBUTE_TEXT);
    this.ischeck = attriubtes.get(ATTRIBUTE_ISCHECK);
    this.attribute1 = attriubtes.get(ATTRIBUTE_1);
    this.attribute2 = attriubtes.get(ATTRIBUTE_2);
  }

  /**
   * Instantiates a new tree node.
   *
   * @param treeNode the tree node
   * @param treeType the tree type
   */
  public TreeNode(ISimpleTreeNode treeNode, String treeType) {
    attriubtes = treeNode.getAttributesForTree(new HashMap<String, Object>());
    childs = new ArrayList<TreeNode>();
    this.id = attriubtes.get(ATTRIBUTE_ID);
    this.text = attriubtes.get(ATTRIBUTE_TEXT);
    this.ischeck = attriubtes.get(ATTRIBUTE_ISCHECK);
    this.attribute1 = attriubtes.get(ATTRIBUTE_1);
    this.attribute2 = attriubtes.get(ATTRIBUTE_2);
  }

  /**
   * Instantiates a new tree node.
   *
   * @param treeNode the tree node
   * @param leaf the leaf
   */
  public TreeNode(ISimpleTreeNode treeNode, Boolean leaf) {
    attriubtes = treeNode.getAttributesForTree(new HashMap<String, Object>());
    childs = new ArrayList<TreeNode>();
    this.id = attriubtes.get(ATTRIBUTE_ID);
    this.text = attriubtes.get(ATTRIBUTE_TEXT);
    this.ischeck = attriubtes.get(ATTRIBUTE_ISCHECK);
    this.attribute1 = attriubtes.get(ATTRIBUTE_1);
    this.attribute2 = attriubtes.get(ATTRIBUTE_2);
  }

  /**
   * Instantiates a new tree node.
   *
   * @param treeNode the tree node
   * @param treeType the tree type
   * @param leaf the leaf
   */
  public TreeNode(Map<String, Object> map, String treeType, Boolean leaf) {
    attriubtes = map;
    childs = new ArrayList<TreeNode>();
    this.id = attriubtes.get(ATTRIBUTE_ID);
    this.text = attriubtes.get(ATTRIBUTE_TEXT);
    this.ischeck = attriubtes.get(ATTRIBUTE_ISCHECK);
    this.attribute1 = attriubtes.get(ATTRIBUTE_1);
    this.attribute2 = attriubtes.get(ATTRIBUTE_2);
  }

  public TreeNode(Map<String, Object> map) {
    attriubtes = map;
    childs = new ArrayList<TreeNode>();
    this.id = attriubtes.get(ATTRIBUTE_ID);
    this.text = attriubtes.get(ATTRIBUTE_TEXT);
    this.ischeck = attriubtes.get(ATTRIBUTE_ISCHECK);
    this.attribute1 = attriubtes.get(ATTRIBUTE_1);
    this.attribute2 = attriubtes.get(ATTRIBUTE_2);
  }

  /**
   * Gets the parent.
   *
   * @return Returns the parent.
   */
  public TreeNode getParent() {
    return parent;
  }

  /**
   * Sets the parent.
   *
   * @param parent The parent to set.
   */
  public void setParent(TreeNode parent) {
    this.parent = parent;
  }

  /**
   * Adds the child.
   *
   * @param node the node
   */
  public void addChild(TreeNode node) {
    node.setParent(this);
    childs.add(node);
  }

  /**
   * Sets the id.
   *
   * @param id The id to set.
   */
  public void setId(Object id) {
    this.id = id;
  }

  /**
   * Gets the id.
   *
   * @return the id
   */
  public Object getId() {
    return id;
  }

  /**
   * Sets the text.
   *
   * @param text The text to set.
   */
  public void setText(Object text) {
    this.text = text;
  }

  public Object getIscheck() {
	return ischeck;
}

public void setIscheck(Object ischeck) {
	this.ischeck = ischeck;
}

public Object getAttribute1() {
	return attribute1;
}

public void setAttribute1(Object attribute1) {
	this.attribute1 = attribute1;
}

public Object getAttribute2() {
	return attribute2;
}

public void setAttribute2(Object attribute2) {
	this.attribute2 = attribute2;
}

/**
   * Sets the checked.
   *
   * @param checked The checked to set.
   */
  public void setChecked(String checked) {
  }

  /**
   * Sets the leaf.
   *
   * @param leaf The leaf to set.
   */
  public void setLeaf(Boolean leaf) {
  }

  /**
   * Sets the expanded.
   *
   * @param expanded The expanded to set.
   */
  public void setExpanded(Boolean expanded) {
  }

  public void setAttriubtes(Map<String, Object> attriubtes) {
    this.attriubtes = attriubtes;
  }

  public String toString() {
    return toJson();
  }

  public abstract String toJson();

}
