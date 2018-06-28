package com.ceying.common.util.service;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * Title:结果集
 * </p>
 * <p>
 * Description: 提供了统一的结果集的封装
 * </p>
 * <p>
 * Copyright: Copyright (c) 2006
 * </p>
 * <p>
 * Company: HUNDSUN
 * </p>
 *
 * @author
 * @version 1.0
 */
public interface ComRowSet {
  /**
   * 设置错误码
   *
   * @param value
   */
  void setErrorCode(String value);

  /**
   * 设置错误消息
   *
   * @param value
   */
  void setErrorMsg(String value);

  /**
   * 设置成功状态
   *
   * @param value
   */
  void setSuccessFlag(String value);

  /**
   * 返回错误码
   *
   * @return String
   */
  String getErrorCode();

  /**
   * 返回错误消息
   *
   * @return String
   */
  String getErrorMsg();

  /**
   * 返回成功标记
   *
   * @return String
   */
  String getSuccessFlag();

  /**
   * 设置uc号
   *
   * @param value
   */
  void setFunctionno(String value);

  /**
   * 获得功能号
   *
   * @return String
   */
  String getFunctionno();

  /**
   * 是否成功
   *
   * @return
   */
  boolean isSuccessful();

  /**
   * 是否为空
   *
   * @return
   */
  boolean isEmpty();

  /**
   * 获得所有的行数据
   *
   * @return
   */
  List<List<String>> getRows();

  /**
   * 获得某一和数据
   *
   * @param index 行号
   * @return 数组对象
   */
  List<String> getRow(int index);

  /**
   * 返回总记录数
   *
   * @return int
   */
  int getTotalRecords();

  /**
   * 设置总记录数
   *
   * @param num
   */
  void setTotalRecords(int num);

  /**
   * 获得每页记录数
   *
   * @return int
   */
  int getCountPerPage();

  /**
   * 设置每页记录数
   *
   * @param num
   */
  void setCountPerPage(int num);

  /**
   * 获得行数
   *
   * @return
   */
  int getRowCount();

  /**
   * 获得列数
   *
   * @return
   */
  int getColCount();

  /**
   * 获得某一行某一列的数据
   *
   * @param rowNo 行号
   * @param colName 列名
   * @return String
   */
  String getValue(int rowNo, String colName);

  /**
   * 获得某一行某一列的数据
   *
   * @param rowNo 行号
   * @param colNo 列号
   * @return String
   */
  String getValue(int rowNo, int colNo);

  /**
   * 设置某一行某一列的数据
   *
   * @param rowNo 行号
   * @param colNo 列号
   * @param value 值
   */
  void setValue(int rowNo, int colNo, String value);

  /**
   * 设置某一行某一列的数据
   *
   * @param rowNo 行号
   * @param colName 列名
   * @param value 值
   */
  void setValue(int rowNo, String colName, String value);

  /**
   * 设置最后一行某一列的数据
   *
   * @param colNo 列号
   * @param value 值
   */
  void setValue(int colNo, String value);

  /**
   * 增加一行
   */
  void addRow();

  /**
   * 移出一行
   */
  void removeRow();

  /**
   * 增加一行
   *
   * @param row 增加的行
   */
  void addRow(List<String> row);

  /**
   * 增加一列
   *
   * @param value 列名
   * @param cap 列描述
   */
  void addCol(String value, String cap);

  /**
   * 增加一列
   *
   * @param value 列名
   */
  void addCol(String value);

  /**
   * 设置标题
   *
   * @param title
   */
  void setTitle(List<String> title);

  /**
   * 设置某一列的标题
   *
   * @param colNo 列数
   * @param value 值
   */
  void setTitle(int colNo, String value);

  /**
   * 设置某一列的描述
   *
   * @param colNo 列数
   * @param cap 描述
   */
  void setCaption(int colNo, String cap);

  /**
   * 设置超级链接
   *
   * @param colNo 列号
   * @param lk 链接
   */
  void setLink(int colNo, String lk);

  /**
   * 设置链接类型，弹出框或者还是其它的
   *
   * @param colNo 列号
   * @param ft 类型
   */
  void setFrameType(int colNo, String ft);

  /**
   * 设置字段长度
   * @param colNo 列号
   * @param lk 类型
   */
  void setLen(int colNo, String lk);

  /**
   * 设置数据类型
   *
   * @param colNo 列名
   * @param value 类型
   */
  void setDataType(int colNo, String value);

  /**
   * 设置某一列的标题和描述
   *
   * @param colNo 列号
   * @param value 标题
   * @param cap 描述
   */
  void setTitle(int colNo, String value, String cap);

  /**
   * 设置预留字段
   *
   * @param colNo 列号
   * @param ft
   */
  void setReserve(int colNo, String ft);

  /**
   * 返回标题
   *
   * @return
   */
  List<String> getTitle();

  /**
   * 返回某一列标题
   *
   * @param colNo
   * @return String
   */
  String getTitle(int colNo);

  /**
   * 返回某一列描述
   *
   * @param colNo 列号
   * @return String
   */
  String getCaption(int colNo);

  /**
   * 返回某一列描述
   *
   * @param colName 列名
   * @return String
   */
  String getCaption(String colName);

  /**
   * 返回某一列数据类型
   *
   * @param colNo 列号
   * @return String
   */
  String getDataType(int colNo);

  /**
   * 返回某一列超级链接
   *
   * @param colNo
   * @return String
   */
  String getLink(int colNo);

  /**
   * 返回某一列长度
   * @param colNo
   * @return
   */
  String getLen(int colNo);

  /**
   * 返回链接类型
   *
   * @param colNo
   * @return String
   */
  String getFrameType(int colNo);

  /**
   * 转成string
   *
   * @return String
   */
  String toString();

  /**
   * 将标题转成字符串
   *
   * @return String
   */
  String titleToString();

  /**
   * 根据主键查找
   *
   * @param key 主键
   * @return 行号
   */
  int findPrimaryKey(Map<String, String> key);

  /**
   * 根据主键查找
   *
   * @param key 主键
   * @return ComRowSet
   */
  ComRowSet findByKey(Map<String, String> key);

  /**
   * 复制数据集
   *
   * @param rowset
   * @return
   */
  ComRowSet clone(ComRowSet rowset);

  /**
   * 返回保留字段
   *
   * @param colNo
   * @return String
   */
  String getReserve(int colNo);

  /**
   * 返回结果对象
   *
   * @param key 键值
   * @return Object
   */
  Object getResultObject(String key);

  /**
   * 设置结果集
   *
   * @param key
   * @param result
   */
  void setResultObject(String key, Object result);

  /**
   * 设置显示级别
   *
   * @param colNo 列
   * @param value 级别
   */
  void setViewLevel(int colNo, String value);

  /**
   * 返回显示级别
   *
   * @param colNo 列
   * @return String
   */
  String getViewLevel(int colNo);

  /**
   * 求当前返回页汇总数
   *
   * @param colName 列名
   * @return String
   */
  String getCurSumValue(String colName);

  /**
   * 求当前返回页汇总数
   *
   * @param colNo 列号
   * @return String
   */
  String getCurSumValue(int colNo);

  /**
   * 设置当前返回页汇总数
   *
   * @param colNo 列
   * @param value 值
   */
  void setCurSumValue(int colNo, String value);

  /**
   * 根据当前行值初始化统计当前页小计
   */
  void initCurSumValue();//

  /**
   * 求所有结果集汇总数
   *
   * @param colName 列名
   * @return String
   */
  String getTotalSumValue(String colName);

  /**
   * 返回总计
   *
   * @param colNo 列号
   * @return String
   */
  String getTotalSumValue(int colNo);

  /**
   * 设置总计值
   *
   * @param colNo 列号
   * @param value 值
   */
  void setTotalSumValue(int colNo, String value);

  /**
   * 返回行结果记录集数据操作权限
   *
   * @param rowNo 行号
   * @return String
   */
  String getDataRight(int rowNo);

  /**
   * 设置数据权限
   *
   * @param rowNo 行号
   * @param rf 权限
   */
  void setDataRight(int rowNo, String rf);

  /**
   * 获取结果集中某一列的值
   *
   * @param colNo 列号
   * @return 包含改列所有值的List
   */
  List<String> getCol(int colNo);

  /**
   * 交换结果集中两行的位置
   *
   * @param firstRowIndex 欲交换位置的第一行的行号
   * @param secondRowIndex 欲交换位置的第二行的行号
   */
  void changeTwoRowsPos(int firstRowIndex, int secondRowIndex);

  /**
   * 交换结果集中两列的位置
   *
   * @param firstColIndex 欲交换位置的第一列的列号
   * @param secondColIndex 欲交换位置的第二列的列号
   */
  void changeTwoColsPos(int firstColIndex, int secondColIndex);

  /**
   * 获取某一行指定列的值
   *
   * @param rowNo 行号
   * @param colNames 列名
   * @return 值
   */
  String[] getValues(int rowNo, String colNames[]);

  /**
   * 获取某一列指定行的值
   *
   * @param rowNos [] 行号
   * @param colNo 列号
   * @return 值
   */
  String[] getValues(int rowNos[], int colNo);

  /**
   * 获取指定列的指定值在结果集中的行号 如果有多行则返回行号最小的(第一个) -1表示不存在
   *
   * @param colNames 列名
   * @param values 值
   * @return
   */
  int getRowNo(String[] colNames, String[] values);

  /**
   * 获取指定行的指定值在结果集中的列号 如果有多列则返回列号最小的(第一列) 返回-1表示不存在
   *
   * @param rowNos 行号
   * @param values 值
   * @return
   */
  int getColNo(int[] rowNos, String[] values);

  /**
   * 返回某一列名所在的列号
   *
   * @param colName 列名
   * @return 列号
   */
  int findColNameIndex(String colName);

  /**
   * 获取VPO
   *
   * @return
   */
  Object getVpo();

  /**
   * 返回VPO列表
   *
   * @return
   */
  List<?> getVpoList();

  /**
   * 设置VPO
   *
   * @param vpo
   */
  void setVpo(Object vpo);

  /**
   * 设置VPO列表
   *
   * @param vpoList
   */
  void setVpoList(List<?> vpoList);

  /**
   * created by zheng xiang ming 20090225 在结果集形成之后创建结果的索引 输入参数:需要创建索引的列(字段)，放入数组里
   * 输出参数：索引形成返回的HashMap ,该HashMap纪录了索引列的值对应的行信息
   *
    * created by zheng xiang ming 20090225 在结果集形成之后创建结果的索引
  // * 输入参数:需要创建索引的列(字段)，放入数组里 输出参数：索引形成返回的HashMap ,该HashMap纪录了索引列的值对应的行信息
  // *
  // * @return HashMap 注意： (1)该方法是在结果已经生成完毕之后再来建立索引。所以在如果先创建索引，再生成数据，索引是无效的
  // * (2)输入参数数组的值是String[i] = xxxx,yyyy这种中间用","隔开的说明是建立联合索引
   	* (3)如果索引列的值是null,也将建立索引

   * @param indexFields
   */
  void createIndexByEnd(String[] indexFields);

  /**
   * 删除列
   *
   * @param colNo 列号
   */
  void deleteCol(int colNo);

  /**
   * 删除列
   *
   * @param colName 列标题
   */
  void deleteCol(String colName);

  /**
   * 删除行并返回该行数据
   *
   * @param rowNo 行号
   * @return
   */
  List<?> popRow(int rowNo);

  /**
   * 设置RowSet转成树的配置信息.
   * 配置规则为用逗号隔开的字符串,最后一位的其他属性用#隔开.
   * 共四位分别为：id,text,parentId,others
   * 例如：groupId,groupName,parentGroupId,type#desc
   *
   * @param value
   */
  void setTreeInfo(String value);

  /**
   * 获取树的配置信息.
   *
   * @return the tree info
   */
  String getTreeInfo();

}
