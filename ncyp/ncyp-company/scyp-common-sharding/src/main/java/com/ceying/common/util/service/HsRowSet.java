package com.ceying.common.util.service;

import java.io.Serializable;
import java.util.*;

public class HsRowSet implements ComRowSet, Serializable {

  private static final long serialVersionUID = 102702629287692435L;

  private List<List<String>> rows = null; // 行对象

  private List<String> title = null; // 表头信息－每列标题属性

  private List<String> type = null; // 表头信息－每列标题类型

  private List<String> caption = null; // 表头信息－每列标题标签

  private List<String> viewlevel = null; // 表头信息－每列显示级别

  private List<String> totalsum = null; // 表底信息－每列记录总合计

  private List<String> cursum = null; // 表底信息－每列记录页小计

  private List<String> link = null; // 表格格式－每列超链接地址

  private List<String> frametype = null; // 表格格式－每列超链接显示方式（本页，弹出新窗口）

  private List<String> reserve = null; // 预留字段-3详细页面跨列显示

  private List<String> len = null;

  int perPageCount = 20; // 每页记录数

  private Object vpo;

  private List<?> vpoList;

  private Map<String, String> head = null;

  private Map<String, Object> resultObject = null; // 返回结果对象

  private static final String SVC_PROP_ERRORCODE = "errorcode";

  private static final String SVC_PROP_ERRORMSG = "errormsg";

  private static final String SVC_PROP_SUCCESSFLAG = "successFlag";

  private static final String SVC_PROP_TOTALRECORDS = "totalrecords";

  private static final String SVC_PROP_COUNTPERPAGE = "countperpage";

  private static final String SVC_PROP_FUNCTIONNO = "functionno";

  private static final String SVC_DATARIGHT_COL = "datarightflag_system";

  private static final String SVC_PROP_TREEINFO = "treeInfo";

  // 索引maps信息
  private HashMap<String, Map<String, String>> maps = null;

  // 索引列
  private String[] indexFields = null;

  public HsRowSet() {
    rows = new ArrayList<List<String>>();
    title = new ArrayList<String>();
    type = new ArrayList<String>();
    link = new ArrayList<String>();
    frametype = new ArrayList<String>();
    caption = new ArrayList<String>();
    viewlevel = new ArrayList<String>();
    totalsum = new ArrayList<String>();
    cursum = new ArrayList<String>();
    head = new HashMap<String, String>();
    resultObject = new HashMap<String, Object>();
    reserve = new ArrayList<String>();
    len = new ArrayList<String>();

    setHeadProperty(SVC_PROP_ERRORCODE, "0");
    setHeadProperty(SVC_PROP_ERRORMSG, "");
    setHeadProperty(SVC_PROP_SUCCESSFLAG, "-1");
    setHeadProperty(SVC_PROP_TOTALRECORDS, "0");
  }

  public void setHeadProperty(String key, String value) {
    head.put(key, value);
  }

  public String getHeadProperty(String key) {
    return head.get(key);
  }

  public void setErrorCode(String value) {
    setHeadProperty(SVC_PROP_ERRORCODE, value);
  }

  public void setErrorMsg(String value) {
    setHeadProperty(SVC_PROP_ERRORMSG, value);
  }

  public void setSuccessFlag(String value) {
    setHeadProperty(SVC_PROP_SUCCESSFLAG, value);
  }

  public String getErrorCode() {
    return getHeadProperty(SVC_PROP_ERRORCODE);
  }

  public String getErrorMsg() {
    return getHeadProperty(SVC_PROP_ERRORMSG);
  }

  public String getSuccessFlag() {
    return getHeadProperty(SVC_PROP_SUCCESSFLAG);
  }

  public boolean isSuccessful() {
    return "1".equals(getSuccessFlag());
  }

  public void setFunctionno(String value) {
    setHeadProperty(SVC_PROP_FUNCTIONNO, value);
  }

  public String getFunctionno() {
    return getHeadProperty(SVC_PROP_FUNCTIONNO);
  }

  public boolean isEmpty() {
    return (rows == null) || (rows.size() == 0);
  }

  public List<List<String>> getRows() {
    return rows;
  }
  public void setRows(List<List<String>> rows) {
    this.rows = rows;
  }

  /**
   * 返回整个总记录数（包括当前结果集合）
   *
   * @return
   */
  public int getTotalRecords() {
    return Integer.parseInt(getHeadProperty(SVC_PROP_TOTALRECORDS));
  }

  public void setTotalRecords(int num) {
    setHeadProperty(SVC_PROP_TOTALRECORDS, String.valueOf(num));
  }

  /**
   * 返回每页记录数
   *
   * @return
   */

  public int getCountPerPage() {
    return Integer.parseInt(getHeadProperty(SVC_PROP_COUNTPERPAGE));
  }

  public void setCountPerPage(int num) {
    setHeadProperty(SVC_PROP_COUNTPERPAGE, String.valueOf(num));
    perPageCount = Integer.parseInt(getHeadProperty(SVC_PROP_COUNTPERPAGE));
  }

  public List<String> getTitles() {
    return title;
  }

  public void setCols(List<String> titles) {
    this.title = titles;
  }

  public List<String> getCaptions() {
    return caption;
  }

  public void setCaptions(List<String> captions) {
    this.caption = captions;
  }

  public int getPerPageCount() {
    return perPageCount;
  }

  public void setPerPageCount(int perPageCount) {
    this.perPageCount = perPageCount;
  }

  /**
   * 返回每页记录数 用于服务架构 demo
   *
   * @return
   */

  /**
   * 返回当前结果集的总记录数
   *
   * @return
   */
  public int getRowCount() {
    return rows.size();
  }

  public int getColCount() {
    return title.size();
  }

  public int findColNameIndex(String colName) {
    String tmpColName = null;
    int findidx = -1;
    for (int i = 0; i < title.size(); i++) {
      tmpColName = title.get(i);
      if (tmpColName != null && colName.equalsIgnoreCase(tmpColName)) {
        findidx = i;
        // added by zheng xiang ming 20090226
        return findidx;
      }
    }
    return findidx;
  }

  public String getValue(int rowNo, int colNo) {
    if (rowNo < 0 || rowNo >= rows.size())
      return "";
    if (colNo < 0 || colNo >= title.size())
      return "";
    List<String> tmpRow = rows.get(rowNo);
    if (colNo < 0 || colNo >= tmpRow.size())
      return "";
    Object obj = tmpRow.get(colNo);
    if (obj != null)
      return (String) obj;
    else
      return "";
  }

  public String getValue(int rowNo, String colName) {
    if (rowNo < 0 || rowNo >= rows.size())
      return "";
    if (colName == null || "".equals(colName))
      return "";
    int findidx = findColNameIndex(colName);
    if (findidx != -1)
      return getValue(rowNo, findidx);
    else
      return "";
  }

  /**
   * 设置单元格值
   *
   * @param rowNo
   * @param colNo 列号（列数自动增加)
   * @param value
   */
  public void setValue(int rowNo, int colNo, String value) {
    if (rowNo < 0 || rowNo >= rows.size())
      return;
    if (colNo < 0 || colNo >= title.size())
      return;
    List<String> tmpRow = rows.get(rowNo);

    if (colNo >= tmpRow.size()) {
      int addnum = colNo - tmpRow.size();
      for (int i = 0; i < addnum; i++)
        tmpRow.add("");
      tmpRow.add(value);
    }
    else
      tmpRow.set(colNo, value);
  }

  /**
   * 设置单元格值
   *
   * @param rowNo 行号
   * @param colName 列名
   * @param 单元格值
   */
  public void setValue(int rowNo, String colName, String value) {
    if (rowNo < 0 || rowNo >= rows.size())
      return;
    if (colName == null || "".equals(colName))
      return;
    int findidx = findColNameIndex(colName);
    if (findidx != -1) {
      setValue(rowNo, findidx, value);
    }
    else
      return;
  }

  /**
   * 默认改写最后一行
   *
   * @param colNo
   * @param value
   */
  public void setValue(int colNo, String value) {
    if (colNo < 0 || colNo >= title.size())
      return;
    int lastrow = rows.size() - 1;
    if (lastrow < 0)
      return;
    setValue(lastrow, colNo, value);

  }

  public List<String> getRow(int index) {
    if (index < 0 || index >= rows.size())
      return null;
    List<String> tmpRow = rows.get(index);
    return tmpRow;
  }

  public void addRow(List<String> row) {
    rows.add(row);
  }

  public void addRow() {
    List<String> cols = new ArrayList<String>();
    rows.add(cols);
  }

  public void removeRow() {
    int lastrow = rows.size() - 1;
    if (lastrow < 0)
      return;
    rows.remove(lastrow);
  }

  public void addCol(String value) {
    title.add(value);
    caption.add("");
    viewlevel.add("0");
    totalsum.add("");
    cursum.add("");
    link.add("");
    frametype.add("");
    reserve.add("");
    len.add("");
    type.add("");
  }

  public void addCol(String value, String cap) {
    title.add(value);
    caption.add(cap);
    viewlevel.add("0");
    totalsum.add("");
    cursum.add("");
    link.add("");
    frametype.add("");
    reserve.add("");
    len.add("");
    type.add("");
  }

  public void setTitle(List<String> title) {
    this.title = title;
  }

  /**
   *
   * @param colNo 列号（列数自动增加)
   * @param value
   */
  public void setTitle(int colNo, String value) {
    if (colNo < 0)
      return;
    if (colNo >= title.size()) {
      int addnum = colNo - title.size();
      for (int i = 0; i < addnum; i++) {
        title.add("");
        caption.add("");
        viewlevel.add("");
        totalsum.add("");
        cursum.add("");
        link.add("");
        len.add("");
        frametype.add("");
        reserve.add("");
      }
      title.add(value);
      caption.add("");
      viewlevel.add("");
      totalsum.add("");
      cursum.add("");
      link.add("");
      len.add("");
      frametype.add("");
      reserve.add("");
    }
    else
      title.set(colNo, value);
  }

  /**
   *
   * @param colNo 列号（列数自动增加)
   * @param value
   */
  public void setDataType(int colNo, String value) {
    if (colNo < 0)
      return;
    if (colNo >= type.size()) {
      int addnum = colNo - type.size();
      for (int i = 0; i < addnum; i++) {
        type.add("");
        title.add("");
        caption.add("");
        viewlevel.add("");
        totalsum.add("");
        cursum.add("");
        link.add("");
        len.add("");
        frametype.add("");
        reserve.add("");
      }
      type.add(value);
      title.add("");
      caption.add("");
      viewlevel.add("");
      totalsum.add("");
      cursum.add("");
      link.add("");
      len.add("");
      frametype.add("");
      reserve.add("");
    }
    else
      type.set(colNo, value);
  }

  /**
   * 逻辑类同 public void setTitle(int colNo,String value)
   *
   * @param colNo
   * @param value
   * @param cap
   */
  public void setTitle(int colNo, String value, String cap) {
    if (colNo < 0)
      return;
    if (colNo >= title.size()) {
      int addnum = colNo - title.size();
      for (int i = 0; i < addnum; i++) {
        type.add("");
        title.add("");
        caption.add("");
        viewlevel.add("");
        totalsum.add("");
        cursum.add("");
        link.add("");
        len.add("");
        frametype.add("");
        reserve.add("");
      }
      title.add(value);
      caption.add(cap);
      type.add("");
      viewlevel.add("");
      totalsum.add("");
      cursum.add("");
      link.add("");
      len.add("");
      frametype.add("");
      reserve.add("");
    }
    else {
      title.set(colNo, value);
      caption.set(colNo, cap);
      viewlevel.set(colNo, "");
    }
  }

  public void setCaption(int colNo, String cap) {
    if (colNo < 0)
      return;
    if (colNo >= caption.size()) {
      int addnum = colNo - caption.size();
      for (int i = 0; i < addnum; i++) {
        title.add("");
        type.add("");
        caption.add("");
        viewlevel.add("");
        totalsum.add("");
        cursum.add("");
        link.add("");
        len.add("");
        frametype.add("");
        reserve.add("");
      }
      type.add("");
      title.add("");
      caption.add(cap);
      viewlevel.add("");
      totalsum.add("");
      cursum.add("");
      link.add("");
      len.add("");
      frametype.add("");
      reserve.add("");
    }
    else
      caption.set(colNo, cap);
  }

  public void setLink(int colNo, String lk) {
    if (colNo < 0)
      return;
    if (colNo >= link.size()) {
      int addnum = colNo - link.size();
      for (int i = 0; i < addnum; i++) {
        title.add("");
        type.add("");
        caption.add("");
        viewlevel.add("");
        totalsum.add("");
        cursum.add("");
        link.add("");
        len.add("");
      }
      type.add("");
      title.add("");
      caption.add("");
      viewlevel.add("");
      totalsum.add("");
      cursum.add("");
      link.add(lk);
      len.add("");
    }
    else
      link.set(colNo, lk);
  }

  public void setLen(int colNo, String lk) {
    if (colNo < 0)
      return;
    if (colNo >= len.size()) {
      int addnum = colNo - len.size();
      for (int i = 0; i < addnum; i++) {
        title.add("");
        type.add("");
        caption.add("");
        viewlevel.add("");
        totalsum.add("");
        cursum.add("");
        link.add("");
        len.add("");
      }
      type.add("");
      title.add("");
      caption.add("");
      viewlevel.add("");
      totalsum.add("");
      cursum.add("");
      link.add(lk);
      len.add("");
    }
    else
      len.set(colNo, lk);
  }

  public void setFrameType(int colNo, String ft) {
    if (colNo < 0)
      return;
    if (colNo >= frametype.size()) {
      int addnum = colNo - frametype.size();
      for (int i = 0; i < addnum; i++) {
        title.add("");
        type.add("");
        caption.add("");
        viewlevel.add("");
        totalsum.add("");
        cursum.add("");
        link.add("");
        len.add("");
        frametype.add("");
      }
      type.add("");
      title.add("");
      caption.add("");
      viewlevel.add("");
      totalsum.add("");
      cursum.add("");
      link.add("");
      len.add("");
      frametype.add(ft);
    }
    else
      frametype.set(colNo, ft);
  }

  public void setReserve(int colNo, String ft) {
    if (colNo < 0)
      return;
    if (colNo >= reserve.size()) {
      int addnum = colNo - reserve.size();
      for (int i = 0; i < addnum; i++) {
        title.add("");
        type.add("");
        caption.add("");
        viewlevel.add("");
        totalsum.add("");
        cursum.add("");
        link.add("");
        len.add("");
        frametype.add("");
        reserve.add("");
      }
      type.add("");
      title.add("");
      caption.add("");
      viewlevel.add("");
      totalsum.add("");
      cursum.add("");
      link.add("");
      len.add("");
      frametype.add("");
      reserve.add(ft);
    }
    else
      reserve.set(colNo, ft);
  }

  public List<String> getTitle() {
    return this.title;
  }

  /**
   * 取列标题（英文）
   *
   * @param colNo
   * @return
   */

  public String getTitle(int colNo) {
    if (colNo < 0 || colNo >= title.size())
      return "";
    return title.get(colNo) == null ? "" : title.get(colNo);
  }

  /**
   * 取列数据类型
   *
   * @param colNo
   * @return
   */
  public String getDataType(int colNo) {
    if (colNo < 0 || colNo >= type.size())
      return "";
    return type.get(colNo) == null ? "" : type.get(colNo);
  }

  /**
   * 取标题名称
   *
   * @param colNo 列序号
   * @return
   */
  public String getCaption(int colNo) {
    if (colNo < 0 || colNo >= caption.size())
      return "";
    return caption.get(colNo) == null ? "" : caption.get(colNo);
  }

  /**
   * 取标题名称
   *
   * @param colName 列title
   * @return
   */
  public String getCaption(String colName) {
    int findidx = findColNameIndex(colName);
    if (findidx != -1)
      return getCaption(findidx);
    else
      return "";
  }

  /**
   *
   * @param colNo
   * @return
   */
  public String getLink(int colNo) {
    if (colNo < 0 || colNo >= link.size())
      return "";
    return link.get(colNo) == null ? "" : link.get(colNo);
  }

  /**
    *
    * @param colNo
    * @return
    */
  public String getLen(int colNo) {
    if (colNo < 0 || colNo >= len.size())
      return "";
    return len.get(colNo) == null ? "" : len.get(colNo);
  }

  public String getFrameType(int colNo) {
    if (colNo < 0 || colNo >= frametype.size())
      return "";
    return frametype.get(colNo) == null ? "" : frametype.get(colNo);
  }

  public String getReserve(int colNo) {
    if (colNo < 0 || colNo >= reserve.size())
      return "";
    return reserve.get(colNo) == null ? "" : reserve.get(colNo);
  }

  public String toString() {
    StringBuffer rtnStr = new StringBuffer();
    for (int i = 0; i < rows.size(); i++) {
      StringBuffer rtnrow = new StringBuffer();
      for (int j = 0; j < title.size(); j++) {
        if (j == 0)
          rtnrow.append(getValue(i, j));
        else
          rtnrow.append("," + getValue(i, j));
      }

      if (i == 0)
        rtnStr.append("{" + rtnrow + "}");
      else
        rtnStr.append("," + "{" + rtnrow + "}");
    }
    return rtnStr.toString();
  }

  public String titleToString() {
    StringBuffer rtnrow = new StringBuffer();
    for (int j = 0; j < title.size(); j++) {
      if (j == 0)
        rtnrow.append(title.get(j));
      else
        rtnrow.append("," + title.get(j));
    }
    return "{" + rtnrow + "}";
  }

  public String captionToString() {
    StringBuffer rtnrow = new StringBuffer();
    for (int j = 0; j < caption.size(); j++) {
      if (j == 0)
        rtnrow.append(caption.get(j));
      else
        rtnrow.append("," + caption.get(j));
    }
    return "{" + rtnrow + "}";
  }

  /**
   * 根据唯一键值，找到行号
   *
   * @param key
   * @return
   */
  public int oldFindPrimaryKey(Map<String, String> key) {
    if (key == null)
      return -1;
    if (key.size() <= 0)
      return -1;

    Set<String> set = key.keySet();
    Iterator<String> it = set.iterator();
    while (it.hasNext()) {
      String str = it.next().toString();
      if (key.get(str) == null || "".equals(key.get(str)))
        return -1;// 键值存在空
      if (!title.contains(str) && !title.contains(str.toLowerCase())
          && !title.contains(str.toUpperCase()))
        return -1;// 有不存在的键值
    }

    for (int j = 0; j < getRowCount(); j++) {
      boolean bfind = true;
      Iterator<String> it2 = set.iterator();
      while (it2.hasNext()) {
        String str = it2.next().toString();
        String val = key.get(str);
        String data = getValue(j, str);
        if (val == null || "".equals(val)) {
          bfind = false;
          break;
        }
        if (data == null || "".equals(data)) {
          bfind = false;
          break;
        }
        if (!val.equals(data)) {
          bfind = false;
          break;
        }
      }
      if (bfind)
        return j;
    }

    return -1;
  }

  public int findPrimaryKey(Map<String, String> key) {
    if (key == null)
      return -1;
    if (key.size() <= 0)
      return -1;

    Set<String> set = key.keySet();
    Iterator<String> it = set.iterator();
    while (it.hasNext()) {
      String str = it.next().toString();
      if (key.get(str) == null || "".equals(key.get(str)))
        return -1;// 键值存在空
      if (!title.contains(str) && !title.contains(str.toLowerCase())
          && !title.contains(str.toUpperCase()))
        return -1;// 有不存在的键值
    }
    // 如果没有创建过任何索引，直接启用顺序查找算法
    if (indexFields == null) {
      return findPrimaryByOrderSearch(key);
    }
    // 行号数组
    String[] r = null;
    r = getRowNosByIndexFields(key);
    // 如果根据索引信息Map获取不到行号数组，也就是没有对此创建索引，则进行顺序扫描查找
    if (r == null) {
      return findPrimaryByOrderSearch(key);
    }
    else {
      return Integer.valueOf(r[0]).intValue();
    }
  }

  /**
   * 根据唯一键值，找到行号
   *
   * @param key
   * @return
   */
  public int findPrimaryByOrderSearch(Map<String, String> key) {
    Set<String> set = key.keySet();
    for (int j = 0; j < getRowCount(); j++) {
      boolean bfind = true;
      Iterator<String> it2 = set.iterator();
      while (it2.hasNext()) {
        String str = it2.next().toString();
        String val = key.get(str);
        String data = getValue(j, str);
        if (val == null || "".equals(val)) {
          bfind = false;
          break;
        }
        if (data == null || "".equals(data)) {
          bfind = false;
          break;
        }
        if (!val.equals(data)) {
          bfind = false;
          break;
        }
      }
      if (bfind)
        return j;
    }
    return -1;
  }

  /**
   * 克隆除表格数据外的所有信息
   *
   * @param rowSet
   * @return
   */
  public ComRowSet clone(ComRowSet rowSet) {
    HsRowSet tmpRowSet = new HsRowSet();
    tmpRowSet.setErrorCode(rowSet.getErrorCode());
    tmpRowSet.setErrorMsg(rowSet.getErrorMsg());
    tmpRowSet.setSuccessFlag(rowSet.getSuccessFlag());
    for (int i = 0; i < rowSet.getColCount(); i++) {
      tmpRowSet.setTitle(i, rowSet.getTitle(i));
    }
    return tmpRowSet;
  }

  /**
   * 根据条件键值，找到子结果集合
   *
   * @param key
   * @return
   */
  public ComRowSet findByKey(Map<String, String> key) {
    if (key == null)
      return null;
    if (key.size() <= 0)
      return null;

    Set<String> set = key.keySet();
    Iterator<String> it = set.iterator();
    while (it.hasNext()) {
      String str = it.next().toString();
      if (key.get(str) == null || "".equals(key.get(str)))
        return null;// 键值存在空
      if (!title.contains(str))
        return null;// 有不存在的键值
    }
    HsRowSet tmpRowSet = null;
    if (indexFields == null) {
      return findByOrderSearch(key);
    }
    // 行号数组
    String[] r = null;
    r = getRowNosByIndexFields(key);
    // 如果根据索引信息Map获取不到行号数组，则进行顺序扫描查找
    if (r == null) {
      return findByOrderSearch(key);
    }
    else {
      tmpRowSet = (HsRowSet) clone(this);
      // 根据行号数组返回结果集
      for (int i = 0; i < r.length; i++) {
        tmpRowSet.addRow(this.getRow(Integer.valueOf(r[i]).intValue()));
      }
    }
    return tmpRowSet;

  }

  /**
   * 根据输入的字段条件 获取对应行号的数组
   *
   * @param key
   * @return
   */
  public String[] getRowNosByIndexFields(Map<String, String> key) {
    String[] r = null, v = null;
    for (int j = 0; j < indexFields.length; j++) {
      // 判断是否存在索引值
      boolean bfind = true;
      Set<String> set = key.keySet();
      Iterator<String> it2 = set.iterator();
      String toStr = "", valToStr = "";
      while (it2.hasNext()) {
        String str = it2.next().toString();
        toStr = toStr + str + ",";
        // 判断是否存在索引列
        if (indexFields[j].indexOf(str) == -1) {
          bfind = false;
          break;
        }
      }
      toStr = toStr.substring(0, toStr.length() - 1);
      // indexFields[j]是用"," 隔开的字符串
      if ((indexFields[j].length() == toStr.length()) && bfind) {
        // 按照索引的顺序来设置KEY的顺序
        v = indexFields[j].split(",");
        for (int m = 0; m < v.length; m++) {
          String val = key.get(v[m]);
          valToStr = valToStr + val + ",";
        }
        valToStr = valToStr.substring(0, valToStr.length() - 1);
        // 索引文件列表里取得对应索引文件，并返回索引搜索得到行号信息
        String rstring = maps.get(indexFields[j]).get(valToStr);
        if (rstring != null) {
          r = rstring.split(",");
        }
        return r;
      }
    }
    return r;
  }

  /**
   * 顺序查找获得结果集
   */
  public ComRowSet findByOrderSearch(Map<String, String> key) {
    HsRowSet tmpRowSet = (HsRowSet) clone(this);
    for (int j = 0; j < getRowCount(); j++) {
      boolean bfind = true;
      Set<String> set = key.keySet();
      Iterator<String> it2 = set.iterator();
      while (it2.hasNext()) {
        String str = it2.next().toString();
        String val = key.get(str);
        String data = getValue(j, str);
        if (val == null || "".equals(val)) {
          bfind = false;
          break;
        }
        if (data == null || "".equals(data)) {
          bfind = false;
          break;
        }
        if (!val.equals(data)) {
          bfind = false;
          break;
        }
      }
      if (bfind)
        tmpRowSet.addRow(this.getRow(j));
    }
    return tmpRowSet;
  }

  /**
   * 根据条件键值，找到子结果集合
   *
   * @param key
   * @return
   */

  public ComRowSet oldFindByKey(Map<String, String> key) {
    if (key == null)
      return null;
    if (key.size() <= 0)
      return null;

    Set<String> set = key.keySet();
    Iterator<String> it = set.iterator();
    while (it.hasNext()) {
      String str = it.next().toString();
      if (key.get(str) == null || "".equals(key.get(str)))
        return null;// 键值存在空
      if (!title.contains(str))
        return null;// 有不存在的键值
    }

    HsRowSet tmpRowSet = (HsRowSet) clone(this);

    for (int j = 0; j < getRowCount(); j++) {
      boolean bfind = true;
      Iterator<String> it2 = set.iterator();
      while (it2.hasNext()) {
        String str = it2.next().toString();
        String val = key.get(str);
        String data = getValue(j, str);
        if (val == null || "".equals(val)) {
          bfind = false;
          break;
        }
        if (data == null || "".equals(data)) {
          bfind = false;
          break;
        }
        if (!val.equals(data)) {
          bfind = false;
          break;
        }
      }
      if (bfind)
        tmpRowSet.addRow(this.getRow(j));
    }
    return tmpRowSet;
  }

  public Object getResultObject(String key) {
    return resultObject.get(key);
  }

  public void setResultObject(String key, Object result) {
    this.resultObject.put(key, result);
  }

  /**
   * 设置显示级别
   *
   * @param colNo
   * @param value 0:不显示, 1:列表显示 2:详细显示
   */
  public void setViewLevel(int colNo, String value) {
    if (colNo < 0)
      return;
    if (colNo >= viewlevel.size()) {
      int addnum = colNo - title.size();
      for (int i = 0; i < addnum; i++) {
        title.add("");
        type.add("");
        caption.add("");
        viewlevel.add("");
        totalsum.add("");
        cursum.add("");
      }
      title.add("");
      caption.add("");
      type.add("");
      viewlevel.add(value);
      totalsum.add("");
      cursum.add("");
    }
    else
      viewlevel.set(colNo, value);
  }

  public String getViewLevel(int colNo) {
    if (colNo < 0 || colNo >= viewlevel.size())
      return "";
    return viewlevel.get(colNo) == null ? "" : viewlevel.get(colNo);
  }

  //    private String formatFloat(String format, double f) {
  //        StringBuffer formatString = new StringBuffer(format);
  //        java.text.DecimalFormat df = new java.text.DecimalFormat(formatString
  //                .toString());
  //        return df.format(f);
  //    }

  // 求当前结果集汇总数

  public String getCurSumValue(int colNo) {
    if (colNo < 0 || colNo >= title.size())
      return "";
    return cursum.get(colNo) == null ? "" : cursum.get(colNo);
  }

  public String getCurSumValue(String colName) {
    int findidx = findColNameIndex(colName);
    if (findidx != -1)
      return getCurSumValue(findidx);
    else
      return "";
  }

  public void setCurSumValue(int colNo, String value) {
    if (colNo < 0)
      return;
    if (colNo >= cursum.size()) {
      int addnum = colNo - cursum.size();
      for (int i = 0; i < addnum; i++) {
        title.add("");
        type.add("");
        caption.add("");
        viewlevel.add("");
        totalsum.add("");
        cursum.add("");
      }
      title.add("");
      type.add("");
      caption.add("");
      viewlevel.add("");
      totalsum.add("");
      cursum.add(value);
    }
    else
      cursum.set(colNo, value);

  }

  public void initCurSumValue() {
    for (int colNo = 0; colNo < title.size(); colNo++) {
      String tmpType = type.get(colNo);
      double tmptotal = 0;
      if (tmpType.equals("F")) {
        for (int i = 0; i < rows.size(); i++) {
          List<String> tmpRow = rows.get(i);
          String tmpvalue = tmpRow.get(colNo);
          if (!tmpvalue.equals(""))
            tmptotal = tmptotal + Double.parseDouble(tmpvalue);
        }
        setCurSumValue(colNo, Double.toString(tmptotal));
      }
      else {
        setCurSumValue(colNo, "");
      }
    }
  }

  // 求所有结果集汇总数
  public String getTotalSumValue(int colNo) {
    if (colNo < 0 || colNo >= title.size())
      return "";
    return totalsum.get(colNo) == null ? "" : totalsum.get(colNo);
  }

  public String getTotalSumValue(String colName) {
    int findidx = findColNameIndex(colName);
    if (findidx != -1)
      return getTotalSumValue(findidx);
    else
      return "";
  }

  public void setTotalSumValue(int colNo, String value) {
    if (colNo < 0)
      return;
    if (colNo >= totalsum.size()) {
      int addnum = colNo - totalsum.size();
      for (int i = 0; i < addnum; i++) {
        title.add("");
        type.add("");
        caption.add("");
        viewlevel.add("");
        totalsum.add("");
        cursum.add("");
      }
      title.add("");
      type.add("");
      caption.add("");
      viewlevel.add("");
      totalsum.add(value);
      cursum.add("");
    }
    else {
      totalsum.set(colNo, value);
    }
  }

  public String getDataRight(int rowNo) {
    if (rowNo < 0 || rowNo >= rows.size())
      return null;
    return getValue(rowNo, SVC_DATARIGHT_COL);
  }

  public void setDataRight(int rowNo, String rf) {
    if (rowNo < 0 || rowNo >= rows.size())
      return;
    if (rf == null)
      return;
    if (findColNameIndex(SVC_DATARIGHT_COL) < 0) {
      addCol(SVC_DATARIGHT_COL);
      setDataType(findColNameIndex(SVC_DATARIGHT_COL), "S");
    }
    setValue(rowNo, SVC_DATARIGHT_COL, rf);
  }

  public List<String> getCol(int colNo) {
    if (colNo < 0 || colNo > getRow(0).size()) {
      throw new IllegalArgumentException("不正确的colNo值: " + colNo + " 允许的值为[0, " + getRow(0).size()
          + ")");
    }
    List<String> col = new ArrayList<String>();
    for (int i = 0; i < rows.size(); i++) {
      col.add(getValue(i, colNo));
    }
    return col;
  }

  public void changeTwoRowsPos(int firstRowIndex, int secondRowIndex) {
    List<String> firstRow = getRow(firstRowIndex);
    List<String> secondRow = getRow(secondRowIndex);
    rows.remove(firstRowIndex);
    rows.add(firstRowIndex, secondRow);
    rows.remove(secondRowIndex);
    rows.add(secondRowIndex, firstRow);
  }

  public void changeTwoColsPos(int firstColIndex, int secondColIndex) {
    List<String> firstCol = getCol(firstColIndex);
    List<String> secondCol = getCol(secondColIndex);
    for (int i = 0; i < rows.size(); i++) {
      setValue(i, firstColIndex, secondCol.get(i));
      setValue(i, secondColIndex, firstCol.get(i));
    }
  }

  public String[] getValues(int rowNo, String colNames[]) {
    if (rowNo < 0 || rowNo > rows.size()) {
      throw new IllegalArgumentException("不正确的rowNo值: " + rowNo + " 允许的值为[0, " + rows.size() + ")");
    }
    if (colNames == null || colNames.length == 0) {
      throw new IllegalArgumentException("必须指定参数(colNames[])");
    }
    String[] values = new String[colNames.length];
    for (int i = 0; i < colNames.length; i++) {
      values[i] = getValue(rowNo, colNames[i]);
    }
    return values;
  }

  public String[] getValues(int rowNos[], int colNo) {
    if (colNo < 0 || colNo > getRow(0).size()) {
      throw new IllegalArgumentException("不正确的colNo值: " + colNo + " 允许的值为[0, " + getRow(0).size()
          + ")");
    }
    if (rowNos == null || rowNos.length == 0) {
      throw new IllegalArgumentException("必须指定参数(rowNos[])");
    }
    String[] values = new String[rowNos.length];
    for (int i = 0; i < rowNos.length; i++) {
      values[i] = getValue(rowNos[i], colNo);
    }
    return values;
  }

  public int getRowNo(String[] colNames, String[] values) {
    if (colNames == null || colNames.length == 0) {
      throw new IllegalArgumentException("必须指定参数(colNames[])");
    }
    if (values == null || values.length == 0) {
      throw new IllegalArgumentException("必须指定参数(values[])");
    }
    if (colNames.length != values.length) {
      throw new IllegalArgumentException("参数(colNames[])和参数(values[])的长度必须相等");
    }
    // added by zheng xiang ming 20090304
    int[] cols = new int[colNames.length];
    for (int j = 0; j < colNames.length; j++) {
      cols[j] = findColNameIndex(colNames[j]);
    }
    for (int i = 0; i < rows.size(); i++) {
      // edited by zheng xiang ming 20090304
      // String[] vals = getValues(i, colNames);
      int j = 0;
      for (; j < values.length; j++) {
        if (!getValue(i, cols[j]).equals(values[j])) {
          break;
        }
      }
      if (j == values.length) {
        return i;
      }
    }
    return -1;
  }

  public int getColNo(int[] rowNos, String[] values) {
    if (rowNos == null || rowNos.length == 0) {
      throw new IllegalArgumentException("必须指定参数(rowNos[])");
    }
    if (values == null || values.length == 0) {
      throw new IllegalArgumentException("必须指定参数(values[])");
    }
    if (rowNos.length != values.length) {
      throw new IllegalArgumentException("参数(rowNos[])和参数(values[])的长度必须相等");
    }
    for (int i = 0; i < getRow(0).size(); i++) {
      String[] vals = getValues(rowNos, i);
      int j = 0;
      for (; j < values.length; j++) {
        if (!vals[j].equals(values[j])) {
          break;
        }
      }
      if (j == values.length) {
        return i;
      }
    }
    return -1;
  }

  public Object getVpo() {
    return vpo;
  }

  public List<?> getVpoList() {
    return vpoList;
  }

  public void setVpo(Object vpo) {
    this.vpo = vpo;
  }

  public void setVpoList(List<?> vpoList) {
    this.vpoList = vpoList;
  }

  /**
   * created by zheng xiang ming 20090225 在结果集形成之后创建结果的索引 输入参数:需要创建索引的列(字段)，放入数组里
   * 输出参数：索引形成返回的HashMap ,该HashMap纪录了索引列的值对应的行信息
   *
   * @return HashMap 注意： (1)该方法是在结果已经生成完毕之后再来建立索引。所以在如果先创建索引，再生成数据，索引是无效的 (2)输入参数数组的值是String[i] =
   *         xxxx,yyyy这种中间用","隔开的说明是建立联合索引 (3)如果索引列的值是null,也将建立索引
   */

  public void createIndexByEnd(String[] indexFields) {
    this.indexFields = indexFields;
    // 创建索引字段列 并且 j 行对应的值
    String indexFieldsValue = null;
    Map<String, String> map = null;
    // 数组中所有的字段循环创建索引
    if (indexFields.length != 0) {
      maps = new HashMap<String, Map<String, String>>();
    }
    for (int i = 0; i < indexFields.length; i++) {
      map = new HashMap<String, String>();
      // 扫描所有结果的行进行对某字段创建索引
      for (int j = 0; j < rows.size(); j++) {
        // 将索引列字段信息转化为数组，并且把各字段的值取出来组成字符串
        String[] indexFieldsParams = indexFields[i].split(",");
        // 获取需要创建索引字段列 并且 j 行对应的值
        indexFieldsValue = "";
        for (int m = 0; m < indexFieldsParams.length; m++) {
          indexFieldsValue = indexFieldsValue + this.getValue(j, indexFieldsParams[m]) + ",";
        }
        // 去掉最后一个字符","
        indexFieldsValue = indexFieldsValue.substring(0, indexFieldsValue.length() - 1);
        // 判断是否已经存在这个值的Key,值为null的Key也加入到Map 里
        if (!map.containsKey(indexFieldsValue)) {
          // 这里put进去的值为行号，Key为索引字段值
          map.put(indexFieldsValue, String.valueOf(j));
        }
        else {
          // 如果已经存在这个值的Key，则把旧的值更改为新的值，这里put进去的值为行号(多个用","
          // 隔开)，Key为索引字段值(联合索引中间用","隔开)
          String oldValues = map.get(indexFieldsValue);
          map.put(indexFieldsValue, oldValues + "," + String.valueOf(j));
        }
      }
      // 把索引文件加入到索引map
      maps.put(indexFields[i], map);
    }
  }

  public synchronized void deleteCol(int colNo) {
    //如果列太大或太小
    if (colNo >= title.size() || colNo < 0) {
      return;
    }
    title.remove(colNo);
    caption.remove(colNo);
    viewlevel.remove(colNo);
    totalsum.remove(colNo);
    cursum.remove(colNo);
    link.remove(colNo);
    len.remove(colNo);
    frametype.remove(colNo);
    reserve.remove(colNo);
    for (int i = 0; i < rows.size(); i++) {
      List<?> tmpRow = rows.get(i);
      tmpRow.remove(colNo);
    }
  }

  public void deleteCol(String colName) {
    int findidx = findColNameIndex(colName);
    deleteCol(findidx);
  }

  /**
   * 移除行，需要加上同步
   */
  public synchronized List<?> popRow(int rowNo) {
    if (rowNo < 0 || rowNo >= rows.size()) {
      return null;
    }
    return rows.remove(rowNo);
  }

  public void setTreeInfo(String value) {
    setHeadProperty(SVC_PROP_TREEINFO, value);
  }

  public String getTreeInfo() {
    return getHeadProperty(SVC_PROP_TREEINFO);
  }

}
