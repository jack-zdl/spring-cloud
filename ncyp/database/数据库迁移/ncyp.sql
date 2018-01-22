/*
Navicat MySQL Data Transfer

Source Server         : ncyp
Source Server Version : 50717
Source Host           : 192.168.6.253:3306
Source Database       : ncyp

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-01-23 05:45:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tdictionary`
-- ----------------------------
DROP TABLE IF EXISTS `tdictionary`;
CREATE TABLE `tdictionary` (
  `c_sysname` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `l_keyno` int(10) NOT NULL,
  `c_keyvalue` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `c_caption` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `c_modify` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `c_memo` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `c_english` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `l_order` int(10) DEFAULT NULL,
  PRIMARY KEY (`c_sysname`,`l_keyno`,`c_keyvalue`),
  UNIQUE KEY `idx_tdictionary` (`l_keyno`,`c_keyvalue`,`c_sysname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tdictionary
-- ----------------------------
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1001', '#', '是否(√/×)', '0', null, 'IsActive', null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1001', '0', '×', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1001', '1', '√', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1002', '#', '日期类型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1002', '1', '特殊工作日', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1002', '2', '特殊节假日', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1003', '#', '直联币种', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1003', '1', '人民币', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1003', '2', '美元', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1003', '3', '日元', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1003', '4', '港币', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1003', '5', '欧元', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1003', '6', '新加坡元', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1004', '#', '任务运行状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1004', '1', '新建', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1004', '2', '完成', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1004', '4', '运行中', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1005', '#', '直联指令类型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1005', '1', '融资提供方账户今日余额', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1005', '2', '融资提供方账户历史余额', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1005', '3', '融资提供方账户今日明细', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1005', '4', '融资提供方账户历史明细', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1005', '5', '收付', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1005', '6', '数据推送', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1006', '#', '直联支付方式', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1006', '1', '普通支付', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1006', '2', '批量代付', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1006', '3', '非直联', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1006', '4', '批量代收', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1006', '5', '单笔实时收款', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1006', '6', '实时付款', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1006', '7', '零余额扣款', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1006', '8', '短信验证码扣款', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1006', '9', 'POS扣款', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1006', 'A', '短信回复扣款', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1006', 'B', '电话语音扣款', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1007', '#', '直联指令参数分组', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1007', '1', '格式校验', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1007', '2', '数据转换', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1007', '3', '指令发送', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1007', '4', '状态查询', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1008', '#', '支付状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1008', '1', '未收付', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1008', '2', '已收付', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1008', '3', '收付失败', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1008', '4', '融资提供方处理中', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1008', '5', '指令提交中', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1008', '6', '退票', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1008', '7', '收付结果无法识别', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1008', '8', '未知', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1009', '#', '直联报文类型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1009', '1', '支付', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1009', '2', '查询状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1010', '#', '交易方向', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1010', '1', '支出', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1010', '2', '收入', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1011', '#', '任务计划运行状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1011', '1', '启用', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1011', '2', '暂停', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1012', '#', '利率方式', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1012', '1', '浮动利率', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1012', '2', '固定利率', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1013', '#', '利率期限', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1013', '1', '年利率', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1013', '2', '月利率', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1013', '3', '日利率', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1014', '#', '计息基准', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1014', '1', 'ACT/ACT', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1014', '2', 'ACT/365', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1014', '3', 'ACT/360', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1014', '4', '30/360', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1015', '#', '利率变动基准日期', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1015', '1', '利率调整日期', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1015', '2', '合同计息开始日期', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1015', '3', '合同开始日期', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1015', '4', '合同下一结息日期', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1015', '5', '合同首次利率调整日期', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1016', '#', '利率变动生效日', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1016', '1', '对应日', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1016', '2', '首日', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1016', '3', '次日', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1016', '4', '末日', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1017', '#', '业务分类', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1017', '1', '资金类别', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1017', '2', '交易对手类别', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1017', '3', '账户性质', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1017', '4', '账户分组', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1017', '5', '支票用途', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1017', '6', '支票作废原因', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1017', '7', '短信类别', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1018', '#', '数据来源', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1018', '1', '手工录入', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1018', '2', '文件导入', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1018', '3', '系统生成', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1018', '4', '对接系统', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1018', '5', '融汇平台', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1018', '6', '银企直联', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1019', '#', '融资提供方账户维护标识', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1019', '1', '开户', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1019', '2', '变更', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1019', '3', '冻结', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1019', '4', '解冻', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1019', '5', '销户', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1020', '#', '取整划拨等级', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1020', '1', '不取整', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1020', '2', '十', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1020', '3', '百', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1020', '4', '千', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1020', '5', '万', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1021', '#', '审批状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1021', '1', '未审批', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1021', '2', '已审批', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1021', '3', '已拒绝', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1021', '4', '审批中', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1022', '#', '维护状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1022', '1', '未维护', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1022', '2', '已维护', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1023', '#', '作废状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1023', '1', '未作废', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1023', '2', '已作废', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1024', '#', '账户存款类型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1024', '1', '活期', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1024', '2', '定期', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1024', '3', '保证金', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1024', '4', '通知', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1025', '#', '融资提供方账户状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1025', '1', '新建', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1025', '2', '开户', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1025', '3', '冻结', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1025', '4', '销户', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1026', '#', '导出标识', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1026', '1', '未导出', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1026', '2', '已导出', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1026', '3', '导出失败', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1026', '4', '导出中', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1027', '#', '资金交易生成状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1027', '1', '未生成', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1027', '2', '已生成', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1027', '3', '生成失败', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1027', '4', '生成中', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1027', '5', '部分生成', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1028', '#', '认领状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1028', '1', '未认领', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1028', '2', '已认领', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1029', '#', '公私标志', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1029', '1', '对私', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1029', '2', '对公', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1030', '#', '卡折类型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1030', '1', '折', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1030', '2', '借记卡', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1030', '3', '贷记卡', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1030', '4', '准贷记卡', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1031', '#', '数据权限-数据分类', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1031', '1', '系统参数', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1031', '2', '任务', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1031', '3', '交易类型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1031', '4', '结算方式', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1031', '5', '融资提供方账户', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1032', '#', '数据权限-权限分类', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1032', '1', '查询', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1032', '2', '操作', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1033', '#', '支付类型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1033', '1', '直联', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1034', '#', '支票类型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1034', '1', '现金', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1034', '2', '转账', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1034', '3', '现金/转账', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1034', '4', '电汇', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1035', '#', '承兑汇票类型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1035', '1', '应收承兑汇票', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1035', '2', '应付承兑汇票', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1036', '#', '交易场景', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1036', '1', '境内同币', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1036', '2', '境内跨币', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1036', '3', '境外同币', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1036', '4', '境外跨币', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1037', '#', '结算场景', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1037', '0', '默认', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1037', '100', '跨行默认', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1037', '101', '跨行同城非加急', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1037', '102', '跨行加急', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1037', '103', '跨行且满足网银互联', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1037', '11', '同行对私', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1037', '12', '同行对公', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1037', '13', '同行内部调拨', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1037', '20', '代发代扣默认', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1037', '21', '代发代扣对私', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1037', '22', '代发代扣对公', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1038', '#', '优先级', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1038', '0', '默认', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1038', '10', '中', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1038', '100', '高', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1039', '#', '账户类别', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1039', '1', '银企直联户', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1039', '2', '现金虚拟户', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1039', '3', '票据虚拟户', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1039', '99', '其它非直联户', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1040', '#', '交易对方对象类型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1040', '1', '内部组织', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1040', '2', '交易对手', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1041', '#', '组织范围', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1041', '1', '所有组织', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1041', '10', '结算中心', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1041', '2', '本组织', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1041', '3', '非本组织', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1041', '4', '上级组织', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1041', '5', '下级组织', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1041', '6', '平级组织', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1042', '#', '证件类型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1042', '0', '身份证', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1042', '1', '户口簿', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1042', '2', '护照', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1042', '3', '军官证', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1042', '4', '士兵证', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1042', '5', '港澳居民来往内地通行证', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1042', '6', '台湾同胞来往内地通行证', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1042', '7', '临时身份证', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1042', '8', '外国人居留证', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1042', '9', '警官证', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1042', '99', '其他证件', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1043', '#', '同城标识', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1043', '0', '异地', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1043', '1', '同城', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1044', '#', '同行标识', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1044', '0', '跨行', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1044', '1', '同行', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1045', '#', '加急标识', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1045', '0', '不加急', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1045', '1', '加急', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1046', '#', '冲正状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1046', '1', '未冲正', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1046', '2', '已冲正', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1046', '3', '冲正失败', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1046', '4', '冲正中', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1047', '#', '记账状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1047', '1', '未记账', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1047', '2', '已记账', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1047', '3', '记账失败', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1047', '4', '记账中', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1048', '#', '生成状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1048', '1', '未生成', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1048', '2', '已生成', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1048', '3', '生成失败', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1048', '4', '生成中', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1049', '#', '收付款单来源', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1049', '1', '清算产生', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1049', '10', '申请下拨', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1049', '11', '定额下拨', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1049', '12', '上划回拨', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1049', '13', '计划下拨', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1049', '14', '联动下拨', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1049', '15', '补足留底下拨', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1049', '16', '融资提供方账户明细', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1049', '17', '融资提供方账户流水', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1049', '18', '应付承兑汇票', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1049', '19', '应收承兑汇票', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1049', '2', '手工录入', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1049', '3', '文件导入', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1049', '4', '接口导入', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1049', '5', '收付款申请单', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1049', '6', '资金交易单', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1049', '7', '满额上划', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1049', '8', '定额上划', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1049', '9', '按比例上划', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1050', '#', '对接方式', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1050', '1', '文件导入', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1051', '#', '结构账户类型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1051', '1', '企业账户结构', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1051', '2', '中信融资提供方附属账户', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1051', '3', '农行多级账簿', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1051', '4', '工行全球现金池', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1051', '5', '工行账户管家', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1052', '#', '联行号类型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1052', '1', '普通联行号', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1052', '2', '默认联行号', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1052', '3', '支付不可用', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1052', '4', '总行联行号', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1053', '#', '节假日模式', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1053', '1', '节假日运行', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1053', '2', '节假日不运行', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1054', '#', '支付安全策略', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1054', '0', '不控制', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1054', '1', '支付密码', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1054', '2', 'VPN验签', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1054', '3', 'CFCA验签', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1054', '4', '动态密码卡', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1055', '#', '预警触发方式', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1055', '1', '定时', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1055', '2', '即时', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1056', '#', '字段类型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1056', 'C:', '字符', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1056', 'D', '日期', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1056', 'DT', '日期时间', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1056', 'F', '浮点数', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1056', 'I', '整型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1056', 'M', '辅助查询', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1056', 'N', '字典', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1056', 'NC', '字段缓存', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1056', 'S', '字符串', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1056', 'T', '时间', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1057', '#', '预警属性分类', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1057', '1', '条件字段配置', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1057', '2', '模板字段配置', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1057', '3', '通知字段配置', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1058', '#', '左括号', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1058', '1', '(', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1058', '10', '((((((((((', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1058', '2', '((', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1058', '3', '(((', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1058', '4', '((((', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1058', '5', '(((((', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1058', '6', '((((((', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1058', '7', '(((((((', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1058', '8', '((((((((', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1058', '9', '(((((((((', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1059', '#', '右括号', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1059', '1', ')', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1059', '10', '))))))))))', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1059', '2', '))', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1059', '3', ')))', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1059', '4', '))))', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1059', '5', ')))))', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1059', '6', '))))))', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1059', '7', ')))))))', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1059', '8', '))))))))', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1059', '9', ')))))))))', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1060', '#', '比较关系', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1060', '1', '=', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1060', '10', '不包含', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1060', '11', '前X天', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1060', '12', '后X天', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1060', '13', '模糊', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1060', '2', '<>', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1060', '3', '>', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1060', '4', '<', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1060', '5', '>=', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1060', '6', '<=', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1060', '7', '空', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1060', '8', '非空', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1060', '9', '包含', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1061', '#', '逻辑关系', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1061', '1', '并且', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1061', '2', '或者', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1062', '#', '通知方式', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1062', '1', '预警消息', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1062', '2', '系统消息', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1062', '3', '邮件', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1062', '4', '短信', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1063', '#', '通知对象', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1063', '1', '系统用户', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1063', '2', '其它人员', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1064', '#', '通知对象源', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1064', '1', '单据', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1064', '2', '自定义设置', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1065', '#', '票据类型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1065', '1', '融资提供方承兑汇票', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1065', '2', '商业承兑汇票', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1066', '#', '应收票据状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1066', '1', '已登记', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1066', '10', '坏票', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1066', '2', '已收票', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1066', '3', '到期未收款', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1066', '4', '到期已收款', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1066', '5', '已背书', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1066', '6', '已贴现', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1066', '7', '已质押', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1066', '8', '质押到期收款', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1066', '9', '已换票', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1067', '#', '应付票据状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1067', '1', '已登记', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1067', '2', '已出票', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1067', '3', '到期未付款', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1067', '4', '到期已付款', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1067', '5', '已拒付', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1067', '6', '已退票', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1067', '7', '已换票', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1068', '#', '支票状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1068', '1', '登记入库', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1068', '2', '已领用', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1069', '#', '应付票据操作标识', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1069', '1', '出票', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1069', '101', '取消出票', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1069', '102', '取消承付', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1069', '2', '承付', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1069', '3', '拒付', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1069', '4', '退票', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1070', '#', '保证金担保方式', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1070', '1', '一定比例保证金', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1070', '2', '个人保证金', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1070', '3', '票据质押保证', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1071', '#', '发送状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1071', '1', '未发送', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1071', '2', '已发送', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1071', '3', '发送失败', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1071', '4', '发送中', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1072', '#', '交易类型类别', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1072', '0', '未分类', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1072', '1', '上划', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1072', '2', '下拨', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1072', '3', '提现', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1072', '4', '存现', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1073', '#', '审核状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1073', '1', '未审批', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1073', '2', '已审批', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1074', '#', '应收票据操作标识', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1074', '1', '收票', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1074', '101', '取消收票', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1074', '102', '取消托收', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1074', '103', '取消背书', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1074', '104', '取消贴现', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1074', '105', '取消质押', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1074', '2', '托收', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1074', '3', '背书', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1074', '4', '贴现', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1074', '5', '质押', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1074', '6', '质押到期收款', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1074', '7', '换票', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1074', '8', '坏票', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1076', '#', '上划模式', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1076', '1', '满额上划', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1076', '2', '定额上划', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1076', '3', '按比例上划', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1077', '#', '排序方式', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1077', '1', '升序', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1077', '2', '降序', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1078', '#', '下拨状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1078', '1', '未下拨', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1078', '2', '下拨成功', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1078', '3', '下拨失败', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1078', '4', '下拨中', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1079', '#', '下拨模式', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1079', '1', '定额下拨', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1079', '2', '留底下拨', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1080', '#', '余额不足处理', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1080', '2', '不下拨', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1080', '3', '尝试下一个账户', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1081', '#', '返盘状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1081', '1', '未返盘', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '1081', '2', '已返盘', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '3130', '#', '产品描述(分行业)', '0', '根据参数，将\"基金\"替换成对应的值', null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '3130', 'fund', '基金', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '3130', 'securities', '产品', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '3130', 'third-party', '产品', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '3130', 'trust', '产品', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '3131', '#', '产品账号描述(分行业)', '0', '根据参数,将\"基金账号\"替换成对应的值', null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '3131', 'fund', '基金账号', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '3131', 'securities', '产品账号', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '3131', 'third-party', '产品账号', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '3131', 'trust', '理财账号', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '3132', '#', '计划任务状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '3132', '1', '启动', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '3132', '2', '暂停', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '3132', '3', '失败', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '3134', '#', '日期配置模式', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '3134', '1', '日模式', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '3134', '2', '月模式', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '3135', '#', '第几个星期', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '3135', '0', '每个星期', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '3135', '1', '第一个星期', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '3135', '2', '第二个星期', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '3135', '3', '第三个星期', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '3135', '4', '第四个星期', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '3135', '5', '最后个星期', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '3136', '#', '星期', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '3136', '1', '星期日', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '3136', '2', '星期一', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '3136', '3', '星期二', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '3136', '4', '星期三', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '3136', '5', '星期四', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '3136', '6', '星期五', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '3136', '7', '星期六', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '19089', '#', '已完成请求状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '19089', 'cancel', '发起人撤销', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '19089', 'ended', '正常结束', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '19089', 'terminated', '强制终止', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '19090', '#', '未完成请求状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '19090', 'active', '正在运行', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '19090', 'suspended', '暂停', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999001', '#', '用户分类', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999001', '0', '柜员', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999001', '1', '用户', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999002', '#', '用户状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999002', '0', '正常', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999002', '1', '注销', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999002', '2', '未激活', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999002', '3', '冻结', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999003', '#', 'SYS证件类型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999003', '1', '身份证', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999003', '10', '警官证', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999003', '11', '其它证件', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999003', '2', '户口薄', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999003', '3', '护照', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999003', '4', '军官证', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999003', '5', '士兵证', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999003', '6', '港澳居民来往内地通行证', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999003', '7', '台湾同胞来往内地通行证', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999003', '8', '临时身份证', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999003', '9', '外国人居留证', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999004', '#', '组织分类', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999004', '0', '平台', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999004', '1', '融资提供方', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999004', '2', '核心企业', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999004', '3', '供应商', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999005', '#', '组织级别', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999005', '0', '平台', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999005', '1', '一级', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999005', '2', '二级', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999005', '3', '三级', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999005', '4', '四级', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999006', '#', '服务运行标志', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999006', '0', '可运行', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999006', '1', '不可运行', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999007', '#', '权限分配标志', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999007', '0', '未分配', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999007', '1', '分配', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999008', '#', '组织状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999008', '-1', '注销', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999008', '0', '正常', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999009', '#', '授权标识', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999009', '0', '未授权', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999009', '1', '授权', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999010', '#', '窗口类型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999010', '0', '子窗口', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999010', '2', '单页模式窗口', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999010', '3', '非单页模式窗口', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999011', '#', '排除参与人', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999011', '0', '不排除', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999011', '1', '排除前一活动', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999011', '2', '排除所有已办活动', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999012', '#', '流程实例状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999012', 'active', '正在运行', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999012', 'cancel', '已废除', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999012', 'ended', '正常终止', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999012', 'resume', '恢复', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999012', 'suspend', '暂停', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999012', 'suspended', '暂停', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999012', 'terminate', '终止', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999012', 'terminated', '强制终止', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999013', '#', '委托状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999013', '0', '过期', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999013', '1', '停用', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999013', '2', '启用', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999014', '#', '委托方式', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999014', 'A', '全权委托', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999014', 'P', '流程委托', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999015', '#', '开闭标识', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999015', '0', '关闭', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999015', '1', '开启', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999016', '#', '系统分类', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999016', 'BIZFRAME', '基础业务框架', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999016', 'WORKFLOW', '工作流', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999017', '#', '租户类型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999017', '0', '普通', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999017', '1', '大型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999017', '2', '集团', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999018', '#', '租户状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999018', '0', '正常', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999018', '1', '注销', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999018', '2', '禁用', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999019', '#', '输入输出标志', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999019', '0', '输入', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999019', '1', '输出', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999020', '#', '公私包', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999020', '0', '私有', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999020', '1', '公共', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999021', '#', '库字段类型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999021', 'C', '字符', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999021', 'D', '日期', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999021', 'DT', '日期时间', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999021', 'F', '浮点数', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999021', 'I', '整型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999021', 'S', '字符串', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999022', '#', '非空', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999022', '0', '可空', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999022', '1', '非空', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999023', '#', '字段类别', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999023', '0', '普通', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999023', '1', '主键', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999023', '2', '查询条件', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999023', '3', '传变量', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999024', '#', '条件', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999024', '<', '<', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999024', '<=', '<=', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999024', '<>', '<>', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999024', '=', '=', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999024', '>', '>', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999024', '>=', '>=', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999024', 'exists', 'exists', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999024', 'in', 'in', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999024', 'incsub', 'incsub', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999024', 'like', 'like', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999024', 'lrlike', 'lrlike', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999024', 'not exists', 'not exists', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999024', 'not in', 'not in', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999024', 'rlike', 'rlike', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999025', '#', '输入显示级别', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999025', '0', '高级查询显示', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999025', '1', '显示', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999025', '2', '不显示', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999026', '#', '输入类型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999026', 'C', '字符', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999026', 'D', '日期', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999026', 'DT', '日期时间', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999026', 'F', '浮点数', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999026', 'I', '整型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999026', 'M', '辅助查询', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999026', 'N', '字典', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999026', 'S', '字符串', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999026', 'T', '时间', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999027', '#', '视图初始条件', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999027', '0', '否', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999027', '1', '是', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999028', '#', '发起人终止流程', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999028', '0', '下一个任务处理前可以终止', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999028', '1', '流程实例结束前可以终止', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999028', '2', '回到发起人可以终止', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999029', '#', '管理视角', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999029', '1', '视角A', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999029', '2', '视角B', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999029', '3', '视角C', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999030', '#', '数据用户类型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999030', '1', '类型A', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999030', '2', '类型B', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999030', '3', '类型C', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999031', '#', 'SQL类型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999031', '0', '普通sql语句', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999031', '1', '存储过程', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999032', '#', '登录标志', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999032', '0', '否', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999032', '1', '登录', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999033', '#', '直联币种', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999033', '1', '人民币', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999033', '2', '美元', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999033', '3', '日元', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999033', '4', '港币', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999033', '5', '欧元', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999033', '6', '新加坡元', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999034', '#', '邮件短信对象类型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999034', '1', '邮件', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999034', '2', '短信', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999035', '#', '预警触发方式', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999035', '1', '定时', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999035', '2', '即时', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999036', '#', '预警属性分类', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999036', '1', '条件字段配置', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999036', '2', '模板字段配置', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999036', '3', '通知字段配置', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999037', '#', '左括号', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999037', '1', '(', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999037', '10', '((((((((((', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999037', '2', '((', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999037', '3', '(((', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999037', '4', '((((', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999037', '5', '(((((', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999037', '6', '((((((', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999037', '7', '(((((((', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999037', '8', '((((((((', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999037', '9', '(((((((((', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999038', '#', '右括号', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999038', '1', ')', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999038', '10', '))))))))))', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999038', '2', '))', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999038', '3', ')))', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999038', '4', '))))', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999038', '5', ')))))', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999038', '6', '))))))', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999038', '7', ')))))))', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999038', '8', '))))))))', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999038', '9', ')))))))))', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999039', '#', '比较关系', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999039', '1', '=', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999039', '10', '不包含', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999039', '11', '前X天', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999039', '12', '后X天', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999039', '13', '模糊', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999039', '2', '<>', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999039', '3', '>', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999039', '4', '<', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999039', '5', '>=', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999039', '6', '<=', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999039', '7', '空', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999039', '8', '非空', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999039', '9', '包含', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999040', '#', '逻辑关系', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999040', '1', '并且', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999040', '2', '或者', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999041', '#', '通知方式', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999041', '1', '预警消息', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999041', '2', '系统消息', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999041', '3', '邮件', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999041', '4', '短信', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999042', '#', '通知对象', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999042', '1', '系统用户', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999042', '2', '其它人员', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999043', '#', '通知对象源', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999043', '1', '单据', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999043', '2', '自定义设置', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999044', '#', '交易账户账号类别', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999044', '1', '采购方', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999044', '2', '供应方', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999046', '#', '交易对手类别名称', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999046', '0', '员工', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999046', '1', '供应商', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999046', '2', '客户', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999047', '#', '赊销方式', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999047', '1', '计息赊销', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999047', '2', '不计息赊销', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999048', '#', '子账户优先级', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999048', '1', '优先级-1', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999048', '2', '优先级-2', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999048', '3', '优先级-3', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999048', '4', '优先级-4', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999049', '#', '分账规则', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999049', '1', '按结算比例分账', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999049', '2', '其他', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999050', '#', '计息周期', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999050', '1', '月', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999050', '2', '季', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999051', '#', '导入导出标识', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999051', '1', '导入', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999051', '2', '导出', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999052', '#', '直联账户存款类型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999052', '1', '活期', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999052', '2', '定期', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999052', '3', '保证金', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999053', '#', '指令类型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999053', '1', '融资提供方账户今日余额', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999053', '2', '融资提供方账户历史余额', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999053', '3', '融资提供方账户今日明细', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999053', '4', '融资提供方账户历史明细', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999054', '#', '系统内置标识', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999054', '0', '非系统内置', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999054', '1', '系统内置', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999055', '#', '处理方式', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999055', '1', '文件处理', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999055', '2', '任务处理', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999055', '3', '报盘处理', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999055', '4', '其他处理', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999056', '#', '规则处理', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999056', '1', '主规则', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999056', '2', '辅助规则', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999057', '#', 'DTS类型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999057', '1', '导入导出规则', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999057', '2', '系统对接规则', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999058', '#', '多账户处理方式', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999058', '0', '不进行匹配', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999058', '1', '取第一个', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999058', '2', '随机', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999059', '#', '限定组织', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999059', '0', '同级组织', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999059', '1', '上级组织', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999059', '2', '指定组织', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999060', '#', '限定融资提供方', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999060', '0', '同行优先', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999060', '1', '限定同行', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999060', '2', '指定融资提供方', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999061', '#', '适用类型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999061', '0', '实时收款', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999061', '1', '普通收款', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999061', '2', '普通付款', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999062', '#', '渠道切换策略', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999062', '0', '成本优先策略', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999062', '1', '渠道拥堵策略', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999062', '2', '指定顺序策略', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999063', '#', '通知状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999063', '1', '未通知', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999063', '2', '已通知', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999063', '3', '通知失败', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999063', '4', '通知中', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999063', '5', '无需通知', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999064', '#', '支付网关渠道', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999064', '1', '中金支付渠道', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999064', '2', '银联支付渠道', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999065', '#', '有追无追', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999065', '1', '有追', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999065', '2', '无追', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999065', '3', '两者皆可', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999066', '#', '三方协议操作标志', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999066', '101', '供应商经办发起融资申请', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999066', '102', '供应商复核签约', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999066', '103', '供应商审批签约', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999066', '201', '核心企业经办签约', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999066', '202', '核心企业复核签约', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999066', '203', '核心企业审批签约', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999066', '301', '融资提供方经办签约', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999066', '302', '融资提供方复核签约', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999066', '303', '融资提供方审批签约', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999066', '8101', '供应商经办撤销', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999066', '8102', '供应商复核否决', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999066', '8103', '供应商审批否决', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999066', '8201', '核心企业经办否决', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999066', '8202', '核心企业复核否决', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999066', '8203', '核心企业审批否决', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999066', '8301', '融资提供方经办否决', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999066', '8302', '融资提供方复核否决', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999066', '8303', '融资提供方审批否决', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999066', '9101', '供应商经办作废', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999066', '9102', '供应商复核作废', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999066', '9103', '供应商审批作废_融资提供方未签约(轻惩罚)', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999066', '9104', '供应商审批作废_融资提供方签约超期(不惩罚)', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999066', '9105', '供应商审批作废_融资提供方已签约(重惩罚)', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999067', '#', '是否有效', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999067', '1', '有效', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999067', '2', '无效', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999068', '#', '分发消耗', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999068', '1', '分发', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999068', '2', '消耗', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999069', '#', '交易账户类别', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999069', '0', '平台', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999069', '1', '融资提供方', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999069', '2', '核心企业', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999069', '3', '供应商', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999070', '#', '交易账户状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999070', '1', '正常', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999070', '2', '禁止提现', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999070', '3', '注销', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999071', '#', '应付账款操作状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999071', '100', '待发布', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999071', '101', '核心企业经办发布', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999071', '102', '核心企业复核签约', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999071', '103', '核心企业审批签约', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999071', '201', '供应商经办提交融资意向', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999071', '202', '供应商复核签约', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999071', '203', '供应商审批签约', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999071', '301', '融资提供方经办报价签约', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999071', '302', '融资提供方复核签约', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999071', '303', '融资提供方审批签约', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999071', '401', '融资提供方放弃优先权', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999071', '402', '融资提供方报价不满足条件自动放弃优先权', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999071', '501', '三方协议退回重新提交融资意向', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999071', '601', '应付账款到期自动作废', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999071', '602', '三方协议否决作废', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999071', '603', '供应商已发起三方协议自动作废在途报价', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999071', '8101', '核心企业经办撤销', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999071', '8102', '核心企业复核否决', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999071', '8103', '核心企业审批否决', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999071', '8201', '供应商经办撤销', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999071', '8202', '供应商复核否决', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999071', '8203', '供应商审批否决', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999071', '8301', '融资提供方经办报价撤销', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999071', '8302', '融资提供方复核否决', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999071', '8303', '融资提供方审批否决', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999071', '8304', '融资提供方复核退回', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999071', '8305', '融资提供方审批退回', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999072', '#', '联系人类别', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999072', '1', '关键', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999072', '2', '常用', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999072', '3', '普通', null, null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999073', '#', '优先权', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999073', '1', '优先', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999073', '2', '普通', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999073', '3', '关闭优先权', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999074', '#', '操作类型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999074', '1', '充值', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999074', '2', '提现', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999074', '3', '冻结', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999074', '4', '解冻', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999074', '5', '扣减服务费', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999074', '6', '退回服务费', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999074', '7', '支付服务费', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999074', '8', '罚款', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999074', '9', '补偿款', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999075', '#', '黑白名单', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999075', '1', '白名单', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999075', '2', '黑名单', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999076', '#', '大合同审批状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999076', '100', '待送审', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999076', '101', '已送审', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999076', '102', '已复核', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999076', '103', '已审批', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999076', '8101', '撤销', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999076', '8102', '复核否决', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999076', '8103', '审批否决', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999077', '#', '申诉类型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999078', '#', '申诉处理状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999078', '1', '未处理', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999078', '2', '已处理', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999079', '#', 'key库存补货申请状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999079', '101', '已申请', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999079', '102', '已批准', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999079', '103', '已到货', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999080', '#', 'key库存管理操作标志', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999080', '101', '入库', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999080', '102', '领用', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999080', '103', '初始化', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999080', '104', '作废', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999081', '#', 'key盘存标志', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999081', '101', '作废', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999082', '#', '银模板', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999082', '1', '基准利率上浮（年化）', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999082', '2', '实际利率', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999082', '3', '月息', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999083', '#', '供应商保密级别', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999083', '1', '明码', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999083', '2', '局部保密', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999083', '3', '全部保密', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999084', '#', '三方协议模板操作标志', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999084', '100', '融资提供方经办待发布', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999084', '101', '融资提供方经办已发布', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999084', '102', '融资提供方复核签约', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999084', '103', '融资提供方审批签约', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999084', '201', '核心企业经办签约', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999084', '202', '核心企业复核签约', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999084', '203', '核心企业审批签约', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999084', '8101', '融资提供方经办撤销', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999084', '8102', '融资提供方复核否决', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999084', '8103', '融资提供方审批否决', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999084', '8201', '核心企业经办否决', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999084', '8202', '核心企业复核否决', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999084', '8203', '核心企业审批否决', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999085', '#', '融资提供方报价模板', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999085', '1', '基准利率上浮（年化）', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999085', '2', '实际利率（年化）', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999085', '3', '月息', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999086', '#', '供应商支持业务类型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999086', '101', '反向保理', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999086', '201', '正向保理', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999086', '301', '应收账款质押', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999087', '#', '区块链节点申请操作标志', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999087', '100', '经办待审', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999087', '101', '经办送审', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999087', '102', '复核', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999087', '103', '审批', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999087', '201', '平台审批签约', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999087', '8101', '经办撤销', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999087', '8102', '复核否决', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999087', '8103', '审批否决', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999087', '8201', '平台审批否决', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999088', '#', '银行拒绝放款理由', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999088', '8101', '银行额度不足', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999088', '8102', '供应商贸易真实性有问题', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999089', '#', '封面类型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999089', '1', '反向代理', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999090', '#', '开票状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999090', '1', '待开票', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999090', '2', '已开票', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999090', '3', '开票作废', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999091', '#', '账户类型', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999091', '101', '反向保理', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999091', '201', '正向保理', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999091', '301', '应收账款质押', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '9999091', '401', '提现', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '99990912', '#', '签约后状态', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '99990912', '101', '银行经办已放款', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '99990912', '201', '平台经办已确认放款', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '99990912', '301', '核心企业经办已还款', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '99990912', '401', '平台经办已确认还款', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '99990912', '8101', '银行经办拒绝放款（银行额度不足）', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '99990912', '8102', '银行经办拒绝放款（供应商贸易真实性有问题）', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '99990912', '8201', '平台经办已确认拒绝放款（银行额度不足）', '0', null, null, null);
INSERT INTO `tdictionary` VALUES ('FUNDCRM', '99990912', '8202', '平台经办已确认拒绝放款（供应商贸易真实性有问题）', '0', null, null, null);

-- ----------------------------
-- Table structure for `tsys_kind`
-- ----------------------------
DROP TABLE IF EXISTS `tsys_kind`;
CREATE TABLE `tsys_kind` (
  `kind_code` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '分类编号',
  `kind_type` varchar(4) COLLATE utf8_bin NOT NULL COMMENT '用于表示此类别的分类类型 取数据字典[SYS_BIZ_KIND_TYPE] 0-数据字典 1-系统参数 2-标准字段 3-系统资源 4-系统菜单',
  `kind_name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '分类名称',
  `parent_code` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '上级编号',
  `mnemonic` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '助记符',
  `tree_idx` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '树索引码',
  `ext_flag` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展标识',
  `lifecycle` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '生命周期',
  `platform` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '平台标识',
  `remark` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`kind_code`),
  KEY `nk_biz_kind_name` (`kind_name`) USING BTREE,
  KEY `nk_biz_kind_pcode` (`parent_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统分类表';

-- ----------------------------
-- Records of tsys_kind
-- ----------------------------
INSERT INTO `tsys_kind` VALUES ('0001', '0', '数据字典', 'bizroot', '0', '#bizroot#0001#', null, '1', '1', null);
INSERT INTO `tsys_kind` VALUES ('0002', '1', '系统参数', 'bizroot', '1', '#bizroot#0002#', null, '1', '1', null);
INSERT INTO `tsys_kind` VALUES ('0003', '2', '标准字段', 'bizroot', '2', '#bizroot#0003#', null, '1', '1', null);
INSERT INTO `tsys_kind` VALUES ('0004', '3', '系统资源', 'bizroot', '3', '#bizroot#0004#', null, '1', '1', null);
INSERT INTO `tsys_kind` VALUES ('0005', '4', '系统菜单', 'bizroot', '4', '#bizroot#0005#', null, '1', '1', null);
INSERT INTO `tsys_kind` VALUES ('0006', '5', '子系统', 'bizroot', '5', '#bizroot#0006#', '1', null, '1', null);
INSERT INTO `tsys_kind` VALUES ('122', '4', '123', '666', '3s', 'undefined666#122#', null, null, '0', null);
INSERT INTO `tsys_kind` VALUES ('565', '5', '565', '0006', '56222222', 'undefined565#', null, null, '0', null);
INSERT INTO `tsys_kind` VALUES ('666', '4', '666555', '0005', '666555', 'undefined666#', null, null, '0', null);
INSERT INTO `tsys_kind` VALUES ('677', '5', '6777', '0006', 'oo', 'undefined677#', null, null, '0', null);
INSERT INTO `tsys_kind` VALUES ('88888', '5', '88888', '0006', '88888', 'undefined88888#', null, null, '0', null);
INSERT INTO `tsys_kind` VALUES ('BIZFRAME', '5', '基础业务框架', '0006', '123', '#bizroot#0006#BIZFRAME#', null, '1', '1', null);
INSERT INTO `tsys_kind` VALUES ('BIZ_DICT', '0', '基础数据字典', '0001', 'bizDict', '#bizroot#0001#BIZ_DICT#', null, null, null, null);
INSERT INTO `tsys_kind` VALUES ('BIZ_PARAM', '1', '基础参数', '0002', 'param', '#bizroot#0002#BIZ_PARAM#', null, '1', '1', null);
INSERT INTO `tsys_kind` VALUES ('WORKFLOW', '5', '工作流', '0006', 'WF', '#bizroot#0006#WORKFLOW#', null, null, null, null);
INSERT INTO `tsys_kind` VALUES ('dfdhggf', '1', 'sdfd', '0002', 'dfd', 'undefineddfdhggf#', null, null, '0', null);
INSERT INTO `tsys_kind` VALUES ('qqq', '3', 'qqq', '0004', 'qqq', 'undefinedqqq#', null, null, '0', null);
INSERT INTO `tsys_kind` VALUES ('test', '1', 'test', '0002', '007', 'undefinedtest#', null, null, '0', null);
INSERT INTO `tsys_kind` VALUES ('test001', '1', 'test0011', '0002', 'test0011', 'undefinedtest001#', null, null, '0', 'test001');
INSERT INTO `tsys_kind` VALUES ('ttt', '3', 'ttt1', '0004', 'ttt1', 'undefinedttt#', null, null, '0', null);
INSERT INTO `tsys_kind` VALUES ('yyy', '0', 'yyy', '0001', 'yyy', 'undefinedyyy#', null, null, '0', null);

-- ----------------------------
-- Table structure for `tsys_log`
-- ----------------------------
DROP TABLE IF EXISTS `tsys_log`;
CREATE TABLE `tsys_log` (
  `log_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '业务日志编号',
  `org_id` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '组织编号',
  `org_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '组织名',
  `user_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '操作者ID',
  `user_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '操作者名称',
  `access_date` datetime NOT NULL COMMENT '操作日期',
  `access_time` datetime NOT NULL COMMENT '操作时间',
  `sub_trans_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '子交易号',
  `trans_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'QA:交易编号',
  `oper_contents` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '业务操作详细描述',
  `ip_add` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '操作者ip地址',
  `host_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '主机名称',
  `tenant_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`log_id`),
  KEY `nk_biz_log_org_id` (`org_id`) USING BTREE,
  KEY `nk_biz_log_org_name` (`org_name`) USING BTREE,
  KEY `nk_biz_log_user_id` (`user_id`) USING BTREE,
  KEY `nk_biz_log_user_name` (`user_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tsys_log
-- ----------------------------

-- ----------------------------
-- Table structure for `tsys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `tsys_menu`;
CREATE TABLE `tsys_menu` (
  `menu_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '用于表示菜单英文代码,代码与生命周期组成唯一索引 Studio需显示文本输入',
  `kind_code` varchar(16) COLLATE utf8_bin NOT NULL COMMENT 'QA:分类编号，外键TSYS_KIND.KIND_CODE',
  `trans_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'QA:交易编号，外键TSYS_SUBTRANS.TRANS_CODE',
  `sub_trans_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'QA:子交易号，外键:TSYS_SUBTRANS.SUB_TRANS_CODE',
  `menu_name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '用于表示菜单中文名称 Studio需显示文本输入',
  `menu_arg` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单参数',
  `menu_icon` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '名称之前ICON图标或者菜单的背景图片',
  `menu_url` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'MENU_URL',
  `window_type` varchar(4) COLLATE utf8_bin DEFAULT NULL COMMENT '用于表示点击菜单后展现页面的显示方式 取数据字典[SYS_BIZ_WINDOW_CATE] 0-工作区TAB页 1-弹出窗口',
  `window_model` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '用于表示单例窗口\\每次打开新窗口模式',
  `tip` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '对菜单功能的简单描述，鼠标悬停在菜单名称上时可做相应的提示',
  `hot_key` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '快捷键',
  `parent_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '用于表示菜单上级节点的引用 Studio需显示节点选择输入',
  `order_no` int(11) DEFAULT NULL COMMENT '用于表示同级菜单下的顺序排列 Studio需显示',
  `open_flag` varchar(4) COLLATE utf8_bin DEFAULT NULL COMMENT '用于表示该菜单是否默认展开',
  `tree_idx` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '用于表示菜单各级之间关系,取各级菜单id前后加''#''号',
  `remark` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`menu_code`,`kind_code`),
  KEY `nk_biz_menu_code` (`menu_code`) USING BTREE,
  KEY `nk_biz_menu_name` (`menu_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tsys_menu
-- ----------------------------
INSERT INTO `tsys_menu` VALUES ('BIZFRAME', 'BIZFRAME', 'BIZFRAME', 'BIZFRAME', '企金云平台', null, null, null, '0', null, null, null, 'bizroot', '0', null, '#bizroot#BIZFRAME#', null);
INSERT INTO `tsys_menu` VALUES ('BigContractMgmt', 'BIZFRAME', 'BigContractMgmt', 'BigContractMgmt', '反向保理额度管理', null, null, '/rfp/bigcontract/bigcontractmanage.jsp', '0', null, null, null, 'manageBigContract', '1', null, '#bizroot#BIZFRAME#business#manageBigContract#BigContractMgmt#', null);
INSERT INTO `tsys_menu` VALUES ('KeyInitConfirmState', 'BIZFRAME', 'KeyInitConfirmState', 'KeyInitConfirmState', '电子签名确认书', null, null, '/rfp/keymgmt/keyinitconfirmstate.jsp', '0', null, null, null, 'manageKeys', '5', null, '#bizroot#BIZFRAME#business#manageKeys#KeyInitConfirmState#', null);
INSERT INTO `tsys_menu` VALUES ('SupplierAccountsMgmt', 'BIZFRAME', 'SupplierAccountsMgmt', 'SupplierAccountsMgmt', '保理专户管理', null, null, '/rfp/supplieraccount/supplieraccount.jsp', '0', null, null, null, 'manageSupplierAccount', '1', null, '#bizroot#BIZFRAME#business#manageSupplierAccount#SupplierAccountsMgmt#', null);
INSERT INTO `tsys_menu` VALUES ('WBflowTaskTodo', 'BIZFRAME', 'WBflowTaskTodo', 'WBflowTaskTodo', '其它待办任务', null, null, '/workflow/client/todo/todoTaskSimple.jsp', '0', null, null, null, 'workBench', '1', null, '#bizroot#BIZFRAME#workBench#WBflowTaskTodo#', null);
INSERT INTO `tsys_menu` VALUES ('WBpayableChx', 'BIZFRAME', 'WBpayableChx', 'WBpayableChx', '应付账款审批', null, null, '/rfp/accountspayable/chxtodotask.jsp', '0', null, null, null, 'workBench', '2', null, '#bizroot#BIZFRAME#workBench#WBpayableChx#', null);
INSERT INTO `tsys_menu` VALUES ('WBpayableIntention', 'BIZFRAME', 'WBpayableIntention', 'WBpayableIntention', '融资意愿审批', null, null, '/rfp/accountspayable/chxtodotask.jsp', '0', null, null, null, 'workBench', '4', null, '#bizroot#BIZFRAME#workBench#WBpayableIntention#', null);
INSERT INTO `tsys_menu` VALUES ('WBpayableIntentionApply', 'BIZFRAME', 'WBpayableIntentionApply', 'WBpayableIntentionApply', '发起融资意愿', null, null, '/rfp/accountspayable/chxtodotask.jsp', '0', null, null, null, 'workBench', '6', null, '#bizroot#BIZFRAME#workBench#WBpayableIntentionApply#', null);
INSERT INTO `tsys_menu` VALUES ('WBpayableIntentionList', 'BIZFRAME', 'WBpayableIntentionList', 'WBpayableIntentionList', '优先融资意愿清单', null, null, '/rfp/accountspayable/chxtodotask.jsp?lastoperationflag=203', '0', null, null, null, 'workBench', '5', null, '#bizroot#BIZFRAME#workBench#WBpayableIntentionList#', null);
INSERT INTO `tsys_menu` VALUES ('WBpayableQuote', 'BIZFRAME', 'WBpayableQuote', 'WBpayableQuote', '融资确认审批', null, null, '/rfp/accountspayable/chxtodotask.jsp', '0', null, null, null, 'workBench', '3', null, '#bizroot#BIZFRAME#workBench#WBpayableQuote#', null);
INSERT INTO `tsys_menu` VALUES ('WBreturnPayableIntentionList', 'BIZFRAME', 'WBreturnPayableIntentionList', 'WBreturnPayableIntentionList', '退回融资意愿清单', null, null, '/rfp/accountspayable/chxtodotask.jsp?returnflag=1', '0', null, null, null, 'workBench', '7', null, '#bizroot#BIZFRAME#workBench#WBreturnPayableIntentionList#', null);
INSERT INTO `tsys_menu` VALUES ('WBsupportPayableIntentionList', 'BIZFRAME', 'WBsupportPayableIntentionList', 'WBsupportPayableIntentionList', '支持融资意愿清单', null, null, '/rfp/accountspayable/chxtodotask.jsp?lastoperationflag=401,402', '0', null, null, null, 'workBench', '8', null, '#bizroot#BIZFRAME#workBench#WBsupportPayableIntentionList#', null);
INSERT INTO `tsys_menu` VALUES ('WBtripartiteAgreementChxTodo', 'BIZFRAME', 'WBtripartiteAgreementChxTodo', 'WBtripartiteAgreementChxTodo', '三方协议待办任务', null, null, '/rfp/agreement/chxtodo.jsp', '0', null, null, null, 'workBench', '9', null, '#bizroot#BIZFRAME#workBench#WBtripartiteAgreementChxTodo#', null);
INSERT INTO `tsys_menu` VALUES ('accountTaskTodo', 'BIZFRAME', 'accountTaskTodo', 'accountTaskTodo', '待办应付账款', null, null, '/workflow/client/todo/todoTaskSimple.jsp', '0', null, null, null, 'flowTask', '6', null, '#bizroot#BIZFRAME#flowMenu#flowTask#accountTaskTodo#', null);
INSERT INTO `tsys_menu` VALUES ('accountsPayable', 'BIZFRAME', 'accountsPayable', 'accountsPayable', '应付账款', null, 'systemparameter(s).png', null, '0', null, null, null, 'comprehensiveQuery', '1', null, '#bizroot#BIZFRAME#comprehensiveQuery#accountsPayable#', null);
INSERT INTO `tsys_menu` VALUES ('accountsPayableQuery', 'BIZFRAME', 'accountsPayableQuery', 'accountsPayableQuery', '应付账款查询', null, null, '\\admin\\commonquery\\accountspayable.jsp', '0', null, null, null, 'accountsPayable', '1', null, '#bizroot#BIZFRAME#comprehensiveQuery#accountsPayable#accountsPayableQuery#', null);
INSERT INTO `tsys_menu` VALUES ('accountsPayableSignature', 'BIZFRAME', 'accountsPayableSignature', 'accountsPayableSignature', '应付账款签名', null, null, null, '0', null, null, null, 'manageSignature', '2', null, '#bizroot#BIZFRAME#business#manageSignature#accountsPayableSignature#', null);
INSERT INTO `tsys_menu` VALUES ('agreement', 'BIZFRAME', 'agreement', 'agreement', '三方协议', null, 'systemparameter(s).png', null, '0', null, null, null, 'comprehensiveQuery', '7', null, '#bizroot#BIZFRAME#comprehensiveQuery#agreement#', null);
INSERT INTO `tsys_menu` VALUES ('agreementQuery', 'BIZFRAME', 'agreementQuery', 'agreementQuery', '三方协议查询', null, null, '\\admin\\commonquery\\agreement.jsp', '0', null, null, null, 'agreement', '1', null, '#bizroot#BIZFRAME#comprehensiveQuery#agreement#agreementQuery#', null);
INSERT INTO `tsys_menu` VALUES ('agreementTemp', 'BIZFRAME', 'agreementTemp', 'agreementTemp', '三方协议模板', null, 'systemparameter(s).png', null, '0', null, null, null, 'comprehensiveQuery', '8', null, '#bizroot#BIZFRAME#comprehensiveQuery#agreementTemp#', null);
INSERT INTO `tsys_menu` VALUES ('agreementTempQuery', 'BIZFRAME', 'agreementTempQuery', 'agreementTempQuery', '三方协议模板查询', null, null, '\\admin\\commonquery\\agreementtemp.jsp', '0', null, null, null, 'agreementTemp', '1', null, '#bizroot#BIZFRAME#comprehensiveQuery#agreementTemp#agreementTempQuery#', null);
INSERT INTO `tsys_menu` VALUES ('appeal', 'BIZFRAME', 'appeal', 'appeal', '申诉管理', null, 'systemparameter(s).png', null, '0', null, null, null, 'comprehensiveQuery', '5', null, '#bizroot#BIZFRAME#comprehensiveQuery#appeal#', null);
INSERT INTO `tsys_menu` VALUES ('appealDone', 'BIZFRAME', 'appealDone', 'appealDone', '已完成申诉', null, null, '/rfp/appeal/appealdone.jsp', '0', null, null, null, 'manageAppeal', '4', null, '#bizroot#BIZFRAME#customService#manageAppeal#appealDone#', null);
INSERT INTO `tsys_menu` VALUES ('appealMgmt', 'BIZFRAME', 'appealMgmt', 'appealMgmt', '申诉类型管理', null, null, '/rfp/appeal/appealmanagement.jsp', '0', null, null, null, 'manageAppeal', '1', null, '#bizroot#BIZFRAME#customService#manageAppeal#appealMgmt#', null);
INSERT INTO `tsys_menu` VALUES ('appealQuery', 'BIZFRAME', 'appealQuery', 'appealQuery', '申诉管理查询', null, null, '\\admin\\commonquery\\appeal.jsp', '0', null, null, null, 'appeal', '1', null, '#bizroot#BIZFRAME#comprehensiveQuery#appeal#appealQuery#', null);
INSERT INTO `tsys_menu` VALUES ('appealStart', 'BIZFRAME', 'appealStart', 'appealStart', '我发起的申诉', null, null, '/rfp/appeal/appealmanagementforme.jsp', '0', null, null, null, 'manageAppeal', '5', null, '#bizroot#BIZFRAME#customService#manageAppeal#appealStart#', null);
INSERT INTO `tsys_menu` VALUES ('appealTodoTask', 'BIZFRAME', 'appealTodoTask', 'appealTodoTask', '待处理申诉', null, null, '/rfp/appeal/appealtodotaskindex.jsp', '0', null, null, null, 'manageAppeal', '3', null, '#bizroot#BIZFRAME#customService#manageAppeal#appealTodoTask#', null);
INSERT INTO `tsys_menu` VALUES ('appealmsMgmt', 'BIZFRAME', 'appealmsMgmt', 'appealmsMgmt', '申诉信息管理', null, null, '/rfp/appeal/appealdetailmanagement.jsp', '0', null, null, null, 'manageAppeal', '2', null, '#bizroot#BIZFRAME#customService#manageAppeal#appealmsMgmt#', null);
INSERT INTO `tsys_menu` VALUES ('areaMgmt', 'BIZFRAME', 'areaMgmt', 'areaMgmt', '银行辖区管理', null, null, '/rfp/organization/bankjurisdiction/bankarea.jsp', '0', null, null, null, 'manageOrg', '5', null, '#bizroot#BIZFRAME#manageOrgUser#manageOrg#areaMgmt#', null);
INSERT INTO `tsys_menu` VALUES ('bankInvite', 'BIZFRAME', 'bankInvite', 'bankInvite', '银行邀请信息', null, null, '/rfp/organization/bankinvite/bankinvite.jsp', '0', null, null, null, 'manageServiceBank', '1', null, '#bizroot#BIZFRAME#cooperation#manageServiceBank#bankInvite#', null);
INSERT INTO `tsys_menu` VALUES ('bankQuota', 'BIZFRAME', 'bankQuota', 'bankQuota', '银行给核心企业额度', null, null, '/rfp/organization/bankquota/bankquota.jsp', '0', null, null, null, 'manageBank', '6', null, '#bizroot#BIZFRAME#cooperation#manageBank#bankQuota#', null);
INSERT INTO `tsys_menu` VALUES ('bankSupplierRelation', 'BIZFRAME', 'bankSupplierRelation', 'bankSupplierRelation', '银行分配供应商', null, null, '/rfp/organization/orgrelation/orgrelationserach.jsp?type=3', '0', null, null, null, 'manageOrgRelation', '3', null, '#bizroot#BIZFRAME#manageOrgUser#manageOrgRelation#bankSupplierRelation#', null);
INSERT INTO `tsys_menu` VALUES ('bankView', 'BIZFRAME', 'bankView', 'bankView', '合作银行查看', null, null, '/rfp/organization/orgview/orgbank.jsp', '0', null, null, null, 'manageBank', '3', null, '#bizroot#BIZFRAME#cooperation#manageBank#bankView#', null);
INSERT INTO `tsys_menu` VALUES ('baseSet', 'BIZFRAME', 'baseSet', 'baseSet', '基础设置', null, 'setting(g).png', null, '0', null, null, null, 'BIZFRAME', '6', null, '#bizroot#BIZFRAME#baseSet#', null);
INSERT INTO `tsys_menu` VALUES ('bigContract', 'BIZFRAME', 'bigContract', 'bigContract', '大合同', null, 'systemparameter(s).png', null, '0', null, null, null, 'comprehensiveQuery', '2', null, '#bizroot#BIZFRAME#comprehensiveQuery#bigContract#', null);
INSERT INTO `tsys_menu` VALUES ('bigContractQuery', 'BIZFRAME', 'bigContractQuery', 'bigContractQuery', '大合同信息查询', null, null, '\\admin\\commonquery\\bigcontract.jsp', '0', null, null, null, 'bigContract', '1', null, '#bizroot#BIZFRAME#comprehensiveQuery#bigContract#bigContractQuery#', null);
INSERT INTO `tsys_menu` VALUES ('bigContractSignature', 'BIZFRAME', 'bigContractSignature', 'bigContractSignature', '反向保理额度签名', null, null, '/common/comingsoon.jsp', '0', null, null, null, 'manageSignature', '3', null, '#bizroot#BIZFRAME#business#manageSignature#bigContractSignature#', null);
INSERT INTO `tsys_menu` VALUES ('bizOrgSet', 'BIZFRAME', 'bizOrgSet', 'bizOrgSet', '组织机构设置', null, null, '/admin/system/orgmanage/orgmanage.jsp', '3', null, null, null, 'manageOrg', '3', null, '#bizroot#BIZFRAME#manageOrgUser#manageOrg#bizOrgSet#', null);
INSERT INTO `tsys_menu` VALUES ('bizSetCache', 'BIZFRAME', 'bizSetCache', 'bizSetCache', '缓存刷新', null, null, '/admin/cache/cachrefresh.jsp', '3', null, null, null, 'bizSysManager', '1', null, '#bizroot#BIZFRAME#systemsettings#bizSysManager#bizSetCache#', null);
INSERT INTO `tsys_menu` VALUES ('bizSetLog', 'BIZFRAME', 'bizSetLog', 'bizSetLog', '业务日志设置', null, null, '/admin/businesslog/syslog.jsp', '3', null, null, null, 'bizSysManager', '2', null, '#bizroot#BIZFRAME#systemsettings#bizSysManager#bizSetLog#', null);
INSERT INTO `tsys_menu` VALUES ('bizSetMenu', 'BIZFRAME', 'bizSetMenu', 'bizSetMenu', '系统菜单设置', null, null, '/admin/system/menumanage/menumanage.jsp', '3', null, null, null, 'bizSysManager', '3', '1', '#bizroot#BIZFRAME#systemsettings#bizSysManager#bizSetMenu#', null);
INSERT INTO `tsys_menu` VALUES ('bizSetOrgRole', 'BIZFRAME', 'bizSetOrgRole', 'bizSetOrgRole', '多岗设置', null, null, '/admin/system/orgrolemanage/orgrolemanage.jsp', '3', null, null, null, 'bizUserManager', '1', null, '#bizroot#BIZFRAME#userManager#bizUserManager#bizSetOrgRole#', null);
INSERT INTO `tsys_menu` VALUES ('bizSetRole', 'BIZFRAME', 'bizSetRole', 'bizSetRole', '角色设置', null, null, '/admin/system/rolemanage/rolemanage.jsp', '3', null, null, null, 'bizUserManager', '2', null, '#bizroot#BIZFRAME#userManager#bizUserManager#bizSetRole#', null);
INSERT INTO `tsys_menu` VALUES ('bizSetUser', 'BIZFRAME', 'bizSetUser', 'bizSetUser', '用户设置', null, null, '/admin/system/usermanage/usermanage.jsp', '2', null, null, null, 'bizUserManager', '4', null, '#bizroot#BIZFRAME#userManager#bizUserManager#bizSetUser#', null);
INSERT INTO `tsys_menu` VALUES ('bizSetUserKey', 'BIZFRAME', 'bizSetUserKey', 'bizSetUserKey', '用户KEY绑定', null, null, '/rfp/userkey/userbindkey.jsp', '0', null, null, null, 'bizUserManager', '4', null, '#bizroot#BIZFRAME#userManager#bizUserManager#bizSetUserKey#', null);
INSERT INTO `tsys_menu` VALUES ('bizSetUserKeyApply', 'BIZFRAME', 'bizSetUserKeyApply', 'bizSetUserKeyApply', '用户KEY申请', null, null, '/rfp/userkey/userapplykey.jsp', '0', null, null, null, 'bizUserManager', '5', null, '#bizroot#BIZFRAME#userManager#bizUserManager#bizSetUserKeyApply#', null);
INSERT INTO `tsys_menu` VALUES ('bizSysManager', 'BIZFRAME', 'bizSysManager', 'bizSysManager', '系统管理', null, 'systemmanage(s).png', null, '0', null, null, null, 'systemsettings', '2', null, '#bizroot#BIZFRAME#systemsettings#bizSysManager#', null);
INSERT INTO `tsys_menu` VALUES ('bizUserManager', 'BIZFRAME', 'bizUserManager', 'bizUserManager', '用户管理', null, 'user(s).png', null, '0', null, null, null, 'userManager', '4', null, '#bizroot#BIZFRAME#userManager#bizUserManager#', null);
INSERT INTO `tsys_menu` VALUES ('blockchain', 'BIZFRAME', 'blockchain', 'blockchain', '区块链', null, 'blockchain(g).png', null, '0', null, null, null, 'BIZFRAME', '15', null, '#bizroot#BIZFRAME#blockchain#', null);
INSERT INTO `tsys_menu` VALUES ('blockchainApply', 'BIZFRAME', 'blockchainApply', 'blockchainApply', '申请成为节点', null, null, '/rfp/blockchain/blockchainnodeapply.jsp', '0', null, null, null, 'blockchainManage', '3', null, '#bizroot#BIZFRAME#blockchain#blockchainManage#blockchainApply#', null);
INSERT INTO `tsys_menu` VALUES ('blockchainFind', 'BIZFRAME', 'blockchainFind', 'blockchainFind', '区块链取证', null, null, '/rfp/blockchain/blockchainsearch.jsp', '0', null, null, null, 'blockchainManage', '1', null, '#bizroot#BIZFRAME#blockchain#blockchainManage#blockchainFind#', null);
INSERT INTO `tsys_menu` VALUES ('blockchainManage', 'BIZFRAME', 'blockchainManage', 'blockchainManage', '区块链', null, 'blockchain(s).png', null, '0', null, null, null, 'blockchain', '4', null, '#bizroot#BIZFRAME#blockchain#blockchainManage#', null);
INSERT INTO `tsys_menu` VALUES ('blockchainNodeManage', 'BIZFRAME', 'blockchainNodeManage', 'blockchainNodeManage', '节点管理', null, null, '/rfp/blockchain/blockchainnodemanage.jsp', '0', null, null, null, 'blockchainManage', '4', null, '#bizroot#BIZFRAME#blockchain#blockchainManage#blockchainNodeManage#', null);
INSERT INTO `tsys_menu` VALUES ('blockchainView', 'BIZFRAME', 'blockchainView', 'blockchainView', '区块链查看', null, null, '/rfp/blockchain/blockchainbrowser.jsp', '0', null, null, null, 'blockchainManage', '2', null, '#bizroot#BIZFRAME#blockchain#blockchainManage#blockchainView#', null);
INSERT INTO `tsys_menu` VALUES ('business', 'BIZFRAME', 'business', 'business', '业务', null, 'business(g).png', null, '0', null, null, null, 'BIZFRAME', '5', null, '#bizroot#BIZFRAME#business#', null);
INSERT INTO `tsys_menu` VALUES ('calendarsManager', 'BIZFRAME', 'calendarsManager', 'calendarsManager', '日历管理', null, null, '/base/system/calendars/calendarstab.jsp', null, null, null, null, 'generalSettings', '1', null, '#bizroot#BIZFRAME#systemsettings#generalSettings#calendarsManager#', null);
INSERT INTO `tsys_menu` VALUES ('checkSignature', 'BIZFRAME', 'checkSignature', 'checkSignature', '我要验签', null, 'signcontract(s).png', '/rfp/keymgmt/signverify.jsp', '0', null, null, null, 'business', '7', null, '#bizroot#BIZFRAME#business#checkSignature#', null);
INSERT INTO `tsys_menu` VALUES ('comprehensiveQuery', 'BIZFRAME', 'comprehensiveQuery', 'comprehensiveQuery', '综合查询', null, 'setting(g).png', null, '0', null, null, null, 'BIZFRAME', '17', null, '#bizroot#BIZFRAME#comprehensiveQuery#', null);
INSERT INTO `tsys_menu` VALUES ('cooperation', 'BIZFRAME', 'cooperation', 'cooperation', '合作', null, 'cooperation(g).png', null, '0', null, null, null, 'BIZFRAME', '13', null, '#bizroot#BIZFRAME#cooperation#', null);
INSERT INTO `tsys_menu` VALUES ('corecompanyFirstBank', 'BIZFRAME', 'corecompanyFirstBank', 'corecompanyFirstBank', '优先级', null, null, '/rfp/organization/bankquota/bankquota.jsp?priority=1', '0', null, null, null, 'manageCoreCompany', '4', null, '#bizroot#BIZFRAME#cooperation#manageCoreCompany#corecompanyFirstBank#', null);
INSERT INTO `tsys_menu` VALUES ('corecompanyInvite', 'BIZFRAME', 'corecompanyInvite', 'corecompanyInvite', '邀请', null, null, '/rfp/organization/bankinvite/corecompanyinvite.jsp', '0', null, null, null, 'manageCoreCompany', '2', null, '#bizroot#BIZFRAME#cooperation#manageCoreCompany#corecompanyInvite#', null);
INSERT INTO `tsys_menu` VALUES ('corecompanyQuota', 'BIZFRAME', 'corecompanyQuota', 'corecompanyQuota', '平台给核心企业额度', null, null, '/rfp/organization/corecompanyquota/corecompanyquota.jsp', '0', null, null, null, 'manageCoreCompany', '7', null, '#bizroot#BIZFRAME#cooperation#manageCoreCompany#corecompanyQuota#', null);
INSERT INTO `tsys_menu` VALUES ('corecompanySupportBank', 'BIZFRAME', 'corecompanySupportBank', 'corecompanySupportBank', '支持级', null, null, '/rfp/organization/bankquota/bankquota.jsp?priority=2', '0', null, null, null, 'manageCoreCompany', '5', null, '#bizroot#BIZFRAME#cooperation#manageCoreCompany#corecompanySupportBank#', null);
INSERT INTO `tsys_menu` VALUES ('corecompanyView', 'BIZFRAME', 'corecompanyView', 'corecompanyView', '核心企业查看', null, null, '/rfp/organization/orgview/orgcorecompany.jsp', '0', null, null, null, 'manageCoreCompany', '1', null, '#bizroot#BIZFRAME#cooperation#manageCoreCompany#corecompanyView#', null);
INSERT INTO `tsys_menu` VALUES ('currencyManage', 'BIZFRAME', 'currencyManage', 'currencyManage', '币种管理', null, null, '/base/system/currency/currency.jsp', null, null, null, null, 'generalSettings', '3', null, '#bizroot#BIZFRAME#systemsettings#generalSettings#currencyManage#', null);
INSERT INTO `tsys_menu` VALUES ('customService', 'BIZFRAME', 'customService', 'customService', '申诉', null, 'service(g).png', null, '0', null, null, null, 'BIZFRAME', '7', null, '#bizroot#BIZFRAME#customService#', null);
INSERT INTO `tsys_menu` VALUES ('firstBank', 'BIZFRAME', 'firstBank', 'firstBank', '优先级银行', null, null, '/rfp/organization/banklist/banklist.jsp?priority=1', '0', null, null, null, 'manageServiceBank', '1', null, '#bizroot#BIZFRAME#cooperation#manageServiceBank#firstBank#', null);
INSERT INTO `tsys_menu` VALUES ('flowDelegateMgrnew', 'BIZFRAME', 'flowDelegateMgrnew', 'flowDelegateMgrnew', '委托', null, null, '/workflow/client/delegate/delegate.jsp', '0', null, null, null, 'flowTask', '3', null, '#bizroot#BIZFRAME#flowMenu#flowTask#flowDelegateMgrnew#', null);
INSERT INTO `tsys_menu` VALUES ('flowDelegateMonitor', 'BIZFRAME', 'flowDelegateMonitor', 'flowDelegateMonitor', '委托监控', null, null, '/admin/workflow/delegate/delegate.jsp', '0', null, null, null, 'flowMonitor', '0', null, '#bizroot#BIZFRAME#flowMenu#flowMonitor#flowDelegateMonitor#', null);
INSERT INTO `tsys_menu` VALUES ('flowForm', 'BIZFRAME', 'flowForm', 'flowForm', '表单管理', null, 'formmanage(s).png', null, '0', null, null, null, 'flowMenu', '1', null, '#bizroot#BIZFRAME#flowMenu#flowForm#', null);
INSERT INTO `tsys_menu` VALUES ('flowFormKind', 'BIZFRAME', 'flowFormKind', 'flowFormKind', '表单分类', null, null, '/admin/workflow/processform/processformtype.jsp', '0', null, null, null, 'flowForm', '1', null, '#bizroot#BIZFRAME#flowMenu#flowForm#flowFormKind#', null);
INSERT INTO `tsys_menu` VALUES ('flowFormReg', 'BIZFRAME', 'flowFormReg', 'flowFormReg', '表单设置', null, null, '/admin/workflow/processform/processformreg.jsp', '0', null, null, null, 'flowForm', '2', null, '#bizroot#BIZFRAME#flowMenu#flowForm#flowFormReg#', null);
INSERT INTO `tsys_menu` VALUES ('flowManaDesign', 'BIZFRAME', 'flowManaDesign', 'flowManaDesign', '流程设计', null, null, '/admin/workflow/flowdesign/processdesign.jsp', '0', null, null, null, 'flowManage', '2', null, '#bizroot#BIZFRAME#flowMenu#flowManage#flowManaDesign#', null);
INSERT INTO `tsys_menu` VALUES ('flowManaProcKind', 'BIZFRAME', 'flowManaProcKind', 'flowManaProcKind', '流程类型', null, null, '/admin/workflow/flowmanage/processtype.jsp', '0', null, null, null, 'flowManage', '1', null, '#bizroot#BIZFRAME#flowMenu#flowManage#flowManaProcKind#', null);
INSERT INTO `tsys_menu` VALUES ('flowManage', 'BIZFRAME', 'flowManage', 'flowManage', '工作流设置', null, 'workflowsetting(s).png', null, '0', null, null, null, 'flowMenu', '3', null, '#bizroot#BIZFRAME#flowMenu#flowManage#', null);
INSERT INTO `tsys_menu` VALUES ('flowMenu', 'BIZFRAME', 'flowMenu', 'flowMenu', '工作流', null, 'workflow(g).png', null, '0', null, null, null, 'BIZFRAME', '11', null, '#bizroot#BIZFRAME#flowMenu#', null);
INSERT INTO `tsys_menu` VALUES ('flowMoniInstance', 'BIZFRAME', 'flowMoniInstance', 'flowMoniInstance', '实例监控', null, null, '/admin/workflow/monitor/processinstancemonitor.jsp', '0', null, null, null, 'flowMonitor', '1', null, '#bizroot#BIZFRAME#flowMenu#flowMonitor#flowMoniInstance#', null);
INSERT INTO `tsys_menu` VALUES ('flowMonitor', 'BIZFRAME', 'flowMonitor', 'flowMonitor', '工作流监控', null, 'workflowmonitorin(s).png', null, '0', null, null, null, 'flowMenu', '2', null, '#bizroot#BIZFRAME#flowMenu#flowMonitor#', null);
INSERT INTO `tsys_menu` VALUES ('flowMyProcessFinished', 'BIZFRAME', 'flowMyProcessFinished', 'flowMyProcessFinished', '我已完成的请求', null, null, '/workflow/client/myprocess/finished.jsp', null, null, null, null, 'flowTask', '5', null, '#bizroot#BIZFRAME#flowMenu#flowTask#flowMyProcessFinished#', null);
INSERT INTO `tsys_menu` VALUES ('flowMyProcessUnfinished', 'BIZFRAME', 'flowMyProcessUnfinished', 'flowMyProcessUnfinished', '我未完成的请求', null, null, '/workflow/client/myprocess/unfinished.jsp', null, null, null, null, 'flowTask', '4', null, '#bizroot#BIZFRAME#flowMenu#flowTask#flowMyProcessUnfinished#', null);
INSERT INTO `tsys_menu` VALUES ('flowTask', 'BIZFRAME', 'flowTask', 'flowTask', '工作台', null, 'workbench(s).png', null, '2', null, null, null, 'flowMenu', '1', null, '#bizroot#BIZFRAME#flowMenu#flowTask#', null);
INSERT INTO `tsys_menu` VALUES ('flowTaskHistory', 'BIZFRAME', 'flowTaskHistory', 'flowTaskHistory', '已办任务', null, null, '/workflow/client/hist/doneTask.jsp', '0', null, null, null, 'flowTask', '2', null, '#bizroot#BIZFRAME#flowMenu#flowTask#flowTaskHistory#', null);
INSERT INTO `tsys_menu` VALUES ('flowTaskTodo', 'BIZFRAME', 'flowTaskTodo', 'flowTaskTodo', '待办任务', null, null, '/workflow/client/todo/todoTaskSimple.jsp', '0', null, null, null, 'flowTask', '1', null, '#bizroot#BIZFRAME#flowMenu#flowTask#flowTaskTodo#', null);
INSERT INTO `tsys_menu` VALUES ('gasMgmt', 'BIZFRAME', 'gasMgmt', 'gasMgmt', '燃料管理', null, 'fuelmanage(s).png', null, '0', null, null, null, 'baseSet', '2', null, '#bizroot#BIZFRAME#baseSet#gasMgmt#', null);
INSERT INTO `tsys_menu` VALUES ('gasaccount', 'BIZFRAME', 'gasaccount', 'gasaccount', '燃料账户', null, null, '/rfp/gasmgmt/gasaccount.jsp', '0', null, null, null, 'gasMgmt', '2', null, '#bizroot#BIZFRAME#baseSet#gasMgmt#gasaccount#', null);
INSERT INTO `tsys_menu` VALUES ('gastransactions', 'BIZFRAME', 'gastransactions', 'gastransactions', '燃料交易明细', null, null, '/rfp/gasmgmt/gastransactions.jsp', '0', null, null, null, 'gasMgmt', '1', null, '#bizroot#BIZFRAME#business#managePltfFin#gasMgmt#gastransactions#', null);
INSERT INTO `tsys_menu` VALUES ('generalSettings', 'BIZFRAME', 'generalSettings', 'generalSettings', '一般设置', null, 'setting(s).png', null, '0', null, null, null, 'systemsettings', '8', null, '#bizroot#BIZFRAME#systemsettings#generalSettings#', 'test1');
INSERT INTO `tsys_menu` VALUES ('keyInit', 'BIZFRAME', 'keyInit', 'keyInit', 'KEY初始化', null, null, '/rfp/keymgmt/keyinit.jsp', '0', null, null, null, 'manageKeys', '2', null, '#bizroot#BIZFRAME#business#manageKeys#keyInit#', null);
INSERT INTO `tsys_menu` VALUES ('keyInitRecord', 'BIZFRAME', 'keyInitRecord', 'keyInitRecord', 'KEY初始化记录', null, null, '/rfp/keymgmt/keyinitrecord.jsp', '0', null, null, null, 'manageKeys', '3', null, '#bizroot#BIZFRAME#business#manageKeys#keyInitRecord#', null);
INSERT INTO `tsys_menu` VALUES ('keyInventoryMgmt', 'BIZFRAME', 'keyInventoryMgmt', 'keyInventoryMgmt', 'KEY物料管理', null, null, '/rfp/keymgmt/keyinventory.jsp', '0', null, null, null, 'manageKeys', '4', null, '#bizroot#BIZFRAME#business#manageKeys#keyInventoryMgmt#', null);
INSERT INTO `tsys_menu` VALUES ('keyPurchase', 'BIZFRAME', 'keyPurchase', 'keyPurchase', 'KEY申请单', null, null, '/rfp/keymgmt/keypurchase.jsp', '0', null, null, null, 'manageKeys', '4', null, '#bizroot#BIZFRAME#business#manageKeys#keyPurchase#', null);
INSERT INTO `tsys_menu` VALUES ('manageAppeal', 'BIZFRAME', 'manageAppeal', 'manageAppeal', '申诉管理', null, 'appealmanage(s).png', null, '0', null, null, null, 'customService', '5', null, '#bizroot#BIZFRAME#customService#manageAppeal#', null);
INSERT INTO `tsys_menu` VALUES ('manageBank', 'BIZFRAME', 'manageBank', 'manageBank', '合作银行', null, 'client(s).png', null, '0', null, null, null, 'cooperation', '8', null, '#bizroot#BIZFRAME#cooperation#manageBank#', null);
INSERT INTO `tsys_menu` VALUES ('manageBigContract', 'BIZFRAME', 'manageBigContract', 'manageBigContract', '反向保理额度管理', null, 'reversefactoringmanage(s).png', null, '0', null, null, null, 'business', '9', null, '#bizroot#BIZFRAME#business#manageBigContract#', null);
INSERT INTO `tsys_menu` VALUES ('manageCoreCompany', 'BIZFRAME', 'manageCoreCompany', 'manageCoreCompany', '核心企业', null, 'client(s).png', null, '0', null, null, null, 'cooperation', '8', null, '#bizroot#BIZFRAME#cooperation#manageCoreCompany#', null);
INSERT INTO `tsys_menu` VALUES ('manageFuel', 'BIZFRAME', 'manageFuel', 'manageFuel', '燃油管理', null, 'fuelmanage(s).png', '/common/comingsoon.jsp', '0', null, null, null, 'trade', '4', null, '#bizroot#BIZFRAME#trade#manageFuel#', null);
INSERT INTO `tsys_menu` VALUES ('manageIntegral', 'BIZFRAME', 'manageIntegral', 'manageIntegral', '积分管理', null, 'integralmanage(s).png', '/common/comingsoon.jsp', '0', null, null, null, 'trade', '3', null, '#bizroot#BIZFRAME#trade#manageIntegral#', null);
INSERT INTO `tsys_menu` VALUES ('manageKeys', 'BIZFRAME', 'manageKeys', 'manageKeys', 'KEY管理', null, 'keymanage(s).png', null, '0', null, null, null, 'business', '7', null, '#bizroot#BIZFRAME#business#manageKeys#', null);
INSERT INTO `tsys_menu` VALUES ('manageOrg', 'BIZFRAME', 'manageOrg', 'manageOrg', '组织管理', null, 'organizationmanage(s).png', null, '0', null, null, null, 'manageOrgUser', '1', null, '#bizroot#BIZFRAME#manageOrgUser#manageOrg#', null);
INSERT INTO `tsys_menu` VALUES ('manageOrgRelation', 'BIZFRAME', 'manageOrgRelation', 'manageOrgRelation', '组织关系设置', null, 'organizationalrelationsetting(s).png', null, '0', null, null, null, 'manageOrgUser', '2', null, '#bizroot#BIZFRAME#manageOrgUser#manageOrgRelation#', null);
INSERT INTO `tsys_menu` VALUES ('manageOrgUser', 'BIZFRAME', 'manageOrgUser', 'manageOrgUser', '组织', null, 'organization(g).png', null, '0', null, null, null, 'BIZFRAME', '6', null, '#bizroot#BIZFRAME#manageOrgUser#', null);
INSERT INTO `tsys_menu` VALUES ('managePayable', 'BIZFRAME', 'managePayable', 'managePayable', '应付账款', null, 'accountspayable(s).png', null, '0', null, null, null, 'business', '3', null, '#bizroot#BIZFRAME#business#managePayable#', null);
INSERT INTO `tsys_menu` VALUES ('manageProvider', 'BIZFRAME', 'manageProvider', 'manageProvider', '供应商', null, 'client(s).png', null, '0', null, null, null, 'cooperation', '10', null, '#bizroot#BIZFRAME#cooperation#manageProvider#', null);
INSERT INTO `tsys_menu` VALUES ('manageRecable', 'BIZFRAME', 'manageRecable', 'manageRecable', '应收账款管理', null, 'accountspayablemanage(s).png', '/rfp/accountspayable/accountsrecablemanage.jsp', '0', null, null, null, 'business', '5', null, '#bizroot#BIZFRAME#business#manageRecable#', null);
INSERT INTO `tsys_menu` VALUES ('manageServiceBank', 'BIZFRAME', 'manageServiceBank', 'manageServiceBank', '服务银行列表', null, 'clientlist(s).png', null, '0', null, null, null, 'cooperation', '4', null, '#bizroot#BIZFRAME#cooperation#manageServiceBank#', null);
INSERT INTO `tsys_menu` VALUES ('manageSignature', 'BIZFRAME', 'manageSignature', 'manageSignature', '签名管理', null, 'signmanage(s).png', null, '0', null, null, null, 'business', '6', null, '#bizroot#BIZFRAME#business#manageSignature#', null);
INSERT INTO `tsys_menu` VALUES ('manageSupplierAccount', 'BIZFRAME', 'manageSupplierAccount', 'manageSupplierAccount', '保理专户管理', null, 'factoringusermanage(s).png', null, '0', null, null, null, 'business', '9', null, '#bizroot#BIZFRAME#business#manageSupplierAccount#', null);
INSERT INTO `tsys_menu` VALUES ('manageTradeContract', 'BIZFRAME', 'manageTradeContract', 'manageTradeContract', '资金交易', null, 'capitaltransaction(s).png', null, '0', null, null, null, 'trade', '1', null, '#bizroot#BIZFRAME#trade#manageTradeContract#', null);
INSERT INTO `tsys_menu` VALUES ('manageTripartiteAgreement', 'BIZFRAME', 'manageTripartiteAgreement', 'manageTripartiteAgreement', '三方协议管理', null, 'tripartiteagreementmanage(s).png', null, '0', null, null, null, 'business', '4', null, '#bizroot#BIZFRAME#business#manageTripartiteAgreement#', null);
INSERT INTO `tsys_menu` VALUES ('match', 'BIZFRAME', 'match', 'match', '撮合融资意向', null, 'facilitatefinancingintention(s).png', null, '0', null, null, null, 'signature', '2', null, '#bizroot#BIZFRAME#signature#match#', null);
INSERT INTO `tsys_menu` VALUES ('noticesManager', 'BIZFRAME', 'noticesManager', 'noticesManager', '公告管理', null, null, '/base/system/notice/notice.jsp', null, null, null, null, 'generalSettings', '2', null, '#bizroot#BIZFRAME#systemsettings#generalSettings#noticesManager#', null);
INSERT INTO `tsys_menu` VALUES ('orgBankRelation', 'BIZFRAME', 'orgBankRelation', 'orgBankRelation', '核心企业分配银行', null, null, '/rfp/organization/orgrelation/orgrelationserach.jsp?type=1', '0', null, null, null, 'manageOrgRelation', '2', null, '#bizroot#BIZFRAME#manageOrgUser#manageOrgRelation#orgBankRelation#', null);
INSERT INTO `tsys_menu` VALUES ('orgContractMgmt', 'BIZFRAME', 'orgContractMgmt', 'orgContractMgmt', '联系人管理', null, null, '/rfp/organization/orgcontact/organization.jsp', '0', null, null, null, 'manageOrg', '3', null, '#bizroot#BIZFRAME#manageOrgUser#manageOrg#orgContractMgmt#', null);
INSERT INTO `tsys_menu` VALUES ('orgSupplierRelation', 'BIZFRAME', 'orgSupplierRelation', 'orgSupplierRelation', '核心企业分配供应商', null, null, '/rfp/organization/orgrelation/orgrelationserach.jsp?type=2', '0', null, null, null, 'manageOrgRelation', '3', null, '#bizroot#BIZFRAME#manageOrgUser#manageOrgRelation#orgSupplierRelation#', null);
INSERT INTO `tsys_menu` VALUES ('organization', 'BIZFRAME', 'organization', 'organization', '组织机构', null, 'systemparameter(s).png', null, '0', null, null, null, 'comprehensiveQuery', '4', null, '#bizroot#BIZFRAME#comprehensiveQuery#organization#', null);
INSERT INTO `tsys_menu` VALUES ('organizationContact', 'BIZFRAME', 'organizationContact', 'organizationContact', '联系人管理', null, null, '\\admin\\commonquery\\organizationcontact.jsp', '0', null, null, null, 'organization', '2', null, '#bizroot#BIZFRAME#comprehensiveQuery#organization#organizationContact#', null);
INSERT INTO `tsys_menu` VALUES ('organizationQuery', 'BIZFRAME', 'organizationQuery', 'organizationQuery', '组织机构', null, null, '\\admin\\commonquery\\organization.jsp', '0', null, null, null, 'organization', '1', null, '#bizroot#BIZFRAME#comprehensiveQuery#organization#organizationQuery#', null);
INSERT INTO `tsys_menu` VALUES ('payableChx', 'BIZFRAME', 'payableChx', 'payableChx', '应付账款审批', null, null, '/rfp/accountspayable/chxtodotask.jsp', '0', null, null, null, 'match', '3', null, '#bizroot#BIZFRAME#signature#match#payableChx#', null);
INSERT INTO `tsys_menu` VALUES ('payableExpireList', 'BIZFRAME', 'payableExpireList', 'payableExpireList', '应付账款到期付款清单', null, null, '/common/comingsoon.jsp', '0', null, null, null, 'managePayable', '3', null, '#bizroot#BIZFRAME#business#managePayable#payableExpireList#', null);
INSERT INTO `tsys_menu` VALUES ('payableIntention', 'BIZFRAME', 'payableIntention', 'payableIntention', '融资意向审批', null, null, '/rfp/accountspayable/chxtodotask.jsp', '0', null, null, null, 'match', '5', null, '#bizroot#BIZFRAME#signature#match#payableIntention#', null);
INSERT INTO `tsys_menu` VALUES ('payableIntentionApply', 'BIZFRAME', 'payableIntentionApply', 'payableIntentionApply', '发起融资意向', null, null, '/rfp/accountspayable/chxtodotask.jsp ', '0', null, null, null, 'match', '7', null, '#bizroot#BIZFRAME#signature#match#payableIntentionApply#', null);
INSERT INTO `tsys_menu` VALUES ('payableIntentionList', 'BIZFRAME', 'payableIntentionList', 'payableIntentionList', '优先融资意愿清单', null, null, '/rfp/accountspayable/chxtodotask.jsp?lastoperationflag=203', '0', null, null, null, 'match', '4', null, '#bizroot#BIZFRAME#signature#match#payableIntentionList#', null);
INSERT INTO `tsys_menu` VALUES ('payableMgmt', 'BIZFRAME', 'payableMgmt', 'payableMgmt', '应付账款管理', null, null, '/rfp/accountspayable/accountspayablemanage.jsp', '0', null, null, null, 'managePayable', '1', null, '#bizroot#BIZFRAME#business#managePayable#payableMgmt#', null);
INSERT INTO `tsys_menu` VALUES ('payableQuote', 'BIZFRAME', 'payableQuote', 'payableQuote', '融资确认审批', null, null, '/rfp/accountspayable/chxtodotask.jsp', '0', null, null, null, 'match', '5', null, '#bizroot#BIZFRAME#signature#match#payableQuote#', null);
INSERT INTO `tsys_menu` VALUES ('payableQuoteQuery', 'BIZFRAME', 'payableQuoteQuery', 'payableQuoteQuery', '应付账款报价查询', null, null, '/rfp/accountspayable/accountspayablequote.jsp', '0', null, null, null, 'managePayable', '2', null, '#bizroot#BIZFRAME#business#managePayable#payableQuoteQuery#', null);
INSERT INTO `tsys_menu` VALUES ('platformTemplate', 'BIZFRAME', 'platformTemplate', 'platformTemplate', '平台模板', null, 'template(g).png', null, '0', null, null, null, 'BIZFRAME', '11', null, '#bizroot#BIZFRAME#platformTemplate#', null);
INSERT INTO `tsys_menu` VALUES ('platformTemplateManage', 'BIZFRAME', 'platformTemplateManage', 'platformTemplateManage', '平台模板', null, 'terracetemplate(s).png', '/rfp/platformtemplate/platformtemplate.jsp', '0', null, null, null, 'platformTemplate', '1', null, '#bizroot#BIZFRAME#platformTemplate#platformTemplateManage#', null);
INSERT INTO `tsys_menu` VALUES ('recableQuoteQuery', 'BIZFRAME', 'recableQuoteQuery', 'recableQuoteQuery', '应收账款报价查询', null, 'accountspayable(s).png', '/rfp/accountspayable/accountspayablequote.jsp', '0', null, null, null, 'business', '6', null, '#bizroot#BIZFRAME#business#recableQuoteQuery#', null);
INSERT INTO `tsys_menu` VALUES ('regionMgmt', 'BIZFRAME', 'regionMgmt', 'regionMgmt', '区域管理', null, null, '/rfp/organization/area/area.jsp', '0', null, null, null, 'manageOrg', '4', null, '#bizroot#BIZFRAME#manageOrgUser#manageOrg#regionMgmt#', null);
INSERT INTO `tsys_menu` VALUES ('returnPayableIntentionList', 'BIZFRAME', 'returnPayableIntentionList', 'returnPayableIntentionList', '退回融资意愿清单', null, null, '/rfp/accountspayable/chxtodotask.jsp?returnflag=1', '0', null, null, null, 'match', '6', null, '#bizroot#BIZFRAME#signature#match#returnPayableIntentionList#', null);
INSERT INTO `tsys_menu` VALUES ('schedule', 'BIZFRAME', 'schedule', 'schedule', '计划任务', null, 'task(s).png', '/base/schedule/taskindex.jsp', '0', null, null, null, 'task', '18', null, '#task#schedule#', null);
INSERT INTO `tsys_menu` VALUES ('signature', 'BIZFRAME', 'signature', 'signature', '签约', null, 'contract(g).png', null, '0', null, null, null, 'BIZFRAME', '12', null, '#bizroot#BIZFRAME#signature#', null);
INSERT INTO `tsys_menu` VALUES ('supplierAccount', 'BIZFRAME', 'supplierAccount', 'supplierAccount', '供应商专户', null, 'systemparameter(s).png', null, '0', null, null, null, 'comprehensiveQuery', '6', null, '#bizroot#BIZFRAME#comprehensiveQuery#supplierAccount#', null);
INSERT INTO `tsys_menu` VALUES ('supplierAccountQuery', 'BIZFRAME', 'supplierAccountQuery', 'supplierAccountQuery', '供应商专户查询', null, null, '\\admin\\commonquery\\supplieraccount.jsp', '0', null, null, null, 'supplierAccount', '1', null, '#bizroot#BIZFRAME#comprehensiveQuery#supplierAccount#supplierAccountQuery#', null);
INSERT INTO `tsys_menu` VALUES ('supplierBlackList', 'BIZFRAME', 'supplierBlackList', 'supplierBlackList', '供应商黑名单', null, null, '/rfp/organization/supplierblacklist/supplierblacklist.jsp?type=2', '0', null, null, null, 'manageProvider', '3', null, '#bizroot#BIZFRAME#cooperation#manageProvider#supplierBlackList#', null);
INSERT INTO `tsys_menu` VALUES ('supplierView', 'BIZFRAME', 'supplierView', 'supplierView', '供应商查看', null, null, '/rfp/organization/orgview/orgsupplier.jsp', '0', null, null, null, 'manageProvider', '1', null, '#bizroot#BIZFRAME#cooperation#manageProvider#supplierView#', null);
INSERT INTO `tsys_menu` VALUES ('supplierWhiteList', 'BIZFRAME', 'supplierWhiteList', 'supplierWhiteList', '供应商白名单', null, null, '/rfp/organization/supplierblacklist/supplierblacklist.jsp?type=1', '0', null, null, null, 'manageProvider', '2', null, '#bizroot#BIZFRAME#cooperation#manageProvider#supplierWhiteList#', null);
INSERT INTO `tsys_menu` VALUES ('supportBank', 'BIZFRAME', 'supportBank', 'supportBank', '支持银行', null, null, '/rfp/organization/banklist/banklist.jsp?priority=2', '0', null, null, null, 'manageServiceBank', '2', null, '#bizroot#BIZFRAME#cooperation#manageServiceBank#supportBank#', null);
INSERT INTO `tsys_menu` VALUES ('supportPayableIntentionList', 'BIZFRAME', 'supportPayableIntentionList', 'supportPayableIntentionList', '支持融资意愿清单', null, null, '/rfp/accountspayable/chxtodotask.jsp?lastoperationflag=401,402', '0', null, null, null, 'match', '5', null, '#bizroot#BIZFRAME#signature#match#supportPayableIntentionList#', null);
INSERT INTO `tsys_menu` VALUES ('syscompany', 'BIZFRAME', 'syscompany', 'syscompany', '企业管理', null, 'companymanage(s).png', null, '0', null, null, null, 'tenant', '5', null, '#bizroot#BIZFRAME#tenant#syscompany#', null);
INSERT INTO `tsys_menu` VALUES ('syscompanyinfo', 'BIZFRAME', 'syscompanyinfo', 'syscompanyinfo', '企业信息', null, null, '/admin/syscompany/syscompanyinfo.jsp', '0', null, null, null, 'syscompany', '1', null, '#bizroot#BIZFRAME#tenant#syscompany#syscompanyinfo#', null);
INSERT INTO `tsys_menu` VALUES ('syscontract', 'BIZFRAME', 'syscontract', 'syscontract', '协议设置', null, null, '/admin/syscompany/syscontractinfo.jsp', null, null, null, null, 'syscompany', '2', null, '#bizroot#BIZFRAME#tenant#syscompany#syscontractinfo#', null);
INSERT INTO `tsys_menu` VALUES ('syspackage', 'BIZFRAME', 'syspackage', 'syspackage', '套餐设置', null, null, '/admin/syscompany/syspackageinfo.jsp', null, null, null, null, 'syscompany', '3', null, '#bizroot#BIZFRAME#tenant#syscompany#syspackageinfo#', null);
INSERT INTO `tsys_menu` VALUES ('systemParam', 'BIZFRAME', 'systemParam', 'systemParam', '系统参数', null, 'systemparameter(s).png', null, '0', null, null, null, 'systemsettings', '7', null, '#bizroot#BIZFRAME#systemsettings#systemParam#', null);
INSERT INTO `tsys_menu` VALUES ('systemParamManage', 'BIZFRAME', 'systemParamManage', 'systemParamManage', '系统参数管理', null, null, '/base/system/param/sysparam.jsp', null, null, null, null, 'systemParam', '1', null, '#bizroot#BIZFRAME#systemsettings#systemParam#systemParamManage#', null);
INSERT INTO `tsys_menu` VALUES ('systemsettings', 'BIZFRAME', 'systemsettings', 'systemsettings', '系统设置', null, 'setting(g).png', null, '0', null, null, null, 'BIZFRAME', '15', null, '#bizroot#BIZFRAME#systemsettings#', null);
INSERT INTO `tsys_menu` VALUES ('taTemplateSignature', 'BIZFRAME', 'taTemplateSignature', 'taTemplateSignature', '三方协议模板签名', null, null, '/common/comingsoon.jsp', '0', null, null, null, 'manageSignature', '4', null, '#bizroot#BIZFRAME#business#manageSignature#taTemplateSignature#', null);
INSERT INTO `tsys_menu` VALUES ('task', 'BIZFRAME', 'task', 'task', '任务', null, 'task(g).png', null, '0', null, null, null, 'BIZFRAME', '7', null, '#bizroot#BIZFRAME#task#', null);
INSERT INTO `tsys_menu` VALUES ('tdrctablelist', 'BIZFRAME', 'tdrctablelist', 'tdrctablelist', '数据权限管理', null, null, '/admin/tsvcmanage/tdrctablelist/tdrctablelist.jsp', '0', null, null, null, 'tsvcmanage', '2', null, '#bizroot#BIZFRAME#systemsettings#tsvcmanage#tdrctablelist#', null);
INSERT INTO `tsys_menu` VALUES ('tenant', 'BIZFRAME', 'tenant', 'tenant', '企业', null, 'enterprise(g).png', null, '0', null, null, null, 'BIZFRAME', '7', null, '#bizroot#BIZFRAME#tenant#', null);
INSERT INTO `tsys_menu` VALUES ('trade', 'BIZFRAME', 'trade', 'trade', '交易', null, 'transaction(g).png', null, '0', null, null, null, 'BIZFRAME', '14', null, '#bizroot#BIZFRAME#trade#', null);
INSERT INTO `tsys_menu` VALUES ('tradeAccountBalance', 'BIZFRAME', 'tradeAccountBalance', 'tradeAccountBalance', '交易账户余额', null, null, '/rfp/tradeaccount/transaccountbalance.jsp', '0', null, null, null, 'manageTradeContract', '3', null, '#bizroot#BIZFRAME#trade#manageTradeContract#tradeAccountBalance#', null);
INSERT INTO `tsys_menu` VALUES ('tradeAccountDetail', 'BIZFRAME', 'tradeAccountDetail', 'tradeAccountDetail', '交易账户明细', null, null, '/rfp/tradeaccount/transaccountdetail.jsp', '0', null, null, null, 'manageTradeContract', '3', null, '#bizroot#BIZFRAME#trade#manageTradeContract#tradeAccountDetail#', null);
INSERT INTO `tsys_menu` VALUES ('tradeAccountMgmt', 'BIZFRAME', 'tradeAccountMgmt', 'tradeAccountMgmt', '交易账户管理', null, null, '/rfp/tradeaccount/tradeaccount.jsp', '0', null, null, null, 'manageTradeContract', '1', null, '#bizroot#BIZFRAME#trade#manageTradeContract#tradeAccountMgmt#', null);
INSERT INTO `tsys_menu` VALUES ('tradeAccounts', 'BIZFRAME', 'tradeAccounts', 'tradeAccounts', '交易账户', null, 'systemparameter(s).png', null, '0', null, null, null, 'comprehensiveQuery', '3', null, '#bizroot#BIZFRAME#comprehensiveQuery#tradeAccounts#', null);
INSERT INTO `tsys_menu` VALUES ('tradeAccountsQuery', 'BIZFRAME', 'tradeAccountsQuery', 'tradeAccountsQuery', '交易账户查询', null, null, '\\admin\\commonquery\\tradeaccounts.jsp', '0', null, null, null, 'tradeAccounts', '1', null, '#bizroot#BIZFRAME#comprehensiveQuery#tradeAccounts#tradeAccountsQuery#', null);
INSERT INTO `tsys_menu` VALUES ('tradeBalance', 'BIZFRAME', 'tradeBalance', 'tradeBalance', '交易账户余额', null, null, '\\admin\\commonquery\\tradebalance.jsp', '0', null, null, null, 'tradeAccounts', '3', null, '#bizroot#BIZFRAME#comprehensiveQuery#tradeAccounts#tradeBalance#', null);
INSERT INTO `tsys_menu` VALUES ('tradeTransaction', 'BIZFRAME', 'tradeTransaction', 'tradeTransaction', '交易账户明细', null, null, '\\admin\\commonquery\\tradetransaction.jsp', '0', null, null, null, 'tradeAccounts', '2', null, '#bizroot#BIZFRAME#comprehensiveQuery#tradeAccounts#tradeTransaction#', null);
INSERT INTO `tsys_menu` VALUES ('tripartiteAgreementChx', 'BIZFRAME', 'tripartiteAgreementChx', 'tripartiteAgreementChx', '三方协议签约', null, 'tripartiteagreementsign(s).png', null, '0', null, null, null, 'signature', '3', null, '#bizroot#BIZFRAME#signature#tripartiteAgreementChx#', null);
INSERT INTO `tsys_menu` VALUES ('tripartiteAgreementChxDone', 'BIZFRAME', 'tripartiteAgreementChxDone', 'tripartiteAgreementChxDone', '已办任务', null, null, '/rfp/agreement/tripartiteagreementdonetask.jsp', '0', null, null, null, 'tripartiteAgreementChx', '2', null, '#bizroot#BIZFRAME#signature#tripartiteAgreementChx#tripartiteAgreementChxDone#', null);
INSERT INTO `tsys_menu` VALUES ('tripartiteAgreementChxTodo', 'BIZFRAME', 'tripartiteAgreementChxTodo', 'tripartiteAgreementChxTodo', '待办任务', null, null, '/rfp/agreement/chxtodo.jsp', '0', null, null, null, 'tripartiteAgreementChx', '1', null, '#bizroot#BIZFRAME#signature#tripartiteAgreementChx#tripartiteAgreementChxTodo#', null);
INSERT INTO `tsys_menu` VALUES ('tripartiteAgreementDone', 'BIZFRAME', 'tripartiteAgreementDone', 'tripartiteAgreementDone', '已完成合约', null, null, '/rfp/agreement/tripartiteagreementdone.jsp', '0', null, null, null, 'manageTripartiteAgreement', '4', null, '#bizroot#BIZFRAME#business#manageTripartiteAgreement#tripartiteAgreementDone#', null);
INSERT INTO `tsys_menu` VALUES ('tripartiteAgreementMgmt', 'BIZFRAME', 'tripartiteAgreementMgmt', 'tripartiteAgreementMgmt', '发起三方协议', null, null, '/rfp/agreement/tripartiteagreement.jsp', '0', null, null, null, 'manageTripartiteAgreement', '1', null, '#bizroot#BIZFRAME#business#manageTripartiteAgreement#tripartiteAgreementMgmt#', null);
INSERT INTO `tsys_menu` VALUES ('tripartiteAgreementRunning', 'BIZFRAME', 'tripartiteAgreementRunning', 'tripartiteAgreementRunning', '在途合约', null, null, '/rfp/agreement/tripartiteagreementrunning.jsp', '0', null, null, null, 'manageTripartiteAgreement', '3', null, '#bizroot#BIZFRAME#business#manageTripartiteAgreement#tripartiteAgreementRunning#', null);
INSERT INTO `tsys_menu` VALUES ('tripartiteAgreementSignature', 'BIZFRAME', 'tripartiteAgreementSignature', 'tripartiteAgreementSignature', '三方协议签名', null, null, '/common/comingsoon.jsp', '0', null, null, null, 'manageSignature', '1', null, '#bizroot#BIZFRAME#business#manageSignature#tripartiteAgreementSignature#', null);
INSERT INTO `tsys_menu` VALUES ('tripartiteAgreementTempMgmt', 'BIZFRAME', 'tripartiteAgreementTempMgmt', 'tripartiteAgreementTempMgmt', '三方协议模版管理', null, null, '/rfp/triagreementtemp/templatemanage.jsp', '0', null, null, null, 'manageTripartiteAgreement', '2', null, '#bizroot#BIZFRAME#business#manageTripartiteAgreement#tripartiteAgreementTempMgmt#', null);
INSERT INTO `tsys_menu` VALUES ('tsvcinterface', 'BIZFRAME', 'tsvcinterface', 'tsvcinterface', '通用查询配置', null, null, '/admin/tsvcmanage/tsvcinterface/tsvchsiright.jsp', '0', null, null, null, 'tsvcmanage', '1', null, '#bizroot#BIZFRAME#systemsettings#tsvcmanage#tsvcinterface#', null);
INSERT INTO `tsys_menu` VALUES ('tsvcmanage', 'BIZFRAME', 'tsvcmanage', 'tsvcmanage', '辅助开发管理', null, 'assistdevelopmanage(s).png', null, '0', null, null, null, 'systemsettings', '6', null, '#bizroot#BIZFRAME#systemsettings#tsvcmanage#', null);
INSERT INTO `tsys_menu` VALUES ('userManager', 'BIZFRAME', 'userManager', 'userManager', '用户', null, 'user(g).png', null, '0', null, null, null, 'BIZFRAME', '3', null, '#bizroot#BIZFRAME#userManager#', null);
INSERT INTO `tsys_menu` VALUES ('warning', 'BIZFRAME', 'warning', 'warning', '预警监控', null, 'warning(s).png', null, '0', null, null, null, 'warningManage', '9', null, '#bizroot#BIZFRAME#warningManage#warning#', null);
INSERT INTO `tsys_menu` VALUES ('warningAnnulMessage', 'BIZFRAME', 'warningAnnulMessage', 'warningAnnulMessage', '预警撤销信息', null, null, '/base/warning/warningmessage/warningannulmessageindex.jsp', '0', null, null, null, 'warning', '4', null, '#bizroot#BIZFRAME#warningManage#warning#warningAnnulMessage#', null);
INSERT INTO `tsys_menu` VALUES ('warningManage', 'BIZFRAME', 'warningManage', 'warningManage', '预警', null, 'warning(g).png', null, '0', null, null, null, 'BIZFRAME', '16', null, '#bizroot#BIZFRAME#warningManage#', null);
INSERT INTO `tsys_menu` VALUES ('warningMessage', 'BIZFRAME', 'warningMessage', 'warningMessage', '预警信息', null, null, '/base/warning/warningmessage/warningmessageindex.jsp', '2', null, null, null, 'warning', '3', null, '#bizroot#BIZFRAME#warningManage#warning#warningMessage#', null);
INSERT INTO `tsys_menu` VALUES ('warningObject', 'BIZFRAME', 'warningObject', 'warningObject', '预警对象', null, null, '/base/warning/warningobject/warningobject.jsp', null, null, null, null, 'warning', '1', null, '#bizroot#BIZFRAME#warningManage#warning#warningObject#', null);
INSERT INTO `tsys_menu` VALUES ('warningRule', 'BIZFRAME', 'warningRule', 'warningRule', '预警规则', null, null, '/base/warning/warningrule/warningrule.jsp', null, null, null, null, 'warning', '2', null, '#bizroot#BIZFRAME#warningManage#warning#warningRule#', null);
INSERT INTO `tsys_menu` VALUES ('workBench', 'BIZFRAME', 'workBench', 'workBench', '工作台', null, 'workbench(w).png', null, '0', null, null, null, 'BIZFRAME', '15', null, '#bizroot#BIZFRAME#workBench#', null);

-- ----------------------------
-- Table structure for `tsys_organization`
-- ----------------------------
DROP TABLE IF EXISTS `tsys_organization`;
CREATE TABLE `tsys_organization` (
  `org_id` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '组织机构标识',
  `dimension` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '维度',
  `org_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '组织机构编码',
  `org_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '组织机构名称',
  `parent_id` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '上级组织标识',
  `manage_id` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '组管组织标识',
  `position_code` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '负责岗位标识',
  `org_cate` varchar(4) COLLATE utf8_bin DEFAULT NULL COMMENT '组织分类:0-平台;1-银行;2-核心企业;3-供应商;4-金融机构;5-核心企业供应商',
  `org_level` varchar(4) COLLATE utf8_bin DEFAULT NULL COMMENT '组织级别:0-平台;1-集团;2-总公司;3-分公司;4-支公司',
  `org_order` int(11) DEFAULT NULL COMMENT '组织序号',
  `org_path` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '组织索引',
  `sso_org_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'SSO组织编码',
  `sso_parent_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'SSO上级组织编码',
  `ext_id` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展标识',
  `remark` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `status` varchar(4) COLLATE utf8_bin DEFAULT '0' COMMENT 'QA:状态',
  `tenant_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '租户ID',
  `shortorgname` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `platformsupplierrate` decimal(8,4) DEFAULT NULL COMMENT '平台向供应商收取的费率',
  `corecompanyrate` decimal(8,4) DEFAULT NULL COMMENT '平台付给核心企业的费率',
  `areaid` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '区域ID',
  `financenumber` int(11) DEFAULT NULL COMMENT '融资次数',
  `address` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '地址',
  `legalperson` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '法人',
  `createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `lastmodifiedon` datetime DEFAULT NULL COMMENT '最后操作时间',
  PRIMARY KEY (`org_id`),
  KEY `nk_biz_org_code` (`org_code`) USING BTREE,
  KEY `nk_biz_org_name` (`org_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='组织表';

-- ----------------------------
-- Records of tsys_organization
-- ----------------------------
INSERT INTO `tsys_organization` VALUES ('0_10000001', '0', '10000001', '策赢集团', '6000001', '6000001', '0_10000001head', '0', '1', '0', '#bizroot#6000001#0_10000001#', null, null, null, null, '0', '10000', null, null, null, null, null, null, null, null, null);
INSERT INTO `tsys_organization` VALUES ('0_100001000001', '0', '100001000001', '北京银行总行', '6000001', '6000001', '0_100001000001head', '1', '1', '0', '#bizroot#6000001#0_100001000001#', null, null, null, null, '0', '10000', null, '0.0100', '0.0200', '1100', null, '11', '11', null, null);
INSERT INTO `tsys_organization` VALUES ('0_100001000003', '0', '100001000003', '北京银行分行2', '0_100001000001', '0_100001000001', '0_100001000003head', '1', '2', '0', '#bizroot#6000001#0_100001000001#0_100001000003#', null, null, null, null, '0', '10000', null, '0.0100', '0.0200', '1100', null, '111', '111', null, null);
INSERT INTO `tsys_organization` VALUES ('0_100001000010', '0', '100001000010', '德州银行总行', '6000001', '6000001', '0_100001000010head', '1', '1', '0', '#bizroot#6000001#0_100001000010#', null, null, null, null, '0', '10000', null, '0.0000', '0.0000', '3714', null, '德州银行总行地址', '德州银行总行法人', null, null);
INSERT INTO `tsys_organization` VALUES ('0_100001000011', '0', '100001000011', '德州银行1', '0_100001000010', '0_100001000010', '0_100001000011head', '1', '2', '0', '#bizroot#6000001#0_100001000010#0_100001000011#', null, null, null, null, '0', '10000', null, '0.0000', '0.0000', '3714', null, '德州银行1地址', '德州银行1法人', null, null);
INSERT INTO `tsys_organization` VALUES ('0_100001000012', '0', '100001000012', '德州银行2', '0_100001000010', '0_100001000010', '0_100001000012head', '1', '2', '0', '#bizroot#6000001#0_100001000010#0_100001000012#', null, null, null, null, '0', '10000', null, '0.0000', '0.0000', '3714', null, '德州银行2地址', '德州银行2法人', null, null);
INSERT INTO `tsys_organization` VALUES ('0_100001000013', '0', '100001000013', '江西银行', '6000001', '6000001', '0_100001000013head', '1', '2', null, '#bizroot#6000001#0_100001000013#', null, null, null, 'test11', null, '10000', null, '0.0000', '0.0000', '3713', null, '2', '2', '2017-11-23 19:21:07', '2017-12-01 17:23:59');
INSERT INTO `tsys_organization` VALUES ('0_100002000001', '0', '100002000001', '北京核心集团', '6000001', '6000001', '0_100002000001head', '2', '1', '0', '#bizroot#6000001#0_100002000001#', null, null, null, null, '0', '10000', null, '0.0000', '0.0200', '1100', null, '11', '1', null, null);
INSERT INTO `tsys_organization` VALUES ('0_100002000002', '0', '100002000002', '北京核心子公司1', '0_100002000001', '0_100002000001', '0_100002000002head', '2', '2', '0', '#bizroot#6000001#0_100002000001#0_100002000002#', null, null, null, null, '0', '10000', null, '0.0000', '0.0111', '1100', '0', '11', '11', null, null);
INSERT INTO `tsys_organization` VALUES ('0_100002000003', '0', '100002000003', '北京核心子公司2', '0_100002000001', '0_100002000001', '0_100002000003head', '2', '3', null, '#bizroot#6000001#0_100002000001#0_100002000003#', null, null, null, 'test111', null, '10000', null, '0.0000', '0.0200', '3712', null, '北京', '张军', '2017-11-23 08:38:35', '2017-12-01 18:06:29');
INSERT INTO `tsys_organization` VALUES ('0_100003000001', '0', '100003000001', '北京供应商集团', '6000001', '6000001', '0_100003000001head', '3', '1', '0', '#bizroot#6000001#0_100003000001#', null, null, null, null, '0', '10000', null, '0.0100', '0.0000', '1100', '1', '11', '11', null, null);
INSERT INTO `tsys_organization` VALUES ('0_100003000002', '0', '100003000002', '北京供应商2', '6000001', '6000001', '0_100003000002head', '3', '3', null, '#bizroot#6000001#0_100003000002#', null, null, null, '11', null, '10000', null, '0.0150', '0.0000', '3712', null, '11', '11', '2017-11-24 14:53:04', '2017-11-24 14:54:23');
INSERT INTO `tsys_organization` VALUES ('6000001', '0', '001000', '策赢平台', 'bizroot', '6000001', '6000001head', '1', '0', '0', '#bizroot#6000001#', null, null, null, null, '0', '10000', null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `tsys_org_user`
-- ----------------------------
DROP TABLE IF EXISTS `tsys_org_user`;
CREATE TABLE `tsys_org_user` (
  `user_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'QA:用户代码，外键TSYS_USER.USER_ID',
  `org_id` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '组织机构编号',
  `role_code` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '角色编号',
  `tenant_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '租户ID',
  KEY `nk_biz_orguser_org_id` (`org_id`) USING BTREE,
  KEY `nk_biz_orguser_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tsys_org_user
-- ----------------------------
INSERT INTO `tsys_org_user` VALUES ('100001995', '0_10000001', null, '10000');

-- ----------------------------
-- Table structure for `tsys_package`
-- ----------------------------
DROP TABLE IF EXISTS `tsys_package`;
CREATE TABLE `tsys_package` (
  `package_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '套餐ID',
  `package_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '套餐编号',
  `package_name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '套餐名称',
  `isactive` char(1) COLLATE utf8_bin NOT NULL DEFAULT '1' COMMENT '是否有效',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `modify_date` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='套餐表';

-- ----------------------------
-- Records of tsys_package
-- ----------------------------
INSERT INTO `tsys_package` VALUES ('1', '000000', '无限套餐', '0', '2016-09-02 00:00:00', '2017-11-13 16:33:25');
INSERT INTO `tsys_package` VALUES ('1001', '1001', '普通套餐-管理员', '1', '2017-01-18 11:10:07', '2017-11-15 17:49:09');
INSERT INTO `tsys_package` VALUES ('1002', '1002', '普通套餐-员工', '1', '2017-01-18 00:00:00', null);

-- ----------------------------
-- Table structure for `tsys_package_detail`
-- ----------------------------
DROP TABLE IF EXISTS `tsys_package_detail`;
CREATE TABLE `tsys_package_detail` (
  `package_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '套餐ID',
  `trans_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '交易编号',
  `sub_trans_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '子交易编号',
  PRIMARY KEY (`package_id`,`trans_code`,`sub_trans_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tsys_package_detail
-- ----------------------------
INSERT INTO `tsys_package_detail` VALUES ('1', 'accountsPayable', 'accountsPayableQuery');
INSERT INTO `tsys_package_detail` VALUES ('1', 'agreementQuery', 'agreementQuery');
INSERT INTO `tsys_package_detail` VALUES ('1', 'agreementTempQuery', 'agreementTempQuery');
INSERT INTO `tsys_package_detail` VALUES ('1', 'appealQuery', 'appealQuery');
INSERT INTO `tsys_package_detail` VALUES ('1', 'bigContract', 'bigContractQuery');
INSERT INTO `tsys_package_detail` VALUES ('1', 'comprehensiveQuery', 'agreement');
INSERT INTO `tsys_package_detail` VALUES ('1', 'comprehensiveQuery', 'agreementTemp');
INSERT INTO `tsys_package_detail` VALUES ('1', 'comprehensiveQuery', 'appeal');
INSERT INTO `tsys_package_detail` VALUES ('1', 'comprehensiveQuery', 'bigContract');
INSERT INTO `tsys_package_detail` VALUES ('1', 'comprehensiveQuery', 'organization');
INSERT INTO `tsys_package_detail` VALUES ('1', 'comprehensiveQuery', 'supplierAccount');
INSERT INTO `tsys_package_detail` VALUES ('1', 'comprehensiveQuery', 'tradeAccounts');
INSERT INTO `tsys_package_detail` VALUES ('1', 'organization', 'organizationQuery');
INSERT INTO `tsys_package_detail` VALUES ('1', 'organizationContact', 'organizationContact');
INSERT INTO `tsys_package_detail` VALUES ('1', 'supplierAccountQuery', 'supplierAccountQuery');
INSERT INTO `tsys_package_detail` VALUES ('1', 'tradeAccountsQuery', 'tradeAccountsQuery');
INSERT INTO `tsys_package_detail` VALUES ('1', 'tradeBalance', 'tradeBalance');
INSERT INTO `tsys_package_detail` VALUES ('1', 'tradeTransaction', 'tradeTransaction');

-- ----------------------------
-- Table structure for `tsys_parameter`
-- ----------------------------
DROP TABLE IF EXISTS `tsys_parameter`;
CREATE TABLE `tsys_parameter` (
  `param_code` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '参数编号',
  `rel_org` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '关联组织',
  `kind_code` varchar(16) COLLATE utf8_bin NOT NULL COMMENT 'QA:分类编号，外键TSYS_KIND.KIND_CODE',
  `param_name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '参数名称',
  `param_value` varchar(1024) COLLATE utf8_bin NOT NULL COMMENT '参数值',
  `ext_flag` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT 'QA:扩展标识',
  `lifecycle` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '生命周期',
  `platform` varchar(8) COLLATE utf8_bin DEFAULT '0' COMMENT '平台标识',
  `param_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '参数说明',
  `param_regex` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '参数正则验证规则',
  `tenant_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`param_code`,`rel_org`),
  KEY `nk_biz_param_code` (`param_code`) USING BTREE,
  KEY `nk_biz_param_name` (`param_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统参数表';

-- ----------------------------
-- Records of tsys_parameter
-- ----------------------------
INSERT INTO `tsys_parameter` VALUES ('0007', '0_hangzhouDevelopment', '0002', '系统参数修改', '1', null, null, '0', null, null, null);
INSERT INTO `tsys_parameter` VALUES ('1112', '0_000000', 'dfdhggf', 'dasf', 'dfd', null, null, '0', 'dasf', null, null);
INSERT INTO `tsys_parameter` VALUES ('12121212', '0_000000', 'BIZ_PARAM', '12121212', 'true3434545eerrrrrrrwwwww', null, null, null, null, null, null);
INSERT INTO `tsys_parameter` VALUES ('2122323', '0_jjj', '0002', '2323', '34343', null, null, null, 'fsfsf', null, null);
INSERT INTO `tsys_parameter` VALUES ('22222222', '0_000000', 'BIZ_PARAM', '22222', '22222jjj', null, null, null, 'vbvb', null, null);
INSERT INTO `tsys_parameter` VALUES ('2704test', '0_000000', 'BIZ_PARAM', '输入内容不能包含单引号双引号', 'ddddyyyyy', null, null, null, null, '^[^\'\\u0022]*$', null);
INSERT INTO `tsys_parameter` VALUES ('34345', '0_000000', 'test', '54545', 'yyyyyyyyyuuuttttttt', null, null, null, null, null, null);
INSERT INTO `tsys_parameter` VALUES ('454', '0_000000', 'BIZ_PARAM', '4545', '4545', null, null, '0', null, null, null);
INSERT INTO `tsys_parameter` VALUES ('45454', '0_000000', 'test', '464654隔', '否发发', null, null, '0', null, null, null);
INSERT INTO `tsys_parameter` VALUES ('4546456', '0_t000004', '0002', '465657', 'ryt', null, null, '0', null, null, null);
INSERT INTO `tsys_parameter` VALUES ('545454', '0_000000', 'BIZ_PARAM', '454545', '4545454', null, null, '0', null, null, null);
INSERT INTO `tsys_parameter` VALUES ('666', '0_qqq', 'BIZ_PARAM', '666', '666', null, null, '0', null, null, null);
INSERT INTO `tsys_parameter` VALUES ('7777777', '0_000000', 'BIZ_PARAM', '77777777', '7777', null, null, '0', null, null, null);
INSERT INTO `tsys_parameter` VALUES ('87878', '0_000000', 'BIZ_PARAM', '65565', 'false2222', null, null, '0', null, '^false|true$', null);
INSERT INTO `tsys_parameter` VALUES ('adasd', '0_000000', 'test001', 'sa', 'dsf', null, null, '0', 'dsf', null, null);
INSERT INTO `tsys_parameter` VALUES ('bizMarquee', '0_000000', 'BIZ_PARAM', '通知', '<a href=\"http://www.fingard.com.cn\" target=\"_blank\">浙江保融科技有限公司</a>', null, null, null, 'bizMarquee', null, null);
INSERT INTO `tsys_parameter` VALUES ('cacheRefeshInterval', '0_000000', 'BIZ_PARAM', '缓存刷新间隔', '60', null, null, '1', '数值，代表缓存刷新的时间间隔(以秒为单位，默认60秒)', '^[1-9]\\d*$', null);
INSERT INTO `tsys_parameter` VALUES ('commonPositionCodeSuffix', '0_000000', 'BIZ_PARAM', '普通岗位编号后缀', 'common', null, null, '1', '字符串，代表新增组织的普通岗位编号后缀', null, null);
INSERT INTO `tsys_parameter` VALUES ('commonPositionNameSuffix', '0_000000', 'BIZ_PARAM', '普通岗位名称后缀', '普通岗', null, null, '1', '字符串，代表新增组织的普通岗位名称后缀', null, null);
INSERT INTO `tsys_parameter` VALUES ('dasda', '0_qa', 'BIZ_PARAM', 'fdsf', 'fdf', null, null, '0', 'sdfdfg', null, null);
INSERT INTO `tsys_parameter` VALUES ('defaultLogo', '0_000000', 'BIZ_PARAM', '默认主页LOGO', 'logo.png', null, null, '1', '默认主页LOGO', null, null);
INSERT INTO `tsys_parameter` VALUES ('defaultUserPassword', '0_000000', 'BIZ_PARAM', '默认密码', '88888888', null, null, '1', '系统用户默认密码', null, null);
INSERT INTO `tsys_parameter` VALUES ('default_menu_depth', '0_000000', 'BIZ_PARAM', '默认主页菜单深度', '1', null, null, '1', '数值，代表默认主页菜单深度', '^[1-9]\\d*$', null);
INSERT INTO `tsys_parameter` VALUES ('desktopBg', '0_000000', 'BIZ_PARAM', '桌面背景', 'desktopBg.gif', null, null, '1', '桌面背景', null, null);
INSERT INTO `tsys_parameter` VALUES ('desktopLogo', '0_000000', 'BIZ_PARAM', '桌面LOGO', 'desktopLogo.gif', null, null, '1', '桌面LOGO', null, null);
INSERT INTO `tsys_parameter` VALUES ('desktop_navigation_menu_depth', '0_000000', 'BIZ_PARAM', '桌面顶置导航菜单深度', '1', null, null, '1', '数值，代表桌面顶置导航菜单深度', '^[1-9]\\d*$', null);
INSERT INTO `tsys_parameter` VALUES ('desktop_start_menu_depth', '0_000000', 'BIZ_PARAM', '桌面开始菜单深度', '1', null, null, '1', '数值，代表桌面开始菜单深度', '^[1-9]\\d*$', null);
INSERT INTO `tsys_parameter` VALUES ('dfdfdf', '0_jjj', '0002', 'rerwer', '6', null, null, '0', null, null, null);
INSERT INTO `tsys_parameter` VALUES ('dsf', '0_000000', 'test001', 'dsaf', 'fdgg', null, null, '0', 'dswfsd', 'w*', null);
INSERT INTO `tsys_parameter` VALUES ('ererere', '0_000000', 'test', '热热热', '而额外', null, null, '0', null, null, null);
INSERT INTO `tsys_parameter` VALUES ('isShowAdminPwd', '0_000000', 'BIZ_PARAM', 'isShowAdminPwd', 'true', null, null, null, '^true|false$', '^true|false$', null);
INSERT INTO `tsys_parameter` VALUES ('lockScreenInterval', '0_000000', 'BIZ_PARAM', '锁屏时间隔', '6', null, null, null, '数值，代表用户无活动锁屏时间隔(以分钟为单位，默认10分钟)', '^[1-9]\\d*$', null);
INSERT INTO `tsys_parameter` VALUES ('loginBg', '0_000000', 'BIZ_PARAM', '登陆页面背景', 'login_logo.png', null, null, '1', '登陆页面背景', null, null);
INSERT INTO `tsys_parameter` VALUES ('login_has_validateCode', '9_000000', 'BIZ_PARAM', '验证码', 'false', null, null, '0', null, '^true|false$', null);
INSERT INTO `tsys_parameter` VALUES ('logoHeight', '0_000000', 'BIZ_PARAM', 'logo高度', '70', null, null, null, '数值，代表页面logo区域高度，默认值70', '^[1-9]\\d*$', null);
INSERT INTO `tsys_parameter` VALUES ('managerPositionCodeSuffix', '0_000000', 'BIZ_PARAM', '负责岗位编号后缀', 'head', null, null, '1', '字符串，代表新增组织的负责岗位编号后缀', null, null);
INSERT INTO `tsys_parameter` VALUES ('managerPositionNameSuffix', '0_000000', 'BIZ_PARAM', '负责岗位名称后缀', '主管岗', null, null, '1', '字符串，代表新增组织的负责岗位名称后缀', null, null);
INSERT INTO `tsys_parameter` VALUES ('maxWrongPass', '0_000000', 'BIZ_PARAM', '最大允许密码错误次数', '10', null, null, '1', '数值，表示大允许密码错误次数', '^[1-9]\\d*$', null);
INSERT INTO `tsys_parameter` VALUES ('menuLoadModel', '0_000000', 'BIZ_PARAM', '首页菜单加载模式', 'tree', null, null, '1', '字符串，代表首页菜单加载模式，目前只支持accordion和tree两种模式', '^accordion|tree$', null);
INSERT INTO `tsys_parameter` VALUES ('msgPollInterval', '0_000000', 'BIZ_PARAM', '消息轮询间隔', '1', null, null, null, '数值，代表页面消息轮询间隔(以分钟为单位，默认3分钟)', '^[1-9]\\d*$', null);
INSERT INTO `tsys_parameter` VALUES ('openMaxTabNum', '0_000000', 'BIZ_PARAM', '最大菜单数目', '6', null, null, '1', '数值，代表主页打开的最大菜单数目', '^[1-9]\\d*$', null);
INSERT INTO `tsys_parameter` VALUES ('passRepeatCycle', '0_000000', 'BIZ_PARAM', '密码重复周期', '3', '1', null, null, '数值，代表用户密码重复周期(默认值0)。若值为4则表示修改密码时不能和之前的四次重复，0表示随意重复', '^[0-7]d*$', null);
INSERT INTO `tsys_parameter` VALUES ('passUnit', '0_000000', 'BIZ_PARAM', '密码有效时间单位', '2', null, null, '1', '0代表天，1代表周，2代表月，3代表年', '^[0-3]$', null);
INSERT INTO `tsys_parameter` VALUES ('passValidity', '0_000000', 'BIZ_PARAM', '密码有效周期', '3', null, null, null, '数值，表示指定数量个密码有效单位的时间长度', '^[1-9]\\d*$', null);
INSERT INTO `tsys_parameter` VALUES ('passwordLengthMin', '0_000000', 'BIZ_PARAM', '密码最短长度', '8', null, null, '1', '系统用户密码最短长度', null, null);
INSERT INTO `tsys_parameter` VALUES ('shieldBcakSpace', '0_000000', 'BIZ_PARAM', '屏蔽鼠标右键', 'false', null, null, null, '布尔值，页面是否需屏蔽鼠标右键,true代表屏蔽false代表不屏蔽', '^true|false$', null);
INSERT INTO `tsys_parameter` VALUES ('shieldF5', '0_000000', 'BIZ_PARAM', '屏蔽F5按钮', 'false', null, null, null, '布尔值，页面是否需屏蔽F5按钮,true代表屏蔽false代表不屏蔽', '^true|false$', null);
INSERT INTO `tsys_parameter` VALUES ('singleTab', '0_000000', 'BIZ_PARAM', '单一打开菜单', 'true', null, null, '1', '布尔值，页面是否单一打开菜单,true代表单一打开 false代表多窗口打开', '^true|false$', null);
INSERT INTO `tsys_parameter` VALUES ('systemHelpUrl', '0_000000', 'BIZ_PARAM', '系统帮助手册地址', 'bizframe/jsp/help/bizframe-help.html', null, null, '1', '字符串，代表系统帮助手册地址', null, null);
INSERT INTO `tsys_parameter` VALUES ('test', '0_000000', 'BIZ_PARAM', 'test', '11111111111', null, null, '0', null, '^[0-9]{0,10}', null);
INSERT INTO `tsys_parameter` VALUES ('ttt', '0_000000', '0002', 'ttt', 'ttt', null, null, '0', null, null, null);
INSERT INTO `tsys_parameter` VALUES ('tttttt', '0_000000', 'BIZ_PARAM', 'tttttt', '1', null, null, '0', null, null, null);
INSERT INTO `tsys_parameter` VALUES ('welcomeUrl', '9_000000', 'BIZ_PARAM', '主页8888', 'http://www.baidu.com', null, null, '0', null, null, null);
INSERT INTO `tsys_parameter` VALUES ('y1', '0_000000', 'test001', 'y1', 'y3', null, null, '0', null, null, null);
INSERT INTO `tsys_parameter` VALUES ('yyy', '0_000000', '0002', 'yyy', 'yyy', null, null, '0', null, null, null);

-- ----------------------------
-- Table structure for `tsys_position`
-- ----------------------------
DROP TABLE IF EXISTS `tsys_position`;
CREATE TABLE `tsys_position` (
  `position_code` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '岗位编号',
  `position_name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '岗位名称',
  `parent_code` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '上级岗位编号',
  `org_id` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '所属组织',
  `role_code` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '角色编号',
  `position_path` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '岗位内码',
  `remark` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `ext_field_1` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段1',
  `ext_field_2` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段2',
  `ext_field_3` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段3',
  PRIMARY KEY (`position_code`),
  KEY `nk_biz_pos_name` (`position_name`) USING BTREE,
  KEY `nk_biz_pos_role_code` (`role_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统岗位表';

-- ----------------------------
-- Records of tsys_position
-- ----------------------------
INSERT INTO `tsys_position` VALUES ('0_001001001common', '浙江保融科技上海分公司普通岗', '0_001001001head', '0_001001001', null, '#bizroot#0_1head#0_101head#0_101common#0_001001head#0_001001001head#0_001001001common#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_001001001head', '浙江保融科技上海分公司主管岗', '0_001001head', '0_001001001', null, '#bizroot#0_1head#0_101head#0_101common#0_001001head#0_001001001head#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_001001002001common', '浙江保融深圳子公司普通岗', '0_001001002001head', '0_001001002001', null, '#bizroot#0_1head#0_101head#0_101common#0_001001head#0_001001002head#0_001001002001head#0_001001002001common#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_001001002001head', '浙江保融深圳子公司主管岗', '0_001001002head', '0_001001002001', null, '#bizroot#0_1head#0_101head#0_101common#0_001001head#0_001001002head#0_001001002001head#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_001001002common', '浙江保融广州分公司普通岗', '0_001001002head', '0_001001002', null, '#bizroot#0_1head#0_101head#0_101common#0_001001head#0_001001002head#0_001001002common#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_001001002head', '浙江保融广州分公司主管岗', '0_001001head', '0_001001002', null, '#bizroot#0_1head#0_101head#0_101common#0_001001head#0_001001002head#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_001001common', '浙江保融科技有限公司普通岗', '0_001001head', '0_001001', null, '#bizroot#0_1head#0_101head#0_101common#0_001001head#0_001001common#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_001001head', '浙江保融科技有限公司主管岗', '0_101common', '0_001001', null, '#bizroot#0_1head#0_101head#0_101common#0_001001head#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_001002001common', '浙江财资北京分公司普通岗', '0_001002001head', '0_001002001', null, '#bizroot#0_1head#0_101head#0_101common#0_001002head#0_001002001head#0_001002001common#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_001002001head', '浙江财资北京分公司主管岗', '0_001002head', '0_001002001', null, '#bizroot#0_1head#0_101head#0_101common#0_001002head#0_001002001head#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_001002002001common', '浙江财资南京子公司普通岗', '0_001002002001head', '0_001002002001', null, '#bizroot#0_1head#0_101head#0_101common#0_001002head#0_001002002head#0_001002002001head#0_001002002001common#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_001002002001head', '浙江财资南京子公司主管岗', '0_001002002head', '0_001002002001', null, '#bizroot#0_1head#0_101head#0_101common#0_001002head#0_001002002head#0_001002002001head#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_001002002common', '浙江财资江苏分公司普通岗', '0_001002002head', '0_001002002', null, '#bizroot#0_1head#0_101head#0_101common#0_001002head#0_001002002head#0_001002002common#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_001002002head', '浙江财资江苏分公司主管岗', '0_001002head', '0_001002002', null, '#bizroot#0_1head#0_101head#0_101common#0_001002head#0_001002002head#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_001002common', '浙江财资科技有限公司普通岗', '0_001002head', '0_001002', null, '#bizroot#0_1head#0_101head#0_101common#0_001002head#0_001002common#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_001002head', '浙江财资科技有限公司主管岗', '0_101common', '0_001002', null, '#bizroot#0_1head#0_101head#0_101common#0_001002head#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_101common', '浙江保融科技有限公司北京分公司普通岗', '0_101head', '0_101', null, '#bizroot#0_1head#0_101head#0_101common#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_101head', '浙江保融科技有限公司北京分公司主管岗', '0_1head', '0_101', null, '#bizroot#0_1head#0_101head#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_102common', '浙江保融科技有限公司上海分公司普通岗', '0_102head', '0_102', null, '#bizroot#0_1head#0_102head#0_102common#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_102head', '浙江保融科技有限公司上海分公司主管岗', '0_1head', '0_102', null, '#bizroot#0_1head#0_102head#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_10301common', '浙江保融科技有限公司深圳子公司普通岗', '0_10301head', '0_10301', null, '#bizroot#0_1head#0_103head#0_10301head#0_10301common#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_10301head', '浙江保融科技有限公司深圳子公司主管岗', '0_103head', '0_10301', null, '#bizroot#0_1head#0_103head#0_10301head#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_103common', '浙江保融科技有限公司广州分公司普通岗', '0_103head', '0_103', null, '#bizroot#0_1head#0_103head#0_103common#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_103head', '浙江保融科技有限公司广州分公司主管岗', '0_1head', '0_103', null, '#bizroot#0_1head#0_103head#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_1common', '浙江财资科技有限公司普通岗', '0_1head', '0_1', null, '#bizroot#0_1head#0_1common#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_1head', '浙江保融科技有限公司主管岗', 'bizroot', '0_1', null, '#bizroot#0_1head#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_201common', '浙江财资科技有限公司江苏分公司普通岗', '0_201head', '0_201', null, '#bizroot#0_1head#0_2head#0_201head#0_201common#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_201head', '浙江财资科技有限公司江苏分公司主管岗', '0_2head', '0_201', null, '#bizroot#0_1head#0_2head#0_201head#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_202common', '浙江财资科技有限公司河南分公司普通岗', '0_202head', '0_202', null, '#bizroot#0_1head#0_2head#0_202head#0_202common#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_202head', '浙江财资科技有限公司河南分公司主管岗', '0_2head', '0_202', null, '#bizroot#0_1head#0_2head#0_202head#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_2common', '浙江财资科技有限公司普通岗', '0_2head', '0_2', null, '#bizroot#0_1head#0_2head#0_2common#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_2head', '浙江财资科技有限公司主管岗', '0_1head', '0_2', null, '#bizroot#0_1head#0_2head#', null, null, null, null);

-- ----------------------------
-- Table structure for `tsys_pos_user`
-- ----------------------------
DROP TABLE IF EXISTS `tsys_pos_user`;
CREATE TABLE `tsys_pos_user` (
  `position_code` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '岗位编号',
  `user_id` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '用户代码',
  PRIMARY KEY (`user_id`,`position_code`),
  KEY `nk_biz_posuser_pos_code` (`position_code`) USING BTREE,
  KEY `nk_biz_posuser_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='岗位用户关系表';

-- ----------------------------
-- Records of tsys_pos_user
-- ----------------------------

-- ----------------------------
-- Table structure for `tsys_role`
-- ----------------------------
DROP TABLE IF EXISTS `tsys_role`;
CREATE TABLE `tsys_role` (
  `role_code` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '角色编号',
  `role_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '角色名称',
  `creator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `remark` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `parent_id` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '角色父节点标识',
  `role_path` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '角色索引',
  `role_order` decimal(22,0) DEFAULT '0' COMMENT 'QA:角色命令',
  `create_date` datetime DEFAULT NULL COMMENT 'QA:分配时间',
  `modify_date` datetime DEFAULT NULL COMMENT 'QA:最后修改时间',
  `org_id` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '组织ID',
  `tenant_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`role_code`),
  KEY `nk_biz_role_name` (`role_name`) USING BTREE,
  KEY `nk_biz_role_code` (`role_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色表';

-- ----------------------------
-- Records of tsys_role
-- ----------------------------
INSERT INTO `tsys_role` VALUES ('10000001', '平台经办', 'admin', null, null, null, '1', '2017-06-08 10:09:04', '2017-06-27 16:05:11', null, '10000');
INSERT INTO `tsys_role` VALUES ('10000002', '平台复核', 'admin', null, null, null, '2', '2017-06-08 10:09:21', '2017-06-27 16:05:25', null, '10000');
INSERT INTO `tsys_role` VALUES ('10000003', '平台审核', 'admin', null, null, null, '3', '2017-06-08 10:09:35', '2017-06-27 16:05:35', null, '10000');
INSERT INTO `tsys_role` VALUES ('10000101', '银行经办', 'admin', null, null, null, '1', '2017-06-08 10:09:04', '2017-08-29 17:35:22', null, '10000');
INSERT INTO `tsys_role` VALUES ('10000102', '银行复核', 'admin', null, null, null, '2', '2017-06-08 10:09:21', '2017-08-29 17:55:20', null, '10000');
INSERT INTO `tsys_role` VALUES ('10000103', '银行审核', 'admin', null, null, null, '3', '2017-06-08 10:09:35', '2017-08-29 17:52:01', null, '10000');
INSERT INTO `tsys_role` VALUES ('10000104', '银行客户经理', 'admin', null, null, null, '4', '2017-08-28 14:25:17', '2017-10-26 09:42:41', null, '10000');
INSERT INTO `tsys_role` VALUES ('10000105', '银行库管', 'admin', null, null, null, '5', '2017-11-26 11:58:09', '2017-10-26 09:42:22', null, '10000');
INSERT INTO `tsys_role` VALUES ('100001111', '111', 'admin', null, null, null, '1', '2017-11-15 18:39:01', null, null, null);
INSERT INTO `tsys_role` VALUES ('10000121', '1212', 'admin', null, null, null, null, '2017-11-15 18:57:05', null, null, null);
INSERT INTO `tsys_role` VALUES ('100001212121', '121', 'admin', null, null, null, null, '2017-11-15 18:52:34', null, null, null);
INSERT INTO `tsys_role` VALUES ('1000012312', '21312', 'admin', null, null, null, '123123', '2017-11-14 13:36:00', null, '6000001', '10000');
INSERT INTO `tsys_role` VALUES ('10000123123', '123123', 'admin', null, null, null, '-3', null, '2017-11-16 14:55:28', '6000001', '10427');
INSERT INTO `tsys_role` VALUES ('1000012313', '1231231', 'admin', null, null, null, '211', null, '2017-11-15 15:26:40', '6000001', '10462');
INSERT INTO `tsys_role` VALUES ('10000123132', '123123', null, null, null, null, '112', null, null, null, '10000');
INSERT INTO `tsys_role` VALUES ('100001993', '管理者', 'admin', null, null, null, '2', '2017-11-27 09:44:18', '2017-11-27 11:07:18', '6000001', '10000');
INSERT INTO `tsys_role` VALUES ('10000201', '核心企业经办', 'admin', null, null, null, '1', '2017-06-08 10:09:04', '2017-06-27 16:05:11', null, '10000');
INSERT INTO `tsys_role` VALUES ('10000202', '核心企业复核', 'admin', null, null, null, '2', '2017-06-08 10:09:21', '2017-06-27 16:05:25', null, '10000');
INSERT INTO `tsys_role` VALUES ('10000203', '核心企业审核', 'admin', null, null, null, '3', '2017-06-08 10:09:35', '2017-06-27 16:05:35', null, '10000');
INSERT INTO `tsys_role` VALUES ('10000301', '供应商经办', 'admin', null, null, null, '1', '2017-06-08 10:09:04', '2017-06-27 16:05:11', null, '10000');
INSERT INTO `tsys_role` VALUES ('10000302', '供应商复核', 'admin', null, null, null, '2', '2017-06-08 10:09:21', '2017-06-27 16:05:25', null, '10000');
INSERT INTO `tsys_role` VALUES ('10000303', '供应商审核', 'admin', null, null, null, '3', '2017-06-08 10:09:35', '2017-06-27 16:05:35', null, '10000');
INSERT INTO `tsys_role` VALUES ('1000032112312', '231123123123', 'admin', null, null, null, '31121', null, '2017-11-10 16:04:34', null, null);
INSERT INTO `tsys_role` VALUES ('1000033', '3333333', 'admin', null, null, null, '333333', '2017-11-15 18:51:46', '2017-11-15 18:51:49', null, null);
INSERT INTO `tsys_role` VALUES ('10000330', '666', 'admin', null, null, null, '6', '2017-11-14 13:37:14', null, '6000001', '10000');
INSERT INTO `tsys_role` VALUES ('10000444444', '123123', 'admin', null, null, null, '1112', '2017-11-17 13:49:12', null, '6000001', '10000');
INSERT INTO `tsys_role` VALUES ('1000098989898', '8989', 'admin', null, null, null, null, '2017-11-15 18:58:36', null, null, null);
INSERT INTO `tsys_role` VALUES ('admin', '后台权限管理员', 'admin', null, null, null, '1', null, '2017-07-28 10:54:03', '6000001', '10000');

-- ----------------------------
-- Table structure for `tsys_role_right`
-- ----------------------------
DROP TABLE IF EXISTS `tsys_role_right`;
CREATE TABLE `tsys_role_right` (
  `trans_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'QA:交易编号，外键TSYS_SUBTRANS.TRANS_CODE',
  `sub_trans_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'QA:子交易号，外键:TSYS_SUBTRANS.SUB_TRANS_CODE',
  `role_code` varchar(16) COLLATE utf8_bin NOT NULL COMMENT 'QA:授权角色,外键:TSYS_ROLE.ROLE_CODE',
  `create_by` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '分配人',
  `create_date` decimal(22,0) DEFAULT NULL COMMENT '分配时间',
  `begin_date` decimal(22,0) NOT NULL COMMENT '生效时间',
  `end_date` decimal(22,0) NOT NULL COMMENT '失效时间',
  `right_flag` varchar(4) COLLATE utf8_bin NOT NULL COMMENT '用于表示该授权的操作授权标志 取数据字典[SYS_BIZ_RIGHT_FLAG] 1-操作 2-授权',
  `right_enable` varchar(4) COLLATE utf8_bin DEFAULT NULL COMMENT '用于表示该授权的是否禁止标志 取数据字典[SYS_BIZ_RIGHT_ENABLE] 0-禁止 1-可用',
  `tenant_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`trans_code`,`sub_trans_code`,`role_code`,`begin_date`,`end_date`,`right_flag`),
  KEY `nk_biz_roleright_role_code` (`role_code`) USING BTREE,
  KEY `nk_biz_roleright_trans_code` (`trans_code`,`sub_trans_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色权限授权表';

-- ----------------------------
-- Records of tsys_role_right
-- ----------------------------
INSERT INTO `tsys_role_right` VALUES ('BIZFRAME', 'BIZFRAME', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BIZFRAME', 'BIZFRAME', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BIZFRAME', 'BIZFRAME', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BIZFRAME', 'BIZFRAME', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BIZFRAME', 'BIZFRAME', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BIZFRAME', 'BIZFRAME', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BIZFRAME', 'BIZFRAME', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BIZFRAME', 'BIZFRAME', '10000105', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BIZFRAME', 'BIZFRAME', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BIZFRAME', 'BIZFRAME', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BIZFRAME', 'BIZFRAME', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BIZFRAME', 'BIZFRAME', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BIZFRAME', 'BIZFRAME', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BIZFRAME', 'BIZFRAME', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BIZFRAME', 'BIZFRAME', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BIZFRAME', 'BIZFRAME', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'Add', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'Add', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'Add', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'Adjust', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'Adjust', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'Adjust', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'BigContractMgmt', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'BigContractMgmt', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'BigContractMgmt', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'BigContractMgmt', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'BigContractMgmt', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'BigContractMgmt', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'BigContractMgmt', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'BigContractMgmt', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'BigContractMgmt', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'BigContractMgmt', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'BigContractMgmt', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'Cancel', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'Cancel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'Cancel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'Del', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'Del', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'Del', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'Edit', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'Edit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'Edit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'SendApprove', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'SendApprove', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'SendApprove', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'View', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'View', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'View', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'View', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'View', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bcCheckbeforeapprove', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bcCheckbeforeapprove', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bcCheckbeforeapprove', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bcCheckbeforeapprove', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bcCheckbeforeapprove', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bcSendapprovebefore', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bcSendapprovebefore', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bcSendapprovebefore', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bcSendapprovebefore', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bcSendapprovebefore', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bigcontractQuery', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bigcontractQuery', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bigcontractQuery', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bigcontractQuery', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bigcontractQuery', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bigcontractQuery', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bigcontractQuery', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bigcontractQuery', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bigcontractQuery', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bigcontractQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bigcontractQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'filecheck', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'filecheck', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'filecheck', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'filecheck', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'filecheck', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'filedownload', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'filedownload', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'filedownload', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'filedownload', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'filedownload', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('KeyInitConfirmState', 'KeyInitConfirmState', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('KeyInitConfirmState', 'KeyInitConfirmState', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('KeyInitConfirmState', 'KeyInitConfirmState', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('KeyInitConfirmState', 'KeyInitConfirmState', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('KeyInitConfirmState', 'getclosedconfirmation', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('KeyInitConfirmState', 'getclosedconfirmation', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('KeyInitConfirmState', 'getclosedconfirmation', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('KeyInitConfirmState', 'getclosedconfirmation', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountedit', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountedit', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsMgmt', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsMgmt', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsMgmt', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsMgmt', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsMgmt', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsMgmt', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsMgmt', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsMgmt', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsMgmt', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsappeal', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsappeal', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsappeal', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsdel', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsdel', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsdel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsdel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'supplieraccountQuery', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'supplieraccountQuery', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'supplieraccountQuery', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'supplieraccountQuery', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'supplieraccountQuery', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'supplieraccountQuery', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'supplieraccountQuery', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'supplieraccountQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'supplieraccountQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'supplieraccountadd', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'supplieraccountadd', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'supplieraccountadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'supplieraccountadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBflowTaskTodo', 'WBflowTaskTodo', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBflowTaskTodo', 'WBflowTaskTodo', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBflowTaskTodo', 'WBflowTaskTodo', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBflowTaskTodo', 'WBflowTaskTodo', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBflowTaskTodo', 'WBflowTaskTodo', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBflowTaskTodo', 'WBflowTaskTodo', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBflowTaskTodo', 'WBflowTaskTodo', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBflowTaskTodo', 'WBflowTaskTodo', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBflowTaskTodo', 'WBflowTaskTodo', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBflowTaskTodo', 'WBflowTaskTodo', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBflowTaskTodo', 'WBflowTaskTodo', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBflowTaskTodo', 'WBflowTaskTodo', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBflowTaskTodo', 'WBflowTaskTodo', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBflowTaskTodo', 'WBflowTaskTodo', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableChx', 'WBpayableChx', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableChx', 'WBpayableChx', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableChx', 'WBpayableChx', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableChx', 'WBpayableChx', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableIntention', 'WBpayableIntention', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableIntention', 'WBpayableIntention', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableIntention', 'WBpayableIntention', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableIntention', 'WBpayableIntention', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableIntentionApply', 'WBpayableIntentionApply', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableIntentionApply', 'WBpayableIntentionApply', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableIntentionApply', 'WBpayableIntentionApply', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableIntentionList', 'WBpayableIntentionList', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableIntentionList', 'WBpayableIntentionList', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableIntentionList', 'WBpayableIntentionList', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableQuote', 'WBpayableQuote', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableQuote', 'WBpayableQuote', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableQuote', 'WBpayableQuote', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableQuote', 'WBpayableQuote', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBreturnPayableIntentionList', 'WBreturnPayableIntentionList', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBreturnPayableIntentionList', 'WBreturnPayableIntentionList', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBreturnPayableIntentionList', 'WBreturnPayableIntentionList', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBsupportPayableIntentionList', 'WBsupportPayableIntentionList', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBsupportPayableIntentionList', 'WBsupportPayableIntentionList', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBsupportPayableIntentionList', 'WBsupportPayableIntentionList', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBtripartiteAgreementChxTodo', 'WBtripartiteAgreementChxTodo', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBtripartiteAgreementChxTodo', 'WBtripartiteAgreementChxTodo', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBtripartiteAgreementChxTodo', 'WBtripartiteAgreementChxTodo', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBtripartiteAgreementChxTodo', 'WBtripartiteAgreementChxTodo', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBtripartiteAgreementChxTodo', 'WBtripartiteAgreementChxTodo', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBtripartiteAgreementChxTodo', 'WBtripartiteAgreementChxTodo', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBtripartiteAgreementChxTodo', 'WBtripartiteAgreementChxTodo', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBtripartiteAgreementChxTodo', 'WBtripartiteAgreementChxTodo', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBtripartiteAgreementChxTodo', 'WBtripartiteAgreementChxTodo', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBtripartiteAgreementChxTodo', 'WBtripartiteAgreementChxTodo', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBtripartiteAgreementChxTodo', 'WBtripartiteAgreementChxTodo', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('accountTaskTodo', 'accountTaskTodo', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('accountTaskTodo', 'accountTaskTodo', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('accountsPayable', 'accountsPayable', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('accountsPayable', 'accountsPayable', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('accountsPayableQuery', 'accountsPayableQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('accountsPayableQuery', 'accountsPayableQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('accountsPayableSignature', 'accountsPayableSignature', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('accountsPayableSignature', 'accountsPayableSignature', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('accountsPayableSignature', 'accountsPayableSignature', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('accountsPayableSignature', 'accountsPayableSignature', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('accountsPayableSignature', 'accountsPayableSignature', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('accountsPayableSignature', 'accountsPayableSignature', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('accountsPayableSignature', 'accountsPayableSignature', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('accountsPayableSignature', 'accountsPayableSignature', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('agreement', 'agreement', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('agreement', 'agreement', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('agreementQuery', 'agreementQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('agreementQuery', 'agreementQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('agreementTemp', 'agreementTemp', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('agreementTemp', 'agreementTemp', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('agreementTempQuery', 'agreementTempQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('agreementTempQuery', 'agreementTempQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appeal', 'appeal', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appeal', 'appeal', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealDone', 'appealDone', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealDone', 'appealDone', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealDone', 'appealDone', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealDone', 'appealDone', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealDone', 'appealDone', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealDone', 'appealDone', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealMgmt', 'appealMgmt', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealMgmt', 'appealMgmt', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealMgmt', 'appealMgmtActive', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealMgmt', 'appealMgmtActive', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealMgmt', 'appealMgmtAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealMgmt', 'appealMgmtAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealMgmt', 'appealMgmtClose', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealMgmt', 'appealMgmtClose', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealMgmt', 'appealMgmtEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealMgmt', 'appealMgmtEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealMgmt', 'appealMgmtQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealMgmt', 'appealMgmtQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealQuery', 'appealQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealQuery', 'appealQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealStart', 'appealEdit', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealStart', 'appealEdit', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealStart', 'appealEdit', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealStart', 'appealEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealStart', 'appealEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealStart', 'appealStart', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealStart', 'appealStart', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealStart', 'appealStart', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealStart', 'appealStart', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealStart', 'appealStart', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealTodoTask', 'appealTodoArbitrate', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealTodoTask', 'appealTodoArbitrate', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealTodoTask', 'appealTodoArbitrate', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealTodoTask', 'appealTodoDeal', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealTodoTask', 'appealTodoDeal', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealTodoTask', 'appealTodoDeal', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealTodoTask', 'appealTodoEdit', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealTodoTask', 'appealTodoEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealTodoTask', 'appealTodoEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealTodoTask', 'appealTodoSave', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealTodoTask', 'appealTodoSave', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealTodoTask', 'appealTodoSave', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealTodoTask', 'appealTodoTask', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealTodoTask', 'appealTodoTask', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealTodoTask', 'appealTodoTask', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealmsMgmt', 'appealmsMgmt', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealmsMgmt', 'appealmsMgmt', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealmsMgmt', 'appealmsMgmtActive', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealmsMgmt', 'appealmsMgmtActive', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealmsMgmt', 'appealmsMgmtAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealmsMgmt', 'appealmsMgmtAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealmsMgmt', 'appealmsMgmtClose', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealmsMgmt', 'appealmsMgmtClose', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealmsMgmt', 'appealmsMgmtEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealmsMgmt', 'appealmsMgmtEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealmsMgmt', 'appealmsMgmtQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealmsMgmt', 'appealmsMgmtQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealmsMgmt', 'appealmsMgmtarbitrate', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealmsMgmt', 'appealmsMgmtarbitrate', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealmsMgmt', 'appealmsMgmtdeal', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealmsMgmt', 'appealmsMgmtdeal', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('areaMgmt', 'allocateuser', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('areaMgmt', 'allocateuser', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('areaMgmt', 'allocateuser', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('areaMgmt', 'areaMgmt', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('areaMgmt', 'areaMgmt', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('areaMgmt', 'areaMgmt', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('areaMgmt', 'bankjurisdiction', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('areaMgmt', 'bankjurisdiction', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('areaMgmt', 'bankjurisdiction', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('areaMgmt', 'unallocateuser', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('areaMgmt', 'unallocateuser', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('areaMgmt', 'unallocateuser', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankInvite', 'approveSign', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankInvite', 'approveSign', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankInvite', 'approveSign', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankInvite', 'bankInvite', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankInvite', 'bankInvite', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankInvite', 'bankInvite', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankInvite', 'rejectSign', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankInvite', 'rejectSign', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankInvite', 'rejectSign', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankQuota', 'bankQuota', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankQuota', 'bankQuota', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankQuota', 'bankquotaadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankQuota', 'bankquotaadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankQuota', 'bankquotadel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankQuota', 'bankquotadel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankQuota', 'bankquotaedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankQuota', 'bankquotaedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankQuota', 'bankquotaquery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankQuota', 'bankquotaquery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankSupplierRelation', 'bankSupplierRelation', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankSupplierRelation', 'bankSupplierRelation', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankSupplierRelation', 'bankSupplierRelation', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankView', 'bankView', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankView', 'bankView', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankView', 'bankView', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankView', 'bankView', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankView', 'bankView', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('baseSet', 'baseSet', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('baseSet', 'baseSet', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bigContract', 'bigContract', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bigContract', 'bigContract', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bigContractQuery', 'bigContractQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bigContractQuery', 'bigContractQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bigContractSignature', 'bigContractSignature', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bigContractSignature', 'bigContractSignature', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bigContractSignature', 'bigContractSignature', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bigContractSignature', 'bigContractSignature', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bigContractSignature', 'bigContractSignature', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bigContractSignature', 'bigContractSignature', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bigContractSignature', 'bigContractSignature', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bigContractSignature', 'bigContractSignature', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'activate', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'activate', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'activate', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'activate', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'activate', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bigOrgAllocate', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bigOrgAllocate', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bigOrgAllocate', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bigOrgDelAllocate', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bigOrgDelAllocate', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bigOrgDelAllocate', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgAdd', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgAllot', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgAllot', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgCancel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgCancel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgDel', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgDel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgDel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgEdit', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgInitialinfo', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgInitialinfo', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgInitialinfo', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgSet', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgSet', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgSet', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgcate', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgcate', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgcate', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgedits', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgedits', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgedits', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetCache', 'bizSetCache', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetCache', 'bizSetCache', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetCache', 'refreshCache', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetCache', 'refreshCache', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetCache', 'sys01c001', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetCache', 'sys01c001', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetLog', 'bizSetLog', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetLog', 'bizSetLog', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetLog', 'bizSetLogFind', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetLog', 'bizSetLogFind', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetLog', 'bizSetLogStart', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetLog', 'bizSetLogStart', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetLog', 'bizSetLogStop', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetLog', 'bizSetLogStop', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetLog', 'setlog', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetLog', 'setlog', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetMenu', 'bizMenuAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetMenu', 'bizMenuAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetMenu', 'bizMenuDelete', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetMenu', 'bizMenuDelete', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetMenu', 'bizMenuEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetMenu', 'bizMenuEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetMenu', 'bizMenuSort', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetMenu', 'bizMenuSort', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetMenu', 'bizMenuSubtranAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetMenu', 'bizMenuSubtranAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetMenu', 'bizMenuSubtranDete', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetMenu', 'bizMenuSubtranDete', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetMenu', 'bizMenuSubtranEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetMenu', 'bizMenuSubtranEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetMenu', 'bizSetMenu', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetMenu', 'bizSetMenu', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetOrgRole', 'bizOrgRoleAllocate', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetOrgRole', 'bizOrgRoleAllocate', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetOrgRole', 'bizOrgRoleUnallocate', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetOrgRole', 'bizOrgRoleUnallocate', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetOrgRole', 'bizSetOrgRole', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetOrgRole', 'bizSetOrgRole', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetRole', 'bizRoleRightSet', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetRole', 'bizRoleRightSet', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetRole', 'bizSetRole', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetRole', 'bizSetRole', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetRole', 'bizSetRoleAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetRole', 'bizSetRoleAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetRole', 'bizSetRoleDelete', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetRole', 'bizSetRoleDelete', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetRole', 'bizSetRoleEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetRole', 'bizSetRoleEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetRole', 'roleUserAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetRole', 'roleUserAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetRole', 'roleUserDel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetRole', 'roleUserDel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetRole', 'rolesendapprove', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetRole', 'rolesendapprove', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizCancelUR', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizCancelUR', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizCancelUR', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizGiveUR', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizGiveUR', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizGiveUR', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizModifyPwd', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizModifyPwd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizModifyPwd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizOrgCancelUR', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizOrgCancelUR', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizOrgCancelUR', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizOrgGiveUR', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizOrgGiveUR', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizOrgGiveUR', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizResetPass', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizResetPass', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizResetPass', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizSetUser', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizSetUser', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizSetUser', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizUserActivate', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizUserActivate', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizUserActivate', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizUserAdd', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizUserAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizUserAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizUserModfiy', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizUserModfiy', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizUserModfiy', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizUserRemove', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizUserRemove', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizUserRemove', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizUserRightAuth', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizUserRightAuth', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizUserRightAuth', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'userAssigned', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'userAssigned', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'userModifyMobile', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'userModifyMobile', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'userModifyMobile', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'userView', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'userView', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'userView', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUserKey', 'bizSetUserKey', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUserKey', 'bizSetUserKey', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUserKey', 'userBindKey', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUserKey', 'userBindKey', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUserKeyApply', 'bizSetUserKeyApply', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUserKeyApply', 'bizSetUserKeyApply', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSysManager', 'bizSysManager', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSysManager', 'bizSysManager', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizUserManager', 'bizUserManager', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizUserManager', 'bizUserManager', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizUserManager', 'bizUserManager', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchain', 'blockchain', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchain', 'blockchain', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchain', 'blockchain', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchain', 'blockchain', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchain', 'blockchain', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchain', 'blockchain', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchain', 'blockchain', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchain', 'blockchain', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchain', 'blockchain', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchain', 'blockchain', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchain', 'blockchain', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchain', 'blockchain', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainAdd', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainAdd', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainAdd', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainAdd', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainApply', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainApply', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainApply', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainApply', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainApply', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainApplyQuery', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainApplyQuery', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainApplyQuery', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainApplyQuery', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainApplyQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainApplyQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainCancel', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainCancel', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainCancel', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainCancel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainCancel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainDel', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainDel', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainDel', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainDel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainDel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainEdit', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainEdit', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainSend', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainSend', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainSend', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainSend', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainSend', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainSend', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainsend', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainsend', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainsend', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainsend', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainsend', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainsend', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainFind', 'blockchainFind', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainFind', 'blockchainFind', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainFind', 'blockchainFind', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainFind', 'blockchainFind', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainFind', 'blockchainFind', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainFind', 'blockchainFind', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainFind', 'blockchainFind', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainFind', 'blockchainFind', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainFind', 'blockchainFind', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainFind', 'blockchainFind', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainFind', 'blockchainFind', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainFind', 'blockchainFind', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainManage', 'blockchainManage', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainManage', 'blockchainManage', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainManage', 'blockchainManage', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainManage', 'blockchainManage', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainManage', 'blockchainManage', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainManage', 'blockchainManage', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainManage', 'blockchainManage', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainManage', 'blockchainManage', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainManage', 'blockchainManage', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'blockchainNodeManage', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'blockchainNodeManage', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'blockchainNodeManage', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'blockchainNodeManage', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'blockchainNodeManage', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'blockchainNodeManage', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'blockchainNodeManage', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'blockchainNodeManage', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'blockchainNodeManage', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'blockchainNodeManage', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'blockchainNodeManage', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'check', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'check', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'check', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'check', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'check', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'check', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'check', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'check', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'check', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'check', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'check', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'check', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'checkbefore', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'checkbefore', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'checkbefore', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'checkbefore', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'checkbefore', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'checkbefore', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'checkbefore', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'checkbefore', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'checkbefore', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'checkbefore', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'checkbefore', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'checkbefore', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchainView', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchainView', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchainView', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchainView', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchainView', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchainView', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchainView', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchainView', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchainView', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchainView', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchainView', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchainView', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchaingetkey', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchaingetkey', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchaingetkey', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchaingetkey', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchaingetkey', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchaingetkey', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchaingetkey', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchaingetkey', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchaingetkey', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchaingetkey', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchaingetkey', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchaingetkey', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'getfromblockchain', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'getfromblockchain', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'getfromblockchain', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'getfromblockchain', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'getfromblockchain', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'getfromblockchain', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'getfromblockchain', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'getfromblockchain', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'getfromblockchain', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'getfromblockchain', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'getfromblockchain', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'getfromblockchain', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('business', 'business', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('business', 'business', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('business', 'business', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('business', 'business', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('business', 'business', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('business', 'business', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('business', 'business', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('business', 'business', '10000105', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('business', 'business', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('business', 'business', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('business', 'business', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('business', 'business', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('business', 'business', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('business', 'business', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('business', 'business', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('business', 'business', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'base02a001', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'base02a001', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'base02a002', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'base02a002', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendaractive', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendaractive', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendaradd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendaradd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendardel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendardel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendardisactive', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendardisactive', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendaredit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendaredit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendarsManager', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendarsManager', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendarspecialactive', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendarspecialactive', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendarspecialadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendarspecialadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendarspecialdel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendarspecialdel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendarspecialdisactive', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendarspecialdisactive', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendarspecialedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendarspecialedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'checkSignature', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'checkSignature', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'checkSignature', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'checkSignature', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'checkSignature', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'checkSignature', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'checkSignature', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'checkSignature', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'checkSignature', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'checkSignature', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'checkSignature', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'content', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'content', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'content', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'content', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'content', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'content', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'content', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'content', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'content', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'content', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'content', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('comprehensiveQuery', 'comprehensiveQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('comprehensiveQuery', 'comprehensiveQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('cooperation', 'cooperation', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('cooperation', 'cooperation', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('cooperation', 'cooperation', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('cooperation', 'cooperation', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('cooperation', 'cooperation', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('cooperation', 'cooperation', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyFirstBank', 'bankQuotaEdit', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyFirstBank', 'bankQuotaEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyFirstBank', 'bankQuotaEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyFirstBank', 'corecompanyFirstBank', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyFirstBank', 'corecompanyFirstBank', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyFirstBank', 'corecompanyFirstBank', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyFirstBank', 'corecompanyFirstBank', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyFirstBank', 'corecompanyFirstBank', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyInvite', 'applySign', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyInvite', 'applySign', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyInvite', 'applySign', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyInvite', 'corecompanyInvite', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyInvite', 'corecompanyInvite', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyInvite', 'corecompanyInvite', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyQuota', 'corecompanyQuota', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyQuota', 'corecompanyQuota', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyQuota', 'corecompanyQuota', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyQuota', 'corecompanyquotaadd', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyQuota', 'corecompanyquotaadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyQuota', 'corecompanyquotaadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyQuota', 'corecompanyquotadel', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyQuota', 'corecompanyquotadel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyQuota', 'corecompanyquotadel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyQuota', 'corecompanyquotaedit', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyQuota', 'corecompanyquotaedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyQuota', 'corecompanyquotaedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanySupportBank', 'corecompanySupportBank', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanySupportBank', 'corecompanySupportBank', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanySupportBank', 'corecompanySupportBank', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanySupportBank', 'corecompanySupportBank', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanySupportBank', 'corecompanySupportBank', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyView', 'corecompanyView', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyView', 'corecompanyView', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyView', 'corecompanyView', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyView', 'corecompanyView', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyView', 'corecompanyView', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('currencyManage', 'currencyManage', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('currencyManage', 'currencyManage', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('currencyManage', 'currencyadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('currencyManage', 'currencyadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('currencyManage', 'currencydel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('currencyManage', 'currencydel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('currencyManage', 'currencyedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('currencyManage', 'currencyedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('customService', 'customService', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('customService', 'customService', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('customService', 'customService', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('customService', 'customService', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('customService', 'customService', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('customService', 'customService', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('firstBank', 'firstBank', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('firstBank', 'firstBank', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('firstBank', 'firstBank', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('firstBank', 'firstBank', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('firstBank', 'firstBank', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('firstBank', 'querybanklist', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('firstBank', 'querybanklist', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('firstBank', 'querybanklist', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowDelegateMgrnew', 'flowDelegateMgrnew', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowDelegateMgrnew', 'flowDelegateMgrnew', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowDelegateMonitor', 'flowDelegateMonitor', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowDelegateMonitor', 'flowDelegateMonitor', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowDelegateMonitor', 'flowDelegateMonitorAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowDelegateMonitor', 'flowDelegateMonitorAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowDelegateMonitor', 'flowDelegateMonitorDel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowDelegateMonitor', 'flowDelegateMonitorDel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowDelegateMonitor', 'flowDelegateMonitorSet', 'admin', 'amdin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowDelegateMonitor', 'flowDelegateMonitorSet', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowDelegateMonitor', 'flowDelegateMonitorStateChange', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowDelegateMonitor', 'flowDelegateMonitorStateChange', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowForm', 'flowForm', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowForm', 'flowForm', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowFormKind', 'flowFormKind', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowFormKind', 'flowFormKind', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowFormKind', 'workflowFormTypeAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowFormKind', 'workflowFormTypeAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowFormKind', 'workflowFormTypeDel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowFormKind', 'workflowFormTypeDel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowFormKind', 'workflowFormTypeModfiy', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowFormKind', 'workflowFormTypeModfiy', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowFormReg', 'flowFormReg', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowFormReg', 'flowFormReg', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowFormReg', 'workflowFormRegAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowFormReg', 'workflowFormRegAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowFormReg', 'workflowFormRegEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowFormReg', 'workflowFormRegEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowFormReg', 'workflowFormRegRemove', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowFormReg', 'workflowFormRegRemove', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowDesignProcDesignFind', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowDesignProcDesignFind', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowDesignProcExp', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowDesignProcExp', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowDesignProcFormBind', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowDesignProcFormBind', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowDesignProcImp', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowDesignProcImp', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowDesignProcModfiy', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowDesignProcModfiy', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowDesignProcPublish', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowDesignProcPublish', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowDesignProcRemove', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowDesignProcRemove', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowDesignProcSave', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowDesignProcSave', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowManaDesign', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowManaDesign', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaProcKind', 'flowManaProcKind', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaProcKind', 'flowManaProcKind', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaProcKind', 'flowProcTypeModfiy', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaProcKind', 'flowProcTypeModfiy', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaProcKind', 'flowProcTypeRemove', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaProcKind', 'flowProcTypeRemove', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaProcKind', 'flowProcTypeSave', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaProcKind', 'flowProcTypeSave', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManage', 'flowManage', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManage', 'flowManage', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMenu', 'flowMenu', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMenu', 'flowMenu', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMoniInstance', 'flowMoniInstance', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMoniInstance', 'flowMoniInstance', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMoniInstance', 'flowMonitorInstanceDel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMoniInstance', 'flowMonitorInstanceDel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMoniInstance', 'flowMonitorInstanceResume', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMoniInstance', 'flowMonitorInstanceResume', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMoniInstance', 'flowMonitorInstanceSuspend', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMoniInstance', 'flowMonitorInstanceSuspend', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMoniInstance', 'flowMonitorInstanceTerminate', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMoniInstance', 'flowMonitorInstanceTerminate', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMoniInstance', 'flowMonitorInstanceViewchange', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMoniInstance', 'flowMonitorInstanceViewchange', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMoniInstance', 'flowMonitorInstanceViewdiagram', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMoniInstance', 'flowMonitorInstanceViewdiagram', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMoniInstance', 'flowMonitorInstanceViewtrace', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMoniInstance', 'flowMonitorInstanceViewtrace', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMonitor', 'flowMonitor', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMonitor', 'flowMonitor', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMyProcessFinished', 'flowMyProcessFinished', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMyProcessFinished', 'flowMyProcessFinished', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMyProcessUnfinished', 'flowMyProcessUnfinished', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMyProcessUnfinished', 'flowMyProcessUnfinished', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowTask', 'flowTask', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowTask', 'flowTask', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowTaskHistory', 'flowTaskHistory', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowTaskHistory', 'flowTaskHistory', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowTaskTodo', 'flowTaskTodo', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowTaskTodo', 'flowTaskTodo', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('gasMgmt', 'gasMgmt', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('gasMgmt', 'gasMgmt', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('gasaccount', 'gasaccount', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('gasaccount', 'gasaccount', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('gasaccount', 'gasacctadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('gasaccount', 'gasacctadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('gasaccount', 'gasacctedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('gasaccount', 'gasacctedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('gastransactions', 'gastranadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('gastransactions', 'gastranadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('gastransactions', 'gastransactions', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('gastransactions', 'gastransactions', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('gastransactions', 'gastransedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('gastransactions', 'gastransedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('generalSettings', 'generalSettings', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'certapplydownload', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'certapplydownload', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'certapplydownload', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'certapplydownload', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'checkvalidempty', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'checkvalidempty', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'checkvalidempty', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'checkvalidempty', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'getclosedconfirmation', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'getclosedconfirmation', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'getclosedconfirmation', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'getclosedconfirmation', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'getconfirmation', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'getconfirmation', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'getconfirmation', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'getconfirmation', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'keyInit', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'keyInit', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'keyInit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'keyInit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'keypostsign', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'keypostsign', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'keypostsign', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'keypostsign', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInitRecord', 'getclosedconfirmation', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInitRecord', 'getclosedconfirmation', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInitRecord', 'getclosedconfirmation', '10000105', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInitRecord', 'getclosedconfirmation', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInitRecord', 'getclosedconfirmation', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInitRecord', 'getconfirmationfromblockchain', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInitRecord', 'getconfirmationfromblockchain', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInitRecord', 'getconfirmationfromblockchain', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInitRecord', 'getconfirmationfromblockchain', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInitRecord', 'keyInitRecord', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInitRecord', 'keyInitRecord', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInitRecord', 'keyInitRecord', '10000105', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInitRecord', 'keyInitRecord', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInitRecord', 'keyInitRecord', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'keyInventoryMgmt', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'keyInventoryMgmt', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'keyInventoryMgmt', '10000105', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'keyInventoryMgmt', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'keyInventoryMgmt', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'keyinventoryadd', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'keyinventoryadd', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'keyinventoryadd', '10000105', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'keyinventoryadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'keyinventoryadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'keyinventoryedit', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'keyinventoryedit', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'keyinventoryedit', '10000105', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'keyinventoryedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'keyinventoryedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'remove', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'remove', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'remove', '10000105', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'remove', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'remove', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'stock', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'stock', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'stock', '10000105', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'stock', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'stock', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'apply', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'apply', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'apply', '10000105', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'apply', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'apply', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'approve', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'approve', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'approve', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'confirm', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'confirm', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'confirm', '10000105', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'confirm', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'confirm', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'keyPurchase', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'keyPurchase', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'keyPurchase', '10000105', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'keyPurchase', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'keyPurchase', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageAppeal', 'manageAppeal', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageAppeal', 'manageAppeal', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageAppeal', 'manageAppeal', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageAppeal', 'manageAppeal', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageAppeal', 'manageAppeal', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageAppeal', 'manageAppeal', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageBank', 'manageBank', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageBank', 'manageBank', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageBank', 'manageBank', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageBank', 'manageBank', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageBank', 'manageBank', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageBigContract', 'manageBigContract', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageBigContract', 'manageBigContract', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageBigContract', 'manageBigContract', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageBigContract', 'manageBigContract', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageBigContract', 'manageBigContract', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageBigContract', 'manageBigContract', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageBigContract', 'manageBigContract', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageBigContract', 'manageBigContract', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageBigContract', 'manageBigContract', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageBigContract', 'manageBigContract', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageBigContract', 'manageBigContract', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageCoreCompany', 'manageCoreCompany', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageCoreCompany', 'manageCoreCompany', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageCoreCompany', 'manageCoreCompany', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageCoreCompany', 'manageCoreCompany', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageCoreCompany', 'manageCoreCompany', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageCoreCompany', 'manageCoreCompany', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageCoreCompany', 'manageCoreCompany', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageCoreCompany', 'manageCoreCompany', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageCoreCompany', 'manageCoreCompany', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageFuel', 'manageFuel', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageFuel', 'manageFuel', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageFuel', 'manageFuel', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageFuel', 'manageFuel', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageFuel', 'manageFuel', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageFuel', 'manageFuel', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageFuel', 'manageFuel', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageFuel', 'manageFuel', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageFuel', 'manageFuel', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageFuel', 'manageFuel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageFuel', 'manageFuel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageIntegral', 'manageIntegral', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageIntegral', 'manageIntegral', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageIntegral', 'manageIntegral', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageIntegral', 'manageIntegral', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageIntegral', 'manageIntegral', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageIntegral', 'manageIntegral', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageIntegral', 'manageIntegral', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageIntegral', 'manageIntegral', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageIntegral', 'manageIntegral', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageIntegral', 'manageIntegral', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageIntegral', 'manageIntegral', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageKeys', 'manageKeys', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageKeys', 'manageKeys', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageKeys', 'manageKeys', '10000105', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageKeys', 'manageKeys', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageKeys', 'manageKeys', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageKeys', 'manageKeys', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageKeys', 'manageKeys', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageOrg', 'manageOrg', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageOrg', 'manageOrg', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageOrg', 'manageOrg', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageOrgRelation', 'manageOrgRelation', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageOrgRelation', 'manageOrgRelation', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageOrgRelation', 'manageOrgRelation', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageOrgUser', 'manageOrgUser', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageOrgUser', 'manageOrgUser', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageOrgUser', 'manageOrgUser', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('managePayable', 'managePayable', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('managePayable', 'managePayable', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('managePayable', 'managePayable', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('managePayable', 'managePayable', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('managePayable', 'managePayable', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageProvider', 'manageProvider', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageProvider', 'manageProvider', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageProvider', 'manageProvider', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageProvider', 'manageProvider', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageProvider', 'manageProvider', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageProvider', 'manageProvider', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageProvider', 'manageProvider', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageProvider', 'manageProvider', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageRecable', 'manageRecable', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageRecable', 'manageRecable', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageRecable', 'manageRecable', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageRecable', 'manageRecable', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageRecable', 'manageRecable', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageRecable', 'manageRecableRevoke', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageRecable', 'manageRecableRevoke', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageRecable', 'manageRecableRevoke', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageServiceBank', 'manageServiceBank', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageServiceBank', 'manageServiceBank', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageServiceBank', 'manageServiceBank', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageServiceBank', 'manageServiceBank', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageServiceBank', 'manageServiceBank', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSignature', 'manageSignature', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSignature', 'manageSignature', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSignature', 'manageSignature', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSignature', 'manageSignature', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSignature', 'manageSignature', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSignature', 'manageSignature', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSignature', 'manageSignature', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSignature', 'manageSignature', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSignature', 'manageSignature', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSignature', 'manageSignature', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSignature', 'manageSignature', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSupplierAccount', 'manageSupplierAccount', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSupplierAccount', 'manageSupplierAccount', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSupplierAccount', 'manageSupplierAccount', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSupplierAccount', 'manageSupplierAccount', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSupplierAccount', 'manageSupplierAccount', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSupplierAccount', 'manageSupplierAccount', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSupplierAccount', 'manageSupplierAccount', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSupplierAccount', 'manageSupplierAccount', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSupplierAccount', 'manageSupplierAccount', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTradeContract', 'manageTradeContract', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTradeContract', 'manageTradeContract', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTradeContract', 'manageTradeContract', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTradeContract', 'manageTradeContract', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTradeContract', 'manageTradeContract', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTradeContract', 'manageTradeContract', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTradeContract', 'manageTradeContract', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTradeContract', 'manageTradeContract', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTradeContract', 'manageTradeContract', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTradeContract', 'manageTradeContract', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTradeContract', 'manageTradeContract', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTripartiteAgreement', 'manageTripartiteAgreement', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTripartiteAgreement', 'manageTripartiteAgreement', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTripartiteAgreement', 'manageTripartiteAgreement', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTripartiteAgreement', 'manageTripartiteAgreement', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTripartiteAgreement', 'manageTripartiteAgreement', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTripartiteAgreement', 'manageTripartiteAgreement', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTripartiteAgreement', 'manageTripartiteAgreement', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTripartiteAgreement', 'manageTripartiteAgreement', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTripartiteAgreement', 'manageTripartiteAgreement', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTripartiteAgreement', 'manageTripartiteAgreement', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTripartiteAgreement', 'manageTripartiteAgreement', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTripartiteAgreement', 'manageTripartiteAgreement', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'approveUrl', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'approveUrl', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'approveUrl', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'approveUrl', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'approveUrl', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'approveUrl', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'approveUrl', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'approveUrl', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'disapproveUrl', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'disapproveUrl', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'disapproveUrl', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'disapproveUrl', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'disapproveUrl', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'disapproveUrl', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'disapproveUrl', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'disapproveUrl', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'examineTest', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'examineTest', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'examineTest', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'examineTest', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'examineTest', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'examineTest', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'examineTest', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'examineTest', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'examineTest', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'examineTest', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'getagreetemplate', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'getagreetemplate', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'getagreetemplate', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'match', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'match', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'match', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'match', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'match', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'match', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'match', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'match', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'match', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'match', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'match', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'matchgetbigcontract', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'matchgetbigcontract', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'matchgetbigcontract', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'querysigninfo', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'querysigninfo', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'querysigninfo', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'querysigninfo', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'querysigninfo', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'querysigninfo', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'querysigninfo', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'querysigninfo', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'querysigninfo', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'querysigninfo', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('noticesManager', 'base02a003', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('noticesManager', 'base02a003', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('noticesManager', 'noticeadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('noticesManager', 'noticeadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('noticesManager', 'noticedel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('noticesManager', 'noticedel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('noticesManager', 'noticeedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('noticesManager', 'noticeedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('noticesManager', 'noticesManager', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('noticesManager', 'noticesManager', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgBankRelation', 'orgBankRelation', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgBankRelation', 'orgBankRelation', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgBankRelation', 'orgBankRelation', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'orgContractMgmt', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'orgContractMgmt', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'orgContractMgmt', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'organizationactive', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'organizationactive', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'organizationactive', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'organizationadd', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'organizationadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'organizationadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'organizationclose', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'organizationclose', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'organizationclose', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'organizationdel', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'organizationdel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'organizationdel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'organizationedit', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'organizationedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'organizationedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgSupplierRelation', 'orgSupplierRelation', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgSupplierRelation', 'orgSupplierRelation', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgSupplierRelation', 'orgSupplierRelation', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('organization', 'organization', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('organization', 'organization', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('organizationContact', 'organizationContact', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('organizationContact', 'organizationContact', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('organizationQuery', 'organizationQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('organizationQuery', 'organizationQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableChx', 'payableChx', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableChx', 'payableChx', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableChx', 'payableChx', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableChx', 'payableChx', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableExpireList', 'payableExpireList', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableExpireList', 'payableExpireList', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableExpireList', 'payableExpireList', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableExpireList', 'payableExpireList', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableExpireList', 'payableExpireList', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntention', 'payableIntention', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntention', 'payableIntention', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntention', 'payableIntention', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntention', 'payableIntention', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionApply', 'payableIntentionApply', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionApply', 'payableIntentionApply', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionApply', 'payableIntentionApply', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionApply', 'submitFinancingApplicationUrl', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionApply', 'submitFinancingApplicationUrl', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionApply', 'submitFinancingApplicationUrl', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionList', 'abandonPriorityUrl', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionList', 'abandonPriorityUrl', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionList', 'abandonPriorityUrl', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionList', 'payableIntentionList', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionList', 'payableIntentionList', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionList', 'payableIntentionList', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionList', 'payableIntentionList', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionList', 'queryUrl', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionList', 'queryUrl', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionList', 'queryUrl', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionList', 'submitQuoteUrl', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionList', 'submitQuoteUrl', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionList', 'submitQuoteUrl', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableAdd', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableApprovesigninfo', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableApprovesigninfo', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableApprovesigninfo', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableApprovesigninfo', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableApprovesigninfo', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableDel', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableDel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableDel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableDownloadResults', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableDownloadResults', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableDownloadResults', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableDownloadtemplate', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableDownloadtemplate', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableDownloadtemplate', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableEdit', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableEditRate', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableEditRate', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableEditRate', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableExtend', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableExtend', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableExtend', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableImportdata', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableImportdata', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableImportdata', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayablePublish', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayablePublish', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayablePublish', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableQuery', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableQuery', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableQuery', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableRevoke', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableRevoke', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableRevoke', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'payableMgmt', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'payableMgmt', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'payableMgmt', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'payableMgmt', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'payableMgmt', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableQuote', 'payableQuote', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableQuote', 'payableQuote', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableQuote', 'payableQuote', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableQuote', 'payableQuote', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableQuote', 'returnQuote', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableQuote', 'returnQuote', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableQuote', 'returnQuote', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableQuote', 'returnQuote', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableQuoteQuery', 'payableQuoteQuery', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableQuoteQuery', 'payableQuoteQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableQuoteQuery', 'payableQuoteQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('platformTemplate', 'platformTemplate', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('platformTemplate', 'platformTemplate', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('platformTemplateManage', 'plaformTemplateedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('platformTemplateManage', 'plaformTemplateedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('platformTemplateManage', 'plaformtemplateadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('platformTemplateManage', 'plaformtemplateadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('platformTemplateManage', 'platformTemplateManage', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('platformTemplateManage', 'platformTemplateManage', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('recableQuoteQuery', 'recableQuoteQuery', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('recableQuoteQuery', 'recableQuoteQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('recableQuoteQuery', 'recableQuoteQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('regionMgmt', 'regionMgmt', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('regionMgmt', 'regionMgmt', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('returnPayableIntentionList', 'resubmitQuote', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('returnPayableIntentionList', 'resubmitQuote', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('returnPayableIntentionList', 'resubmitQuote', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('returnPayableIntentionList', 'returnPayableIntentionList', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('returnPayableIntentionList', 'returnPayableIntentionList', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('returnPayableIntentionList', 'returnPayableIntentionList', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'base05a001', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'base05a001', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'base05a002', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'base05a002', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'base05a003', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'base05a003', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'base05a004', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'base05a004', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'schedule', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'schedule', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'scheduleadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'scheduleadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'scheduledel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'scheduledel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'scheduleedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'scheduleedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'schedulepause', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'schedulepause', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'schedulerun', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'schedulerun', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'schedulestart', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'schedulestart', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('signature', 'signature', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('signature', 'signature', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('signature', 'signature', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('signature', 'signature', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('signature', 'signature', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('signature', 'signature', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierAccount', 'supplierAccount', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierAccount', 'supplierAccount', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierAccountQuery', 'supplierAccountQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierAccountQuery', 'supplierAccountQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierBlackList', 'supplierBlackList', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierBlackList', 'supplierBlackList', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierBlackList', 'supplierBlackList', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierBlackList', 'supplierBlackList', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierBlackList', 'supplierBlackList', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierBlackList', 'supplierblacklistpull', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierBlackList', 'supplierblacklistpull', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierBlackList', 'supplierblacklistpull', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierView', 'supplierView', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierView', 'supplierView', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierView', 'supplierView', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierView', 'supplierView', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierView', 'supplierView', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'coreindividuationedit', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'coreindividuationedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'coreindividuationedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'coremodifyrate', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'coremodifyrate', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'coremodifyrate', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'pull', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'pull', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'pull', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'supplierWhiteList', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'supplierWhiteList', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'supplierWhiteList', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'supplierWhiteList', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'supplierWhiteList', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'supplierblacklistedit', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'supplierblacklistedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'supplierblacklistedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportBank', 'BankListQuery', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportBank', 'BankListQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportBank', 'BankListQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportBank', 'supportBank', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportBank', 'supportBank', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportBank', 'supportBank', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportBank', 'supportBank', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportBank', 'supportBank', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportPayableIntentionList', 'supportPayableIntentionList', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportPayableIntentionList', 'supportPayableIntentionList', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportPayableIntentionList', 'supportPayableIntentionList', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportPayableIntentionList', 'supportPayableIntentionList', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportPayableIntentionList', 'supportQueryUrl', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportPayableIntentionList', 'supportQueryUrl', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportPayableIntentionList', 'supportQueryUrl', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportPayableIntentionList', 'supportSubmitQuote', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportPayableIntentionList', 'supportSubmitQuote', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportPayableIntentionList', 'supportSubmitQuote', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscompany', 'syscompany', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscompany', 'syscompany', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscompanyinfo', 'syscompanyinfo', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscompanyinfo', 'syscompanyinfo', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscompanyinfo', 'tenantAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscompanyinfo', 'tenantAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscompanyinfo', 'tenantDel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscompanyinfo', 'tenantDel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscompanyinfo', 'tenantEidt', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscompanyinfo', 'tenantEidt', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscontract', 'syscontract', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscontract', 'syscontract', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscontract', 'syscontractAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscontract', 'syscontractAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscontract', 'syscontractDel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscontract', 'syscontractDel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscontract', 'syscontractEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscontract', 'syscontractEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syspackage', 'syspackage', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syspackage', 'syspackage', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syspackage', 'syspackageActive', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syspackage', 'syspackageActive', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syspackage', 'syspackageAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syspackage', 'syspackageAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syspackage', 'syspackageClose', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syspackage', 'syspackageClose', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syspackage', 'syspackageDel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syspackage', 'syspackageDel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syspackage', 'syspackageEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syspackage', 'syspackageEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syspackage', 'syspackageSet', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syspackage', 'syspackageSet', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syspackage', 'syspackageView', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syspackage', 'syspackageView', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemParam', 'systemParam', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemParam', 'systemParam', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemParamManage', 'base03a001', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemParamManage', 'base03a001', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemParamManage', 'base03a002', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemParamManage', 'base03a002', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemParamManage', 'base03a003', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemParamManage', 'base03a003', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemParamManage', 'parammanageadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemParamManage', 'parammanageadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemParamManage', 'parammanagedel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemParamManage', 'parammanagedel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemParamManage', 'parammanageedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemParamManage', 'parammanageedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemParamManage', 'systemParamManage', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemParamManage', 'systemParamManage', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemsettings', 'systemsettings', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('taTemplateSignature', 'taTemplateSignature', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('taTemplateSignature', 'taTemplateSignature', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('taTemplateSignature', 'taTemplateSignature', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('taTemplateSignature', 'taTemplateSignature', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('taTemplateSignature', 'taTemplateSignature', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('taTemplateSignature', 'taTemplateSignature', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('taTemplateSignature', 'taTemplateSignature', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('taTemplateSignature', 'taTemplateSignature', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('task', 'task', 'admin', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'sys99a006', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'sys99a006', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'sys99a007', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'sys99a007', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'tdrcownerconfigadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'tdrcownerconfigadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'tdrcownerconfigdel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'tdrcownerconfigdel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'tdrcownerconfigedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'tdrcownerconfigedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'tdrctablelist', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'tdrctablelist', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'tdrctablelistadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'tdrctablelistadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'tdrctablelistdel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'tdrctablelistdel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'tdrctablelistedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'tdrctablelistedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tenant', 'tenant', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('thsiright', 'thsirightadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('thsiright', 'thsirightadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('thsiright', 'thsirightdel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('thsiright', 'thsirightdel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('thsiright', 'thsirightedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('thsiright', 'thsirightedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('thsiright', 'tsvcinterface', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('thsiright', 'tsvcinterface', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('trade', 'trade', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('trade', 'trade', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('trade', 'trade', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('trade', 'trade', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('trade', 'trade', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('trade', 'trade', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('trade', 'trade', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('trade', 'trade', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('trade', 'trade', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('trade', 'trade', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('trade', 'trade', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('trade', 'trade', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('trade', 'trade', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('trade', 'trade', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountBalance', 'tradeAccountBalance', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountBalance', 'tradeAccountBalance', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountBalance', 'tradeAccountBalance', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountBalance', 'tradeAccountBalance', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountBalance', 'tradeAccountBalance', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountBalance', 'tradeAccountBalance', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountBalance', 'tradeAccountBalance', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountBalance', 'tradeAccountBalance', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountBalance', 'tradeAccountBalance', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountBalance', 'tradeAccountappeal', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountBalance', 'tradeAccountappeal', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountBalance', 'tradeAccountappeal', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountBalance', 'tradeAccountappeal', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradeAccountDetail', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradeAccountDetail', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradeAccountDetail', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradeAccountDetail', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradeAccountDetail', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradeAccountDetail', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradeAccountDetail', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradeAccountDetail', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradeAccountDetail', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradeAccountDetail', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradeAccountDetail', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionAdd', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionApprove', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionApprove', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionApprove', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionApprvebefore', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionApprvebefore', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionApprvebefore', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionApprvebefore', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionDel', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionDel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionDel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionEdit', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionQuery', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionQuery', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionQuery', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionQuery', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionQuery', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionQuery', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionQuery', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeAccountMgmt', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeAccountMgmt', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeAccountMgmt', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeaccountAdd', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeaccountAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeaccountAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeaccountDel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeaccountDel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeaccountEdit', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeaccountEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeaccountEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeaccountQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeaccountQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeaccountactive', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeaccountactive', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeaccountclose', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeaccountclose', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccounts', 'tradeAccounts', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccounts', 'tradeAccounts', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountsQuery', 'tradeAccountsQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountsQuery', 'tradeAccountsQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeBalance', 'tradeBalance', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeBalance', 'tradeBalance', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeTransaction', 'tradeTransaction', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeTransaction', 'tradeTransaction', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChx', 'tripartiteAgreementChx', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChx', 'tripartiteAgreementChx', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChx', 'tripartiteAgreementChx', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChx', 'tripartiteAgreementChx', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChx', 'tripartiteAgreementChx', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChx', 'tripartiteAgreementChx', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChx', 'tripartiteAgreementChx', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChx', 'tripartiteAgreementChx', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChx', 'tripartiteAgreementChx', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChx', 'tripartiteAgreementChx', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxDone', 'tripartiteAgreementChxDone', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxDone', 'tripartiteAgreementChxDone', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxDone', 'tripartiteAgreementChxDone', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxDone', 'tripartiteAgreementChxDone', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxDone', 'tripartiteAgreementChxDone', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxDone', 'tripartiteAgreementChxDone', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxDone', 'tripartiteAgreementChxDone', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxDone', 'tripartiteAgreementChxDone', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxDone', 'tripartiteAgreementChxDone', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxDone', 'tripartiteAgreementChxDone', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taApprove', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taApprove', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taApprove', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taApprove', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taApprove', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taApprove', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taApprove', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taApprove', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taApprove', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taApprove', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taDisapprove', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taDisapprove', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taDisapprove', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taDisapprove', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taDisapprove', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taDisapprove', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taDisapprove', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taDisapprove', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taDisapprove', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taDisapprove', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taQuerySigninfo', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taQuerySigninfo', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taQuerySigninfo', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taQuerySigninfo', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taQuerySigninfo', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taQuerySigninfo', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taQuerySigninfo', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taQuerySigninfo', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taQuerySigninfo', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taQuerySigninfo', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'tripartiteAgreementChxTodo', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'tripartiteAgreementChxTodo', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'tripartiteAgreementChxTodo', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'tripartiteAgreementChxTodo', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'tripartiteAgreementChxTodo', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'tripartiteAgreementChxTodo', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'tripartiteAgreementChxTodo', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'tripartiteAgreementChxTodo', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'tripartiteAgreementChxTodo', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'tripartiteAgreementChxTodo', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'base', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'base', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'base', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'base', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'base', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'base', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'base', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'base', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'base', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'base', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'base', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'gather', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'gather', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'gather', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'load', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'load', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'load', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'taDoneQuery', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'taDoneQuery', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'taDoneQuery', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'taDoneQuery', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'taDoneQuery', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'taDoneQuery', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'taDoneQuery', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'taDoneQuery', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'taDoneQuery', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'taDoneQuery', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'taDoneQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'taDoneQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementDone', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementDone', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementDone', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementDone', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementDone', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementDone', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementDone', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementDone', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementDone', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementDone', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementDone', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementDone', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementappeal', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementappeal', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementappeal', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementappeal', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', '10000105', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementMgmt', 'taApplyQuerysigninfo', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementMgmt', 'taApplyQuerysigninfo', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementMgmt', 'taApplyQuerysigninfo', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementAbolish', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementAbolish', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementAdd', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementMgmt', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementMgmt', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementMgmt', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementQuery', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementWithdraw', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementWithdraw', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'abolish', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'abolish', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'taRunningQuery', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'taRunningQuery', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'taRunningQuery', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'taRunningQuery', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'taRunningQuery', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'taRunningQuery', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'taRunningQuery', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'taRunningQuery', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'taRunningQuery', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'taRunningQuery', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'taRunningQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'taRunningQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'tripartiteAgreementRunning', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'tripartiteAgreementRunning', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'tripartiteAgreementRunning', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'tripartiteAgreementRunning', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'tripartiteAgreementRunning', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'tripartiteAgreementRunning', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'tripartiteAgreementRunning', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'tripartiteAgreementRunning', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'tripartiteAgreementRunning', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'tripartiteAgreementRunning', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'tripartiteAgreementRunning', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'tripartiteAgreementRunning', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'withdraw', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'withdraw', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'withdraw', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementSignature', 'tripartiteAgreementSignature', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementSignature', 'tripartiteAgreementSignature', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementSignature', 'tripartiteAgreementSignature', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementSignature', 'tripartiteAgreementSignature', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementSignature', 'tripartiteAgreementSignature', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementSignature', 'tripartiteAgreementSignature', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementSignature', 'tripartiteAgreementSignature', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementSignature', 'tripartiteAgreementSignature', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementSignature', 'tripartiteAgreementSignature', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementSignature', 'tripartiteAgreementSignature', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementSignature', 'tripartiteAgreementSignature', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateAdd', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateCancel', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateCancel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateCancel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateDel', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateDel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateDel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateEdit', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateQuery', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateQuery', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateQuery', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateQuery', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateQuery', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateQuery', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateSend', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateSend', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateSend', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateSendbefore', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateSendbefore', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateSendbefore', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateView', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateView', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templatecheckbeforeapprove', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templatecheckbeforeapprove', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templatecheckbeforeapprove', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templatecheckbeforeapprove', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templatecheckbeforeapprove', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templatecheckbeforeapprove', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templatecheckbeforeapprove', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templatesendapprovebefore', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templatesendapprovebefore', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templatesendapprovebefore', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templatesendapprovebefore', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templatesendapprovebefore', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templatesendapprovebefore', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templatesendapprovebefore', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'tripartiteAgreementTempMgmt', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'tripartiteAgreementTempMgmt', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'tripartiteAgreementTempMgmt', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'tripartiteAgreementTempMgmt', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'tripartiteAgreementTempMgmt', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'tripartiteAgreementTempMgmt', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'tripartiteAgreementTempMgmt', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'tripartiteAgreementTempMgmt', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'create', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'create', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'getdata', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'getdata', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'gethead', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'gethead', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'save', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'save', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'set', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'set', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'sqladd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'sqladd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'sqledit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'sqledit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterface', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterface', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterfaceAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterfaceAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterfaceDel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterfaceDel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterfaceEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterfaceEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterfaceadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterfaceadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterfacedel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterfacedel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterfaceedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterfaceedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterfaceinitexportdata', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterfaceinitexportdata', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterfaceinitimportdata', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterfaceinitimportdata', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcviewconfigadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcviewconfigadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcviewconfigdel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcviewconfigdel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcviewconfigedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcviewconfigedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcviewconfiginitexportdata', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcviewconfiginitexportdata', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcmanage', 'tsvcmanage', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcmanage', 'tsvcmanage', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcsql', 'tsvcinterface', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcsql', 'tsvcinterface', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcsql', 'tsvcsqladd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcsql', 'tsvcsqladd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcsql', 'tsvcsqldel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcsql', 'tsvcsqldel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcsql', 'tsvcsqledit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcsql', 'tsvcsqledit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcviewconfig', 'tsvcinterface', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcviewconfig', 'tsvcinterface', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcviewconfig', 'tsvcviewconfigdel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcviewconfig', 'tsvcviewconfigdel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcviewconfig', 'tsvcviewconfigeadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcviewconfig', 'tsvcviewconfigeadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcviewconfig', 'tsvcviewconfigedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcviewconfig', 'tsvcviewconfigedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('userManager', 'userManager', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('userManager', 'userManager', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('warning', 'warning', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('warning', 'warning', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningAnnulMessage', 'warningAnnulMessage', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningAnnulMessage', 'warningAnnulMessage', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningManage', 'warningManage', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningManage', 'warningManage', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningMessage', 'annul', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningMessage', 'annul', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningMessage', 'warningMessage', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningMessage', 'warningMessage', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningObject', 'warningObject', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningObject', 'warningObject', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningObject', 'warningObjectAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningObject', 'warningObjectAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningObject', 'warningObjectDel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningObject', 'warningObjectDel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningObject', 'warningObjectEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningObject', 'warningObjectEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningRule', 'warningRule', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningRule', 'warningRule', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningRule', 'warningRuleAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningRule', 'warningRuleAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningRule', 'warningRuleDel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningRule', 'warningRuleDel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningRule', 'warningRuleEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningRule', 'warningRuleEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('workBench', 'workBench', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('workBench', 'workBench', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('workBench', 'workBench', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('workBench', 'workBench', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('workBench', 'workBench', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('workBench', 'workBench', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('workBench', 'workBench', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('workBench', 'workBench', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('workBench', 'workBench', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('workBench', 'workBench', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('workBench', 'workBench', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('workBench', 'workBench', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('workBench', 'workBench', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('workBench', 'workBench', 'admin', 'admin', '0', '0', '0', '2', null, null);

-- ----------------------------
-- Table structure for `tsys_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `tsys_role_user`;
CREATE TABLE `tsys_role_user` (
  `user_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'QA:交易编号，外键TSYS_SUBTRANS.TRANS_CODE',
  `role_code` varchar(16) COLLATE utf8_bin NOT NULL COMMENT 'QA:角色编号,外键:TSYS_ROLE.ROLE_CODE',
  `right_flag` varchar(4) COLLATE utf8_bin NOT NULL COMMENT '1-操作角色 2-授权角色',
  `tenant_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`user_code`,`role_code`,`right_flag`),
  KEY `nk_biz_roleuser_ru` (`user_code`,`role_code`) USING BTREE,
  KEY `nk_roleuser_role` (`role_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色用户关系表';

-- ----------------------------
-- Records of tsys_role_user
-- ----------------------------
INSERT INTO `tsys_role_user` VALUES ('1000000100101', '10000002', '1', '10000');
INSERT INTO `tsys_role_user` VALUES ('1000000100101', '10000003', '1', '10000');
INSERT INTO `tsys_role_user` VALUES ('1000000100101', '10000101', '1', '10000');
INSERT INTO `tsys_role_user` VALUES ('1000000100101', '10000102', '1', '10000');
INSERT INTO `tsys_role_user` VALUES ('1000000100102', '100001111', '1', '10000');
INSERT INTO `tsys_role_user` VALUES ('10000100001301', '10000101', '1', null);
INSERT INTO `tsys_role_user` VALUES ('10000100001302', '10000102', '1', null);
INSERT INTO `tsys_role_user` VALUES ('10000100001303', '10000103', '1', null);
INSERT INTO `tsys_role_user` VALUES ('10000123123132', '100001111', '1', '10000');
INSERT INTO `tsys_role_user` VALUES ('100001993', '100001993', '1', '10000');
INSERT INTO `tsys_role_user` VALUES ('10000300000201', '10000301', '1', null);
INSERT INTO `tsys_role_user` VALUES ('10000300000202', '10000302', '1', null);
INSERT INTO `tsys_role_user` VALUES ('10000300000203', '10000303', '1', null);
INSERT INTO `tsys_role_user` VALUES ('admin', 'admin', '1', null);
INSERT INTO `tsys_role_user` VALUES ('admin', 'admin', '2', null);

-- ----------------------------
-- Table structure for `tsys_subtrans`
-- ----------------------------
DROP TABLE IF EXISTS `tsys_subtrans`;
CREATE TABLE `tsys_subtrans` (
  `trans_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'QA:交易编号，外键TSYS_TRANS.TRANS_CODE',
  `sub_trans_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '子交易编号',
  `sub_trans_name` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '子交易名称',
  `rel_serv` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '映射服务',
  `rel_url` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '00-不控制功能权限/不控制数据权限 01-不控制功能权限/控制数据权限 10-控制功能权限/不控制数据权限 11-控制功能权限/控制数据权限 ',
  `ctrl_flag` varchar(4) COLLATE utf8_bin DEFAULT NULL COMMENT '0-不控制 1-授权控制',
  `login_flag` varchar(4) COLLATE utf8_bin DEFAULT NULL COMMENT '0-否 1-是',
  `remark` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `ext_field_1` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段1',
  `ext_field_2` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段2',
  `ext_field_3` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段3',
  PRIMARY KEY (`trans_code`,`sub_trans_code`),
  KEY `nk_biz_sbutrans_sub_code` (`sub_trans_code`) USING BTREE,
  KEY `nk_biz_sbutrans_trans_code` (`trans_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统子交易表';

-- ----------------------------
-- Records of tsys_subtrans
-- ----------------------------
INSERT INTO `tsys_subtrans` VALUES ('BIZFRAME', 'BIZFRAME', '资金管理系统', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('BigContractMgmt', 'Add', '导入', 'bigcontract/add', null, null, '1', '导入保理额度合同', null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('BigContractMgmt', 'Adjust', '修改授信额度', 'bigcontract/adjust', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('BigContractMgmt', 'BigContractMgmt', '反向保理额度管理', null, '/rfp/bigcontract/bigcontractmanage.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('BigContractMgmt', 'Cancel', '撤销', 'bigcontract/cancel', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('BigContractMgmt', 'Del', '删除', 'bigcontract/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('BigContractMgmt', 'Edit', '修改', 'bigcontract/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('BigContractMgmt', 'SendApprove', '送审', 'bigcontract/sendapprove', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('BigContractMgmt', 'View', '查看详情', 'bigcontract/view', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('BigContractMgmt', 'bcCheckbeforeapprove', '校验待签名信息', 'bigcontract/checkbeforeapprove', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('BigContractMgmt', 'bcSendapprovebefore', '查询待签名信息', 'bigcontract/sendapprovebefore', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('BigContractMgmt', 'bigcontractQuery', '大合同查询', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('BigContractMgmt', 'filecheck', '查询附件信息', 'bigcontract/checkfile', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('BigContractMgmt', 'filedownload', '下载附件', 'common/fileDownload', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('KeyInitConfirmState', 'KeyInitConfirmState', '电子签名确认书', null, '/rfp/keymgmt/keyinitconfirmstate.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('KeyInitConfirmState', 'getclosedconfirmation', '获取历史确认书', 'keymgmt/getclosedconfirmation', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('SupplierAccountsMgmt', 'SupplierAccountedit', '供应商专户账户编辑', 'supplieraccount/account/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsMgmt', '保理专户管理', null, '/rfp/supplieraccount/supplieraccount.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsappeal', '供应商专户账户申诉', 'supplieraccount/account/appealadd', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsdel', '供应商专户账户删除', 'supplieraccount/account/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('SupplierAccountsMgmt', 'supplieraccountQuery', '供应商专户账户查询', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('SupplierAccountsMgmt', 'supplieraccountadd', '供应商专户账户新增', 'supplieraccount/account/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('WBflowTaskTodo', 'WBflowTaskTodo', '其它待办任务', null, '/workflow/client/todo/todoTaskSimple.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('WBpayableChx', 'WBpayableChx', '应付账款审批', null, '/rfp/accountspayable/chxtodotask.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('WBpayableIntention', 'WBpayableIntention', '融资意愿审批', null, '/rfp/accountspayable/chxtodotask.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('WBpayableIntentionApply', 'WBpayableIntentionApply', '发起融资意愿', null, '/rfp/accountspayable/chxtodotask.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('WBpayableIntentionList', 'WBpayableIntentionList', '优先融资意愿清单', null, '/rfp/accountspayable/chxtodotask.jsp?lastoperationflag=203', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('WBpayableQuote', 'WBpayableQuote', '融资确认审批', null, '/rfp/accountspayable/chxtodotask.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('WBreturnPayableIntentionList', 'WBreturnPayableIntentionList', '退回融资意愿清单', null, '/rfp/accountspayable/chxtodotask.jsp?returnflag=1', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('WBsupportPayableIntentionList', 'WBsupportPayableIntentionList', '支持融资意愿清单', null, '/rfp/accountspayable/chxtodotask.jsp?lastoperationflag=401,402', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('WBtripartiteAgreementChxTodo', 'WBtripartiteAgreementChxTodo', '三方协议待办任务', null, '/rfp/agreement/chxtodo.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('accountTaskTodo', 'accountTaskTodo', '待办应付账款', null, '/workflow/client/todo/todoTaskSimple.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('accountsPayable', 'accountsPayable', '应付账款', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('accountsPayableQuery', 'accountsPayableQuery', '应付账款查询', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('accountsPayableSignature', 'accountsPayableSignature', '应付账款签名', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('agreement', 'agreement', '三方协议', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('agreementQuery', 'agreementQuery', '三方协议查询', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('agreementTemp', 'agreementTemp', '三方协议模板', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('agreementTempQuery', 'agreementTempQuery', '三方协议模板查询', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appeal', 'appeal', '申诉管理', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealDone', 'appealDone', '已完成申诉', null, '/rfp/appeal/appealdone.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealMgmt', 'appealMgmt', '申诉类型管理', null, '/rfp/appeal/appealmanagement.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealMgmt', 'appealMgmtActive', '激活申诉', 'appealmgmt/appealmgmt/active', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealMgmt', 'appealMgmtAdd', '新增申诉信息', 'appealmgmt/appealmgmt/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealMgmt', 'appealMgmtClose', '申诉冻结', 'appealmgmt/appealmgmt/close', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealMgmt', 'appealMgmtEdit', '修改申诉信息', 'appealmgmt/appealmgmt/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealMgmt', 'appealMgmtQuery', '申诉信息查询', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealQuery', 'appealQuery', '申诉管理查询', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealStart', 'appealEdit', '修改', 'appealmsmgmt/appealmsmgmt/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealStart', 'appealStart', '我发起的申诉', null, '/rfp/appeal/appealmanagementforme.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealTodoTask', 'appealTodoArbitrate', '仲裁申诉信息', 'appealmsmgmt/appealmsmgmt/arbitrate', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealTodoTask', 'appealTodoDeal', '处理申诉信息', 'appealmsmgmt/appealmsmgmt/deal', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealTodoTask', 'appealTodoEdit', '编辑申诉信息', 'appealmsmgmt/appealmsmgmt/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealTodoTask', 'appealTodoSave', '保存申诉信息', 'appealopinion/appealopinion/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealTodoTask', 'appealTodoTask', '待处理申诉', null, '/rfp/appeal/appealtodotaskindex.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealmsMgmt', 'appealmsMgmt', '申诉信息管理', null, '/rfp/appeal/appealdetailmanagement.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealmsMgmt', 'appealmsMgmtActive', '激活申诉信息', 'appealmsmgmt/appealmsmgmt/active', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealmsMgmt', 'appealmsMgmtAdd', '新增申诉信息', 'appealmsmgmt/appealmsmgmt/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealmsMgmt', 'appealmsMgmtClose', '冻结申诉信息', 'appealmsmgmt/appealmsmgmt/close', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealmsMgmt', 'appealmsMgmtEdit', '修改申诉信息', 'appealmsmgmt/appealmsmgmt/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealmsMgmt', 'appealmsMgmtQuery', '申诉信息查询', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealmsMgmt', 'appealmsMgmtarbitrate', '申诉信息仲裁', 'appealmsmgmt/appealmsmgmt/arbitrate', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealmsMgmt', 'appealmsMgmtdeal', '处理申诉信息', 'appealmgmt/appealmgmt/deal', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('areaMgmt', 'allocateuser', '分配辖区', 'bankjurisdiction/bankarea/allocateuser', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('areaMgmt', 'areaMgmt', '银行辖区管理', null, '/rfp/organization/bankjurisdiction/bankarea.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('areaMgmt', 'bankjurisdiction', '分配辖区', 'bankjurisdiction/bankarea/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('areaMgmt', 'unallocateuser', '取消辖区', 'bankjurisdiction/bankarea/unallocateuser', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bankInvite', 'approveSign', '同意邀请', 'usermanage/org/approve', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bankInvite', 'bankInvite', '银行邀请信息', null, '/rfp/organization/bankinvite/bankinvite.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bankInvite', 'rejectSign', '拒绝邀请', 'usermanage/org/approve', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bankQuota', 'bankQuota', '银行给核心企业额度', null, '/rfp/organization/bankquota/bankquota.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bankQuota', 'bankquotaadd', '新增银行给核心企业额度信息', 'bankquota/bankquota/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bankQuota', 'bankquotadel', '删除银行给核心企业额度信息', 'bankquota/bankquota/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bankQuota', 'bankquotaedit', '修改银行给核心企业额度信息', 'bankquota/bankquota/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bankQuota', 'bankquotaquery', '查询银行给核心企业额度信息', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bankSupplierRelation', 'bankSupplierRelation', '银行分配供应商', null, '/rfp/organization/orgrelation/orgrelationserach.jsp?type=3', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bankView', 'bankView', '合作银行查看', null, '/rfp/organization/orgview/orgbank.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('baseSet', 'baseSet', '基础设置', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bigContract', 'bigContract', '大合同', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bigContractQuery', 'bigContractQuery', '大合同信息查询', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bigContractSignature', 'bigContractSignature', '反向保理额度签名', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizOrgSet', 'activate', '激活用户', 'usermanage/org/activate', null, null, '1', '激活用户', null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizOrgSet', 'bigOrgAllocate', '分配', 'usermanage/org/addallocaterela', null, null, '1', '组织机构设置中的组织分配表单中的分配按钮', null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizOrgSet', 'bigOrgDelAllocate', '取消', 'usermanage/org/delallocaterela', null, null, '1', '取消', null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizOrgSet', 'bizOrgAdd', '新增组织机构', 'usermanage/org/add', null, '1', '1', null, '1', null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizOrgSet', 'bizOrgAllot', '分配用户组织机构', 'usermanage/org/allocateuser', null, null, '1', null, '0', null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizOrgSet', 'bizOrgCancel', '取消用户组织机构', 'usermanage/org/unallocateuser', null, null, '1', null, '0', null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizOrgSet', 'bizOrgDel', '删除组织机构', 'usermanage/org/del', null, '1', '1', null, '1', null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizOrgSet', 'bizOrgEdit', '修改组织机构', 'usermanage/org/edit', null, '1', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizOrgSet', 'bizOrgInitialinfo', '初始化基础信息', 'usermanage/org/initialinfo', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizOrgSet', 'bizOrgSet', '组织机构设置', null, '/admin/system/orgmanage/orgmanage.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizOrgSet', 'bizOrgcate', '查询组织编码', 'usermanage/org/orgcate', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizOrgSet', 'bizOrgedits', '维护联系人', 'usermanage/org/allocaterela', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetCache', 'bizSetCache', '缓存刷新', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetCache', 'refreshCache', '缓存刷新', 'bizSetCache/refreshCache', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetCache', 'sys01c001', '查询CACHE对象', 'UC_SYS_JRESCACHELIST', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetLog', 'bizSetLog', '业务日志设置', 'systemmanage/log/setlog', null, '0', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetLog', 'bizSetLogFind', '业务日志查看', 'systemmanage/log/view', null, '0', '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetLog', 'bizSetLogStart', '业务日志开启', 'systemmanage/log/start', null, '0', '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetLog', 'bizSetLogStop', '业务日志关闭', 'systemmanage/log/stop', null, '0', '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetLog', 'setlog', '业务日志设置', 'systemmanage/log/setlog', null, '0', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetMenu', 'bizMenuAdd', '菜单新增', 'systemmanage/menu/add', null, '1', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetMenu', 'bizMenuDelete', '菜单删除', 'systemmanage/menu/del', null, '1', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetMenu', 'bizMenuEdit', '菜单编辑', 'systemmanage/menu/edit', null, '1', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetMenu', 'bizMenuSort', '菜单排序', 'systemmanage/menu/move', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetMenu', 'bizMenuSubtranAdd', '菜单子功能新增', 'systemmanage/menu/subtranadd', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetMenu', 'bizMenuSubtranDete', '菜单子功能删除', 'systemmanage/menu/subtrandel', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetMenu', 'bizMenuSubtranEdit', '菜单子功能修改', 'systemmanage/menu/subtranedit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetMenu', 'bizSetMenu', '系统菜单设置', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetOrgRole', 'bizOrgRoleAllocate', '分配角色', 'usermanage/postion/allocaterole', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetOrgRole', 'bizOrgRoleUnallocate', '取消分配角色', 'usermanage/postion/unallocaterole', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetOrgRole', 'bizSetOrgRole', '多岗设置', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetRole', 'bizRoleRightSet', '角色分配权限', 'usermanage/role/allocatepower', null, '0', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetRole', 'bizSetRole', '角色设置', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetRole', 'bizSetRoleAdd', '角色添加', 'usermanage/role/add', null, '1', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetRole', 'bizSetRoleDelete', '角色删除', 'usermanage/role/del', null, '1', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetRole', 'bizSetRoleEdit', '角色修改', 'usermanage/role/edit', null, '1', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetRole', 'roleUserAdd', '分配角色用户', 'usermanage/role/allocateuser', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetRole', 'roleUserDel', '取消分配角色用户', 'usermanage/role/unallocateuser', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetRole', 'rolesendapprove', '角色送审', 'usermanage/role/sendapprove', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUser', 'bizCancelUR', '取消分配角色', 'usermanage/user/unallocaterole', null, '1', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUser', 'bizGiveUR', '分配角色', 'usermanage/user/allocaterole', null, '1', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUser', 'bizModifyPwd', '修改密码', 'home/modifyPwd', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUser', 'bizOrgCancelUR', '取消分配组织', 'usermanage/user/unallocateorg', null, '1', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUser', 'bizOrgGiveUR', '分配组织', 'usermanage/user/allocateorg', null, '1', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUser', 'bizResetPass', '用户清密', 'usermanage/user/reset', null, '1', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUser', 'bizSetUser', '用户设置', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUser', 'bizUserActivate', '激活用户', 'usermanage/user/active', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUser', 'bizUserAdd', '用户新增', 'usermanage/user/add', null, '1', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUser', 'bizUserModfiy', '用户修改', 'usermanage/user/edit', null, '1', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUser', 'bizUserRemove', '用户注销', 'usermanage/user/close', null, '1', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUser', 'bizUserRightAuth', '用户权限授权', 'usermanage/user/allocatepower', null, '1', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUser', 'userModifyMobile', '修改手机号', 'usermanage/user/modifyMobile', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUser', 'userView', '信息查看', 'usermanage/user/view', null, '0', '0', null, '1', null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUserKey', 'bizSetUserKey', '用户KEY绑定', null, '/rfp/userkey/userbindkey.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUserKey', 'userBindKey', '绑定KEY', 'userkeymanage/userkey/bind', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUserKeyApply', 'bizSetUserKeyApply', '用户KEY申请', null, '/rfp/userkey/userapplykey.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSysManager', 'bizSysManager', '系统管理', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizUserManager', 'bizUserManager', '用户管理', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchain', 'blockchain', '区块链', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchainApply', 'blockchainAdd', '新增节点', 'blockchainnode/blockchain/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchainApply', 'blockchainApply', '申请成为节点', null, '/rfp/blockchain/blockchainnodeapply.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchainApply', 'blockchainApplyQuery', '区块链节点查询', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchainApply', 'blockchainCancel', '撤销', 'blockchainnode/blockchain/cancel', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchainApply', 'blockchainDel', '删除节点', 'blockchainnode/blockchain/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchainApply', 'blockchainEdit', '修改节点', 'blockchainnode/blockchain/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchainApply', 'blockchainSend', '发布节点', 'blockchainnode/blockchain/send', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchainApply', 'blockchainsend', '送审验签', 'blockchainnode/blockchain/sendbefore', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchainFind', 'blockchainFind', '区块链取证', null, '/rfp/blockchain/blockchainsearch.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchainManage', 'blockchainManage', '区块链', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchainNodeManage', 'blockchainNodeManage', '节点管理', null, '/rfp/blockchain/blockchainnodemanage.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchainNodeManage', 'check', '流程验签', 'blockchainnode/blockchain/check', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchainNodeManage', 'checkbefore', '流程送审', 'blockchainnode/blockchain/checkbefore', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchainView', 'blockchainView', '区块链查看', null, '/rfp/blockchain/blockchainbrowser.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchainView', 'blockchaingetkey', '获取三方协议加密密钥', 'tripartiteagreementmanage/tripartiteagreement/getkey', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchainView', 'getfromblockchain', '从区块链获取数据', 'blockchain/getfromblockchain', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('business', 'business', '业务', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('caidan', 'caidan', '菜单', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('caidantest3', 'caidantest3', 'test3', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('calendarsManager', 'base02a001', '日历查看', 'UC_BASE_SET_CALENDARS_SEARCH', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('calendarsManager', 'base02a002', '特殊日历查看', 'UC_BASE_SET_CALENDARSPECIAL_SEARCH', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('calendarsManager', 'calendaractive', '日历生效', 'generalset/calendar/active', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('calendarsManager', 'calendaradd', '日历新增', 'generalset/calendar/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('calendarsManager', 'calendardel', '日历删除', 'generalset/calendar/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('calendarsManager', 'calendardisactive', '日历失效', 'generalset/calendar/disactive', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('calendarsManager', 'calendaredit', '日历修改', 'generalset/calendar/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('calendarsManager', 'calendarsManager', '日历管理', null, '/base/system/calendars/calendarstab.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('calendarsManager', 'calendarspecialactive', '特殊日历生效', 'generalset/calendarspecial/active', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('calendarsManager', 'calendarspecialadd', '特殊日历新增', 'generalset/calendarspecial/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('calendarsManager', 'calendarspecialdel', '特殊日历删除', 'generalset/calendarspecial/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('calendarsManager', 'calendarspecialdisactive', '特殊日历激活', 'generalset/calendarspecial/disactive', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('calendarsManager', 'calendarspecialedit', '特殊日历修改', 'generalset/calendarspecial/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('checkSignature', 'checkSignature', '我要验签', null, '/rfp/keymgmt/signverify.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('checkSignature', 'content', '复制', 'base/tool/content', null, null, '1', '正文接口', null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('comprehensiveQuery', 'comprehensiveQuery', '综合查询', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('cooperation', 'cooperation', '合作', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('corecompanyFirstBank', 'bankQuotaEdit', '修改银行给核心企业额度', 'bankquota/bankquota/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('corecompanyFirstBank', 'corecompanyFirstBank', '优先级', null, '/rfp/organization/bankquota/bankquota.jsp?priority=1', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('corecompanyInvite', 'applySign', '邀请签约', 'usermanage/org/apply', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('corecompanyInvite', 'corecompanyInvite', '邀请', null, '/rfp/organization/bankinvite/corecompanyinvite.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('corecompanyQuota', 'corecompanyQuota', '平台给核心企业额度', null, '/rfp/organization/corecompanyquota/corecompanyquota.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('corecompanyQuota', 'corecompanyquotaadd', '新增平台给核心企业额度', 'corecompanyquota/corecompanyquota/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('corecompanyQuota', 'corecompanyquotadel', '平台给核心企业额度删除', 'corecompanyquota/corecompanyquota/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('corecompanyQuota', 'corecompanyquotaedit', '平台给核心企业额度修改', 'corecompanyquota/corecompanyquota/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('corecompanySupportBank', 'corecompanySupportBank', '支持级', null, '/rfp/organization/bankquota/bankquota.jsp?priority=2', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('corecompanyView', 'corecompanyView', '核心企业查看', null, '/rfp/organization/orgview/orgcorecompany.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('currencyManage', 'currencyManage', '币种管理', null, '/base/system/currency/currency.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('currencyManage', 'currencyadd', '币种新增', 'generalset/currency/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('currencyManage', 'currencydel', '币种删除', 'generalset/currency/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('currencyManage', 'currencyedit', '币种修改', 'generalset/currency/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('customService', 'customService', '申诉', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('firstBank', 'firstBank', '优先级银行', null, '/rfp/organization/banklist/banklist.jsp?priority=1', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('firstBank', 'querybanklist', '优先级银行查询', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowDelegateMgrnew', 'flowDelegateMgrnew', '委托', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowDelegateMonitor', 'flowDelegateMonitor', '委托监控', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowDelegateMonitor', 'flowDelegateMonitorAdd', '工作流委托关系新增', 'workflow/flowmonitor/delegate/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowDelegateMonitor', 'flowDelegateMonitorDel', '工作流委托流程删除', 'workflow/flowmonitor/delegate/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowDelegateMonitor', 'flowDelegateMonitorSet', '工作流委托流程设置', 'workflow/flowmonitor/delegate/set', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowDelegateMonitor', 'flowDelegateMonitorStateChange', '工作流委托状态更改', 'workflow/flowmonitor/delegate/changestate', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowForm', 'flowForm', '表单管理', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowFormKind', 'flowFormKind', '表单分类', null, '/admin/workflow/processform/processformtype.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowFormKind', 'workflowFormTypeAdd', '表单分类新增', 'workflow/processform/formtype/add', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowFormKind', 'workflowFormTypeClose', '表单分类收缩', 'workflow/processform/formtype/close', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowFormKind', 'workflowFormTypeDel', '表单分类删除', 'workflow/processform/formtype/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowFormKind', 'workflowFormTypeExpend', '表单分类展开', 'workflow/processform/formtype/expand', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowFormKind', 'workflowFormTypeModfiy', '表单分类修改', 'workflow/processform/formtype/edit', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowFormKind', 'workflowFormTypeRefresh', '表单分类刷新', 'workflow/processform/formtype/refresh', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowFormReg', 'flowFormReg', '表单设置', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowFormReg', 'workflowFormRegAdd', '表单注册新增', 'workflow/processform/formreg/add', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowFormReg', 'workflowFormRegEdit', '表单注册修改', 'workflow/processform/formreg/edit', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowFormReg', 'workflowFormRegRemove', '表单注册删除', 'workflow/processform/formreg/del', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowManaDesign', 'flowDesignProcDesignFind', '流程设计设计查询', 'workflow/flowdesign/processdesign/design', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowManaDesign', 'flowDesignProcExp', '流程设计导出', 'workflow/flowdesign/processdesign/export', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowManaDesign', 'flowDesignProcFormBind', '流程设计表单绑定', 'workflow/flowdesign/processdesign/bindform', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowManaDesign', 'flowDesignProcImp', '流程设计导入', 'workflow/flowdesign/processdesign/import', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowManaDesign', 'flowDesignProcModfiy', '流程设计修改', 'workflow/flowdesign/processdesign/edit', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowManaDesign', 'flowDesignProcPublish', '流程设计发布', 'workflow/flowdesign/processdesign/publish', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowManaDesign', 'flowDesignProcRemove', '流程设计删除', 'workflow/flowdesign/processdesign/del', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowManaDesign', 'flowDesignProcSave', '流程设计保存', 'workflow/flowdesign/processdesign/add', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowManaDesign', 'flowManaDesign', '流程设计', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowManaProcKind', 'flowManaProcKind', '流程类型', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowManaProcKind', 'flowProcTypeModfiy', '流程分类修改', 'workflow/flowManaProcKind/edit', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowManaProcKind', 'flowProcTypeRemove', '流程分类删除', 'workflow/flowManaProcKind/del', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowManaProcKind', 'flowProcTypeSave', '流程分类保存', 'workflow/flowManaProcKind/add', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowManage', 'flowManage', '工作流设置', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowMenu', 'flowMenu', '工作流', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowMoniInstance', 'flowMoniInstance', '实例监控', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowMoniInstance', 'flowMonitorInstanceDel', '实例监控删除', 'workflow/flowmonitor/instance/del', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowMoniInstance', 'flowMonitorInstanceResume', '实例监控恢复', 'workflow/flowmonitor/instance/resume', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowMoniInstance', 'flowMonitorInstanceSuspend', '实例监控挂起', 'workflow/flowmonitor/instance/suspend', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowMoniInstance', 'flowMonitorInstanceTerminate', '实例监控终止', 'workflow/flowmonitor/instance/terminate', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowMoniInstance', 'flowMonitorInstanceViewchange', '查看变更', 'workflow/flowmonitor/instance/viewchange', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowMoniInstance', 'flowMonitorInstanceViewdiagram', '实例图', 'workflow/flowmonitor/instance/viewdiagram', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowMoniInstance', 'flowMonitorInstanceViewtrace', '查看留痕', 'workflow/flowmonitor/instance/viewtrace', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowMonitor', 'flowMonitor', '工作流监控', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowMyProcessFinished', 'flowMyProcessFinished', '我已完成的请求', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowMyProcessUnfinished', 'flowMyProcessUnfinished', '我未完成的请求', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowTask', 'flowTask', '工作台', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowTaskHistory', 'flowTaskHistory', '已办任务', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowTaskTodo', 'flowTaskTodo', '待办任务', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('gasMgmt', 'gasMgmt', '燃料管理', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('gasaccount', 'gasaccount', '燃料账户', null, '/rfp/gasmgmt/gasaccount.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('gasaccount', 'gasacctadd', '燃料账户新增', 'gasaccount/gasacct/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('gasaccount', 'gasacctedit', '燃料账户修改', 'gasaccount/gasacct/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('gastransactions', 'gastranadd', '燃料交易明细', 'gastransactions/gastransactions/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('gastransactions', 'gastransactions', '燃料交易明细', null, '/rfp/gasmgmt/gastransactions.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('gastransactions', 'gastransedit', '燃料交易修改', 'gastransactions/gastransactions/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('generalSettings', 'generalSettings', '一般设置', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyInit', 'certapplydownload', '下载证书', 'keymgmt/certapplydownload', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyInit', 'checkvalidempty', '检查KEY是否未初始化过且有效', 'keymgmt/checkvalidempty', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyInit', 'getclosedconfirmation', '获取历史确认书', 'keymgmt/getclosedconfirmation', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyInit', 'getconfirmation', '获取确认书', 'keymgmt/getconfirmation', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyInit', 'keyInit', 'KEY初始化', null, '/rfp/keymgmt/keyinit.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyInit', 'keypostsign', '提交确认书签名结果', 'keymgmt/postsign', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyInitRecord', 'getclosedconfirmation', '获取历史确认书', 'keymgmt/getclosedconfirmation', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyInitRecord', 'getconfirmationfromblockchain', '从区块链获取历史确认书', 'keymgmt/getconfirmationfromblockchain', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyInitRecord', 'keyInitRecord', 'KEY初始化记录', null, '/rfp/keymgmt/keyinitrecord.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyInventoryMgmt', 'keyInventoryMgmt', 'KEY物料管理', null, '/rfp/keymgmt/keyinventory.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyInventoryMgmt', 'keyinventoryadd', '入库', 'keymgmt/keyinventory/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyInventoryMgmt', 'keyinventoryedit', '修改', 'keymgmt/keyinventory/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyInventoryMgmt', 'remove', '出库', 'keymgmt/keyinventory/remove', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyInventoryMgmt', 'stock', '盘存', 'keymgmt/keyinventory/stock', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyPurchase', 'apply', '补货申请', 'keymgmt/keypurchase/apply', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyPurchase', 'approve', '补货批准', 'keymgmt/keypurchase/approve', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyPurchase', 'confirm', '到货确认', 'keymgmt/keypurchase/confirm', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyPurchase', 'keyPurchase', 'KEY申请单', null, '/rfp/keymgmt/keypurchase.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageAppeal', 'manageAppeal', '申诉管理', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageBank', 'manageBank', '合作银行', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageBigContract', 'manageBigContract', '反向保理额度管理', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageCoreCompany', 'manageCoreCompany', '核心企业', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageFuel', 'manageFuel', '燃油管理', null, '/common/comingsoon.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageIntegral', 'manageIntegral', '积分管理', null, '/common/comingsoon.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageKeys', 'manageKeys', 'KEY管理', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageOrg', 'manageOrg', '组织管理', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageOrgRelation', 'manageOrgRelation', '组织关系设置', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageOrgUser', 'manageOrgUser', '组织', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('managePayable', 'managePayable', '应付账款', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageProvider', 'manageProvider', '供应商', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageRecable', 'manageRecable', '应收账款管理', null, '/rfp/accountspayable/accountsrecablemanage.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageRecable', 'manageRecableRevoke', '应收账款撤销', 'payablemgmt/accountspayable/revoke', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageServiceBank', 'manageServiceBank', '服务银行列表', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageSignature', 'manageSignature', '签名管理', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageSupplierAccount', 'manageSupplierAccount', '保理专户管理', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageTradeContract', 'manageTradeContract', '资金交易', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageTripartiteAgreement', 'manageTripartiteAgreement', '三方协议管理', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('match', 'approveUrl', '同意', 'payablemgmt/accountspayable/approve', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('match', 'disapproveUrl', '否决', 'payablemgmt/accountspayable/disapprove', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('match', 'examineTest', '批量审批', 'accountspayable/examine/test', null, null, '1', '提供给批量审批一个假的接口', null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('match', 'getagreetemplate', '查询三方协议模板信息', 'tripartiteagreement/template/getagreetemplate', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('match', 'match', '撮合融资意向', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('match', 'matchgetbigcontract', '获取反向保理额度', 'bigcontract/getbigcontract', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('match', 'querysigninfo', '查询签名信息', 'payablemgmt/accountspayable/querysigninfo', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('noticesManager', 'base02a003', '公告查看', 'UC_BASE_SET_NOTICES_SEARCH', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('noticesManager', 'noticeadd', '公告新增', 'generalset/notice/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('noticesManager', 'noticedel', '公告删除', 'generalset/notice/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('noticesManager', 'noticeedit', '公告修改', 'generalset/notice/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('noticesManager', 'noticesManager', '公告管理', null, '/base/system/notice/notice.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('orgBankRelation', 'orgBankRelation', '核心企业分配银行', null, '/rfp/organization/orgrelation/orgrelationserach.jsp?type=1', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('orgContractMgmt', 'orgContractMgmt', '联系人管理', null, '/rfp/organization/orgcontact/organization.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('orgContractMgmt', 'organizationactive', '组织联系人激活', 'orgcontact/orgcontact/active', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('orgContractMgmt', 'organizationadd', '组织联系人信息', 'orgcontact/orgcontact/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('orgContractMgmt', 'organizationclose', '组织联系人冻结', 'orgcontact/orgcontact/close', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('orgContractMgmt', 'organizationdel', '组织联系人删除', 'orgcontact/orgcontact/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('orgContractMgmt', 'organizationedit', '组织联系人修改', 'orgcontact/orgcontact/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('orgSupplierRelation', 'orgSupplierRelation', '核心企业分配供应商', null, '/rfp/organization/orgrelation/orgrelationserach.jsp?type=2', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('organization', 'organization', '组织机构', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('organizationContact', 'organizationContact', '联系人管理', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('organizationQuery', 'organizationQuery', '组织机构', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableChx', 'payableChx', '应付账款审批', null, '/rfp/accountspayable/chxtodotask.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableExpireList', 'payableExpireList', '应付账款到期付款清单', null, '/common/comingsoon.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableIntention', 'payableIntention', '融资意向审批', null, '/rfp/accountspayable/chxtodotask.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableIntentionApply', 'payableIntentionApply', '发起融资意向', null, '/rfp/accountspayable/chxtodotask.jsp ', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableIntentionApply', 'submitFinancingApplicationUrl', '提交融资意向', 'payablemgmt/accountspayable/submitfinancingapplication', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableIntentionList', 'abandonPriorityUrl', '放弃优先权', 'payablemgmt/accountspayable/abandonpriority', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableIntentionList', 'payableIntentionList', '优先融资意愿清单', null, '/rfp/accountspayable/chxtodotask.jsp?lastoperationflag=203', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableIntentionList', 'queryUrl', '优先报价任务查询', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableIntentionList', 'submitQuoteUrl', '报价', 'payablemgmt/accountspayable/submitquote', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableMgmt', 'accountsPayableAdd', '应付账款新增', 'payablemgmt/accountspayable/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableMgmt', 'accountsPayableApprovesigninfo', '查询应付账款待签名信息', 'payablemgmt/accountspayable/queryapprovesigninfo', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableMgmt', 'accountsPayableDel', '应付账款删除', 'payablemgmt/accountspayable/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableMgmt', 'accountsPayableDownloadResults', '下载导入失败数据', 'payablemgmt/accountspayable/downloadresults', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableMgmt', 'accountsPayableDownloadtemplate', '应付账款模板下载', 'payablemgmt/accountspayable/downloadtemplate', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableMgmt', 'accountsPayableEdit', '应付账款编辑', 'payablemgmt/accountspayable/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableMgmt', 'accountsPayableEditRate', '修改应付账款费率', 'payablemgmt/accountspayable/editrate', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableMgmt', 'accountsPayableExtend', '延长到期日', 'payablemgmt/accountspayable/extend', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableMgmt', 'accountsPayableImportdata', '应付账款导入', 'payablemgmt/accountspayable/importdata', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableMgmt', 'accountsPayablePublish', '应付账款发布', 'payablemgmt/accountspayable/publish', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableMgmt', 'accountsPayableQuery', '应付账款查询', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableMgmt', 'accountsPayableRevoke', '应付账款撤销', 'payablemgmt/accountspayable/revoke', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableMgmt', 'payableMgmt', '应付账款管理', null, '/rfp/accountspayable/accountspayablemanage.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableQuote', 'payableQuote', '融资确认审批', null, '/rfp/accountspayable/chxtodotask.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableQuote', 'returnQuote', '提交退回意见', 'payablemgmt/accountspayable/returnquote', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableQuoteQuery', 'payableQuoteQuery', '应付账款报价查询', null, '/rfp/accountspayable/accountspayablequote.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('platformTemplate', 'platformTemplate', '平台模板', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('platformTemplateManage', 'plaformTemplateedit', '平台模板修改', 'platformtemplate/platformtemplate/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('platformTemplateManage', 'plaformtemplateadd', '平台模板新增', 'platformtemplate/platformtemplate/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('platformTemplateManage', 'platformTemplateManage', '平台模板', null, '/rfp/platformtemplate/platformtemplate.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('recableQuoteQuery', 'recableQuoteQuery', '应收账款报价查询', null, '/rfp/accountspayable/accountspayablequote.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('regionMgmt', 'regionMgmt', '区域管理', null, '/rfp/organization/area/area.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('returnPayableIntentionList', 'resubmitQuote', '提交报价', 'payablemgmt/accountspayable/resubmitquote', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('returnPayableIntentionList', 'returnPayableIntentionList', '退回融资意愿清单', null, '/rfp/accountspayable/chxtodotask.jsp?returnflag=1', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('schedule', 'base05a001', '系统任务查看', 'UC_BASE_SYSTEMTASK_SEARCH', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('schedule', 'base05a002', '运行计划查看', 'UC_BASE_RUNSCHEDULER_SEARCH', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('schedule', 'base05a003', '运行记录查看', 'UC_BASE_RUNHISTORY_SEARCH', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('schedule', 'base05a004', '任务命令查看', 'UC_BASE_TASKCOMMAND_SEARCH', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('schedule', 'schedule', '计划任务', null, '/base/schedule/taskindex.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('schedule', 'scheduleadd', '系统任务新增', 'schedule/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('schedule', 'scheduledel', '系统任务删除', 'schedule/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('schedule', 'scheduleedit', '系统任务修改', 'schedule/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('schedule', 'schedulepause', '系统任务暂停', 'schedule/pause', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('schedule', 'schedulerun', '系统任务运行', 'schedule/run', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('schedule', 'schedulestart', '系统任务启动', 'schedule/start', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('signature', 'signature', '签约', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('supplierAccount', 'supplierAccount', '供应商专户', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('supplierAccountQuery', 'supplierAccountQuery', '供应商专户查询', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('supplierBlackList', 'supplierBlackList', '供应商黑名单', null, '/rfp/organization/supplierblacklist/supplierblacklist.jsp?type=2', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('supplierBlackList', 'supplierblacklistpull', '拉出黑名单', 'supplierblacklist/supplierblacklist/pull', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('supplierView', 'supplierView', '供应商查看', null, '/rfp/organization/orgview/orgsupplier.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('supplierWhiteList', 'coreindividuationedit', '核心企业修改供应商保密级别', 'individuation/corecompany/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('supplierWhiteList', 'coremodifyrate', '修改核心企业费率', 'usermanage/org/modifyrate', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('supplierWhiteList', 'pull', '拉入黑名单', 'supplierblacklist/supplierblacklist/pull', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('supplierWhiteList', 'supplierWhiteList', '供应商白名单', null, '/rfp/organization/supplierblacklist/supplierblacklist.jsp?type=1', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('supplierWhiteList', 'supplierblacklistedit', '修改供应商费率', 'supplierblacklist/supplierblacklist/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('supportBank', 'BankListQuery', '支持银行查询', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('supportBank', 'supportBank', '支持银行', null, '/rfp/organization/banklist/banklist.jsp?priority=2', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('supportPayableIntentionList', 'supportPayableIntentionList', '支持融资意愿清单', null, '/rfp/accountspayable/chxtodotask.jsp?lastoperationflag=401,402', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('supportPayableIntentionList', 'supportQueryUrl', '支持报价任务查询', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('supportPayableIntentionList', 'supportSubmitQuote', '支持行报价', '/payablemgmt/accountspayable/submitquote', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('sysDirectChannelPurposesMap', 'base01a006', '直联渠道代收付用途映射查看', 'UC_BASE_BANK_DIRECTCHANNELPURPOSESMAP_SEARCH', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('sysDirectChannelPurposesMap', 'purposesmapadd', '直联代收付用途映射新增', 'sysbank/directchannelpurposesmap/add', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('sysDirectChannelPurposesMap', 'purposesmapdel', '直联渠道代收付用途映射删除', 'sysbank/directchannelpurposesmap/del', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('sysDirectChannelPurposesMap', 'purposesmapedit', '直联渠道代收付用途映射新增', 'sysbank/directchannelpurposesmap/edit', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('sysDirectChannelPurposesMap', 'sysDirectChannelPurposesMap', '直联渠道代收付用途映射', null, '/base/system/bank/purpose/directchannelpurposesmap.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syscompany', 'syscompany', '企业管理', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syscompanyinfo', 'syscompanyinfo', '企业信息', null, '/admin/syscompany/syscompanyinfo.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syscompanyinfo', 'tenantAdd', '租户新增', 'tenantmanage/tenant/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syscompanyinfo', 'tenantDel', '租户删除', 'tenantmanage/tenant/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syscompanyinfo', 'tenantEidt', '租户修改', 'tenantmanage/tenant/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syscontract', 'syscontract', '协议设置', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syscontract', 'syscontractAdd', '协议新增', 'tenantmanage/contract/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syscontract', 'syscontractDel', '协议删除', 'tenantmanage/contract/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syscontract', 'syscontractEdit', '协议修改', 'tenantmanage/contract/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syspackage', 'syspackage', '套餐设置', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syspackage', 'syspackageActive', '套餐激活', 'tenantmanage/package/active', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syspackage', 'syspackageAdd', '套餐新增', 'tenantmanage/package/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syspackage', 'syspackageClose', '套餐冻结', 'tenantmanage/package/close', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syspackage', 'syspackageDel', '套餐删除', 'tenantmanage/package/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syspackage', 'syspackageEdit', '套餐修改', 'tenantmanage/package/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syspackage', 'syspackageSet', '功能定制', 'tenantmanage/package/set', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syspackage', 'syspackageView', '功能查看', 'tenantmanage/package/view', null, null, null, null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('systemParam', 'systemParam', '系统参数', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('systemParamManage', 'base03a001', '系统参数查看', 'UC_BASE_PARAM_PARAMANAGE_SEARCH', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('systemParamManage', 'base03a002', '系统参数数值查看', 'UC_BASE_PARAM_PARAMVAL_SEARCH', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('systemParamManage', 'base03a003', '系统参数定义查看', 'UC_BASE_PARAM_PARAMDEF_SEARCH', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('systemParamManage', 'parammanageadd', '系统参数新增', 'sysparam/parammanage/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('systemParamManage', 'parammanagedel', '系统参数删除', 'sysparam/parammanage/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('systemParamManage', 'parammanageedit', '系统参数修改', 'sysparam/parammanage/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('systemParamManage', 'systemParamManage', '系统参数管理', null, '/base/system/param/sysparam.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('systemsettings', 'systemsettings', '系统设置', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('taTemplateSignature', 'taTemplateSignature', '三方协议模板签名', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('task', 'task', '任务', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('taskmanage', 'taskmanage', '任务', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tdrctablelist', 'sys99a006', '数据权限查询', 'UC_SYS_DATARIGHT_SEARCH', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tdrctablelist', 'sys99a007', '配置描述查询', 'UC_SYS_OWNERCONFIG_SEARCH', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tdrctablelist', 'tdrcownerconfigadd', '配置描述新增', 'tsvcmanage/tdrcownerconfig/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tdrctablelist', 'tdrcownerconfigdel', '配置描述删除', 'tsvcmanage/tdrcownerconfig/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tdrctablelist', 'tdrcownerconfigedit', '配置描述修改', 'tsvcmanage/tdrcownerconfig/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tdrctablelist', 'tdrctablelist', '数据权限管理', null, '/admin/tsvcmanage/tdrctablelist/tdrctablelist.jsp	', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tdrctablelist', 'tdrctablelistadd', '数据权限新增', 'tsvcmanage/tdrctablelist/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tdrctablelist', 'tdrctablelistdel', '数据权限删除', 'tsvcmanage/tdrctablelist/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tdrctablelist', 'tdrctablelistedit', '数据权限修改', 'tsvcmanage/tdrctablelist/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tenant', 'tenant', '企业', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('thsiright', 'thsirightadd', '功能表定义新增', 'tsvcmanage/thsiright/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('thsiright', 'thsirightdel', '功能表定义删除', 'tsvcmanage/thsiright/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('thsiright', 'thsirightedit', '功能表定义修改', 'tsvcmanage/thsiright/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('trade', 'trade', '交易', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountBalance', 'tradeAccountBalance', '交易账户余额', null, '/rfp/tradeaccount/transaccountbalance.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountBalance', 'tradeAccountappeal', '申诉', 'appealmsmgmt/appealmsmgmt/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountDetail', 'tradeAccountDetail', '交易账户明细', null, '/rfp/tradeaccount/transaccountdetail.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountDetail', 'tradetransactionAdd', '交易账户明细新增', 'tradeaccountmanage/tradetransaction/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountDetail', 'tradetransactionApprove', '交易账户明细送审', 'tradeaccountmanage/tradetransaction/sendapprove', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountDetail', 'tradetransactionApprvebefore', '交易账户送审前置事件', 'tradeaccountmanage/tradetransaction/approvebefore', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountDetail', 'tradetransactionDel', '交易账户明细删除', 'tradeaccountmanage/tradetransaction/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountDetail', 'tradetransactionEdit', '交易账户明细修改', 'tradeaccountmanage/tradetransaction/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountDetail', 'tradetransactionQuery', '交易账户明细查询', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountMgmt', 'tradeAccountMgmt', '交易账户管理', null, '/rfp/tradeaccount/tradeaccount.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountMgmt', 'tradeaccountAdd', '交易账户新增', 'tradeaccountmanage/tradeaccount/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountMgmt', 'tradeaccountDel', '交易账户删除', 'tradeaccountmanage/tradeaccount/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountMgmt', 'tradeaccountEdit', '交易账户修改', 'tradeaccountmanage/tradeaccount/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountMgmt', 'tradeaccountQuery', '交易账户查询', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountMgmt', 'tradeaccountactive', '交易账户激活', 'tradeaccountmanage/tradeaccount/active', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountMgmt', 'tradeaccountclose', '交易账户冻结', 'tradeaccountmanage/tradeaccount/close', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccounts', 'tradeAccounts', '交易账户', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountsQuery', 'tradeAccountsQuery', '交易账户查询', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeBalance', 'tradeBalance', '交易账户余额', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeTransaction', 'tradeTransaction', '交易账户明细', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementChx', 'tripartiteAgreementChx', '三方协议签约', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementChxDone', 'tripartiteAgreementChxDone', '已办任务', null, '/rfp/agreement/tripartiteagreementdonetask.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementChxTodo', 'taApprove', '同意', 'tripartiteagreementmanage/tripartiteagreement/approve', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementChxTodo', 'taDisapprove', '否决', 'tripartiteagreementmanage/tripartiteagreement/disapprove', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementChxTodo', 'taQuerySigninfo', '查询待签名信息', 'tripartiteagreementmanage/tripartiteagreement/querysigninfo', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementChxTodo', 'tripartiteAgreementChxTodo', '待办任务', null, '/rfp/agreement/chxtodo.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementDone', 'base', '复制', 'base/tool/base', null, null, '1', '将正文转成base', null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementDone', 'gather', '企业还款', 'tripartiteagreementmanage/tripartiteagreement/gather', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementDone', 'load', '银行放款', 'tripartiteagreementmanage/tripartiteagreement/load', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementDone', 'taDoneQuery', '查询', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementDone', '已完成合约', null, '/rfp/agreement/tripartiteagreementdone.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementappeal', '申诉', 'appealmsmgmt/appealmsmgmt/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', '三方协议打印', 'base/tool/test', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementMgmt', 'taApplyQuerysigninfo', '查询待签名信息', 'tripartiteagreementmanage/tripartiteagreement/jointsigninfo', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementAbolish', '作废融资申请', 'tripartiteagreementmanage/tripartiteagreement/abolish', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementAdd', '申请融资', 'tripartiteagreementmanage/tripartiteagreement/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementMgmt', '发起三方协议', null, '/rfp/agreement/tripartiteagreement.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementQuery', '三方协议查询', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementWithdraw', '撤销融资申请', 'tripartiteagreementmanage/tripartiteagreement/withdraw', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementRunning', 'abolish', '作废融资申请', 'tripartiteagreementmanage/tripartiteagreement/abolish', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementRunning', 'taRunningQuery', '查询', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementRunning', 'tripartiteAgreementRunning', '在途合约', null, '/rfp/agreement/tripartiteagreementrunning.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementRunning', 'withdraw', '撤销融资申请', 'tripartiteagreementmanage/tripartiteagreement/withdraw', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementSignature', 'tripartiteAgreementSignature', '三方协议签名', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementTempMgmt', 'templateAdd', '新增', 'tripartiteagreement/template/add', null, null, '1', '三方协议模板新增', null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementTempMgmt', 'templateCancel', '撤销', 'tripartiteagreement/template/cancel', null, null, '1', '三方协议模板撤销操作', null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementTempMgmt', 'templateDel', '删除', 'tripartiteagreement/template/del', null, null, '1', '三方协议模板删除', null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementTempMgmt', 'templateEdit', '修改', 'tripartiteagreement/template/edit', null, null, '1', '三方协议模板管理的修改功能', null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementTempMgmt', 'templateQuery', '三方协议模板查询', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementTempMgmt', 'templateSend', '发布', 'tripartiteagreement/template/send', null, null, '1', '三方协议模板发布', null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementTempMgmt', 'templateSendbefore', '查询待签名信息', 'tripartiteagreement/template/sendbefore', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementTempMgmt', 'templateView', '查看详情', 'tripartiteagreement/template/view', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementTempMgmt', 'templatecheckbeforeapprove', '审核校验签名', 'tripartiteagreement/template/checkbeforeapprove', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementTempMgmt', 'templatesendapprovebefore', '校验签名', 'tripartiteagreement/template/sendapprovebefore', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementTempMgmt', 'tripartiteAgreementTempMgmt', '三方协议模版管理', null, '/rfp/triagreementtemp/templatemanage.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'create', '生成配置SQL', 'tsvcmanage/tsvcsetsql/create', null, null, null, null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'getdata', 'sql语句测试获取数据', 'tsvcmanage/tsvcsql/getdata', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'gethead', 'sql语句测试获取表头', 'tsvcmanage/tsvcsql/gethead', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'save', '保存SQL', 'tsvcmanage/tsvcsetsql/save', null, null, null, null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'set', '配置', 'tsvcmanage/thsiright/set', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'sqladd', '新增sql', 'tsvcmanage/tsvcsql/add', null, null, null, null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'sqledit', '修改sql', 'tsvcmanage/tsvcsql/edit', null, null, null, null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'tsvcinterface', '通用查询配置', null, '/admin/tsvcmanage/tsvcinterface/tsvchsiright.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'tsvcinterfaceAdd', '新增', 'tsvcmanage/thsiright/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'tsvcinterfaceDel', '删除', 'tsvcmanage/thsiright/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'tsvcinterfaceEdit', '修改', 'tsvcmanage/thsiright/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'tsvcinterfaceadd', '新增', 'tsvcmanage/tsvcinterface/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'tsvcinterfacedel', '删除', 'tsvcmanage/tsvcinterface/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'tsvcinterfaceedit', '修改', 'tsvcmanage/tsvcinterface/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'tsvcinterfaceinitexportdata', '初始化输出', 'tsvcmanage/tsvcinterface/initexportdata', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'tsvcinterfaceinitimportdata', '初始化输入', 'tsvcmanage/tsvcinterface/initimportdata', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'tsvcviewconfigadd', '新增', 'tsvcmanage/tsvcviewconfig/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'tsvcviewconfigdel', '删除', 'tsvcmanage/tsvcviewconfig/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'tsvcviewconfigedit', '修改', 'tsvcmanage/tsvcviewconfig/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'tsvcviewconfiginitexportdata', '查询显示配置', 'tsvcmanage/tsvcviewconfig/initexportdata', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcmanage', 'tsvcmanage', '辅助开发管理', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcsql', 'tsvcsqladd', '数据源SQL维护新增', 'tsvcmanage/tsvcsql/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcsql', 'tsvcsqldel', '数据源SQL维护删除', 'tsvcmanage/tsvcsql/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcsql', 'tsvcsqledit', '数据源SQL维护修改', 'tsvcmanage/tsvcsql/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcviewconfig', 'tsvcviewconfigdel', '查询显示配置删除', 'tsvcmanage/tsvcviewconfig/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcviewconfig', 'tsvcviewconfigeadd', '查询显示配置新增', 'tsvcmanage/tsvcviewconfig/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcviewconfig', 'tsvcviewconfigedit', '查询显示配置修改', 'tsvcmanage/tsvcviewconfig/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('userManager', 'userManager', '用户', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('warning', 'warning', '预警监控', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('warningAnnulMessage', 'warningAnnulMessage', '预警撤销信息', null, '/base/warning/warningmessage/warningannulmessageindex.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('warningManage', 'warningManage', '预警', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('warningMessage', 'annul', '预警信息撤销', 'warning/warningmessage/annul', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('warningMessage', 'warningMessage', '预警信息', null, '/base/warning/warningmessage/warningmessageindex.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('warningObject', 'warningObject', '预警对象', null, '/base/warning/warningobject/warningobject.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('warningObject', 'warningObjectAdd', '预警对象新增', 'warning/warningobject/add', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('warningObject', 'warningObjectDel', '预警对象删除', 'warning/warningobject/del', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('warningObject', 'warningObjectEdit', '预警对象修改', 'warning/warningobject/edit', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('warningRule', 'warningRule', '预警规则', null, '/base/warning/warningrule/warningrule.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('warningRule', 'warningRuleAdd', '预警规则新增', 'warning/warningrule/add', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('warningRule', 'warningRuleDel', '预警规则删除', 'warning/warningrule/del', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('warningRule', 'warningRuleEdit', '预警规则修改', 'warning/warningrule/edit', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('workBench', 'workBench', '工作台', null, null, null, '1', null, null, null, null);

-- ----------------------------
-- Table structure for `tsys_tenant`
-- ----------------------------
DROP TABLE IF EXISTS `tsys_tenant`;
CREATE TABLE `tsys_tenant` (
  `tenant_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '租户ID',
  `tenant_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '租户CODE',
  `tenant_name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '租户名称',
  `tenant_shortname` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '租户英文简称',
  `tenant_type` varchar(4) COLLATE utf8_bin NOT NULL COMMENT '0-普通 1-大型 2-集团',
  `tenant_status` varchar(4) COLLATE utf8_bin NOT NULL COMMENT '0-正常 1-注销 2-禁用',
  `telno` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '固定电话',
  `mobile` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '法人手机号',
  `email` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '法人邮箱',
  `remark` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `tenant_order` int(8) DEFAULT NULL COMMENT '排序',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_date` datetime DEFAULT NULL COMMENT '修改时间',
  `ext_field_1` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段1',
  `ext_field_2` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段2',
  `ext_field_3` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段3',
  `tenant_cnshortname` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '租户中文简称 ',
  PRIMARY KEY (`tenant_id`),
  UNIQUE KEY `nk_tsys_company_code` (`tenant_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tsys_tenant
-- ----------------------------
INSERT INTO `tsys_tenant` VALUES ('10000', '10000', '策赢平台', 'CeYing', '2', '0', null, '13682411482', 'chx@163.com', null, null, null, '2017-07-10 13:17:58', null, null, null, '策赢平台');
INSERT INTO `tsys_tenant` VALUES ('10461', '10460', '123', null, '0', '0', null, '13511111111', '11@qq.com', null, null, '2017-11-14 11:09:31', '2017-11-14 11:09:31', null, null, null, null);
INSERT INTO `tsys_tenant` VALUES ('10465', '10464', '243', null, '1', '0', null, '13511111111', '11.@qq.com', null, null, '2017-11-14 11:37:33', '2017-11-16 09:43:12', null, null, null, null);

-- ----------------------------
-- Table structure for `tsys_trans`
-- ----------------------------
DROP TABLE IF EXISTS `tsys_trans`;
CREATE TABLE `tsys_trans` (
  `trans_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'QA:交易编号',
  `trans_name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '交易名称',
  `kind_code` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '分类编号',
  `model_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '模块编号',
  `remark` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `ext_field_1` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段1',
  `ext_field_2` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段2',
  `ext_field_3` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段3',
  PRIMARY KEY (`trans_code`),
  KEY `nk_biz_trans_name` (`trans_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统交易表';

-- ----------------------------
-- Records of tsys_trans
-- ----------------------------
INSERT INTO `tsys_trans` VALUES ('BIZFRAME', '企金云平台', 'BIZFRAME', '1', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('BigContractMgmt', '反向保理额度管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('KeyInitConfirmState', '电子签名确认书', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('SupplierAccountsMgmt', '保理专户管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('WBflowTaskTodo', '其它待办任务', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('WBpayableChx', '应付账款审批', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('WBpayableIntention', '融资意愿审批', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('WBpayableIntentionApply', '发起融资意愿', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('WBpayableIntentionList', '优先融资意愿清单', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('WBpayableQuote', '融资确认审批', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('WBreturnPayableIntentionList', '退回融资意愿清单', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('WBsupportPayableIntentionList', '支持融资意愿清单', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('WBtripartiteAgreementChxTodo', '三方协议待办任务', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('accountTaskTodo', '待办应付账款', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('accountsPayable', '应付账款', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('accountsPayableQuery', '应付账款查询', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('accountsPayableSignature', '应付账款签名', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('agreement', '三方协议', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('agreementQuery', '三方协议查询', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('agreementTemp', '三方协议模板', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('agreementTempQuery', '三方协议模板查询', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('appeal', '申诉管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('appealDone', '已完成申诉', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('appealMgmt', '申诉类型管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('appealQuery', '申诉管理查询', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('appealStart', '我发起的申诉', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('appealTodoTask', '待处理申诉', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('appealmsMgmt', '申诉信息管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('areaMgmt', '银行辖区管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bankInvite', '银行邀请信息', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bankQuota', '银行给核心企业额度', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bankSupplierRelation', '银行分配供应商', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bankView', '合作银行查看', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('baseSet', '基础设置', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bigContract', '大合同', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bigContractQuery', '大合同信息查询', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bigContractSignature', '反向保理额度签名', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bizOrgSet', '组织机构设置', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bizSetCache', '缓存刷新', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bizSetLog', '业务日志设置', 'BIZFRAME', '1', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bizSetMenu', '系统菜单设置', 'BIZFRAME', '1', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bizSetOrgRole', '多岗设置', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bizSetRole', '角色设置', 'BIZFRAME', '1', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bizSetUser', '用户设置', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bizSetUserKey', '用户KEY绑定', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bizSetUserKeyApply', '用户KEY申请', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bizSysManager', '系统管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bizUserManager', '用户管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('blockchain', '区块链', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('blockchainApply', '申请成为节点', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('blockchainFind', '区块链取证', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('blockchainManage', '区块链', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('blockchainNodeManage', '节点管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('blockchainView', '区块链查看', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('business', '业务', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('caidan', '菜单', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('calendarsManager', '日历管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('checkSignature', '我要验签', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('comprehensiveQuery', '综合查询', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('cooperation', '合作', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('corecompanyFirstBank', '优先级', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('corecompanyInvite', '邀请', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('corecompanyQuota', '平台给核心企业额度', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('corecompanySupportBank', '支持级', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('corecompanyView', '核心企业查看', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('currencyManage', '币种管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('customService', '申诉', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('firstBank', '优先级银行', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('flowDelegateMgrnew', '委托', 'BIZFRAME', '1', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('flowDelegateMonitor', '委托监控', 'BIZFRAME', '1', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('flowForm', '表单管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('flowFormKind', '表单分类', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('flowFormReg', '表单设置', 'BIZFRAME', '1', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('flowManaDesign', '流程设计', 'BIZFRAME', '1', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('flowManaProcKind', '流程类型', 'BIZFRAME', '1', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('flowManage', '工作流设置', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('flowMenu', '工作流', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('flowMoniInstance', '实例监控', 'BIZFRAME', '1', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('flowMonitor', '工作流监控', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('flowMyProcessFinished', '我已完成的请求', 'BIZFRAME', '1', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('flowMyProcessUnfinished', '我未完成的请求', 'BIZFRAME', '1', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('flowTask', '工作台', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('flowTaskHistory', '已办任务', 'BIZFRAME', '1', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('flowTaskTodo', '待办任务', 'BIZFRAME', '1', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('gasMgmt', '燃料管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('gasaccount', '燃料账户', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('gastransactions', '燃料交易明细', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('generalSettings', '一般设置', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('keyInit', 'KEY初始化', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('keyInitRecord', 'KEY初始化记录', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('keyInventoryMgmt', 'KEY物料管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('keyPurchase', 'KEY申请单', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageAppeal', '申诉管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageBank', '合作银行', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageBigContract', '反向保理额度管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageCoreCompany', '核心企业', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageFuel', '燃油管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageIntegral', '积分管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageKeys', 'KEY管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageOrg', '组织管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageOrgRelation', '组织关系设置', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageOrgUser', '组织', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('managePayable', '应付账款', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageProvider', '供应商', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageRecable', '应收账款管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageServiceBank', '服务银行列表', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageSignature', '签名管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageSupplierAccount', '保理专户管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageTradeContract', '资金交易', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageTripartiteAgreement', '三方协议管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('match', '撮合融资意向', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('noticesManager', '公告管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('orgBankRelation', '核心企业分配银行', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('orgContractMgmt', '联系人管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('orgSupplierRelation', '核心企业分配供应商', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('organization', '组织机构', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('organizationContact', '联系人管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('organizationQuery', '组织机构', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('payableChx', '应付账款审批', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('payableExpireList', '应付账款到期付款清单', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('payableIntention', '融资意向审批', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('payableIntentionApply', '发起融资意向', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('payableIntentionList', '优先融资意愿清单', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('payableMgmt', '应付账款管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('payableQuote', '融资确认审批', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('payableQuoteQuery', '应付账款报价查询', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('platformTemplate', '平台模板', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('platformTemplateManage', '平台模板', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('recableQuoteQuery', '应收账款报价查询', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('regionMgmt', '区域管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('returnPayableIntentionList', '退回融资意愿清单', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('schedule', '计划任务', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('signature', '签约', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('supplierAccount', '供应商专户', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('supplierAccountQuery', '供应商专户查询', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('supplierBlackList', '供应商黑名单', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('supplierView', '供应商查看', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('supplierWhiteList', '供应商白名单', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('supportBank', '支持银行', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('supportPayableIntentionList', '支持融资意愿清单', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('syscompany', '企业管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('syscompanyinfo', '企业信息', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('syscontract', '协议设置', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('syspackage', '套餐设置', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('systemParam', '系统参数', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('systemParamManage', '系统参数管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('systemsettings', '系统设置', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('taTemplateSignature', '三方协议模板签名', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('task', '任务', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('taskmanage', '任务', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tdrctablelist', '数据权限管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tenant', '企业', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('trade', '交易', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tradeAccountBalance', '交易账户余额', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tradeAccountDetail', '交易账户明细', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tradeAccountMgmt', '交易账户管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tradeAccounts', '交易账户', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tradeAccountsQuery', '交易账户查询', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tradeBalance', '交易账户余额', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tradeTransaction', '交易账户明细', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tripartiteAgreementChx', '三方协议签约', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tripartiteAgreementChxDone', '已办任务', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tripartiteAgreementChxTodo', '待办任务', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tripartiteAgreementDone', '已完成合约', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tripartiteAgreementMgmt', '发起三方协议', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tripartiteAgreementRunning', '在途合约', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tripartiteAgreementSignature', '三方协议签名', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tripartiteAgreementTempMgmt', '三方协议模版管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tsvcinterface', '通用查询配置', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tsvcmanage', '辅助开发管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('userManager', '用户', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('warning', '预警监控', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('warningAnnulMessage', '预警撤销信息', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('warningManage', '预警', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('warningMessage', '预警信息', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('warningObject', '预警对象', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('warningRule', '预警规则', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('workBench', '工作台', 'BIZFRAME', '2', null, null, null, null);

-- ----------------------------
-- Table structure for `tsys_user`
-- ----------------------------
DROP TABLE IF EXISTS `tsys_user`;
CREATE TABLE `tsys_user` (
  `user_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '用户代码',
  `user_name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '用户名称',
  `user_pwd` varchar(256) COLLATE utf8_bin NOT NULL COMMENT '用户密码',
  `org_id` varchar(40) COLLATE utf8_bin NOT NULL COMMENT 'QA:组织ID,外键:TSYS_ORGANIZATION.ORG_ID',
  `user_type` varchar(4) COLLATE utf8_bin NOT NULL COMMENT '取数据字典[SYS_BIZ_USER_CATE] 0-柜员 1-用户',
  `user_status` varchar(4) COLLATE utf8_bin NOT NULL COMMENT '用于表示此用户状态 取数据字典[SYS_BIZ_USER_STATUS] 0-正常 1-注销 2-禁用',
  `lock_status` varchar(4) COLLATE utf8_bin NOT NULL COMMENT '用于表示此用户是否被锁定 取数据字典[SYS_BIZ_LOCK_STATUS] 0-签退 1-登录 2-非正常签退 3-锁定',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_date` datetime DEFAULT NULL COMMENT '最后修改时间',
  `pass_modify_date` datetime DEFAULT NULL COMMENT '密码修改时间',
  `mobile` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '用户手机号',
  `email` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '用户邮箱',
  `ext_flag` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展标识',
  `remark` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `ext_field_1` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段1',
  `ext_field_2` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段2',
  `ext_field_3` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段3',
  `ext_field_4` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段4',
  `ext_field_5` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段5',
  `user_order` int(11) DEFAULT NULL COMMENT 'QA:用户指令',
  `c_identitytype` char(3) COLLATE utf8_bin DEFAULT NULL COMMENT 'QA:身份证件类型',
  `c_identityno` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT 'QA:证件号码',
  `c_credentials` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT 'QA:证书',
  `tenant_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`user_id`),
  KEY `nk_biz_user_name` (`user_name`) USING BTREE,
  KEY `nk_biz_user_org_id` (`org_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表';

-- ----------------------------
-- Records of tsys_user
-- ----------------------------
INSERT INTO `tsys_user` VALUES ('1000000100101', '平台经办', '495c5df39c78a5af7e8c1fba334e39a8', '6000001', '1', '0', '0', null, '2018-01-15 16:28:49', null, null, null, null, null, null, null, null, null, null, '0', null, null, '4002545654', '10000');
INSERT INTO `tsys_user` VALUES ('1000000100102', '平台复核', '27e048ce3034196dc47b3d3d4f48662e', '6000001', '1', '0', '0', null, null, null, null, null, null, null, null, null, null, '798ee0bc1e43212beba5387e17fd2575', null, '0', null, null, null, '10000');
INSERT INTO `tsys_user` VALUES ('1000000100103', '平台审核', 'd274edf9f3e68f1d345be603f20698c9', '6000001', '1', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, '4048030770', '10000');
INSERT INTO `tsys_user` VALUES ('10000100001301', '经办', '868a97c512bac71118f3701d27ff4b7a', '0_100001000013', '1', '0', '0', '2017-11-23 19:21:07', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10000');
INSERT INTO `tsys_user` VALUES ('10000100001302', '复核', 'd0edee5e2deaea4680670ec21bec8ee6', '0_100001000013', '1', '0', '0', '2017-11-23 19:21:07', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10000');
INSERT INTO `tsys_user` VALUES ('10000100001303', '审核', '4d73d1e38f442bfd71bb08d772830b60', '0_100001000013', '1', '0', '0', '2017-11-23 19:21:07', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10000');
INSERT INTO `tsys_user` VALUES ('10000102', '平台', '4d73d1e38f442bfd71bb08d772830b60', '6000001', '1', '0', '0', '2017-11-23 10:18:23', '2017-11-23 10:18:23', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10000');
INSERT INTO `tsys_user` VALUES ('10000123123132', '12312312312444', '4d73d1e38f442bfd71bb08d772830b60', '0_10000001', '1', '0', '0', '2017-11-17 13:39:13', '2017-11-17 13:39:13', null, null, null, null, null, null, null, null, null, null, null, null, null, '12414124124142', '10000');
INSERT INTO `tsys_user` VALUES ('100001993', '审核人', '4d73d1e38f442bfd71bb08d772830b60', '6000001', '1', '0', '0', '2017-11-24 17:12:16', '2017-11-27 10:05:56', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10000');
INSERT INTO `tsys_user` VALUES ('100001994', '审核人22', '4d73d1e38f442bfd71bb08d772830b60', '6000001', '1', '0', '0', '2017-11-24 17:12:41', '2017-11-27 09:07:38', null, null, null, null, 'test', null, null, null, null, null, null, null, null, '22', '10000');
INSERT INTO `tsys_user` VALUES ('100001995', '审核人333', '4d73d1e38f442bfd71bb08d772830b60', '6000001', '1', '0', '0', '2017-11-27 10:18:44', '2017-11-27 10:21:38', '2017-11-27 10:21:38', null, null, null, 'test11111', null, null, null, null, null, null, null, null, '11', '10000');
INSERT INTO `tsys_user` VALUES ('10000300000201', '经办', '4d73d1e38f442bfd71bb08d772830b60', '0_100003000002', '1', '0', '0', '2017-11-24 14:53:04', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10000');
INSERT INTO `tsys_user` VALUES ('10000300000202', '复核', '4d73d1e38f442bfd71bb08d772830b60', '0_100003000002', '1', '0', '0', '2017-11-24 14:53:04', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10000');
INSERT INTO `tsys_user` VALUES ('10000300000203', '审核', '4d73d1e38f442bfd71bb08d772830b60', '0_100003000002', '1', '0', '0', '2017-11-24 14:53:04', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10000');
INSERT INTO `tsys_user` VALUES ('10000333333', '平台经办', '4d73d1e38f442bfd71bb08d772830b60', '6000001', '1', '0', '0', '2017-11-23 10:17:41', '2017-11-23 10:17:41', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10000');
INSERT INTO `tsys_user` VALUES ('100003333333333', '得我群翁3', '4d73d1e38f442bfd71bb08d772830b60', '6000001', '1', '0', '0', '2017-11-16 15:56:20', '2017-11-20 16:06:29', '2017-11-20 16:06:29', null, null, null, null, null, null, null, null, null, null, null, null, '1123123131', '10461');
INSERT INTO `tsys_user` VALUES ('admin', '系统管理员', '4d73d1e38f442bfd71bb08d772830b60', '6000001', '1', '0', '0', null, '2018-01-22 17:05:02', null, null, null, null, null, null, null, null, '524e1c2b0be677e6a86c8a5451a57d85,30164108ac7c54832000e8afee998bd0,37155e91144e679433efdd4119a7b7a3', null, '0', null, null, '4002013877', '10000');

-- ----------------------------
-- Table structure for `tsys_user_login`
-- ----------------------------
DROP TABLE IF EXISTS `tsys_user_login`;
CREATE TABLE `tsys_user_login` (
  `user_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'QA:用户代码，外键TSYS_USER.USER_ID',
  `last_login_date` datetime DEFAULT NULL COMMENT '上次成功登录日',
  `last_login_ip` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '最近登录操作IP',
  `login_fail_times` int(11) DEFAULT NULL COMMENT '登录累计失败次数',
  `last_fail_date` datetime DEFAULT NULL COMMENT '最后登录失败日',
  `ext_field` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段',
  `tenant_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '租户ID',
  `org_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '组织ID',
  `user_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名称',
  `tenant_cnshortname` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '用户中文简称',
  `tenant_shortname` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '用户英文代码',
  `mobile` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tsys_user_login
-- ----------------------------
INSERT INTO `tsys_user_login` VALUES ('1000000100101', '2018-01-18 15:08:00', '127.0.0.1', '0', '2018-01-15 16:28:42', '1334', '10000', '6000001', '平台经办', '策赢平台', 'CeYing', null);
INSERT INTO `tsys_user_login` VALUES ('1000000100102', '2018-01-12 10:44:55', '127.0.0.1', '0', '2018-01-12 10:44:17', '411', '10000', '6000001', '平台复核', '策赢平台', 'CeYing', null);
INSERT INTO `tsys_user_login` VALUES ('1000000100103', '2018-01-18 10:50:40', '127.0.0.1', '0', null, '164', '10000', '6000001', '平台审核', '策赢平台', 'CeYing', null);
INSERT INTO `tsys_user_login` VALUES ('10000100001301', '2018-01-22 17:53:19', '192.168.2.26', '0', '2018-01-22 14:49:30', null, '10000', '0_100001000013', '经办', null, null, null);
INSERT INTO `tsys_user_login` VALUES ('10000100001302', '2018-01-19 11:35:19', '192.168.2.26', '0', '2018-01-18 17:04:36', null, '10000', '0_100001000013', '复核', '策赢平台', 'CeYing', null);
INSERT INTO `tsys_user_login` VALUES ('100003333333333', '2017-11-20 16:07:24', '127.0.0.1', '1', '2017-11-20 16:07:24', null, '10461', '6000001', '得我群翁3', null, null, null);
INSERT INTO `tsys_user_login` VALUES ('admin', '2018-01-22 17:37:33', '127.0.0.1', '0', '2018-01-22 17:11:18', '7023', '10000', '6000001', '系统管理员', '策赢平台', 'CeYing', null);

-- ----------------------------
-- Table structure for `tsys_user_message`
-- ----------------------------
DROP TABLE IF EXISTS `tsys_user_message`;
CREATE TABLE `tsys_user_message` (
  `rowversion` int(4) NOT NULL,
  `msg_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '消息代码',
  `msg_title` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '消息标题',
  `send_user_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '发送者ID',
  `receive_user_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '接收者ID',
  `send_date` datetime DEFAULT NULL COMMENT '站内消息发送日期时间',
  `msg_content` varchar(4000) COLLATE utf8_bin DEFAULT NULL COMMENT '站内消息内容',
  `msg_type` varchar(4) COLLATE utf8_bin NOT NULL COMMENT '站内消息类型据字典[BIZ_MSG_TYPE] 1-站内邮件 2-站内消息',
  `msg_isred` varchar(4) COLLATE utf8_bin NOT NULL COMMENT '站内消息是否已读取数据字典[BIZ_IS_READ]  0-未读  1-已读',
  `ext_field` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段',
  `tenant_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`msg_id`),
  KEY `nk_biz_usermsg_send` (`send_user_id`) USING BTREE,
  KEY `nk_biz_usermsg_title` (`msg_title`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户消息表';

-- ----------------------------
-- Records of tsys_user_message
-- ----------------------------
INSERT INTO `tsys_user_message` VALUES ('20', '123', null, '7894', '8979', null, null, '789', '4564', null, null);

-- ----------------------------
-- Table structure for `tsys_user_right`
-- ----------------------------
DROP TABLE IF EXISTS `tsys_user_right`;
CREATE TABLE `tsys_user_right` (
  `trans_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'QA:交易编号，外键TSYS_SUBTRANS.TRANS_CODE',
  `sub_trans_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'QA:子交易号，外键:TSYS_SUBTRANS.SUB_TRANS_CODE',
  `user_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'QA:授权用户，外键TSYS_USER.USER_ID',
  `create_by` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '分配人',
  `create_date` decimal(22,0) DEFAULT NULL COMMENT '分配时间',
  `right_flag` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '用于表示该授权的操作授权标志 取数据字典[SYS_BIZ_RIGHT_FLAG] 1-操作 2-授权',
  `right_enable` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '用于表示该授权的是否禁止标志 取数据字典[SYS_BIZ_RIGHT_ENABLE] 0-禁止 1-可用',
  `tenant_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`trans_code`,`sub_trans_code`,`user_id`,`right_flag`),
  KEY `nk_biz_userright_trans_code` (`trans_code`,`sub_trans_code`) USING BTREE,
  KEY `nk_biz_userright_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tsys_user_right
-- ----------------------------
INSERT INTO `tsys_user_right` VALUES ('BIZFRAME', 'BIZFRAME', '100001995', null, '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('accountsPayable', 'accountsPayable', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('accountsPayable', 'accountsPayable', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('accountsPayableQuery', 'accountsPayableQuery', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('accountsPayableQuery', 'accountsPayableQuery', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('agreement', 'agreement', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('agreement', 'agreement', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('agreementQuery', 'agreementQuery', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('agreementQuery', 'agreementQuery', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('agreementTemp', 'agreementTemp', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('agreementTemp', 'agreementTemp', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('agreementTempQuery', 'agreementTempQuery', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('agreementTempQuery', 'agreementTempQuery', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('appeal', 'appeal', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('appeal', 'appeal', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('appealQuery', 'appealQuery', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('appealQuery', 'appealQuery', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('bigContract', 'bigContract', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('bigContract', 'bigContract', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('bigContractQuery', 'bigContractQuery', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('bigContractQuery', 'bigContractQuery', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('comprehensiveQuery', 'comprehensiveQuery', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('comprehensiveQuery', 'comprehensiveQuery', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('organization', 'organization', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('organization', 'organization', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('organizationContact', 'organizationContact', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('organizationContact', 'organizationContact', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('organizationQuery', 'organizationQuery', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('organizationQuery', 'organizationQuery', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('supplierAccount', 'supplierAccount', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('supplierAccount', 'supplierAccount', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('supplierAccountQuery', 'supplierAccountQuery', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('supplierAccountQuery', 'supplierAccountQuery', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('tradeAccounts', 'tradeAccounts', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('tradeAccounts', 'tradeAccounts', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('tradeAccountsQuery', 'tradeAccountsQuery', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('tradeAccountsQuery', 'tradeAccountsQuery', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('tradeBalance', 'tradeBalance', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('tradeBalance', 'tradeBalance', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('tradeTransaction', 'tradeTransaction', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('tradeTransaction', 'tradeTransaction', 'admin', 'admin', '0', '2', null, null);

-- ----------------------------
-- Table structure for `t_organizationrelation`
-- ----------------------------
DROP TABLE IF EXISTS `t_organizationrelation`;
CREATE TABLE `t_organizationrelation` (
  `urid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ourorgid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `opporgid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `priority` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `category` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `corecompanysupplierrate` decimal(8,4) DEFAULT NULL,
  `createdby` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `createdon` datetime NOT NULL,
  `lastmodifiedby` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `lastmodifiedon` datetime DEFAULT NULL,
  `rowversion` int(4) NOT NULL,
  `description` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `isblack` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `extensiondate` decimal(22,0) DEFAULT '0',
  `organizationrelationid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`urid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_organizationrelation
-- ----------------------------
INSERT INTO `t_organizationrelation` VALUES ('0015cb59304340cb86a156be6cacc688', '0_100002000001', '0_100003000454', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:48', null, '2017-12-12 11:58:46', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('002a6d13c60945ad8ad3ef5de9ce4bd9', '0_100002000001', '0_100003000130', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:06', null, '2017-12-12 11:58:04', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('012fad601e764c34b67e12f27227e910', '0_100002000001', '0_100003000119', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:05', null, '2017-12-12 11:58:03', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('0134238d708641bb819886ba37ea1fca', '0_100002000001', '0_100003000033', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:54', null, '2017-12-12 11:57:52', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('015d4a3a775f4531a44a4e20088f1097', '0_100002000001', '0_100003000166', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:11', null, '2017-12-12 11:58:09', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('01bcebb3052c42cdab3075b93bfd04e8', '0_100002000001', '0_100003000388', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:41', null, '2017-12-12 11:58:38', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('01d694023da045c09da76614d01fc6b2', '0_100002000001', '0_100003000557', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:54', null, '2017-12-12 16:11:51', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('024cb1158ce2457ab0e9bda377b68949', '0_100002000001', '0_100003000150', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:09', null, '2017-12-12 11:58:07', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('03d70e3ca4534b4584c71e6cf700c825', '0_100002000001', '0_100003000174', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:12', null, '2017-12-12 11:58:10', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('0430b2ae8ec74f3f8a77c7dd9aa1da42', '0_100002000001', '0_100003000494', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:53', null, '2017-12-12 11:58:51', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('045915442d7a4d8a93852f16db8cb7c8', '0_100002000001', '0_100003000158', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:10', null, '2017-12-12 11:58:08', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('04cde4e4b4a34ed28f8432434147985b', '0_100002000010', '0_100001000001', '3', '1', null, 'admin', '2017-12-25 14:26:52', '10000100000101', '2018-01-03 14:29:30', '6', null, null, '0', null);
INSERT INTO `t_organizationrelation` VALUES ('05e91ecb8f854767939519a4fac3bcef', '0_100002000001', '0_100003000471', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:51', null, '2017-12-12 11:58:48', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('06db0c29db8341ad874599063fc773a1', '0_100002000001', '0_100003000096', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:02', null, '2017-12-12 11:58:00', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('06e1c6d782ff420197c9713a263d33aa', '0_100002000001', '0_100003000144', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:08', null, '2017-12-12 11:58:06', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('06ebbcace0fa452ab3d5590df0fa435c', '0_100002000001', '0_100003000165', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:11', null, '2017-12-12 11:58:09', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('072c71dac55c4407bd5b15bca7d8b373', '0_100002000001', '0_100003000094', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:02', null, '2017-12-12 11:58:00', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('072d05a4393b49db8de1b39ec1c63943', '0_100002000001', '0_100003000410', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:43', null, '2017-12-12 11:58:41', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('07eab27072a04e9fb6ab950ead928527', '0_100002000001', '0_100003000507', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:55', null, '2017-12-12 11:58:53', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('081ce74dace64333b9fc9476a018a03d', '0_100002000001', '0_100003000556', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:53', null, '2017-12-12 16:11:51', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('0835822257ba4f94ad541a61a9d4eb7d', '0_100002000001', '0_100003000546', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:50', null, '2017-12-12 16:11:48', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('08b46770df17494b9f95d3d8465d931a', '0_100002000001', '0_100003000056', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:57', null, '2017-12-12 11:57:55', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('08e72b3f6987400299b1c3aeadcfb152', '0_100002000001', '0_100003000245', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:23', null, '2017-12-12 11:58:21', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('09096fa52dec4949baab76fde7368aee', '0_100002000001', '0_100003000415', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:43', null, '2017-12-12 11:58:41', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('09748645ba854a70832c66d14b1f9e4c', '0_100002000001', '0_100003000580', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:59', null, '2017-12-12 16:11:56', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('09d5cb49979848e39e4cb27ad45353ef', '0_100002000001', '0_100003000282', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:29', null, '2017-12-12 11:58:26', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('0a19510c919f4705a681b1344c91a4b0', '0_100002000001', '0_100003000413', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:43', null, '2017-12-12 11:58:41', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('0a4ba83da7424a56bb7a8f5ebcbb5124', '0_100002000001', '0_100003000602', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:05', null, '2017-12-12 16:12:02', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('0a7cb07bc64c40eebd604b57aa09191c', '0_100002000001', '0_100003000486', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:52', null, '2017-12-12 11:58:50', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('0a8752093c134d2b9e6e7bf3752cf5d0', '0_100002000001', '0_100003000086', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:01', null, '2017-12-12 11:57:59', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('0b0c58196fc9444e89df2cc8ceaa4202', '0_100002000001', '0_100003000077', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:00', null, '2017-12-12 11:57:58', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('0b66d7a0be96479e9303c8246f01d2d1', '0_100002000001', '0_100003000219', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:19', null, '2017-12-12 11:58:17', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('0bc83d6712d54d47a94027a5a30e6c17', '0_100002000001', '0_100003000022', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:54', null, '2017-12-12 11:57:51', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('0c3d1f1d29e3484587f0c0f3dab3b6d5', '0_100002000001', '0_100003000514', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:56', null, '2017-12-12 11:58:54', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('0c686633a98c458ebb4ef5232deb1cce', '0_100002000001', '0_100003000128', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:06', null, '2017-12-12 11:58:04', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('0cf4ac9fb82641e7b3190abdfd308bdb', '0_100002000001', '0_100003000241', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:23', null, '2017-12-12 11:58:20', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('0d63b1ede2a64e3881e8751654e17af4', '0_100002000001', '0_100003000574', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:57', null, '2017-12-12 16:11:55', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('0dcb7cbabb8d4a608bcfa01e7a5cb405', '0_100002000001', '0_100003000068', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:58', null, '2017-12-12 11:57:56', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('0de494cc61be41429fab336e6f1f5765', '0_100002000001', '0_100003000298', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:30', null, '2017-12-12 11:58:28', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('0e35f49e10cd4ce5b6ebd987d9d0a6b0', '0_100002000001', '0_100003000011', null, '2', null, '10000200000101', '2017-11-24 15:01:35', null, '2017-11-24 15:01:35', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('0e4d32d5a9f94c1d8b63ad74b01db0d9', '0_100002000001', '0_100003000055', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:57', null, '2017-12-12 11:57:55', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('0e607393160a4310b7d86989ece57d66', '0_100002000001', '0_100003000189', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:14', null, '2017-12-12 11:58:12', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('0ea76ded9c0d46299a274c63658c9b70', '0_100002000001', '0_100003000300', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:30', null, '2017-12-12 11:58:28', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('0f6ac3b6ff554c5ba1f016eaba3a1501', '0_100002000001', '0_100003000495', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:54', null, '2017-12-12 11:58:51', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('1007ab4f161542498e9d2439e7097fba', '0_100002000001', '0_100003000103', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:03', null, '2017-12-12 11:58:01', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('119f3d8672104dcaa77e833888f28fbb', '0_100002000001', '0_100003000389', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:41', null, '2017-12-12 11:58:38', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('11aa3306f21d477db5b07bc5dc9be49b', '0_100002000001', '0_100003000224', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:20', null, '2017-12-12 11:58:18', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('12289ae8265c40b29757e6ed68eb1de9', '0_100002000001', '0_100003000013', null, '2', null, '10000200000101', '2017-11-24 15:01:35', null, '2017-11-24 15:01:35', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('125649d451ef42459389d2c8506f6ff9', '0_100002000001', '0_100003000459', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:49', null, '2017-12-12 11:58:47', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('129ba30c76724d43b9318c832aedf6ba', '0_100002000001', '0_100003000190', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:14', null, '2017-12-12 11:58:12', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('130b2575af6b4beb9cc889f01eff6047', '0_100002000001', '0_100003000181', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:13', null, '2017-12-12 11:58:11', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('1343217967154db09df0472cd300b921', '0_100002000001', '0_100003000171', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:12', null, '2017-12-12 11:58:10', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('135689e5e85d4066b5087cc4e485f6d7', '0_100002000001', '0_100003000210', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:18', null, '2017-12-12 11:58:16', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('13da00c8d9b2429395588d469c71e1da', '0_100002000001', '0_100003000536', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:47', null, '2017-12-12 16:11:45', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('145b442db5e5422bac1f468a04fd3f7a', '0_100002000001', '0_100003000045', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:56', null, '2017-12-12 11:57:54', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('147f5f67ce8d463b88a13adf196a581c', '0_100002000001', '0_100003000361', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:38', null, '2017-12-12 11:58:35', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('14941612ec6e476a869d6d0049cbf2bc', '0_100002000001', '0_100003000139', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:07', null, '2017-12-12 11:58:05', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('162fe36df4734c63a77a471de33f6f4c', '0_100002000001', '0_100003000087', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:01', null, '2017-12-12 11:57:59', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('16e7906b9c5945fc9c07b84595af4ef0', '0_100002000001', '0_100003000267', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:26', null, '2017-12-12 11:58:24', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('190079b98a6149d7a1d1d6a9e2fa816a', '0_100002000001', '0_100003000206', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:18', null, '2017-12-12 11:58:16', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('19166b0516f74608a5065377cee66d84', '0_100002000001', '0_100003000167', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:11', null, '2017-12-12 11:58:09', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('1921999558f845948a377c39659fe9b3', '0_100002000001', '0_100003000017', null, '2', '0.0200', '1000000100101', '2017-12-08 11:40:06', null, '2017-12-08 11:40:02', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('1952e7ac0b9f4d53a97ed576450ddcd1', '0_100002000001', '0_100003000363', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:38', null, '2017-12-12 11:58:36', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('19cf6fe0600e4697934409c72ef79aa6', '0_100002000001', '0_100003000309', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:31', null, '2017-12-12 11:58:29', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('1a597c297e674ba980ab413f1af9d2a5', '0_100002000001', '0_100003000310', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:32', null, '2017-12-12 11:58:29', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('1aff58b40016492292834ecc7b5b79eb', '0_100002000001', '0_100003000497', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:54', null, '2017-12-12 11:58:52', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('1b0d9b76abfa4764ba22db18b2466f5c', '0_100002000001', '0_100003000365', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:38', null, '2017-12-12 11:58:36', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('1be297d858b740818d99526975296aa6', '0_100002000001', '0_100003000420', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:44', null, '2017-12-12 11:58:42', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('1cc2d366f37a4250bc027a6e7a5061d1', '0_100002000001', '0_100003000577', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:58', null, '2017-12-12 16:11:56', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('1d08583fbd664a9ca9160882346a13dc', '0_100002000001', '0_100003000408', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:43', null, '2017-12-12 11:58:41', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('1e61c838a5974948a80d1d28591618d4', '0_100002000001', '0_100003000532', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:46', null, '2017-12-12 16:11:44', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('1e8ee88d763b47d29e41b98537ba5dda', '0_100002000001', '0_100003000338', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:35', null, '2017-12-12 11:58:33', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('1ea925e8995c418998675b13e00780c2', '0_100002000001', '0_100003000002', null, '2', '-1.0000', 'admin', '2017-11-21 15:43:40', null, '2017-11-21 15:43:36', '15', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('1efe1cdf23824706ab4f2a30dc52e184', '0_100002000001', '0_100003000567', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:56', null, '2017-12-12 16:11:53', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('1f090d2f0d3848a092f636edfa2f5a38', '0_100002000001', '0_100003000336', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:35', null, '2017-12-12 11:58:33', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('1f4f251658c1411584b316e3cfa4d9a1', '0_100002000001', '0_100003000043', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:56', null, '2017-12-12 11:57:53', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('1f68449d9ed44526affe4473d83f266b', '0_100002000001', '0_100003000616', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:07', null, '2017-12-12 16:12:05', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('1f82ef801b2e4a0a8cf5462ec3770c85', '0_100002000001', '0_100003000059', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:57', null, '2017-12-12 11:57:55', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('1f84335074a3438ba0d74f0e2c645b35', '0_100002000001', '0_100003000007', null, '2', null, '10000200000101', '2017-11-24 15:01:33', null, '2017-11-24 15:01:33', '2', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('20004c6bb8474e20ab12df6e0cbe4a2f', '0_100001000001', '0_100003000002', null, '3', null, '1000000100101', '2017-12-07 16:57:44', null, '2017-12-07 16:57:43', '1', null, null, '0', 'ae0a74766f964f6e9a4e81c386262872');
INSERT INTO `t_organizationrelation` VALUES ('206291369c924bbb856005b7b6b0dbd6', '0_100002000001', '0_100003000175', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:12', null, '2017-12-12 11:58:10', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('206fb68141884debbe09f52aae954af9', '0_100002000001', '0_100003000104', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:03', null, '2017-12-12 11:58:01', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('207c46ff18bc4a14baf0b79ea95e2e7f', '0_100002000001', '0_100003000009', null, '2', null, '10000200000101', '2017-11-24 15:01:34', null, '2017-11-24 15:01:34', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('20d7259f029e4115aac60d58e1935ce7', '0_100002000001', '0_100003000032', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:54', null, '2017-12-12 11:57:52', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('212a0917eceb4663b9f9ef91bc014210', '0_100002000001', '0_100003000235', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:22', null, '2017-12-12 11:58:19', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('212d3b8758624923b3feee7c906794b4', '0_100002000001', '0_100003000198', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:15', null, '2017-12-12 11:58:13', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('215916f2b15b4b849dc2dbe28fd2e93d', '0_100001000001', '0_100003000016', null, '3', null, '1000000100101', '2017-12-07 18:48:46', null, '2017-12-07 18:48:44', '1', null, null, '0', '2efbeb3f8cda4c78ad67673aaefcbc44');
INSERT INTO `t_organizationrelation` VALUES ('21b2e5cd76b84a3396eed30d94faded4', '0_100002000001', '0_100003000202', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:17', null, '2017-12-12 11:58:15', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('22945eef07784282ab2b6afb11dc29a2', '0_100002000001', '0_100003000188', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:14', null, '2017-12-12 11:58:12', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('2378fd0972aa46828b1b34cc7e152ebb', '0_100002000001', '0_100003000247', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:23', null, '2017-12-12 11:58:21', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('24665d6d074c427aa41add14fdfa2a59', '0_100002000001', '0_100003000399', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:42', null, '2017-12-12 11:58:40', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('246b0fb84b924546b66130311e34d6f8', '0_100002000001', '0_100003000376', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:39', null, '2017-12-12 11:58:37', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('256391e98ebe4c62a2705ba0991732b9', '0_100002000001', '0_100003000573', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:57', null, '2017-12-12 16:11:55', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('25752c4f09634caf9396a011e02bcfdc', '0_100002000001', '0_100003000205', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:18', null, '2017-12-12 11:58:15', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('2670905958a541ba95acb3b028ee1a65', '0_100002000001', '0_100003000081', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:01', null, '2017-12-12 11:57:59', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('26afd98f686a4455b46178cb1869873f', '0_100002000001', '0_100003000375', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:39', null, '2017-12-12 11:58:37', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('2765d2478d36462fa16d189dc5755b82', '0_100002000001', '0_100003000176', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:12', null, '2017-12-12 11:58:10', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('276747937b8d41d98dc1a01e73e110ab', '0_100002000001', '0_100003000343', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:36', null, '2017-12-12 11:58:33', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('276deb4118bc4524981afac7afb5ffc9', '0_100002000001', '0_100003000319', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:32', null, '2017-12-12 11:58:30', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('27b3e85cf5e94015aa0ecf6e2f07ecdb', '0_100002000001', '0_100003000177', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:12', null, '2017-12-12 11:58:10', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('27df2470adbc495394a61d7db472ef12', '0_100002000001', '0_100003000306', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:31', null, '2017-12-12 11:58:29', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('298fb0f927034fa08fac686677a31dfc', '0_100002000001', '0_100003000348', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:36', null, '2017-12-12 11:58:34', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('2a0ec8cca7e0427f87665931d8737bf7', '0_100001000002', '0_100003000002', null, '3', null, '1000000100101', '2017-12-07 16:50:01', null, '2017-12-07 16:50:00', '1', null, null, '0', '677fb1a7b23d445da81fddfbd451e091');
INSERT INTO `t_organizationrelation` VALUES ('2a15c934f238408aae1f1f36e072b248', '0_100002000001', '0_100003000222', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:20', null, '2017-12-12 11:58:18', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('2a1873737881435b9d42910e2ac3c2de', '0_100002000001', '0_100003000422', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:44', null, '2017-12-12 11:58:42', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('2ac23ec808ed46bc98231b873095c3f0', '0_100002000001', '0_100003000120', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:05', null, '2017-12-12 11:58:03', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('2b13c2dcfd0b48e0b670c98246f2eb72', '0_100002000001', '0_100003000394', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:41', null, '2017-12-12 11:58:39', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('2b3cfd52fc414eb1956c59318bfaaf5d', '0_100002000001', '0_100003000048', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:56', null, '2017-12-12 11:57:54', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('2c0ec1693a7c48f7bfae7a4de57c4ac4', '0_100002000001', '0_100003000609', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:06', null, '2017-12-12 16:12:04', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('2c6bdcdaae344ef9aef3fcfda472eccb', '0_100002000001', '0_100003000323', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:33', null, '2017-12-12 11:58:31', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('2ccdfb64ad0641ca93a2b66bc5ed1120', '0_100002000001', '0_100003000501', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:54', null, '2017-12-12 11:58:52', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('2d122620c49a443d86d53c341156843b', '0_100002000001', '0_100003000600', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:04', null, '2017-12-12 16:12:02', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('2d216df7986c4f1d882a864b531d8dd9', '0_100002000001', '0_100003000116', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:05', null, '2017-12-12 11:58:02', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('2e3def281cd0483e8edbbb058c28de44', '0_100002000001', '0_100003000531', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:46', null, '2017-12-12 16:11:44', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('2e74f17c32c94015a4748327157d39d8', '0_100002000001', '0_100003000061', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:58', null, '2017-12-12 11:57:55', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('2e87823f2bad4308868e6dec00fb96c2', '0_100002000001', '0_100003000122', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:05', null, '2017-12-12 11:58:03', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('2efbeb3f8cda4c78ad67673aaefcbc44', '0_100002000001', '0_100001000001', '1', '1', null, '1000000100101', '2017-10-31 14:52:50', '10000100000101', '2018-01-08 11:43:17', '40', '测试描述修改2', null, '2', null);
INSERT INTO `t_organizationrelation` VALUES ('2f56c434cd6d413db25257a26f63ba20', '0_100002000001', '0_100003000576', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:58', null, '2017-12-12 16:11:55', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('2f6807ba6a0a427e8e9774f54f4a3e77', '0_100002000001', '0_100003000265', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:26', null, '2017-12-12 11:58:24', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('3009abbd0c994222bdb2f90947290710', '0_100002000001', '0_100003000434', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:46', null, '2017-12-12 11:58:44', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('30226483d73f4bc295bc312f9a1ae797', '0_100002000001', '0_100001000002', '2', '1', null, '1000000100101', '2017-11-17 09:43:40', null, '2017-11-17 09:43:37', '1', null, null, '0', null);
INSERT INTO `t_organizationrelation` VALUES ('307c9b6dd38242fcaf0db77b8e367cb0', '0_100002000001', '0_100003000355', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:37', null, '2017-12-12 11:58:35', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('3080bd40ff7b43c4860136525243e414', '0_100002000001', '0_100003000424', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:44', null, '2017-12-12 11:58:42', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('31a871a024b8429bbecd9843d66e1977', '0_100002000001', '0_100003000457', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:49', null, '2017-12-12 11:58:47', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('31c49a9ba5f74127b17f90e5a4d44d2d', '0_100002000001', '0_100003000387', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:40', null, '2017-12-12 11:58:38', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('32551c09c1ad4a2b83ca614ea51183a4', '0_100002000001', '0_100003000019', null, '2', '0.0200', '10000200000101', '2017-12-11 11:02:26', null, '2017-12-11 11:02:24', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('328abfffa0a04146a3a1743139b661c0', '0_100002000001', '0_100003000191', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:14', null, '2017-12-12 11:58:12', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('328ed7fd18a140ed83e374b8cfa98e03', '0_100002000001', '0_100003000356', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:37', null, '2017-12-12 11:58:35', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('32a3c2eb1c9e4ecda0c0a8193fac619f', '0_100002000001', '0_100003000288', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:29', null, '2017-12-12 11:58:27', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('33063e3b02bc4770a474a62410e44b09', '0_100002000001', '0_100003000067', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:58', null, '2017-12-12 11:57:56', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('34b7ba829c9442c18f17b7b733490a0b', '0_100002000001', '0_100003000051', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:56', null, '2017-12-12 11:57:54', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('35112e2fe8dd4df2a8ac325503a517e6', '0_100002000001', '0_100003000050', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:56', null, '2017-12-12 11:57:54', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('360249509c2349d78a51e708889f05ce', '0_100002000001', '0_100003000417', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:44', null, '2017-12-12 11:58:42', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('3630ea6ba26f4904a2d62a04e8ccdee3', '0_100002000001', '0_100003000163', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:11', null, '2017-12-12 11:58:08', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('3755f91b7bef4240aebb344fc2e30b3a', '0_100002000001', '0_100003000342', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:35', null, '2017-12-12 11:58:33', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('37caeecd6a8541a58373c8977297cbd2', '0_100002000001', '0_100003000305', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:31', null, '2017-12-12 11:58:29', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('38270f3a0ab745eab458f2a8e35e2b4a', '0_100002000001', '0_100003000549', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:51', null, '2017-12-12 16:11:49', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('38727ccacc9b4ec59f1bfa242086cf88', '0_100002000001', '0_100003000308', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:31', null, '2017-12-12 11:58:29', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('38d24cee2e4d4693ab9ed23aa9e5d0ed', '0_100002000001', '0_100003000236', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:22', null, '2017-12-12 11:58:20', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('3a8876cbed02466780178bb7cd7c6ef5', '0_100002000001', '0_100003000062', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:58', null, '2017-12-12 11:57:56', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('3aa07d22a9694b0891235d56dd8eeb50', '0_100002000001', '0_100003000441', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:47', null, '2017-12-12 11:58:44', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('3b45d454912346b6b4fdcfd6843d99ec', '0_100002000001', '0_100003000179', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:13', null, '2017-12-12 11:58:10', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('3b6cc3a7cb224d979c8bf7b2b9298888', '0_100002000001', '0_100003000316', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:32', null, '2017-12-12 11:58:30', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('3c427af9104b40248efd24591f85e918', '0_100002000001', '0_100003000594', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:02', null, '2017-12-12 16:12:00', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('3cb9d515a6434a5e9e322e5bc3353514', '0_100002000001', '0_100003000184', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:13', null, '2017-12-12 11:58:11', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('3dde26a7186843b4991e32ecdbb77b8a', '0_100002000001', '0_100003000571', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:57', null, '2017-12-12 16:11:54', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('3e1243cecea04a7fa06d2f4db066da32', '0_100002000001', '0_100003000384', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:40', null, '2017-12-12 11:58:38', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('3e605fb2fbf7417589fc5037a1cb04a2', '0_100002000001', '0_100003000619', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:08', null, '2017-12-12 16:12:06', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('3e83981a12034ce198aaa672e65a2736', '0_100002000001', '0_100003000136', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:07', null, '2017-12-12 11:58:05', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('3ea70919ac354b11a9ceef41b59d6815', '0_100002000001', '0_100003000095', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:02', null, '2017-12-12 11:58:00', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('3ecfef1465264f4b901d2fa4098680ad', '0_100002000001', '0_100003000052', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:57', null, '2017-12-12 11:57:54', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('3ed42ddaf9504557a496012d76783252', '0_100002000001', '0_100003000252', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:24', null, '2017-12-12 11:58:22', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('3eec4c0a24da4c4fb0802fff0bd87673', '0_100002000001', '0_100003000028', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:54', null, '2017-12-12 11:57:52', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('3f4d56b535fe41caa8a9432d5ab70a91', '0_100002000001', '0_100003000407', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:43', null, '2017-12-12 11:58:40', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('40694048381c44d1a98837ec9ebd7130', '0_100002000001', '0_100003000566', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:56', null, '2017-12-12 16:11:53', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('40e0763d2ea34a0390d2af7323397420', '0_100002000001', '0_100003000058', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:57', null, '2017-12-12 11:57:55', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('40f91a66c8af4a298ab0f19722e445dd', '0_100001000001', '0_100003000002', null, '3', null, '1000000100101', '2017-12-07 09:48:19', null, '2017-12-07 09:48:19', '1', null, null, '0', '2efbeb3f8cda4c78ad67673aaefcbc44');
INSERT INTO `t_organizationrelation` VALUES ('411b4af0f5634d6fb9186a09c51533c5', '0_100002000001', '0_100003000610', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:06', null, '2017-12-12 16:12:04', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('412c8cbab4724b4391be3866d5d8093c', '0_100002000001', '0_100003000098', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:03', null, '2017-12-12 11:58:00', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('41c0f2228b2a433c8ac90a5f8b3b001a', '0_100002000001', '0_100003000511', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:56', null, '2017-12-12 11:58:53', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('41e4632d16e84d788a69e56832f6871b', '0_100002000001', '0_100003000117', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:05', null, '2017-12-12 11:58:03', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('422830cdfa874cfb83f90e1a99f38302', '0_100002000001', '0_100003000545', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:50', null, '2017-12-12 16:11:47', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('4288dea9de304e0a9fdea064306cf2f7', '0_100002000001', '0_100003000027', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:54', null, '2017-12-12 11:57:52', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('42b9f79ee7404dac96dda810ca6661ab', '0_100002000001', '0_100003000035', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:55', null, '2017-12-12 11:57:53', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('42ca77cfd6504c75af2f7a47c27cf0da', '0_100002000001', '0_100003000121', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:05', null, '2017-12-12 11:58:03', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('43494786ff80421ab7b7db264b216177', '0_100002000001', '0_100003000482', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:52', null, '2017-12-12 11:58:50', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('4408b6cbac3d417ea143d1c0bc522785', '0_100002000001', '0_100003000185', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:13', null, '2017-12-12 11:58:11', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('442b05179d3a4c0096414f3df600ca74', '0_100002000001', '0_100003000261', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:26', null, '2017-12-12 11:58:24', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('442dcff747524495afcc6b5f1cedd256', '0_100002000001', '0_100003000197', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:15', null, '2017-12-12 11:58:13', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('44614876da944d29851ced0e28d6d173', '0_100002000001', '0_100003000322', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:33', null, '2017-12-12 11:58:31', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('4591233619cf402d8bc1c8996150fee4', '0_100002000001', '0_100003000134', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:07', null, '2017-12-12 11:58:05', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('45afe6b4c74246b890601ee34795a0b7', '0_100002000001', '0_100003000484', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:52', null, '2017-12-12 11:58:50', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('461f66bd493247f7a87cc41a5716af6b', '0_100002000001', '0_100003000401', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:42', null, '2017-12-12 11:58:40', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('46bf936884ed4369a765da40ccb18110', '0_100002000001', '0_100003000385', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:40', null, '2017-12-12 11:58:38', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('4713d09263ab49f6978d354ca905f90a', '0_100002000001', '0_100003000451', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:48', null, '2017-12-12 11:58:46', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('472e47022c234548babf90493f0d2f39', '0_100002000001', '0_100003000100', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:03', null, '2017-12-12 11:58:01', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('479450dfd93a44dab9d3681fc91970ba', '0_100002000001', '0_100003000446', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:47', null, '2017-12-12 11:58:45', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('481a8569fc0b43c2bd64929ba72d0ad5', '0_100002000001', '0_100003000209', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:18', null, '2017-12-12 11:58:16', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('481fb79c95f64055a20741d1335bf2e0', '0_100002000001', '0_100003000250', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:24', null, '2017-12-12 11:58:22', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('4830c1f896ee4b4babb3191869828162', '0_100002000004', '0_100001000001', '3', '1', null, '1000000100101', '2017-12-22 15:30:14', '10000100000101', '2018-01-03 14:29:30', '4', null, null, '0', null);
INSERT INTO `t_organizationrelation` VALUES ('48351b924ced467a966aad3b17cac801', '0_100002000001', '0_100003000453', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:48', null, '2017-12-12 11:58:46', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('4888e067424f42bb97f730f4809bb7e6', '0_100002000001', '0_100003000595', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:02', null, '2017-12-12 16:12:00', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('48f0037432ac4159b5d20bab651d14ac', '0_100002000001', '0_100003000023', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:54', null, '2017-12-12 11:57:52', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('493df6d5746f4346ba26a37045d7f831', '0_100002000001', '0_100003000429', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:45', null, '2017-12-12 11:58:43', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('494650400a1b402789e2b07630405d44', '0_100002000001', '0_100003000558', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:54', null, '2017-12-12 16:11:51', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('4a228f01baae444eb7fb07da5459613a', '0_100002000001', '0_100003000578', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:58', null, '2017-12-12 16:11:56', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('4b55521428d5485a9b30564d53fe5bd3', '0_100002000001', '0_100003000537', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:48', null, '2017-12-12 16:11:45', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('4bbb59c21350480f9cc6ccc33d97e90c', '0_100002000001', '0_100003000169', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:12', null, '2017-12-12 11:58:09', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('4bf6a56112c442d9975080baa263e02d', '0_100002000001', '0_100003000194', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:15', null, '2017-12-12 11:58:13', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('4d8d27c1473a4b40ad2656185ccc5a16', '0_100002000001', '0_100003000409', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:43', null, '2017-12-12 11:58:41', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('4decbd2f29d44ca18aa93f3862fee87f', '0_100002000001', '0_100003000544', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:50', null, '2017-12-12 16:11:47', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('4e1332b22b4b45ad98c8f32d8fcb3412', '0_100002000001', '0_100003000001', null, '2', '0.0200', '1000000100101', '2017-12-30 11:32:18', null, '2017-11-29 11:27:24', '8', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('4e5f5702d3994e2186f0dfa4365f9ba5', '0_100002000001', '0_100003000039', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:55', null, '2017-12-12 11:57:53', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('4e605646fc7947acb4f3f182686752c1', '0_100002000001', '0_100003000063', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:58', null, '2017-12-12 11:57:56', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('4e8a1720851647868a75ca9ca4a03900', '0_100002000001', '0_100003000231', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:21', null, '2017-12-12 11:58:19', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('4eb816d52c78438187ff37784e71de65', '0_100002000001', '0_100003000292', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:30', null, '2017-12-12 11:58:27', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('4f5266df802a44bf8095759170a1a3b7', '0_100002000001', '0_100003000321', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:33', null, '2017-12-12 11:58:31', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('4f52861b74c14169a196925e2a269657', '0_100002000001', '0_100003000152', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:09', null, '2017-12-12 11:58:07', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('4f6e328c4adf48a18da3547afc310725', '0_100002000001', '0_100003000232', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:21', null, '2017-12-12 11:58:19', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('4fcedf445df048bb9ee48085cf4d77b0', '0_100002000001', '0_100003000240', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:22', null, '2017-12-12 11:58:20', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('503ca62ab1344523aa8a1a1523b4a5a3', '0_100002000001', '0_100003000524', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:44', null, '2017-12-12 16:11:42', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('50bb6bde78494f878ec64f21a55e95c9', '0_100002000001', '0_100003000565', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:55', null, '2017-12-12 16:11:53', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('50c98bc4353b4c1cab553824a88d8fec', '0_100002000001', '0_100003000383', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:40', null, '2017-12-12 11:58:38', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('50cf7f9b61da405f902ae23e39df60b5', '0_100002000001', '0_100003000517', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:56', null, '2017-12-12 11:58:54', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('50e5a713a0344821a8d7753e846162ce', '0_100002000001', '0_100003000018', null, '2', '0.0200', '10000200000101', '2017-12-08 16:56:27', null, '2017-12-08 16:56:26', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('5101ec770737455c8da7016f2a05d77d', '0_100002000005', '0_100001000001', '3', '1', null, '1000000100101', '2017-12-22 15:30:32', '10000100000101', '2018-01-03 14:29:30', '4', null, null, '0', null);
INSERT INTO `t_organizationrelation` VALUES ('529b24a742624865849953dad6bd5995', '0_100002000001', '0_100003000114', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:04', null, '2017-12-12 11:58:02', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('537b74edc2ac4ebdb833122ba0d6c955', '0_100002000001', '0_100003000049', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:56', null, '2017-12-12 11:57:54', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('53f2a8d5c5f749b0832f2c50c243803e', '0_100002000001', '0_100003000542', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:49', null, '2017-12-12 16:11:47', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('53f9be70e542488a9dad476ca8c0d0d3', '0_100002000001', '0_100003000606', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:05', null, '2017-12-12 16:12:03', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('541f19fbc0a94fd4ba04750afeaf2c0b', '0_100002000001', '0_100003000533', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:46', null, '2017-12-12 16:11:44', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('5449b8da56f34770b40cef17b760bb11', '0_100002000001', '0_100003000359', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:37', null, '2017-12-12 11:58:35', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('5475cbbddcb54d8a95b383d47eea3cce', '0_100002000001', '0_100003000079', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:00', null, '2017-12-12 11:57:58', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('54a700f80b8f42c98e0fdb1648fdde9c', '0_100002000001', '0_100003000137', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:07', null, '2017-12-12 11:58:05', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('54cec5d21da34d1e926643faaa774fec', '0_100002000001', '0_100003000426', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:45', null, '2017-12-12 11:58:43', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('55e3fb8512dc4b4e886bc7699f26975d', '0_100002000001', '0_100003000504', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:55', null, '2017-12-12 11:58:53', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('56108786318d4366bee8bf56ccf17ae9', '0_100002000001', '0_100003000082', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:01', null, '2017-12-12 11:57:59', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('563846b157f14180aef8c671b1398499', '0_100002000001', '0_100003000269', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:27', null, '2017-12-12 11:58:25', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('567087e9533b42f5919d939cf2e33c26', '0_100002000001', '0_100003000102', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:03', null, '2017-12-12 11:58:01', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('5696dc59b6064efbb05af0d0404a9cb2', '0_100002000001', '0_100003000398', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:42', null, '2017-12-12 11:58:39', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('571551e1056744c1adf5a758052c3cdf', '0_100002000001', '0_100003000584', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:00', null, '2017-12-12 16:11:57', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('5725fb1e0f314aee93b89191be611033', '0_100002000001', '0_100003000475', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:51', null, '2017-12-12 11:58:49', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('577f6d437b2f44f5b76adf1dbf536823', '0_100002000001', '0_100003000370', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:38', null, '2017-12-12 11:58:36', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('57d356501f354db8aed98ee70f8ff510', '0_100002000001', '0_100003000034', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:55', null, '2017-12-12 11:57:52', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('57de3c2261f64a41965f46f0ef505cd1', '0_100002000001', '0_100003000066', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:58', null, '2017-12-12 11:57:56', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('582e65f382f84eca9ff09377b30285ea', '0_100002000001', '0_100003000513', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:56', null, '2017-12-12 11:58:54', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('5854999e28214608a3edc8c0c9ea704f', '0_100002000001', '0_100003000003', null, '2', '-1.0000', '10000200000101', '2017-11-17 17:02:16', null, '2017-11-17 17:02:15', '24', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('592b151c6d6a446b97d70760d812e9f6', '0_100002000001', '0_100003000251', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:24', null, '2017-12-12 11:58:22', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('59a1bec60c924efdbb6d4e1e62cb52be', '0_100002000001', '0_100003000291', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:29', null, '2017-12-12 11:58:27', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('5a40da1bb3a84308aee272a3c98bf40a', '0_100002000001', '0_100003000126', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:06', null, '2017-12-12 11:58:04', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('5ac405e64c424b6dbe371ac6b4b535c5', '0_100002000001', '0_100003000307', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:31', null, '2017-12-12 11:58:29', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('5b8197088adf479b976cd3340aedebbb', '0_100002000001', '0_100003000445', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:47', null, '2017-12-12 11:58:45', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('5ba9239e72eb4dc8b674bc2a4bd02e76', '0_100002000001', '0_100003000404', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:42', null, '2017-12-12 11:58:40', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('5be10abe898f4bd3bbfb7b7af32220c0', '0_100002000001', '0_100003000016', null, '2', '0.0200', '1000000100101', '2017-12-07 18:48:22', null, '2017-12-07 18:48:20', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('5c497221cee9400a882b9abfb9e3871c', '0_100002000001', '0_100003000289', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:29', null, '2017-12-12 11:58:27', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('5cd7587e2f814538be1ed1a3f2612ddb', '0_100002000001', '0_100003000160', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:10', null, '2017-12-12 11:58:08', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('5d25d178979b4746839009b152594b81', '0_100002000001', '0_100003000522', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:44', null, '2017-12-12 16:11:41', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('5d9b86884d2b490e982d9e027bb217d1', '0_100002000001', '0_100003000539', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:48', null, '2017-12-12 16:11:46', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('5def5afd899141f987221bdfb5e5f764', '0_100002000001', '0_100003000406', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:42', null, '2017-12-12 11:58:40', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('5e13ee3b3d574604a1dac8cbf373e49e', '0_100002000001', '0_100003000465', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:50', null, '2017-12-12 11:58:48', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('5e793d15d927464aa467ed5eb1ad5b71', '0_100002000001', '0_100003000379', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:39', null, '2017-12-12 11:58:37', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('5fff80ea00d34e1b8cf5c0ea9528966e', '0_100002000001', '0_100003000461', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:49', null, '2017-12-12 11:58:47', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('60159573d84d4e19b7ff26475bf73bdd', '0_100002000001', '0_100003000499', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:54', null, '2017-12-12 11:58:52', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('6114b037f93c429eb791b5ef7b8e8338', '0_100002000001', '0_100003000431', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:45', null, '2017-12-12 11:58:43', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('6180c6bdf9c9413284f29b699a2f19b5', '0_100002000001', '0_100003000620', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:08', null, '2017-12-12 16:12:06', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('6187b4789ec0480f8823c9988a39fde5', '0_100002000001', '0_100003000299', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:30', null, '2017-12-12 11:58:28', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('6215b39f36584feeac0f8e8ee4ae2d25', '0_100002000001', '0_100003000246', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:23', null, '2017-12-12 11:58:21', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('622db4c16c8a44db860989445d9b8bba', '0_100002000001', '0_100003000437', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:46', null, '2017-12-12 11:58:44', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('623a4561954b460299907ace7e6ee23d', '0_100002000001', '0_100003000327', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:33', null, '2017-12-12 11:58:31', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('628c197e692545dca8412a365579c6b5', '0_100002000001', '0_100003000622', null, '2', '0.0200', '10000200000101', '2017-12-14 14:31:14', null, '2017-12-14 14:31:15', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('634567e77dd447ce806d55851c370c58', '0_100002000001', '0_100003000512', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:56', null, '2017-12-12 11:58:54', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('64321797621b4324813533c090be03f5', '0_100002000001', '0_100003000466', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:50', null, '2017-12-12 11:58:48', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('64869ccd33984d5ea6e11db1192df429', '0_100002000001', '0_100003000014', null, '2', null, '10000200000101', '2017-11-24 15:01:36', '10000200000101', '2017-11-29 10:24:55', '2', null, '2', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('64a2c34b8609422b8bf5c8d19f1d63f4', '0_100002000001', '0_100003000444', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:47', null, '2017-12-12 11:58:45', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('64b8d235a6e94d10a7d8f9bcaaf7e789', '0_100002000001', '0_100003000331', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:34', null, '2017-12-12 11:58:32', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('659d48a843d342ee820631dd748fc05a', '0_100002000001', '0_100003000478', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:51', null, '2017-12-12 11:58:49', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('65ecf89444e8411593660e472cfc30aa', '0_100002000001', '0_100003000480', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:52', null, '2017-12-12 11:58:49', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('6626fd7e8786412ab9e2e422367e176c', '0_100002000001', '0_100003000107', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:04', null, '2017-12-12 11:58:01', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('66b36ca742944b3e969f755279ecf21a', '0_100002000001', '0_100003000432', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:46', null, '2017-12-12 11:58:43', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('66bcd5ddc1554bdf9c41bb439c6924dd', '0_100002000001', '0_100003000523', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:44', null, '2017-12-12 16:11:42', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('670d13f04a264c0f99819db4d52b64a6', '0_100001000001', '0_100003000001', null, '3', null, '1000000100101', '2017-12-08 10:34:23', null, '2017-12-08 10:34:20', '1', null, null, '0', 'eda282a8c96c4d88b949e86ed58b7198');
INSERT INTO `t_organizationrelation` VALUES ('677fb1a7b23d445da81fddfbd451e091', '0_100002000008', '0_100001000002', '1', '1', null, '1000000100101', '2017-12-07 16:49:41', null, '2017-12-07 16:49:40', '1', null, null, '0', null);
INSERT INTO `t_organizationrelation` VALUES ('679c9cdc38a14f4d95d686cd8f463033', '0_100002000003', '0_100003000002', null, '2', null, '1000000100101', '2017-11-29 14:46:27', null, '2017-11-29 14:46:24', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('68014d7816ca43de98c916491ba0813f', '0_100002000001', '0_100003000212', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:18', null, '2017-12-12 11:58:16', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('68c54e8f88f846f68096399bc28cfb8a', '0_100002000001', '0_100003000099', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:03', null, '2017-12-12 11:58:01', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('68ef804ec2544c268d5be25677a6bc93', '0_100002000001', '0_100003000301', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:31', null, '2017-12-12 11:58:28', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('6951224861564e29982742b62c2a8f16', '0_100002000001', '0_100003000140', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:07', null, '2017-12-12 11:58:05', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('6966ac50444c4e52be12b12af1d904c2', '0_100002000001', '0_100003000357', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:37', null, '2017-12-12 11:58:35', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('6a14150f9e684de5a03a53dc765bfea3', '0_100002000001', '0_100003000083', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:01', null, '2017-12-12 11:57:59', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('6aa932fed6794008a7dd99d43c60833c', '0_100002000001', '0_100003000317', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:32', null, '2017-12-12 11:58:30', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('6b0a3429cf4a4cb28c99949a823165ee', '0_100002000001', '0_100003000076', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:00', null, '2017-12-12 11:57:57', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('6c11f05bc5e94f46b472a306d1f8979c', '0_100002000001', '0_100003000223', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:20', null, '2017-12-12 11:58:18', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('6c71413c0db14eba9190c5c5d85765ae', '0_100002000001', '0_100003000030', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:54', null, '2017-12-12 11:57:52', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('6d01c4349be043a89876d5ae74c8256b', '0_100002000001', '0_100003000072', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:59', null, '2017-12-12 11:57:57', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('6d29714adc2e4dd7994257c205cd4187', '0_100002000001', '0_100003000596', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:02', null, '2017-12-12 16:12:00', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('6e9c3f0b0add4abea637d26ca489bae3', '0_100002000001', '0_100003000324', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:33', null, '2017-12-12 11:58:31', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('6eea59001c9e4194919299ac6b497e39', '0_100002000001', '0_100003000448', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:48', null, '2017-12-12 11:58:45', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('6f7b469956e9435d809278f78464ae49', '0_100002000001', '0_100003000238', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:22', null, '2017-12-12 11:58:20', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('7001c464d96642328c7a6b57f3016d79', '0_100002000001', '0_100003000084', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:01', null, '2017-12-12 11:57:59', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('70065a41c5ba49feb083315a27da2843', '0_100002000001', '0_100003000405', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:42', null, '2017-12-12 11:58:40', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('705295d3acbc4968926182b8c622f274', '0_100002000001', '0_100003000551', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:52', null, '2017-12-12 16:11:49', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('70f45491540940158791601c5c310c45', '0_100002000001', '0_100003000425', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:45', null, '2017-12-12 11:58:42', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('71bc2124baf143d68b6d1d8c5c421e4d', '0_100002000001', '0_100003000612', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:07', null, '2017-12-12 16:12:04', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('7236a40b2a5c42b58060243601e489d3', '0_100002000001', '0_100003000568', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:56', null, '2017-12-12 16:11:54', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('726ea517d7c946b693b79cb18fce2915', '0_100002000001', '0_100003000293', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:30', null, '2017-12-12 11:58:28', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('727127e5d63a4decb1fb3f7827739ecb', '0_100002000001', '0_100003000390', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:41', null, '2017-12-12 11:58:39', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('72b329b37c9b48ff9972d5494ebf18a0', '0_100002000001', '0_100003000106', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:03', null, '2017-12-12 11:58:01', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('7301d45e1d724fdf8457d8a5a4333a85', '0_100002000001', '0_100003000113', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:04', null, '2017-12-12 11:58:02', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('735ef68331de43999bddb53ccab61be3', '0_100002000001', '0_100003000025', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:54', null, '2017-12-12 11:57:52', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('740354a6a3ba4a0aac30f4e595a5dca4', '0_100002000001', '0_100003000187', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:14', null, '2017-12-12 11:58:11', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('75c28cde8e95446b94254f2fcd0721dd', '0_100002000001', '0_100003000242', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:23', null, '2017-12-12 11:58:20', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('75d78e98cad24d03a89a2a73d46f71bc', '0_100002000001', '0_100003000428', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:45', null, '2017-12-12 11:58:43', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('762396962ce24db48802fdbaa312bd49', '0_100002000001', '0_100003000456', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:49', null, '2017-12-12 11:58:47', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('76b9ae033906449caeb4856bad5fa66c', '0_100002000001', '0_100003000396', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:41', null, '2017-12-12 11:58:39', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('7770533622f942bcb9f0e083862e050b', '0_100002000001', '0_100003000154', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:09', null, '2017-12-12 11:58:07', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('778cc64374934f10b3e4c9d96d18b06b', '0_100002000001', '0_100003000447', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:47', null, '2017-12-12 11:58:45', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('7791a7d31061489dac354cae2f468bfa', '0_100002000001', '0_100003000201', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:17', null, '2017-12-12 11:58:15', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('77abd6689c2c4040bbc55ea7fd137a1f', '0_100002000001', '0_100003000452', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:48', null, '2017-12-12 11:58:46', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('783eb55d431d4a2182c9cb671bc2931e', '0_100002000001', '0_100003000109', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:04', null, '2017-12-12 11:58:02', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('78443e5dd9b74fc198d2ef444c3f4051', '0_100002000001', '0_100003000132', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:07', null, '2017-12-12 11:58:04', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('788fada4d88441488a578e0ada5abb7b', '0_100002000001', '0_100003000455', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:49', null, '2017-12-12 11:58:46', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('78e3edb4897446bdbe6111710d7d3ad6', '0_100002000001', '0_100003000397', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:42', null, '2017-12-12 11:58:39', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('78f99a5c83cc4b8a9a234fab33f0a957', '0_100002000001', '0_100003000368', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:38', null, '2017-12-12 11:58:36', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('7972ee1e1f58450d8521c4f6b0150c9c', '0_100002000001', '0_100003000148', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:09', null, '2017-12-12 11:58:06', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('79aa44d1e65f4171803c921983abc625', '0_100002000001', '0_100003000509', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:55', null, '2017-12-12 11:58:53', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('7a27cbcf07714658a0192eacf00b3684', '0_100002000001', '0_100003000283', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:29', null, '2017-12-12 11:58:26', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('7aea51d821744db0bedf50a15acb142c', '0_100002000001', '0_100003000311', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:32', null, '2017-12-12 11:58:29', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('7c556e83169e4c598d6e68ece65adcbd', '0_100002000001', '0_100003000579', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:59', null, '2017-12-12 16:11:56', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('7c5820044308483ba9de87300c87f654', '0_100002000001', '0_100003000021', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:53', null, '2017-12-12 11:57:51', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('7c65e94f2be84a2fa423d66e100c4227', '0_100002000001', '0_100003000286', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:29', null, '2017-12-12 11:58:27', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('7d3f52afc9444c76adde48e12b4fa8ef', '0_100002000001', '0_100003000498', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:54', null, '2017-12-12 11:58:52', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('7dd52d7524754ebab9554bcc75f84f20', '0_100002000001', '0_100003000562', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:55', null, '2017-12-12 16:11:52', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('7e4d9e47e66c48edb889813670ef1a51', '0_100002000001', '0_100003000278', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:28', null, '2017-12-12 11:58:26', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('7e61d8b94ba0433c9e6c4b76bb15b44b', '0_100002000001', '0_100003000263', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:26', null, '2017-12-12 11:58:24', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('7ea06ae00e0748719804ff580a5a4bc6', '0_100002000001', '0_100003000071', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:59', null, '2017-12-12 11:57:57', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('7ecd75a1e4f64d4f94e0539a64964202', '0_100002000001', '0_100003000590', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:01', null, '2017-12-12 16:11:59', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('7f013948cae74fa1ace7dbf86739ddb7', '0_100002000001', '0_100003000555', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:53', null, '2017-12-12 16:11:51', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('7f0cc017550f460db850d64eeb715e9f', '0_100002000001', '0_100003000347', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:36', null, '2017-12-12 11:58:34', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('7fac3c391c7b44df91c0b69469161ba6', '0_100002000001', '0_100003000215', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:19', null, '2017-12-12 11:58:17', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('80ba2345bc2140fa97a31858152fc040', '0_100002000001', '0_100003000037', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:55', null, '2017-12-12 11:57:53', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('812d2f237f5240d99fd9d4538b9d5f8f', '0_100002000001', '0_100003000332', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:34', null, '2017-12-12 11:58:32', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('829e916b559a447d8f54c3e9c4e409b9', '0_100002000001', '0_100003000125', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:06', null, '2017-12-12 11:58:03', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('83044b3133e649e5b18682dffc2b6ae0', '0_100002000001', '0_100003000208', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:18', null, '2017-12-12 11:58:16', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('833113ed9a7a469aaf238be866b344a0', '0_100001000002', '0_100003000001', null, '3', null, '1000000100101', '2017-12-07 09:48:05', null, '2017-12-07 09:48:05', '1', null, null, '0', '30226483d73f4bc295bc312f9a1ae797');
INSERT INTO `t_organizationrelation` VALUES ('83a536cb358d473486075cd40ad0f525', '0_100002000001', '0_100003000329', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:34', null, '2017-12-12 11:58:32', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('83f1d4a500ce4570a077f1b1aaed0ef7', '0_100002000001', '0_100003000226', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:20', null, '2017-12-12 11:58:18', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('840f61fafce840f1997c13af41f1c79f', '0_100002000001', '0_100003000530', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:46', null, '2017-12-12 16:11:43', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('850a563a30d6403c9b0e8e7840730690', '0_100002000001', '0_100003000371', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:39', null, '2017-12-12 11:58:36', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('850f8837c57b4f7282886604f8829ea6', '0_100002000001', '0_100003000133', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:07', null, '2017-12-12 11:58:05', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('854307a753f049f09de3a2cdddd0673f', '0_100002000001', '0_100003000199', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:16', null, '2017-12-12 11:58:13', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('85486ab8157f46848e0afc9fec99e88f', '0_100002000001', '0_100003000078', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:00', null, '2017-12-12 11:57:58', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('85589d7a6963460eb7d24b7902dff9bc', '0_100002000001', '0_100003000337', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:35', null, '2017-12-12 11:58:33', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('85b16ffbcce34a7ebf970ecc5a7d3e2a', '0_100002000001', '0_100003000279', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:28', null, '2017-12-12 11:58:26', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('85d5be3b7baf468f924ca3adc1f5c80e', '0_100002000001', '0_100003000230', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:21', null, '2017-12-12 11:58:19', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('861b1eee6b94475987ed7c0233349745', '0_100002000001', '0_100003000380', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:40', null, '2017-12-12 11:58:37', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('869b752a160c42c4830bd593afc66c60', '0_100002000001', '0_100003000391', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:41', null, '2017-12-12 11:58:39', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('86ea1dd6357e4116b7180bd251264684', '0_100002000001', '0_100003000491', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:53', null, '2017-12-12 11:58:51', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('87e6974cf69d48209f560848a5f0b7e2', '0_100002000001', '0_100003000046', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:56', null, '2017-12-12 11:57:54', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('87ef7121d6e24f23a4446c02745661d1', '0_100002000001', '0_100003000054', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:57', null, '2017-12-12 11:57:55', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('88108537d80a465e90317361a04d5935', '0_100002000001', '0_100003000281', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:28', null, '2017-12-12 11:58:26', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('881a284874064b7e97de7f987aa7d5fd', '0_100002000001', '0_100003000131', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:06', null, '2017-12-12 11:58:04', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('884bac377a29424fa51f11a394695447', '0_100002000001', '0_100003000430', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:45', null, '2017-12-12 11:58:43', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('8893863cbb7243bd8b6be1fc45acfe1b', '0_100002000001', '0_100003000589', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:01', null, '2017-12-12 16:11:59', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('88a251700d6a4eceb91d998417e6091d', '0_100002000001', '0_100003000135', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:07', null, '2017-12-12 11:58:05', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('898e75487b524685b5720af978185e7f', '0_100002000001', '0_100003000515', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:56', null, '2017-12-12 11:58:54', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('89fa3a1557174b2c93bef10d6fbb0f02', '0_100002000001', '0_100003000487', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:52', null, '2017-12-12 11:58:50', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('8b53e59ac6c54369932da3cd4677e213', '0_100002000001', '0_100003000040', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:55', null, '2017-12-12 11:57:53', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('8b56a16abf3c433cb62bf4d793c2e40f', '0_100002000001', '0_100003000015', null, '2', null, '10000200000101', '2017-12-06 15:21:33', null, '2017-12-06 15:21:31', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('8b5a7edf289249c0922e182539ef6e12', '0_100002000001', '0_100003000162', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:11', null, '2017-12-12 11:58:08', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('8b8f6ebade324c6d9e532d2bd21d1810', '0_100002000001', '0_100003000256', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:25', null, '2017-12-12 11:58:23', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('8b91fb1a2b2248cc8606fae643b53574', '0_100002000001', '0_100003000020', null, '2', '0.0200', '10000200000101', '2017-12-11 11:05:34', null, '2017-12-11 11:05:32', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('8b9dddd6a92640289f76827c78e7c361', '0_100002000001', '0_100003000203', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:17', null, '2017-12-12 11:58:15', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('8d42a5d119df432190c718e9a7b54845', '0_100002000001', '0_100003000157', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:10', null, '2017-12-12 11:58:08', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('8d444ba4de3b44a88a34f669498bc885', '0_100002000001', '0_100003000330', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:34', null, '2017-12-12 11:58:32', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('8d5d8a9be6a842298a550ea5fac8f622', '0_100002000001', '0_100003000516', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:56', null, '2017-12-12 11:58:54', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('8dc9cccbdb7347c9b071b6a0c22999ea', '0_100002000001', '0_100003000258', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:25', null, '2017-12-12 11:58:23', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('8ddf4b463025411993e3264cf86730cc', '0_100002000001', '0_100003000108', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:04', null, '2017-12-12 11:58:02', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('8e26fba0caea40dc99bdc8e67c1d7398', '0_100002000001', '0_100003000257', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:25', null, '2017-12-12 11:58:23', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('8e392a1b760c48eab5f3d24677a65eff', '0_100002000001', '0_100003000143', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:08', null, '2017-12-12 11:58:06', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('8e40c919a8d24755be3b569235a3295b', '0_100002000001', '0_100003000617', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:08', null, '2017-12-12 16:12:05', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('8ea6d40c32264975b8b5e358b07d1560', '0_100002000001', '0_100003000548', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:51', null, '2017-12-12 16:11:48', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('8f9a132bba234f32af3e3f099eab0d36', '0_100002000001', '0_100003000449', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:48', null, '2017-12-12 11:58:46', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('8fb0169146904708aedd8f54cc79dc5b', '0_100002000001', '0_100003000601', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:04', null, '2017-12-12 16:12:02', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('8fe329c9e8b1447987e1c3745a616359', '0_100002000001', '0_100003000395', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:41', null, '2017-12-12 11:58:39', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('9013e768ddd945469701c2ac5a813745', '0_100002000001', '0_100003000508', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:55', null, '2017-12-12 11:58:53', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('9066cf7d10814b9abc6a7b05db79172f', '0_100002000001', '0_100003000229', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:21', null, '2017-12-12 11:58:19', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('90a11a198fb8401f8a7a45646afb4e57', '0_100002000001', '0_100003000564', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:55', null, '2017-12-12 16:11:53', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('90be237bad4845f0ae0948d1146e76da', '0_100002000001', '0_100003000172', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:12', null, '2017-12-12 11:58:10', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('911291e482fc4fc4a308f6b3b6010de8', '0_100002000001', '0_100003000101', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:03', null, '2017-12-12 11:58:01', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('928d8caa22da4fada1bdfd7924edea79', '0_100002000001', '0_100003000304', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:31', null, '2017-12-12 11:58:29', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('92ae4d10103441f1b401d2e803418bba', '0_100002000001', '0_100003000259', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:25', null, '2017-12-12 11:58:23', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('932b3f989b5144af87f65bba3b532f75', '0_100002000001', '0_100003000091', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:02', null, '2017-12-12 11:58:00', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('933f8d78add347a181283c4d0bd2c557', '0_100002000001', '0_100003000260', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:26', null, '2017-12-12 11:58:23', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('936757c40094499b97199840bd82f057', '0_100002000001', '0_100003000529', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:45', null, '2017-12-12 16:11:43', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('937b4e38dfd340da8c4098ed837d2b9a', '0_100002000001', '0_100003000080', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:01', null, '2017-12-12 11:57:58', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('9395aeb0a523427582cd02e98c9b6073', '0_100002000001', '0_100003000500', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:54', null, '2017-12-12 11:58:52', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('93cccc3dbbf34473ab3c70bac0aa626e', '0_100002000001', '0_100003000090', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:02', null, '2017-12-12 11:58:00', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('93df84de1dd44eeeacd8183853ae0377', '0_100002000001', '0_100003000552', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:52', null, '2017-12-12 16:11:49', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('94ead23de58349c4abf660ca4df2a64a', '0_100002000008', '0_100003000002', null, '2', '0.0100', '1000000100101', '2017-12-07 16:49:10', null, '2017-12-07 16:49:09', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('95db43a8cea648ac8503926b1608761d', '0_100002000001', '0_100003000476', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:51', null, '2017-12-12 11:58:49', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('9608cc8d99ad4405a5311bc796400516', '0_100002000001', '0_100003000605', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:05', null, '2017-12-12 16:12:03', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('96c5fcd3e66641d089044f942022d3a7', '0_100002000001', '0_100003000608', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:06', null, '2017-12-12 16:12:03', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('97938689d8634ca39e831eebd8cac932', '0_100002000001', '0_100003000597', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:03', null, '2017-12-12 16:12:01', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('98dc2a4ed3074e39954661c15c0aae21', '0_100002000001', '0_100003000207', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:18', null, '2017-12-12 11:58:16', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('98e29218f1be42d1ae1cc4b98f9b23ca', '0_100002000001', '0_100003000351', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:36', null, '2017-12-12 11:58:34', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('98f1245d8c5c46fa8762c3d25bef43f6', '0_100002000001', '0_100003000386', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:40', null, '2017-12-12 11:58:38', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('9a791bf021454d95b0e765b612e93a78', '0_100002000001', '0_100003000341', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:35', null, '2017-12-12 11:58:33', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('9ac487d2de184985acfcd6ce8e868861', '0_100002000001', '0_100003000026', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:54', null, '2017-12-12 11:57:52', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('9afdfc14624242f6820a9ee70809bf00', '0_100002000001', '0_100003000156', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:10', null, '2017-12-12 11:58:07', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('9bc24f152ee249f09a044088f235ea2f', '0_100002000001', '0_100003000377', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:39', null, '2017-12-12 11:58:37', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('9c2a04eb823f4201b8c72cc7ac0695a1', '0_100002000001', '0_100003000604', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:05', null, '2017-12-12 16:12:03', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('9c55933f6f8a43cb85515f85d85ee8a9', '0_100002000001', '0_100003000153', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:09', null, '2017-12-12 11:58:07', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('9c9a8f6a57064e7a9458d3089a88419a', '0_100002000001', '0_100003000196', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:15', null, '2017-12-12 11:58:13', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('9ca4a6933f724d92a3ecc4229d8604b1', '0_100002000001', '0_100003000024', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:54', null, '2017-12-12 11:57:52', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('9ccc49138793489cb318af01ac396f2d', '0_100002000001', '0_100003000214', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:19', null, '2017-12-12 11:58:17', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('9d3bb8e6367c43608292e48e7934ccb6', '0_100002000001', '0_100003000248', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:24', null, '2017-12-12 11:58:21', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('9d63b365a61d4779896d34c7580b9c16', '0_100002000003', '0_100003000001', null, '2', '0.0100', '1000000100101', '2017-12-07 09:48:41', null, '2017-12-07 09:48:42', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('9db2db3e43834dd3a7feb487afe6438f', '0_100002000001', '0_100003000436', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:46', null, '2017-12-12 11:58:44', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('9f142408a74c4e5a9e9edd98a3129ab8', '0_100002000001', '0_100003000145', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:08', null, '2017-12-12 11:58:06', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('9f2d8c121ef144c58ca1b1eee170b58d', '0_100002000001', '0_100003000008', null, '2', null, '10000200000101', '2017-11-24 15:01:33', null, '2017-11-24 15:01:34', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('a0a014c50c8f454190cc63be7039a2d8', '0_100002000001', '0_100003000141', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:08', null, '2017-12-12 11:58:05', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('a1b54f064b404670b41dac55f6a85d5a', '0_100002000001', '0_100003000554', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:53', null, '2017-12-12 16:11:50', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('a1dab0f3eae04283a62c5925c00075fa', '0_100002000001', '0_100003000155', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:10', null, '2017-12-12 11:58:07', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('a27d8c776a904fc187bfa9526110ac38', '0_100002000001', '0_100003000402', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:42', null, '2017-12-12 11:58:40', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('a2bfb92557de43df92be6ae15ca8989f', '0_100002000001', '0_100003000591', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:01', null, '2017-12-12 16:11:59', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('a2f08feaba0c4bbea85e875df46b2555', '0_100002000001', '0_100003000287', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:29', null, '2017-12-12 11:58:27', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('a30763990e914bb5bae16dd5c6721b01', '0_100002000001', '0_100003000442', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:47', null, '2017-12-12 11:58:44', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('a3b28f1cde2b4cf3824331aea74a7c7b', '0_100002000001', '0_100003000297', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:30', null, '2017-12-12 11:58:28', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('a3c0eae360484c1593b6f6e030333bc1', '0_100002000001', '0_100003000313', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:32', null, '2017-12-12 11:58:30', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('a3f799e8ec284a3f808990c4897467d3', '0_100002000001', '0_100003000036', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:55', null, '2017-12-12 11:57:53', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('a3fda3600f8941eaafe110704d3f6e69', '0_100002000001', '0_100003000129', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:06', null, '2017-12-12 11:58:04', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('a41200f5d58c47ee8c75c031f6dbc8af', '0_100002000001', '0_100003000159', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:10', null, '2017-12-12 11:58:08', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('a41b5acc80394bb3b385fb4727d66c1b', '0_100002000001', '0_100003000345', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:36', null, '2017-12-12 11:58:34', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('a46221aad9b64520adf2380fb3199a5a', '0_100002000001', '0_100003000065', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:58', null, '2017-12-12 11:57:56', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('a4b0b45efa5441bc8570319f930375d3', '0_100002000001', '0_100003000213', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:19', null, '2017-12-12 11:58:16', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('a589fd5676ea4135b4bc10188e4b300e', '0_100002000001', '0_100003000193', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:14', null, '2017-12-12 11:58:12', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('a62b2402fd0b49c19be8830287d4d16e', '0_100002000001', '0_100003000582', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:59', null, '2017-12-12 16:11:57', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('a653b8c4f1f74f259a6622a159c47301', '0_100002000001', '0_100003000097', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:02', null, '2017-12-12 11:58:00', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('a6a1490985af4461aaf692d5f7962732', '0_100002000001', '0_100003000614', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:07', null, '2017-12-12 16:12:05', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('a72fa525a25a4a30abc92dc92c01e4cf', '0_100002000001', '0_100003000349', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:36', null, '2017-12-12 11:58:34', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('a764e5b7bf7f4bb49cc2a271ebb58780', '0_100002000001', '0_100003000543', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:49', null, '2017-12-12 16:11:47', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('a78e021924a640438e0e0ff864e73de6', '0_100002000001', '0_100003000411', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:43', null, '2017-12-12 11:58:41', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('a8cae2b8d54d438a98a642360d453f0d', '0_100002000001', '0_100003000249', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:24', null, '2017-12-12 11:58:22', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('a8fd8e2eada1450ca014a9a3ae088c44', '0_100002000001', '0_100003000326', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:33', null, '2017-12-12 11:58:31', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('a94b4758e1aa4b9383155f957748fbdc', '0_100002000001', '0_100003000161', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:10', null, '2017-12-12 11:58:08', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('a96c9406fb1a4b9ba2ca1d853e45cf97', '0_100002000001', '0_100003000358', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:37', null, '2017-12-12 11:58:35', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('a9d32f374e954fa78c22a357c0861499', '0_100002000001', '0_100003000510', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:55', null, '2017-12-12 11:58:53', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('a9e6fd0eb7dd4f5890ec0570440be213', '0_100002000001', '0_100003000438', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:46', null, '2017-12-12 11:58:44', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('aa1f4177fbf7499ca3f90a70c0b7b208', '0_100002000001', '0_100003000064', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:58', null, '2017-12-12 11:57:56', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('aa3d0f1e22ea426fa8863dbfc0b029eb', '0_100002000001', '0_100003000005', null, '2', '0.0019', '10000200000101', '2017-11-21 16:29:13', null, '2017-11-21 16:29:09', '26', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('aa4104edef1b4f508e7662d8b45f7b60', '0_100002000001', '0_100003000518', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:56', null, '2017-12-12 11:58:54', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('aab52c7768944908a8c57489d73aecb2', '0_100002000001', '0_100003000031', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:54', null, '2017-12-12 11:57:52', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('aafff47fd06c4b08affd9a1182503865', '0_100002000001', '0_100003000418', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:44', null, '2017-12-12 11:58:42', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('ab9a3d4667a942b9ae5919502bf7b5bd', '0_100002000001', '0_100003000111', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:04', null, '2017-12-12 11:58:02', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('abb521d0c1724cd6b10b8b65b0e6c718', '0_100002000001', '0_100003000611', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:06', null, '2017-12-12 16:12:04', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('ac07b688831d4996961bddab0ea99f5b', '0_100002000001', '0_100003000535', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:47', null, '2017-12-12 16:11:45', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('ac0c62db72e54564804e57deb23a4ac1', '0_100002000001', '0_100003000333', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:34', null, '2017-12-12 11:58:32', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('ac4fa33311a149b7a7ba0de88bfd777c', '0_100002000001', '0_100003000519', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:57', null, '2017-12-12 11:58:54', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('accb930c7eed429ca9470f1f4c69c974', '0_100002000001', '0_100003000470', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:50', null, '2017-12-12 11:58:48', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('ada2d873c9d945f39644563c692a6f02', '0_100002000001', '0_100003000570', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:57', null, '2017-12-12 16:11:54', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('ade2f8f10bb94abdac73a7234d2b66d8', '0_100002000001', '0_100003000433', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:46', null, '2017-12-12 11:58:44', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('ae0a74766f964f6e9a4e81c386262872', '0_100002000008', '0_100001000001', '2', '1', null, '1000000100101', '2017-12-07 16:55:02', null, '2017-12-07 16:55:04', '1', null, null, '0', null);
INSERT INTO `t_organizationrelation` VALUES ('aecf3bb9e0fb4d6b82e3fa87da8b4b41', '0_100001000001', '0_100003000017', null, '3', null, '1000000100101', '2017-12-08 11:40:58', null, '2017-12-08 11:40:55', '1', null, null, '0', '2efbeb3f8cda4c78ad67673aaefcbc44');
INSERT INTO `t_organizationrelation` VALUES ('af21d54aea25476d96af1a1f44de851d', '0_100002000001', '0_100003000233', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:21', null, '2017-12-12 11:58:19', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('af27317256444befa871bfb7a80e74c9', '0_100002000001', '0_100003000458', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:49', null, '2017-12-12 11:58:47', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('af9d333432254b00b9369b7bb4f6e214', '0_100002000001', '0_100003000419', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:44', null, '2017-12-12 11:58:42', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('aff2b18faad9496483b403c5811bcb4d', '0_100002000001', '0_100003000047', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:56', null, '2017-12-12 11:57:54', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('b0ad6e36a5d241fbba4a7e938d1b5bae', '0_100002000001', '0_100003000296', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:30', null, '2017-12-12 11:58:28', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('b1af39abeea1458886c77094c64a44f1', '0_100002000001', '0_100003000492', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:53', null, '2017-12-12 11:58:51', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('b2f3ba398d57404195d818c0481f6990', '0_100002000001', '0_100003000621', null, '2', '0.0200', '10000200000101', '2017-12-14 14:30:07', null, '2017-12-14 14:30:08', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('b351c6a965124a9f8759fdb3214affab', '0_100002000001', '0_100003000180', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:13', null, '2017-12-12 11:58:11', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('b36e70fbc5924866b947251eb6235ba6', '0_100002000001', '0_100003000392', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:41', null, '2017-12-12 11:58:39', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('b3ac6c5278724c6cbafa44fbea63aaff', '0_100002000001', '0_100003000534', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:47', null, '2017-12-12 16:11:44', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('b3b84e83f6c14da9b8a2f8e961aa04f8', '0_100002000001', '0_100003000275', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:28', null, '2017-12-12 11:58:26', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('b4852c89074443f5afb8654ef093b40e', '0_100002000001', '0_100003000427', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:45', null, '2017-12-12 11:58:43', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('b48cd319badb4cf69867e3c40ade62ae', '0_100002000001', '0_100003000540', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:48', null, '2017-12-12 16:11:46', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('b48d1670a73d46fe92062b688084ca4c', '0_100002000001', '0_100003000216', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:19', null, '2017-12-12 11:58:17', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('b4ee5406cab34cad971a552c1cb064d5', '0_100002000001', '0_100003000464', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:50', null, '2017-12-12 11:58:47', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('b53859e690e84321ab834a3b4b2a34c0', '0_100002000001', '0_100003000350', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:36', null, '2017-12-12 11:58:34', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('b5a59c457e644c139b87d658e3c64406', '0_100002000001', '0_100003000276', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:28', null, '2017-12-12 11:58:26', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('b62f5daaa509472bbcf7d623f19ed1db', '0_100002000001', '0_100003000393', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:41', null, '2017-12-12 11:58:39', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('b6eadb170aa045eaae32af05d8de41ca', '0_100002000001', '0_100003000218', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:19', null, '2017-12-12 11:58:17', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('b727fe59c948459fad98afd6bd79e44f', '0_100002000001', '0_100003000366', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:38', null, '2017-12-12 11:58:36', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('b7577670c2d5476880367f98ef7c9ffe', '0_100002000001', '0_100003000382', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:40', null, '2017-12-12 11:58:38', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('b7c238e90c484ca8b57bcf7684ac2545', '0_100002000001', '0_100003000587', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:00', null, '2017-12-12 16:11:58', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('b8499e75f24344f3bd45d1a825643fe9', '0_100002000001', '0_100003000253', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:24', null, '2017-12-12 11:58:22', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('b892612270014c8bb857fe1cd2b523e7', '0_100002000001', '0_100003000460', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:49', null, '2017-12-12 11:58:47', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('b9d0ed88c07c480d918359b1554738df', '0_100002000001', '0_100003000142', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:08', null, '2017-12-12 11:58:05', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('b9e51b8e227247a3bb4645a4d2cffe21', '0_100002000001', '0_100003000520', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:57', null, '2017-12-12 11:58:54', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('ba2a69852b6e4f8b9067006c1328e2e0', '0_100002000001', '0_100003000463', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:50', null, '2017-12-12 11:58:47', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('ba3910480afd475fa91ece6b02d269dc', '0_100002000001', '0_100003000069', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:59', null, '2017-12-12 11:57:56', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('bad5d7b1595443deba39701e0d798e04', '0_100002000001', '0_100003000416', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:44', null, '2017-12-12 11:58:41', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('bb0e4fc68a0d48148763caf344642e88', '0_100002000001', '0_100003000053', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:57', null, '2017-12-12 11:57:55', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('bb50186b2a764384be8ecdcb9247b4cc', '0_100002000001', '0_100003000528', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:45', null, '2017-12-12 16:11:43', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('bc855f448ef64e49a839fe1b207497c7', '0_100002000001', '0_100003000462', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:49', null, '2017-12-12 11:58:47', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('bca3ba262bc2419e87db323e6e1ed768', '0_100002000001', '0_100003000483', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:52', null, '2017-12-12 11:58:50', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('bcb5e567c2b946fa943adb2430a33cf5', '0_100002000001', '0_100003000553', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:52', null, '2017-12-12 16:11:50', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('bd0be26dea644dd2ae72bfb3f783d0de', '0_100002000001', '0_100003000270', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:27', null, '2017-12-12 11:58:25', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('bd439931f3814cf2bd9f982a22731074', '0_100002000001', '0_100003000598', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:03', null, '2017-12-12 16:12:01', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('bd9c6f51ee2b421ab315536c67c68020', '0_100002000001', '0_100003000485', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:52', null, '2017-12-12 11:58:50', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('bdab7c5fd99f44519e4fa6b9bb83e0b4', '0_100002000001', '0_100003000124', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:05', null, '2017-12-12 11:58:03', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('be2c122e9c4e4a97ae5f622f18f4e0b7', '0_100002000001', '0_100003000585', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:00', null, '2017-12-12 16:11:58', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('be8c2dfaadb245169f8d31412205fb7e', '0_100002000001', '0_100003000502', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:54', null, '2017-12-12 11:58:52', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('bea40b7b512a4507b13e49b30f2d32d6', '0_100002000001', '0_100003000472', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:51', null, '2017-12-12 11:58:49', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('bf751168d97d4b4c91d8c78f5c3b7c1d', '0_100001000002', '0_100003000002', null, '3', null, '1000000100101', '2017-12-07 09:47:58', null, '2017-12-07 09:47:59', '1', null, null, '0', '30226483d73f4bc295bc312f9a1ae797');
INSERT INTO `t_organizationrelation` VALUES ('c006971ae7e14888b726e714a7d7e52c', '0_100002000001', '0_100003000315', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:32', null, '2017-12-12 11:58:30', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('c0d8054b7e144ca5ae3a881cff38172b', '0_100002000001', '0_100003000243', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:23', null, '2017-12-12 11:58:21', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('c0e0b9cf0add4644bce22bec656bbf2d', '0_100002000001', '0_100003000353', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:37', null, '2017-12-12 11:58:34', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('c125efb5312a423e8814c2650062de9a', '0_100002000001', '0_100003000607', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:06', null, '2017-12-12 16:12:03', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('c138a97c57c64b7c9b1e92b6042ca821', '0_100002000001', '0_100003000527', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:45', null, '2017-12-12 16:11:43', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('c193642dc8dd4f81bd1f09e845e7b128', '0_100002000001', '0_100003000362', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:38', null, '2017-12-12 11:58:35', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('c2092d21dae24079b19c01bdba65e8ce', '0_100002000001', '0_100003000115', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:04', null, '2017-12-12 11:58:02', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('c24ebce6087c47a9984425b1bca464f5', '0_100002000001', '0_100003000613', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:07', null, '2017-12-12 16:12:04', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('c2eaa9e01b514995a697ce105b32b8c1', '0_100002000001', '0_100003000041', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:55', null, '2017-12-12 11:57:53', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('c30321b2646a431cbbd2c1e0bd64583d', '0_100002000001', '0_100003000440', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:46', null, '2017-12-12 11:58:44', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('c3479950d24242238e5e9f9d1a680cc0', '0_100002000001', '0_100003000178', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:12', null, '2017-12-12 11:58:10', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('c3b51d9b3f54463f9a8d2e36bb4bbf4a', '0_100002000001', '0_100003000346', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:36', null, '2017-12-12 11:58:34', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('c3efb911ba4b443fadf3de252236aa1e', '0_100002000001', '0_100003000352', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:36', null, '2017-12-12 11:58:34', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('c4491ab3b26a424eb3f46cd244d74aa0', '0_100002000001', '0_100003000496', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:54', null, '2017-12-12 11:58:52', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('c465eb2452d3468990d8430f0db361b8', '0_100002000001', '0_100003000340', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:35', null, '2017-12-12 11:58:33', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('c513b335e4064fdca8f7ee493a800a40', '0_100002000001', '0_100003000264', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:26', null, '2017-12-12 11:58:24', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('c675430d86154a6b9d0113d55ebcf259', '0_100002000001', '0_100003000490', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:53', null, '2017-12-12 11:58:51', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('c6e61b995c184648ad02ac1af8dca84f', '0_100002000001', '0_100003000274', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:28', null, '2017-12-12 11:58:25', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('c7b3fa27df1c4eeea89c03536368e81f', '0_100002000001', '0_100003000294', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:30', null, '2017-12-12 11:58:28', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('c95c239f1dca498e9773cfdf41c39d32', '0_100002000001', '0_100003000373', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:39', null, '2017-12-12 11:58:37', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('c9f896d940e14cae96b5d2911f41c70e', '0_100002000001', '0_100003000615', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:07', null, '2017-12-12 16:12:05', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('cb31583f8422431e9ce5baec350f5fb8', '0_100002000001', '0_100003000266', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:26', null, '2017-12-12 11:58:24', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('cb3303e2f1ed4fcb9fc5a60537c62bdd', '0_100002000001', '0_100003000378', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:39', null, '2017-12-12 11:58:37', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('cb57825adc9f403fab048b14cf3daee1', '0_100002000001', '0_100003000521', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:43', null, '2017-12-12 16:11:41', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('cbb7d7eb29c6494c800b36e45cb6b2a4', '0_100002000001', '0_100003000234', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:21', null, '2017-12-12 11:58:19', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('cbee38e479324856821a971a534cde17', '0_100001000001', '0_100003000015', null, '3', null, 'admin', '2017-12-07 19:09:59', null, '2017-12-07 19:10:01', '1', null, null, '0', '2efbeb3f8cda4c78ad67673aaefcbc44');
INSERT INTO `t_organizationrelation` VALUES ('cc2cfc58b2234f46b403fb6af572c978', '0_100002000001', '0_100003000060', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:58', null, '2017-12-12 11:57:55', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('ccb37c9cb3174b1cb0135300602b7086', '0_100002000001', '0_100003000244', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:23', null, '2017-12-12 11:58:21', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('cce31bd8f64e4712846c5d7c23f24263', '0_100002000001', '0_100003000105', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:03', null, '2017-12-12 11:58:01', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('ccf19f5558be43dbb62b181eff071c07', '0_100002000001', '0_100003000467', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:50', null, '2017-12-12 11:58:48', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('cd29a2e18e1c466fa26538238dd99951', '0_100002000001', '0_100003000572', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:57', null, '2017-12-12 16:11:55', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('cdffeeb22fa94328a79b3dc25f2a1c21', '0_100002000001', '0_100003000364', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:38', null, '2017-12-12 11:58:36', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('ce54380933d442b693cbd9a7a1db41bb', '0_100002000001', '0_100003000255', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:25', null, '2017-12-12 11:58:23', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('ce60bf798fe640c2b63f78d3e12d0709', '0_100002000001', '0_100003000073', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:59', null, '2017-12-12 11:57:57', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('ceb95468be6a491cbf7493cfab429ce1', '0_100002000001', '0_100003000381', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:40', null, '2017-12-12 11:58:37', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('ced0733bc7e5457b8678e35774581ff0', '0_100002000001', '0_100003000320', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:33', null, '2017-12-12 11:58:30', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('ceda8206d6384b21808d0afb6c0dc3b4', '0_100002000001', '0_100003000423', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:44', null, '2017-12-12 11:58:42', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('cefbceb0a2da4891b39596cbbd22f798', '0_100002000001', '0_100003000173', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:12', null, '2017-12-12 11:58:10', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('ceff12831d124c818b6efeca429d2798', '0_100002000001', '0_100003000057', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:57', null, '2017-12-12 11:57:55', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('cfaf07e68e8e46f392c53aeb26bd97cc', '0_100002000001', '0_100003000586', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:00', null, '2017-12-12 16:11:58', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('cfe226bd713449feb644a4ed688553be', '0_100002000001', '0_100003000581', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:59', null, '2017-12-12 16:11:57', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('d012ec7f6c5441cf95f44b8f01c04ef7', '0_100002000001', '0_100003000312', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:32', null, '2017-12-12 11:58:30', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('d0f001f4acb549549a813d6f605aca6e', '0_100002000001', '0_100003000164', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:11', null, '2017-12-12 11:58:09', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('d109a61865dc4cd9bb60ac135904224c', '0_100002000001', '0_100003000593', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:02', null, '2017-12-12 16:11:59', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('d11abfd3e1df4a9880f2c69b35db6f7a', '0_100002000001', '0_100003000195', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:15', null, '2017-12-12 11:58:13', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('d167987ea0734db7b8cce3ca2fcdc368', '0_100002000001', '0_100003000503', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:55', null, '2017-12-12 11:58:52', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('d1acf5cf2d9743c0b4a647b1a4321b11', '0_100002000001', '0_100003000481', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:52', null, '2017-12-12 11:58:50', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('d2ef9288035a48d9bd8386ff80f3180b', '0_100002000001', '0_100003000272', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:27', null, '2017-12-12 11:58:25', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('d32c096a580b4bf3aeb8a88a0e24b7a6', '0_100002000001', '0_100003000295', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:30', null, '2017-12-12 11:58:28', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('d33503c5668b4a9595725c559cd60887', '0_100002000001', '0_100003000477', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:51', null, '2017-12-12 11:58:49', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('d35d7e3d511b48a9a6e833f45fbd5eeb', '0_100002000001', '0_100003000525', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:44', null, '2017-12-12 16:11:42', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('d47e8d9c58704cf48d684c026a799243', '0_100002000001', '0_100003000369', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:38', null, '2017-12-12 11:58:36', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('d51e13c5e3b94c159fcde14145cd445e', '0_100002000001', '0_100003000085', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:01', null, '2017-12-12 11:57:59', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('d5b4c5e9f5cb4450aae430147f2cd92a', '0_100002000001', '0_100003000489', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:53', null, '2017-12-12 11:58:51', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('d5e5af5d457b43169c138461fcf52792', '0_100001000001', '0_100003000001', null, '3', null, '1000000100101', '2017-11-16 17:27:12', null, '2017-11-16 17:27:08', '1', null, null, '0', '2efbeb3f8cda4c78ad67673aaefcbc44');
INSERT INTO `t_organizationrelation` VALUES ('d61dac710d5d4f1194185a8d67f24466', '0_100002000001', '0_100003000285', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:29', null, '2017-12-12 11:58:27', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('d68a2cf84ffb4ba9a674d32d44ed32d1', '0_100002000001', '0_100003000314', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:32', null, '2017-12-12 11:58:30', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('d6c34ed0f5a740528b91e0569ff2db84', '0_100002000001', '0_100003000038', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:55', null, '2017-12-12 11:57:53', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('d82317f19f7b41ee80b8d3f15a381e3a', '0_100002000001', '0_100003000280', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:28', null, '2017-12-12 11:58:26', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('d8b18907e966487cafa5bb08ab1e5d31', '0_100002000001', '0_100003000168', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:11', null, '2017-12-12 11:58:09', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('d8e00ed92ad7413abdb534f1e05be053', '0_100002000001', '0_100003000372', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:39', null, '2017-12-12 11:58:37', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('d91d70629ac246f2b1e99df3901bc92f', '0_100002000001', '0_100003000479', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:52', null, '2017-12-12 11:58:49', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('d93330f46501433fbcc0e4c0907fe025', '0_100002000001', '0_100003000262', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:26', null, '2017-12-12 11:58:24', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('d98fd76421744b0da7ad301fa4d781ca', '0_100002000001', '0_100003000561', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:54', null, '2017-12-12 16:11:52', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('da186e4b27ff41baa7247af3fe14d550', '0_100002000001', '0_100003000328', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:33', null, '2017-12-12 11:58:31', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('da9fdd2fd97d4508b35a7ca7ecba187d', '0_100002000001', '0_100003000468', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:50', null, '2017-12-12 11:58:48', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('daecf151bad34a2b8531bd47123fa7bf', '0_100002000001', '0_100003000271', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:27', null, '2017-12-12 11:58:25', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('db2212d669cb4cd4b6c4272bdddb415f', '0_100002000001', '0_100003000004', null, '2', '-1.0000', '10000200000101', '2017-11-21 16:11:13', null, '2017-11-21 16:11:10', '24', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('db63fe11cd924335b64c55f6f6cd3422', '0_100002000001', '0_100003000421', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:44', null, '2017-12-12 11:58:42', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('dbefca88c68d4a8fab7887f4829898e2', '0_100002000001', '0_100003000029', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:54', null, '2017-12-12 11:57:52', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('dbf0ab708ead4481a2501c14985fc17b', '0_100002000001', '0_100003000200', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:17', null, '2017-12-12 11:58:15', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('dc0b55e96fd84be7b5009957c553e35e', '0_100002000001', '0_100003000012', null, '2', null, '10000200000101', '2017-11-24 15:01:35', null, '2017-11-24 15:01:35', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('dc7b2b8a72b148808d4975ba439e2657', '0_100002000001', '0_100003000541', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:49', null, '2017-12-12 16:11:46', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('dcbe7ca19f26442282225cccf81d9706', '0_100002000001', '0_100003000110', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:04', null, '2017-12-12 11:58:02', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('dd76296e3e4246c980666e96ae3371cd', '0_100002000001', '0_100003000284', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:29', null, '2017-12-12 11:58:27', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('de7dae0f774f4066a856d10da62ec248', '0_100002000001', '0_100003000146', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:08', null, '2017-12-12 11:58:06', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('de7e8c723e3e41458fd255c04a559cb4', '0_100002000001', '0_100003000603', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:05', null, '2017-12-12 16:12:02', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('df3005ca7f45453b8bb284023cca5f35', '0_100002000001', '0_100003000183', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:13', null, '2017-12-12 11:58:11', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('df6fbe5653714357891d4823bab754c3', '0_100002000001', '0_100003000583', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:00', null, '2017-12-12 16:11:57', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('e01296d6e5d0416cb9ad9fbb5d8c2d03', '0_100002000001', '0_100003000367', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:38', null, '2017-12-12 11:58:36', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('e0b0e238c9114833bba6f9ffb5cab53d', '0_100002000001', '0_100003000044', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:56', null, '2017-12-12 11:57:54', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('e22bc95557eb4c839bf1ac06bb5f3106', '0_100002000001', '0_100003000186', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:13', null, '2017-12-12 11:58:11', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('e25ff996449345b599f0ba5787f32c6a', '0_100002000001', '0_100003000550', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:51', null, '2017-12-12 16:11:49', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('e2859b418b154b14941d02f2c7a6718b', '0_100002000002', '0_100001000001', '3', '1', null, '1000000100101', '2017-12-22 15:29:50', '10000100000101', '2018-01-03 14:29:30', '9', null, null, '0', null);
INSERT INTO `t_organizationrelation` VALUES ('e34dc192697b4381a348ce5ff40c94b1', '0_100002000001', '0_100003000093', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:02', null, '2017-12-12 11:58:00', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('e3688e018bca4bd3b3f679073a29f4cc', '0_100002000001', '0_100003000089', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:02', null, '2017-12-12 11:57:59', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('e3735b99b740415e96fa91a5602e302f', '0_100002000001', '0_100003000147', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:08', null, '2017-12-12 11:58:06', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('e42f4cef53a54a99bcefb529861e2bc7', '0_100002000001', '0_100003000228', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:21', null, '2017-12-12 11:58:19', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('e4bc5340ad67445ab929e5d425db9cf8', '0_100002000001', '0_100003000547', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:50', null, '2017-12-12 16:11:48', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('e4cb3664fe84483f91c8980ce4b1e204', '0_100002000001', '0_100003000335', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:35', null, '2017-12-12 11:58:32', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('e555939a698345f084d1e9e0d58677ef', '0_100002000001', '0_100003000277', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:28', null, '2017-12-12 11:58:26', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('e5624b79e83e4f99a40068be1fd40469', '0_100002000001', '0_100003000575', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:58', null, '2017-12-12 16:11:55', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('e60ed97c90e64a079ced7ee9fd8e19de', '0_100002000001', '0_100003000006', null, '2', '-1.0000', '10000200000101', '2017-11-24 15:01:33', null, '2017-11-24 15:01:33', '95', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('e634dab530f1440f91d6811296d9b51a', '0_100002000001', '0_100003000239', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:22', null, '2017-12-12 11:58:20', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('e6ae928a7cac47dbbc6a41ed15e3afcc', '0_100002000001', '0_100003000221', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:20', null, '2017-12-12 11:58:18', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('e7421c4416ea44fe815f728063769876', '0_100002000001', '0_100003000325', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:33', null, '2017-12-12 11:58:31', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('e855354264824e2f983292f22e4fbb6d', '0_100002000001', '0_100003000354', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:37', null, '2017-12-12 11:58:35', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('e881eef6b4284089a9c18e4996e1a4af', '0_100002000001', '0_100003000237', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:22', null, '2017-12-12 11:58:20', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('e8ad6c86067a4e6e8a96e62b7469f90f', '0_100002000001', '0_100003000538', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:48', null, '2017-12-12 16:11:46', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('e8c0f81001c64c68885699fa69e9688e', '0_100002000001', '0_100003000599', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:04', null, '2017-12-12 16:12:02', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('e96460b284284c3bac2532f3c86badbe', '0_100002000001', '0_100003000488', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:53', null, '2017-12-12 11:58:50', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('ea10b7edb96b4e1db4e11358821a725d', '0_100002000001', '0_100003000318', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:32', null, '2017-12-12 11:58:30', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('eaab92cfd90a4c2b8e2870a2a90e2d8e', '0_100002000001', '0_100003000450', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:48', null, '2017-12-12 11:58:46', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('eb689c37bbb442c48da845c0808618eb', '0_100002000001', '0_100003000290', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:29', null, '2017-12-12 11:58:27', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('eb8c4c91f8fd40daa83aa80c78a5a509', '0_100002000001', '0_100003000302', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:31', null, '2017-12-12 11:58:29', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('eba9396716e846d5b6c5a47cf35e697c', '0_100002000001', '0_100003000623', null, '2', '0.0200', '10000200000101', '2017-12-14 14:49:25', null, '2017-12-14 14:49:26', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('ebda45115af642d081453481504cc261', '0_100002000001', '0_100003000374', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:39', null, '2017-12-12 11:58:37', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('ec32fa72c28d487eba1dd19a49a9ef8c', '0_100002000001', '0_100003000414', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:43', null, '2017-12-12 11:58:41', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('ec894e7e28464f34ae6d14580302d8fe', '0_100002000001', '0_100003000075', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:59', null, '2017-12-12 11:57:57', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('ec8f96fd0ec9480cba18092d6451cccc', '0_100002000001', '0_100003000473', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:51', null, '2017-12-12 11:58:49', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('ecaf583df2844934bdcfd06458310a9e', '0_100002000001', '0_100003000220', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:20', null, '2017-12-12 11:58:17', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('ed8a5a89dfe3439c8d8bdab7ef7dea11', '0_100002000001', '0_100003000204', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:17', null, '2017-12-12 11:58:15', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('eda282a8c96c4d88b949e86ed58b7198', '0_100002000003', '0_100001000001', '3', '1', null, '1000000100101', '2017-12-08 10:34:03', '10000100000101', '2018-01-03 14:29:30', '7', null, null, '4', null);
INSERT INTO `t_organizationrelation` VALUES ('edc2811a782143069146ee385e17d70d', '0_100002000001', '0_100003000588', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:01', null, '2017-12-12 16:11:58', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('ee4347f007cd4e758ed04faf504dbe18', '0_100002000001', '0_100003000092', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:02', null, '2017-12-12 11:58:00', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('ee6043d5951249ba8f78e2c7c05e5aca', '0_100002000001', '0_100003000403', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:42', null, '2017-12-12 11:58:40', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('eea68a35437945308ac320d7b7a27ef4', '0_100002000001', '0_100003000217', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:19', null, '2017-12-12 11:58:17', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('eeb73083326d4abe988c96970fa60673', '0_100002000001', '0_100003000303', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:31', null, '2017-12-12 11:58:29', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('efa99c95f033442c8bfd25a0a2cb1b49', '0_100002000001', '0_100003000339', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:35', null, '2017-12-12 11:58:33', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('efc8b82036cc4081958cd19a30e6612b', '0_100002000001', '0_100003000074', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:59', null, '2017-12-12 11:57:57', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('efd46169c5cf4904adfb833aa4b79735', '0_100002000001', '0_100003000151', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:09', null, '2017-12-12 11:58:07', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('efef9b59af0b42fdb97b85ceeb24f4e7', '0_100002000001', '0_100003000439', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:46', null, '2017-12-12 11:58:44', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('f093974cdfe5493ebd7f43ab7f888f10', '0_100002000001', '0_100003000344', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:36', null, '2017-12-12 11:58:33', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('f0ceead355b646d9a60d4b4579dd6fc9', '0_100002000001', '0_100003000443', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:47', null, '2017-12-12 11:58:45', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('f15fdbe1f65b44a7ad477aa9b8d7a785', '0_100002000001', '0_100003000010', null, '2', null, '10000200000101', '2017-11-24 15:01:34', null, '2017-11-24 15:01:34', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('f1a40964fce9478fb2605e467e80c1e4', '0_100002000001', '0_100003000254', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:25', null, '2017-12-12 11:58:22', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('f2758fb2c3114b0ebd2a102ec9b515e2', '0_100002000001', '0_100003000400', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:42', null, '2017-12-12 11:58:40', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('f2b0a6b32bfc40dfa9e6ac89454e4b88', '0_100002000001', '0_100003000118', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:05', null, '2017-12-12 11:58:03', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('f2b3d157848c454baedac54801c2cadb', '0_100002000001', '0_100003000268', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:27', null, '2017-12-12 11:58:24', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('f2b7099bc4624ac296af62c2e1cd13a9', '0_100002000001', '0_100003000624', null, '2', '0.0122', '10000200000101', '2017-12-19 17:21:10', null, '2017-12-19 17:21:08', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('f2fda05e129341138937cd531b2d7fdd', '0_100002000001', '0_100003000469', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:50', null, '2017-12-12 11:58:48', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('f30cfeddc3044d71b18aec56b0fcb74e', '0_100002000001', '0_100003000170', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:12', null, '2017-12-12 11:58:09', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('f330efb4d19f435f90e606ce2980f374', '0_100002000001', '0_100003000412', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:43', null, '2017-12-12 11:58:41', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('f342e433203f42e3a279d74dccfb2999', '0_100002000001', '0_100003000149', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:09', null, '2017-12-12 11:58:07', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('f38c10934e2c4cc29f2861c4037de845', '0_100002000001', '0_100003000192', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:14', null, '2017-12-12 11:58:12', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('f3cffb91d2004a898a7b6ce1b2ef77a1', '0_100002000001', '0_100003000559', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:54', null, '2017-12-12 16:11:52', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('f4612f3e09d24f61b22a20dc62b047a8', '0_100002000001', '0_100003000560', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:54', null, '2017-12-12 16:11:52', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('f4e6503830244117b4121f8bb207bc25', '0_100002000001', '0_100003000493', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:53', null, '2017-12-12 11:58:51', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('f4f4d1fb36a344fda2c0d516bbab79ad', '0_100002000001', '0_100003000435', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:46', null, '2017-12-12 11:58:44', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('f58bb5d3838c41b4ba381883b57e235b', '0_100002000001', '0_100003000569', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:56', null, '2017-12-12 16:11:54', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('f5ba8b226dca404cba86bd98393718d0', '0_100002000001', '0_100003000042', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:55', null, '2017-12-12 11:57:53', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('f606d67433fa4c29bb69d34733568f0a', '0_100002000001', '0_100003000182', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:13', null, '2017-12-12 11:58:11', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('f6c614e5b7d94db1b164dde4b4b2e859', '0_100002000001', '0_100003000505', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:55', null, '2017-12-12 11:58:53', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('f774117313ab48689a8647609fb69775', '0_100002000001', '0_100003000225', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:20', null, '2017-12-12 11:58:18', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('f793bb01d17547e79328a39190f22797', '0_100002000001', '0_100003000112', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:04', null, '2017-12-12 11:58:02', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('f7d871be9d1c4d30a5432441f1444464', '0_100002000001', '0_100003000088', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:01', null, '2017-12-12 11:57:59', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('f83bfe6da6444b34aa334191789609f1', '0_100002000001', '0_100003000211', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:18', null, '2017-12-12 11:58:16', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('fa88102027bb45d58679ba090ebbf2cf', '0_100002000001', '0_100003000526', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:45', null, '2017-12-12 16:11:42', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('fb04b584f28a4c018019ca56e138ec08', '0_100002000001', '0_100003000127', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:06', null, '2017-12-12 11:58:04', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('fb13d6564050423db083310af9b5fd97', '0_100002000001', '0_100003000273', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:27', null, '2017-12-12 11:58:25', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('fb4592c23dfa433fb62705798b36440b', '0_100002000001', '0_100003000360', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:37', null, '2017-12-12 11:58:35', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('fb5047db99684e7088be74816f781f74', '0_100002000001', '0_100003000123', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:05', null, '2017-12-12 11:58:03', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('fb9d2318ad25404d85fa935e168b7c95', '0_100002000001', '0_100003000070', null, '2', '0.0200', '10000200000101', '2017-12-12 11:57:59', null, '2017-12-12 11:57:57', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('fc64ae99e0684764b6d9d6efecdb4f61', '0_100002000001', '0_100003000334', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:34', null, '2017-12-12 11:58:32', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('fcbd595b39b34d3f821855a76bbdbdb7', '0_100002000001', '0_100003000138', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:07', null, '2017-12-12 11:58:05', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('fccf747b884946e0a9549a995c1e82f7', '0_100002000001', '0_100003000227', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:21', null, '2017-12-12 11:58:18', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('fcd1c7c40a6f4c17a27e238849da362b', '0_100002000001', '0_100003000474', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:51', null, '2017-12-12 11:58:49', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('fd3f74b90a734f89a8715a95df477dae', '0_100002000001', '0_100003000618', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:08', null, '2017-12-12 16:12:05', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('feba9211af57450baada9e05b8c136b3', '0_100002000001', '0_100003000563', null, '2', '0.0200', '10000200000101', '2017-12-12 16:11:55', null, '2017-12-12 16:11:53', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('fee253b8bc3d40eda1f087e10f83fb08', '0_100002000001', '0_100003000592', null, '2', '0.0200', '10000200000101', '2017-12-12 16:12:02', null, '2017-12-12 16:11:59', '1', null, '1', '0', null);
INSERT INTO `t_organizationrelation` VALUES ('ff2cf8ada42a4dcba169abbc619a7694', '0_100002000001', '0_100003000506', null, '2', '0.0200', '10000200000101', '2017-12-12 11:58:55', null, '2017-12-12 11:58:53', '1', null, '1', '0', null);

-- ----------------------------
-- Table structure for `t_tatemplateoperations`
-- ----------------------------
DROP TABLE IF EXISTS `t_tatemplateoperations`;
CREATE TABLE `t_tatemplateoperations` (
  `urid` varchar(32) NOT NULL DEFAULT '' COMMENT '主键ID',
  `tatemplate_id` varchar(32) NOT NULL COMMENT '三方协议模板ID',
  `operator` varchar(32) NOT NULL COMMENT '操作员KEY',
  `operate_org_id` varchar(32) NOT NULL COMMENT '操作组织ID',
  `operate_date` datetime NOT NULL COMMENT '操作日期',
  `operate_flag` varchar(4) NOT NULL COMMENT '操作标志:100-银行经办待发布,101-银行经办已发布,102-银行复核签约,103-银行审批签约,201-核心企业经办签约,202-核心企业复核签约,203-核心企业审批签约',
  `signature` varchar(2000) DEFAULT NULL COMMENT '签名信息',
  `createdby` varchar(32) NOT NULL COMMENT '创建人',
  `createdon` datetime NOT NULL COMMENT '创建时间',
  `lastmodifiedby` varchar(32) DEFAULT NULL COMMENT '修改人',
  `lastmodifiedon` datetime DEFAULT NULL COMMENT '修改时间',
  `rowversion` int(11) NOT NULL DEFAULT '1' COMMENT '版本号',
  `description` varchar(512) DEFAULT NULL COMMENT '描述',
  `relateoperate_id` varchar(32) DEFAULT NULL COMMENT '关联操作ID',
  `blockchainaddress` varchar(256) DEFAULT NULL COMMENT '区块链地址',
  PRIMARY KEY (`urid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='三方协议模板操作表';

-- ----------------------------
-- Records of t_tatemplateoperations
-- ----------------------------
INSERT INTO `t_tatemplateoperations` VALUES ('01dd3f85bfd84b44adb627172ff87121', '976932004f434176b199865fa9cf2397', '系统管理员', '6000001', '2018-01-17 14:48:16', '100', '签名', '系统管理员', '2018-01-17 14:48:16', null, null, '1', '待发布', 'null', null);
INSERT INTO `t_tatemplateoperations` VALUES ('025225f9e67940c4b10dfae3f1f1c36a', '0d17a926025749b4a5f5caf641de7bfb', '系统管理员', '6000001', '2018-01-10 16:45:18', '100', '签名', '系统管理员', '2018-01-10 16:45:18', null, null, '1', '待发布', 'null', null);
INSERT INTO `t_tatemplateoperations` VALUES ('0493cd17f1e64b4b97377ceeefeeeddb', '4b81fa5c0a2a49bba4f5806202ab651c', '系统管理员', '6000001', '2018-01-11 23:27:17', '100', '签名', '系统管理员', '2018-01-11 23:27:17', null, null, '1', '待发布', 'null', null);
INSERT INTO `t_tatemplateoperations` VALUES ('0e32a1f1ed6e4a7e89bd1216cdab64d0', 'a71aaee89ac84a0c834b32d177f2e627', '系统管理员', '6000001', '2018-01-22 14:38:06', '100', '签名', '系统管理员', '2018-01-22 14:38:06', null, null, '1', '待发布', 'null', null);
INSERT INTO `t_tatemplateoperations` VALUES ('35bfaa21d56440d3b4dcaa6db6f614b7', 'f0946a7b6aca4f0a9d80246b580a0634', '系统管理员', '6000001', '2018-01-17 17:22:06', '100', '签名', '系统管理员', '2018-01-17 17:22:06', null, null, '1', '待发布', 'null', null);
INSERT INTO `t_tatemplateoperations` VALUES ('384a6bbda3454acf9fcd0bdf44d28546', '6b81db695a31408d852c6831e3a8dfa5', '系统管理员', '6000001', '2018-01-14 16:01:56', '100', '签名', '系统管理员', '2018-01-14 16:01:56', null, null, '1', '待发布', 'null', null);
INSERT INTO `t_tatemplateoperations` VALUES ('3a4b01f5962c4ed88438777a0d4795dc', '8d455da5428f418c8900eab0b189a19a', '系统管理员', '6000001', '2018-01-22 16:15:20', '100', '签名', '系统管理员', '2018-01-22 16:15:20', null, null, '1', '待发布', 'null', null);
INSERT INTO `t_tatemplateoperations` VALUES ('3d03163ba3154cf997edaadb461f92f5', '118311d518ec423a91dad5aec67c1bdb', '系统管理员', '6000001', '2018-01-19 17:17:10', '100', '签名', '系统管理员', '2018-01-19 17:17:10', null, null, '1', '待发布', 'null', null);
INSERT INTO `t_tatemplateoperations` VALUES ('4e4dd5ff3575411792a23f39dc92b52e', '70ab10a67a7d4c4f9af4fdf37a398606', '系统管理员', '6000001', '2018-01-12 00:59:39', '100', '签名', '系统管理员', '2018-01-12 00:59:39', null, null, '1', '待发布', 'null', null);
INSERT INTO `t_tatemplateoperations` VALUES ('501c48f936b44c52991afa7d0f2c15aa', '389af7482c6d4d5a8f362266eef1ddb1', '系统管理员', '6000001', '2018-01-12 00:05:54', '100', '签名', '系统管理员', '2018-01-12 00:05:54', null, null, '1', '待发布', 'null', null);
INSERT INTO `t_tatemplateoperations` VALUES ('559f8541b5b2423d994be833b42c2022', '40bcd8c208b7496c982ce2cf77e87f93', '系统管理员', '6000001', '2018-01-14 16:02:11', '100', '签名', '系统管理员', '2018-01-14 16:02:11', null, null, '1', '待发布', 'null', null);
INSERT INTO `t_tatemplateoperations` VALUES ('6f365beff43444088b7971ece358b1b8', '38898e50b526415d9250d65bb9e3b922', '系统管理员', '6000001', '2018-01-14 16:10:59', '100', '签名', '系统管理员', '2018-01-14 16:10:59', null, null, '1', '待发布', 'null', null);
INSERT INTO `t_tatemplateoperations` VALUES ('73b4740534264697a8237d1b655565c2', 'ac108fa8f7b2424b85a105214e0bc022', '系统管理员', '6000001', '2018-01-18 14:19:21', '100', '签名', '系统管理员', '2018-01-18 14:19:21', null, null, '1', '待发布', 'null', null);
INSERT INTO `t_tatemplateoperations` VALUES ('952f61e63b9c410090bae51e92cffc0e', '17bcddf319304f558571f8bff59be6c2', 'aa', '0_100001000013', '2018-01-18 17:04:17', '101', null, '经办', '2018-01-18 17:04:17', null, null, '1', null, null, null);
INSERT INTO `t_tatemplateoperations` VALUES ('9b5009776fb74aa786a51c90f914c615', 'c2b7047fd80a40efac5bd399885d5c45', '系统管理员', '6000001', '2018-01-10 16:45:24', '100', '签名', '系统管理员', '2018-01-10 16:45:24', null, null, '1', '待发布', 'null', null);
INSERT INTO `t_tatemplateoperations` VALUES ('a0d1b5ea700349c09242ea97059d7f1d', '118311d518ec423a91dad5aec67c1bdb', 'admin', '6000001', '2018-01-22 16:20:51', '101', '签名', 'admin', '2018-01-22 16:20:51', null, null, '1', '发布', 'null', null);
INSERT INTO `t_tatemplateoperations` VALUES ('a33e094de9ad4b47b5ad89a42233d4e6', '55effcaba9e943d9bcbdddce4f14d858', '系统管理员', '6000001', '2018-01-14 16:03:18', '100', '签名', '系统管理员', '2018-01-14 16:03:18', null, null, '1', '待发布', 'null', null);
INSERT INTO `t_tatemplateoperations` VALUES ('ae04cfc0935043efab98e114cac7ef36', '63e898317e534e93ae60828fa6f90124', '系统管理员', '6000001', '2018-01-14 22:32:19', '100', '签名', '系统管理员', '2018-01-14 22:32:19', null, null, '1', '待发布', 'null', null);
INSERT INTO `t_tatemplateoperations` VALUES ('ae6db9f975b9475cbd3e21fbaeb89569', 'aba181c7161e47e2bfa18f5281b5abcf', '系统管理员', '6000001', '2018-01-17 14:35:42', '100', '签名', '系统管理员', '2018-01-17 14:35:42', null, null, '1', '待发布', 'null', null);
INSERT INTO `t_tatemplateoperations` VALUES ('c9ec6abd57794fec8b8dfce65b12e990', '583002065a6646f7afc74d77256fcfa0', 'admin', '6000001', '2018-01-22 17:24:28', '101', '签名', 'admin', '2018-01-22 17:24:28', null, null, '1', '发布', 'null', null);
INSERT INTO `t_tatemplateoperations` VALUES ('d1ce444f274741edaaf2145e8e655c2b', 'd2810072005240be8ad7fbf210d40104', '系统管理员', '6000001', '2018-01-12 00:55:41', '100', '签名', '系统管理员', '2018-01-12 00:55:41', null, null, '1', '待发布', 'null', null);
INSERT INTO `t_tatemplateoperations` VALUES ('d4f8bc531b45493fb3e958fed645ab6e', '4a4d3991ae944eacb38d191f661030d1', '系统管理员', '6000001', '2018-01-17 15:00:55', '100', '签名', '系统管理员', '2018-01-17 15:00:55', null, null, '1', '待发布', 'null', null);
INSERT INTO `t_tatemplateoperations` VALUES ('dcb7f6c8f55a47b1a12ec3a7664fb365', '6267a61b39344d938e084002e41108df', '系统管理员', '6000001', '2018-01-22 09:25:21', '100', '签名', '系统管理员', '2018-01-22 09:25:21', null, null, '1', '待发布', 'null', null);
INSERT INTO `t_tatemplateoperations` VALUES ('dfda287bba224d37b13f96e2d62c48fb', '31298ad3f0364618aa1a5b764df4f741', '系统管理员', '6000001', '2018-01-17 14:44:54', '100', '签名', '系统管理员', '2018-01-17 14:44:54', null, null, '1', '待发布', 'null', null);
INSERT INTO `t_tatemplateoperations` VALUES ('fc80ce64cf914869ba389a4adcf5d14e', '4a4d3991ae944eacb38d191f661030d1', 'admin', '6000001', '2018-01-22 17:11:52', '101', '签名', 'admin', '2018-01-22 17:11:52', null, null, '1', '发布', 'null', null);

-- ----------------------------
-- Table structure for `t_tripartiteagreementtemplate`
-- ----------------------------
DROP TABLE IF EXISTS `t_tripartiteagreementtemplate`;
CREATE TABLE `t_tripartiteagreementtemplate` (
  `urid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键ID',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户ID',
  `tatemplate_code` varchar(32) NOT NULL COMMENT '三方协议模板编号',
  `tatemplate_version` int(11) NOT NULL COMMENT '三方协议模板版本',
  `bank_id` varchar(32) NOT NULL COMMENT '银行ID',
  `corecompany_id` varchar(32) NOT NULL COMMENT '核心企业ID',
  `credit_limit` decimal(22,2) NOT NULL COMMENT '授信额度',
  `isresourse` varchar(4) DEFAULT NULL COMMENT '有追无追:1-有追,2-无追,3-两者皆可',
  `isactive` varchar(4) NOT NULL COMMENT '是否有效 :0—无效；1—有效',
  `createdby` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createdon` datetime DEFAULT NULL COMMENT '创建日期',
  `lastmodifiedby` varchar(32) DEFAULT NULL COMMENT '修改人',
  `lastmodifiedon` datetime DEFAULT NULL COMMENT '修改日期',
  `rowversion` decimal(4,0) DEFAULT NULL COMMENT '修改版本',
  `description` varchar(256) DEFAULT NULL COMMENT '描述',
  `template_content` blob COMMENT '模板内容',
  `last_operateflag` varchar(4) DEFAULT NULL COMMENT '最近一次操作标志',
  `businesstype` varchar(4) DEFAULT NULL COMMENT '业务类型：101：反向保理；201：正向保理；301：应收账款质押',
  PRIMARY KEY (`urid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='三方协议模板表';

-- ----------------------------
-- Records of t_tripartiteagreementtemplate
-- ----------------------------
INSERT INTO `t_tripartiteagreementtemplate` VALUES ('118311d518ec423a91dad5aec67c1bdb', '10000', '60000010_1000030000021', '1', '6000001', '0_100003000002', '1.00', null, '1', 'admin', '2018-01-19 17:17:07', 'admin', '2018-01-22 16:21:12', '2', 'qqqqqqqqqqqqqqqqqqq', 0x3C703E717171717171717171717171717171717171717171717171713C2F703E, '101', null);
INSERT INTO `t_tripartiteagreementtemplate` VALUES ('17bcddf319304f558571f8bff59be6c2', '10000', '60000010_1000030000021', '1', '0_100001000013', '0_100003000002', '1.00', null, '1', 'admin', '2018-01-18 14:06:28', null, null, '1', 'aaaaaaaaaaaaaaaaa', 0x3C70207374796C653D22746578742D616C69676E3A2063656E7465723B2077686974652D73706163653A206E6F726D616C3B223E3C7374726F6E673E3C7370616E207374796C653D22666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20323470783B223EE5BA94E694B6E8B4A6E6ACBEE580BAE69D83E8BDACE8AEA9E4B889E696B9E58D8FE8AEAE3C2F7370616E3E3C2F7374726F6E673E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A2031323970783B2077686974652D73706163653A206E6F726D616C3B223E3C7374726F6E673E3C7370616E207374796C653D226C696E652D6865696768743A2033312E3570783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20323170783B223E266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B3C2F7370616E3E3C2F7374726F6E673E3C7374726F6E673E3C7370616E207374796C653D22666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A2031302E3570743B223EE7ADBEE8AEA2E697A5EFBC9A7B7369676E646174657D3C2F7370616E3E3C2F7374726F6E673E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE89E8DE8B584E4BC81E4B89AEFBC9A7B66696E616E63696E67636F6D70616E797D20EFBC88E4B88BE7AE80E7A7B0E794B2E696B9EFBC893C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BD8FE59D80EFBC9A7B66696E616E63696E67636F6D70616E79616464726573737D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6B395E5AE9AE4BBA3E8A1A8E4BABAEFBC88E68896E68E88E69D83E4BBA3E79086E4BABAEFBC89EFBC9A7B66696E616E63696E67636F6D70616E79726570726573656E7461746976657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E266E6273703B3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE89E8DE8B584E68F90E4BE9BE696B9EFBC9A7B62616E6B7D20EFBC88E4B88BE7AE80E7A7B0E4B999E696B9EFBC893C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BD8FE59D80EFBC9A7B62616E6B616464726573737D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6B395E5AE9AE4BBA3E8A1A8E4BABAEFBC88E68896E68E88E69D83E4BBA3E79086E4BABAEFBC89EFBC9A7B62616E6B726570726573656E7461746976657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E266E6273703B3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6A0B8E5BF83E4BC81E4B89AEFBC9A7B636F7265636F6D70616E797D20EFBC88E4B88BE7AE80E7A7B0E4B899E696B9EFBC893C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BD8FE59D80EFBC9A7B636F7265636F6D70616E79616464726573737D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6B395E5AE9AE4BBA3E8A1A8E4BABAEFBC88E68896E68E88E69D83E4BBA3E79086E4BABAEFBC89EFBC9A7B636F7265636F6D70616E79726570726573656E7461746976657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20343270783B206D617267696E2D746F703A20313670783B206D617267696E2D626F74746F6D3A20313370783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE989B4E4BA8EE794B2E4B999E58F8CE696B9E5B7B2E5B0B1E7BC96E58FB7E4B8BA5F5F5F5F5F7B6E756D6265727D5F5F5F5FE79A84E5BA94E694B6E8B4A6E6ACBEE580BAE69D8328E585B7E4BD93E8A781E4B88BE696B9E6B885E58D9529E8BDACE8AEA9E4B8BAE59FBAE7A180E8BEBEE68890E89E8DE8B584E6848FE684BFEFBC8CE78EB0E5B0B1E8AFA5E5BA94E694B6E8B4A6E6ACBEE580BAE69D83E79A84E7A1AEE8AEA4E58F8AE8BDACE8AEA9E9809AE79FA5E4BA8BE5AE9CEFBC8CE794B2E38081E4B999E38081E4B899E4B889E696B9E8BEBEE68890E5A682E4B88BE58D8FE8AEAEEFBC9A3C2F7370616E3E3C2F703E3C7461626C653E3C74626F64793E3C747220636C6173733D226669727374526F77223E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D2270616464696E673A20307078203770783B20626F726465723A2031707820736F6C696420626C61636B3B20626F726465722D696D6167653A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE59586E58AA1E59088E5908CE58FB73C2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE58F91E7A5A8E58FB73C2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE58F91E7A5A8E697A53C2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BB98E6ACBEE588B0E69C9FE697A53C2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE58F91E7A5A8E98791E9A29D28E4BABAE6B091E5B881E58583293C2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE8BDACE8AEA9E98791E9A29DEFBC88E4BABAE6B091E5B881E58583EFBC8928E4B88DE58897E6988EE8A1A8E7A4BAE585A8E9A29DE8BDACE8AEA9293C2F7370616E3E3C2F703E3C2F74643E3C2F74723E3C74723E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D20317078203170783B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C69643B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B3B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B636F6E74726163746E756D6265727D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B696E766F6963656E756D6265727D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B696E766F696365646174657D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B7061796D656E74646174657D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B696E766F6963656D6F6E65797D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B7472616E736665726D6F6E65797D3C2F7370616E3E3C2F74643E3C2F74723E3C2F74626F64793E3C2F7461626C653E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20343270783B206D617267696E2D746F703A20313670783B206D617267696E2D626F74746F6D3A20313370783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E266E6273703B3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4B880E38081E794B2E696B9E5908CE6848FE5B086E4B88AE8BFB0E5BA94E694B6E8B4A6E6ACBEE79A84E580BAE69D83E585A8E983A8E8BDACE8AEA9E7BB99E4B999E696B9EFBC8CE8AFA5E5BA94E694B6E8B4A6E6ACBEE698AFE68C87E794B2E696B9E59FBAE4BA8EE585B6E5928CE4B899E696B9E7ADBEE8AEA2E79A84E4B88AE8BFB0E6B885E58D95E4B8ADE79A84E59586E58AA1E59088E5908CE58F8AE59BA0E6B395E5BE8BE8A784E5AE9AE8808CE88EB7E5BE97E79A84E8A681E6B182E4B899E696B9E4BB98E6ACBEE58F8AE8BF94E8BF98E4B88DE5BD93E5BE97E588A9E58F8AE585B6E5AE83E8B4B9E794A8E79A84E69D83E588A9EFBC8CE58C85E68BACE78EB0E69C89E79A84E98791E992B1E580BAE69D83E58F8AE585B6E4BAA7E7949FE79A84E694B6E79B8AE7AD89EFBC8CE4BD86E4B88DE58C85E68BACE59BA0E7A5A8E68DAEE68896E585B6E4BB96E69C89E4BBB7E8AF81E588B8E8808CE4BAA7E7949FE79A84E4BB98E6ACBEE8AFB7E6B182E69D83E38082E4B899E696B9E58FAAE69C89E68C89E785A7E794B2E4B899E696B9E79A84E59FBAE7A180E4BAA4E69893E59088E5908CE5B9B6E981B5E785A7E4B999E696B9E79A84E4BB98E6ACBEE68C87E7A4BAE59091E4B999E696B9E68C87E5AE9AE79A84E4BBA3E79086E4BABAE4BB98E6ACBEEFBC8CE696B9E58FAFE8A7A3E999A4E585B6E4BB98E6ACBEE8B4A3E4BBBBE380823C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BA8CE38081E4B899E696B9E7A1AEE8AEA4E4B88AE8BFB0E7BC96E58FB7E79A84E5BA94E694B6E8B4A6E6ACBEE4BFA1E681AFE4B8BAE585B6E79C9FE5AE9EE69C89E69588E79A84E5BA94E4BB98E8B4A6E6ACBEEFBC8CE7A1AEE8AEA4E4B88AE8BFB0E5BA94E694B6E8B4A6E6ACBEE580BAE69D83E8BDACE8AEA9E5AFB9E4B899E696B9E58F91E7949FE9809AE79FA5E69588E58A9BEFBC8CE4B899E696B9E5B086E59091E4B999E696B9E689BFE68B85E5928CE5B1A5E8A18CE4B88AE8BFB0E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BE79A84E580BAE58AA1E380823C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4B889E38081E794B2E696B9E5908CE6848FE68B85E4BBBBE4B999E696B9E79A84E694B6E6ACBEE4BBA3E79086E4BABAEFBC8CE4B899E696B9E5908CE6848FE5B086E4B88AE8BFB0E5BA94E694B6E8B4A6E6ACBEE5AFB9E5BA94E79A84E5BA94E4BB98E5B890E6ACBEEFBC8CE5A682E69C9FE4BB98E887B3E4B999E696B9E68C87E5AE9AE79A84E5A682E4B88BE4BBA3E79086E4BABAE8B4A6E688B7EFBC88E4BF9DE79086E4B893E688B7EFBC89EFBC9A3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20353670783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE688B7E5908DEFBC9A7B6E616D657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20353670783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE5BC80E688B7E8A18CEFBC9A7B62616E6B6E616D657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20353670783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE8B4A6E58FB7EFBC9A7B62616E6B6163636F756E747D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE59B9BE38081E4B8BAE981BFE5858DE6ADA7E4B989EFBC8CE794B2E4B999E59CA8E6ADA4E7A1AEE8AEA4EFBC9AE794B2E696B9E59CA8E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BE79A84E4BBBBE4BD95E4B989E58AA1E5928CE4BBBBE4BD95E8B4A3E4BBBBE983BDE4B88DE8BDACE8AEA9E7BB99E4B999E696B9E8808CE4BB8DE794B1E794B2E696B9E689BFE68B85EFBC8CE4B999E696B9E6B2A1E69C89E8A681E6B182E68896E689BFE8AFBAE68EA5E58F97E38081E4BBA3E4B8BAE5B1A5E8A18CE794B2E696B9E59CA8E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BE79A84E4BBBBE4BD95E4B989E58AA1E68896E8B4A3E4BBBBEFBC9BE4B899E696B9E689BFE8AFBAE4B88DE4BBA5E794B2E696B9E79A84E4BBBBE4BD95E8A18CE4B8BAEFBC88E697A0E8AEBAE698AFE590A6E59CA8E4B88AE8BFB0E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BEFBC89E68A97E8BEA9E68896E68AB5E99480E68896E58F8DE7B4A2E4B899E696B9E5B0B1E8A2ABE8BDACE8AEA9E580BAE69D83E5BA94E59091E4B999E696B9E5B1A5E8A18CE5928CE689BFE68B85E79A84E4BBBBE4BD95E5928CE4B880E58887E4B989E58AA1E5928CE8B4A3E4BBBBE38082E5A682E59BA0E6ADA4E7BB99E4B999E696B9E980A0E68890E4BBBBE4BD95E68D9FE5A4B1EFBC8CE794B2E4B899E58F8CE696B9E5BA94E8B49FE8B4A3E5A6A5E59684E8A7A3E586B3E5B9B6E4BA88E4BBA5E8B594E581BFE380823C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BA94E38081E5A682E58F91E7949FE4BA89E8AEAEEFBC8CE59084E696B9E5908CE6848FE58D8FE59586E8A7A3E586B3EFBC9BE58D8FE59586E4B88DE68890E79A84EFBC8CE59084E696B9E5908CE6848FE59CA8E4B999E696B9E79A84E4BD8FE68980E59CB0E4BABAE6B091E6B395E999A2E68F90E8B5B7E8AF89E8AEBCE380823C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE585ADE38081E69CACE58D8FE8AEAEE794B1E794B2E4B999E4B899E4B889E696B9E59CA8E7AD96E8B5A2E7BD91E7BB9CE4BFA1E681AFE69C8DE58AA1E5B9B3E58FB0E6B3A8E5868CE79A84E585B7E5A487E7BB8FE58A9EE38081E5A48DE6A0B8E38081E5AEA1E689B9E8818CE883BDE79A84E794B5E5AD90E7ADBEE5908DE588B6E4BD9CE695B0E68DAEE59D87E5AFB9E69CACE4B889E696B9E58D8FE8AEAEE6ADA3E69687E794B5E5AD90E7ADBEE5908DE5908EE7949FE69588E380823C2F7370616E3E3C2F703E3C70207374796C653D2277686974652D73706163653A206E6F726D616C3B223E266E6273703B3C2F703E3C703E3C62722F3E3C2F703E3C703E266E6273703B3C2F703E, '101', null);
INSERT INTO `t_tripartiteagreementtemplate` VALUES ('4a4d3991ae944eacb38d191f661030d1', '10000', '600000111', '1', '0_100001000013', '1', '1.00', null, '1', 'admin', '2018-01-17 15:00:55', 'admin', '2018-01-22 17:11:52', '2', 'e', 0x3C70207374796C653D22746578742D616C69676E3A2063656E7465723B2077686974652D73706163653A206E6F726D616C3B223E3C7374726F6E673E3C7370616E207374796C653D22666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20323470783B223EE5BA94E694B6E8B4A6E6ACBEE580BAE69D83E8BDACE8AEA9E4B889E696B9E58D8FE8AEAE3C2F7370616E3E3C2F7374726F6E673E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A2031323970783B2077686974652D73706163653A206E6F726D616C3B223E3C7374726F6E673E3C7370616E207374796C653D226C696E652D6865696768743A2033312E3570783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20323170783B223E266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B3C2F7370616E3E3C2F7374726F6E673E3C7374726F6E673E3C7370616E207374796C653D22666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A2031302E3570743B223EE7ADBEE8AEA2E697A5EFBC9A7B7369676E646174657D3C2F7370616E3E3C2F7374726F6E673E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE89E8DE8B584E4BC81E4B89AEFBC9A7B66696E616E63696E67636F6D70616E797D20EFBC88E4B88BE7AE80E7A7B0E794B2E696B9EFBC893C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BD8FE59D80EFBC9A7B66696E616E63696E67636F6D70616E79616464726573737D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6B395E5AE9AE4BBA3E8A1A8E4BABAEFBC88E68896E68E88E69D83E4BBA3E79086E4BABAEFBC89EFBC9A7B66696E616E63696E67636F6D70616E79726570726573656E7461746976657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E266E6273703B3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE89E8DE8B584E68F90E4BE9BE696B9EFBC9A7B62616E6B7D20EFBC88E4B88BE7AE80E7A7B0E4B999E696B9EFBC893C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BD8FE59D80EFBC9A7B62616E6B616464726573737D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6B395E5AE9AE4BBA3E8A1A8E4BABAEFBC88E68896E68E88E69D83E4BBA3E79086E4BABAEFBC89EFBC9A7B62616E6B726570726573656E7461746976657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E266E6273703B3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6A0B8E5BF83E4BC81E4B89AEFBC9A7B636F7265636F6D70616E797D20EFBC88E4B88BE7AE80E7A7B0E4B899E696B9EFBC893C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BD8FE59D80EFBC9A7B636F7265636F6D70616E79616464726573737D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6B395E5AE9AE4BBA3E8A1A8E4BABAEFBC88E68896E68E88E69D83E4BBA3E79086E4BABAEFBC89EFBC9A7B636F7265636F6D70616E79726570726573656E7461746976657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20343270783B206D617267696E2D746F703A20313670783B206D617267696E2D626F74746F6D3A20313370783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE989B4E4BA8EE794B2E4B999E58F8CE696B9E5B7B2E5B0B1E7BC96E58FB7E4B8BA5F5F5F5F5F7B6E756D6265727D5F5F5F5FE79A84E5BA94E694B6E8B4A6E6ACBEE580BAE69D8328E585B7E4BD93E8A781E4B88BE696B9E6B885E58D3FE8BDACE8AEA9E4B8BAE59FBAE7A180E8BEBEE68890E89E8DE8B584E6848FE684BFEFBC8CE78EB0E5B0B1E8AFA5E5BA94E694B6E8B4A6E6ACBEE580BAE69D83E79A84E7A1AEE8AEA4E58F8AE8BDACE8AEA9E9809AE79FA5E4BA8BE5AE9CEFBC8CE794B2E38081E4B999E38081E4B899E4B889E696B9E8BEBEE68890E5A682E4B88BE58D8FE8AEAEEFBC3F2F7370616E3E3C2F703E3C7461626C653E3C74626F64793E3C747220636C6173733D226669727374526F77223E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D2270616464696E673A20307078203770783B20626F726465723A2031707820736F6C696420626C61636B3B20626F726465722D696D6167653A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE59586E58AA1E59088E5908CE58F3F2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE58F91E7A5A8E58F3F2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE58F91E7A5A8E6973F2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BB98E6ACBEE588B0E69C9FE6973F2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE58F91E7A5A8E98791E9A29D28E4BABAE6B091E5B881E58583293C2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE8BDACE8AEA9E98791E9A29DEFBC88E4BABAE6B091E5B881E58583EFBC8928E4B88DE58897E6988EE8A1A8E7A4BAE585A8E9A29DE8BDACE8AE3F3C2F7370616E3E3C2F703E3C2F74643E3C2F74723E3C74723E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D20317078203170783B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C69643B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B3B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B636F6E74726163746E756D6265727D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B696E766F6963656E756D6265727D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B696E766F696365646174657D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B7061796D656E74646174657D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B696E766F6963656D6F6E65797D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B7472616E736665726D6F6E65797D3C2F7370616E3E3C2F74643E3C2F74723E3C2F74626F64793E3C2F7461626C653E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20343270783B206D617267696E2D746F703A20313670783B206D617267696E2D626F74746F6D3A20313370783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E266E6273703B3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4B880E38081E794B2E696B9E5908CE6848FE5B086E4B88AE8BFB0E5BA94E694B6E8B4A6E6ACBEE79A84E580BAE69D83E585A8E983A8E8BDACE8AEA9E7BB99E4B999E696B9EFBC8CE8AFA5E5BA94E694B6E8B4A6E6ACBEE698AFE68C87E794B2E696B9E59FBAE4BA8EE585B6E5928CE4B899E696B9E7ADBEE8AEA2E79A84E4B88AE8BFB0E6B885E58D95E4B8ADE79A84E59586E58AA1E59088E5908CE58F8AE59BA0E6B395E5BE8BE8A784E5AE9AE8808CE88EB7E5BE97E79A84E8A681E6B182E4B899E696B9E4BB98E6ACBEE58F8AE8BF94E8BF98E4B88DE5BD93E5BE97E588A9E58F8AE585B6E5AE83E8B4B9E794A8E79A84E69D83E588A9EFBC8CE58C85E68BACE78EB0E69C89E79A84E98791E992B1E580BAE69D83E58F8AE585B6E4BAA7E7949FE79A84E694B6E79B8AE7AD89EFBC8CE4BD86E4B88DE58C85E68BACE59BA0E7A5A8E68DAEE68896E585B6E4BB96E69C89E4BBB7E8AF81E588B8E8808CE4BAA7E7949FE79A84E4BB98E6ACBEE8AFB7E6B182E69D83E38082E4B899E696B9E58FAAE69C89E68C89E785A7E794B2E4B899E696B9E79A84E59FBAE7A180E4BAA4E69893E59088E5908CE5B9B6E981B5E785A7E4B999E696B9E79A84E4BB98E6ACBEE68C87E7A4BAE59091E4B999E696B9E68C87E5AE9AE79A84E4BBA3E79086E4BABAE4BB98E6ACBEEFBC8CE696B9E58FAFE8A7A3E999A4E585B6E4BB98E6ACBEE8B4A3E4BBBBE3803F2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BA8CE38081E4B899E696B9E7A1AEE8AEA4E4B88AE8BFB0E7BC96E58FB7E79A84E5BA94E694B6E8B4A6E6ACBEE4BFA1E681AFE4B8BAE585B6E79C9FE5AE9EE69C89E69588E79A84E5BA94E4BB98E8B4A6E6ACBEEFBC8CE7A1AEE8AEA4E4B88AE8BFB0E5BA94E694B6E8B4A6E6ACBEE580BAE69D83E8BDACE8AEA9E5AFB9E4B899E696B9E58F91E7949FE9809AE79FA5E69588E58A9BEFBC8CE4B899E696B9E5B086E59091E4B999E696B9E689BFE68B85E5928CE5B1A5E8A18CE4B88AE8BFB0E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BE79A84E580BAE58AA1E3803F2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4B889E38081E794B2E696B9E5908CE6848FE68B85E4BBBBE4B999E696B9E79A84E694B6E6ACBEE4BBA3E79086E4BABAEFBC8CE4B899E696B9E5908CE6848FE5B086E4B88AE8BFB0E5BA94E694B6E8B4A6E6ACBEE5AFB9E5BA94E79A84E5BA94E4BB98E5B890E6ACBEEFBC8CE5A682E69C9FE4BB98E887B3E4B999E696B9E68C87E5AE9AE79A84E5A682E4B88BE4BBA3E79086E4BABAE8B4A6E688B7EFBC88E4BF9DE79086E4B893E688B7EFBC89EFBC9A3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20353670783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE688B7E5908DEFBC9A7B6E616D657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20353670783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE5BC80E688B7E8A18CEFBC9A7B62616E6B6E616D657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20353670783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE8B4A6E58FB7EFBC9A7B62616E6B6163636F756E747D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE59B9BE38081E4B8BAE981BFE5858DE6ADA7E4B989EFBC8CE794B2E4B999E59CA8E6ADA4E7A1AEE8AEA4EFBC9AE794B2E696B9E59CA8E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BE79A84E4BBBBE4BD95E4B989E58AA1E5928CE4BBBBE4BD95E8B4A3E4BBBBE983BDE4B88DE8BDACE8AEA9E7BB99E4B999E696B9E8808CE4BB8DE794B1E794B2E696B9E689BFE68B85EFBC8CE4B999E696B9E6B2A1E69C89E8A681E6B182E68896E689BFE8AFBAE68EA5E58F97E38081E4BBA3E4B8BAE5B1A5E8A18CE794B2E696B9E59CA8E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BE79A84E4BBBBE4BD95E4B989E58AA1E68896E8B4A3E4BBBBEFBC9BE4B899E696B9E689BFE8AFBAE4B88DE4BBA5E794B2E696B9E79A84E4BBBBE4BD95E8A18CE4B8BAEFBC88E697A0E8AEBAE698AFE590A6E59CA8E4B88AE8BFB0E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BEFBC89E68A97E8BEA9E68896E68AB5E99480E68896E58F8DE7B4A2E4B899E696B9E5B0B1E8A2ABE8BDACE8AEA9E580BAE69D83E5BA94E59091E4B999E696B9E5B1A5E8A18CE5928CE689BFE68B85E79A84E4BBBBE4BD95E5928CE4B880E58887E4B989E58AA1E5928CE8B4A3E4BBBBE38082E5A682E59BA0E6ADA4E7BB99E4B999E696B9E980A0E68890E4BBBBE4BD95E68D9FE5A4B1EFBC8CE794B2E4B899E58F8CE696B9E5BA94E8B49FE8B4A3E5A6A5E59684E8A7A3E586B3E5B9B6E4BA88E4BBA5E8B594E581BFE3803F2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BA94E38081E5A682E58F91E7949FE4BA89E8AEAEEFBC8CE59084E696B9E5908CE6848FE58D8FE59586E8A7A3E586B3EFBC9BE58D8FE59586E4B88DE68890E79A84EFBC8CE59084E696B9E5908CE6848FE59CA8E4B999E696B9E79A84E4BD8FE68980E59CB0E4BABAE6B091E6B395E999A2E68F90E8B5B7E8AF89E8AEBCE3803F2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE585ADE38081E69CACE58D8FE8AEAEE794B1E794B2E4B999E4B899E4B889E696B9E59CA8E7AD96E8B5A2E7BD91E7BB9CE4BFA1E681AFE69C8DE58AA1E5B9B3E58FB0E6B3A8E5868CE79A84E585B7E5A487E7BB8FE58A9EE38081E5A48DE6A0B8E38081E5AEA1E689B9E8818CE883BDE79A84E794B5E5AD90E7ADBEE5908DE588B6E4BD9CE695B0E68DAEE59D87E5AFB9E69CACE4B889E696B9E58D8FE8AEAEE6ADA3E69687E794B5E5AD90E7ADBEE5908DE5908EE7949FE69588E3803F2F7370616E3E3C2F703E3C70207374796C653D2277686974652D73706163653A206E6F726D616C3B223E266E6273703B3C2F703E3C703E3C62722F3E3C2F703E3C703E266E6273703B3C2F703E, '101', null);
INSERT INTO `t_tripartiteagreementtemplate` VALUES ('583002065a6646f7afc74d77256fcfa0', '10000', '600000111', '1', '0_100001000013', '1', '1.00', null, '1', 'admin', '2018-01-17 22:40:03', 'admin', '2018-01-22 17:24:28', '2', 'e', 0x3C70207374796C653D22746578742D616C69676E3A2063656E7465723B2077686974652D73706163653A206E6F726D616C3B223E3C7374726F6E673E3C7370616E207374796C653D22666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20323470783B223EE5BA94E694B6E8B4A6E6ACBEE580BAE69D83E8BDACE8AEA9E4B889E696B9E58D8FE8AEAE3C2F7370616E3E3C2F7374726F6E673E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A2031323970783B2077686974652D73706163653A206E6F726D616C3B223E3C7374726F6E673E3C7370616E207374796C653D226C696E652D6865696768743A2033312E3570783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20323170783B223E266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B3C2F7370616E3E3C2F7374726F6E673E3C7374726F6E673E3C7370616E207374796C653D22666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A2031302E3570743B223EE7ADBEE8AEA2E697A5EFBC9A7B7369676E646174657D3C2F7370616E3E3C2F7374726F6E673E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE89E8DE8B584E4BC81E4B89AEFBC9A7B66696E616E63696E67636F6D70616E797D20EFBC88E4B88BE7AE80E7A7B0E794B2E696B9EFBC893C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BD8FE59D80EFBC9A7B66696E616E63696E67636F6D70616E79616464726573737D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6B395E5AE9AE4BBA3E8A1A8E4BABAEFBC88E68896E68E88E69D83E4BBA3E79086E4BABAEFBC89EFBC9A7B66696E616E63696E67636F6D70616E79726570726573656E7461746976657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E266E6273703B3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE89E8DE8B584E68F90E4BE9BE696B9EFBC9A7B62616E6B7D20EFBC88E4B88BE7AE80E7A7B0E4B999E696B9EFBC893C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BD8FE59D80EFBC9A7B62616E6B616464726573737D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6B395E5AE9AE4BBA3E8A1A8E4BABAEFBC88E68896E68E88E69D83E4BBA3E79086E4BABAEFBC89EFBC9A7B62616E6B726570726573656E7461746976657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E266E6273703B3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6A0B8E5BF83E4BC81E4B89AEFBC9A7B636F7265636F6D70616E797D20EFBC88E4B88BE7AE80E7A7B0E4B899E696B9EFBC893C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BD8FE59D80EFBC9A7B636F7265636F6D70616E79616464726573737D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6B395E5AE9AE4BBA3E8A1A8E4BABAEFBC88E68896E68E88E69D83E4BBA3E79086E4BABAEFBC89EFBC9A7B636F7265636F6D70616E79726570726573656E7461746976657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20343270783B206D617267696E2D746F703A20313670783B206D617267696E2D626F74746F6D3A20313370783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE989B4E4BA8EE794B2E4B999E58F8CE696B9E5B7B2E5B0B1E7BC96E58FB7E4B8BA5F5F5F5F5F7B6E756D6265727D5F5F5F5FE79A84E5BA94E694B6E8B4A6E6ACBEE580BAE69D8328E585B7E4BD93E8A781E4B88BE696B9E6B885E58D3FE8BDACE8AEA9E4B8BAE59FBAE7A180E8BEBEE68890E89E8DE8B584E6848FE684BFEFBC8CE78EB0E5B0B1E8AFA5E5BA94E694B6E8B4A6E6ACBEE580BAE69D83E79A84E7A1AEE8AEA4E58F8AE8BDACE8AEA9E9809AE79FA5E4BA8BE5AE9CEFBC8CE794B2E38081E4B999E38081E4B899E4B889E696B9E8BEBEE68890E5A682E4B88BE58D8FE8AEAEEFBC3F2F7370616E3E3C2F703E3C7461626C653E3C74626F64793E3C747220636C6173733D226669727374526F77223E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D2270616464696E673A20307078203770783B20626F726465723A2031707820736F6C696420626C61636B3B20626F726465722D696D6167653A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE59586E58AA1E59088E5908CE58F3F2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE58F91E7A5A8E58F3F2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE58F91E7A5A8E6973F2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BB98E6ACBEE588B0E69C9FE6973F2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE58F91E7A5A8E98791E9A29D28E4BABAE6B091E5B881E58583293C2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE8BDACE8AEA9E98791E9A29DEFBC88E4BABAE6B091E5B881E58583EFBC8928E4B88DE58897E6988EE8A1A8E7A4BAE585A8E9A29DE8BDACE8AE3F3C2F7370616E3E3C2F703E3C2F74643E3C2F74723E3C74723E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D20317078203170783B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C69643B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B3B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B636F6E74726163746E756D6265727D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B696E766F6963656E756D6265727D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B696E766F696365646174657D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B7061796D656E74646174657D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B696E766F6963656D6F6E65797D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B7472616E736665726D6F6E65797D3C2F7370616E3E3C2F74643E3C2F74723E3C2F74626F64793E3C2F7461626C653E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20343270783B206D617267696E2D746F703A20313670783B206D617267696E2D626F74746F6D3A20313370783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E266E6273703B3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4B880E38081E794B2E696B9E5908CE6848FE5B086E4B88AE8BFB0E5BA94E694B6E8B4A6E6ACBEE79A84E580BAE69D83E585A8E983A8E8BDACE8AEA9E7BB99E4B999E696B9EFBC8CE8AFA5E5BA94E694B6E8B4A6E6ACBEE698AFE68C87E794B2E696B9E59FBAE4BA8EE585B6E5928CE4B899E696B9E7ADBEE8AEA2E79A84E4B88AE8BFB0E6B885E58D95E4B8ADE79A84E59586E58AA1E59088E5908CE58F8AE59BA0E6B395E5BE8BE8A784E5AE9AE8808CE88EB7E5BE97E79A84E8A681E6B182E4B899E696B9E4BB98E6ACBEE58F8AE8BF94E8BF98E4B88DE5BD93E5BE97E588A9E58F8AE585B6E5AE83E8B4B9E794A8E79A84E69D83E588A9EFBC8CE58C85E68BACE78EB0E69C89E79A84E98791E992B1E580BAE69D83E58F8AE585B6E4BAA7E7949FE79A84E694B6E79B8AE7AD89EFBC8CE4BD86E4B88DE58C85E68BACE59BA0E7A5A8E68DAEE68896E585B6E4BB96E69C89E4BBB7E8AF81E588B8E8808CE4BAA7E7949FE79A84E4BB98E6ACBEE8AFB7E6B182E69D83E38082E4B899E696B9E58FAAE69C89E68C89E785A7E794B2E4B899E696B9E79A84E59FBAE7A180E4BAA4E69893E59088E5908CE5B9B6E981B5E785A7E4B999E696B9E79A84E4BB98E6ACBEE68C87E7A4BAE59091E4B999E696B9E68C87E5AE9AE79A84E4BBA3E79086E4BABAE4BB98E6ACBEEFBC8CE696B9E58FAFE8A7A3E999A4E585B6E4BB98E6ACBEE8B4A3E4BBBBE3803F2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BA8CE38081E4B899E696B9E7A1AEE8AEA4E4B88AE8BFB0E7BC96E58FB7E79A84E5BA94E694B6E8B4A6E6ACBEE4BFA1E681AFE4B8BAE585B6E79C9FE5AE9EE69C89E69588E79A84E5BA94E4BB98E8B4A6E6ACBEEFBC8CE7A1AEE8AEA4E4B88AE8BFB0E5BA94E694B6E8B4A6E6ACBEE580BAE69D83E8BDACE8AEA9E5AFB9E4B899E696B9E58F91E7949FE9809AE79FA5E69588E58A9BEFBC8CE4B899E696B9E5B086E59091E4B999E696B9E689BFE68B85E5928CE5B1A5E8A18CE4B88AE8BFB0E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BE79A84E580BAE58AA1E3803F2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4B889E38081E794B2E696B9E5908CE6848FE68B85E4BBBBE4B999E696B9E79A84E694B6E6ACBEE4BBA3E79086E4BABAEFBC8CE4B899E696B9E5908CE6848FE5B086E4B88AE8BFB0E5BA94E694B6E8B4A6E6ACBEE5AFB9E5BA94E79A84E5BA94E4BB98E5B890E6ACBEEFBC8CE5A682E69C9FE4BB98E887B3E4B999E696B9E68C87E5AE9AE79A84E5A682E4B88BE4BBA3E79086E4BABAE8B4A6E688B7EFBC88E4BF9DE79086E4B893E688B7EFBC89EFBC9A3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20353670783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE688B7E5908DEFBC9A7B6E616D657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20353670783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE5BC80E688B7E8A18CEFBC9A7B62616E6B6E616D657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20353670783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE8B4A6E58FB7EFBC9A7B62616E6B6163636F756E747D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE59B9BE38081E4B8BAE981BFE5858DE6ADA7E4B989EFBC8CE794B2E4B999E59CA8E6ADA4E7A1AEE8AEA4EFBC9AE794B2E696B9E59CA8E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BE79A84E4BBBBE4BD95E4B989E58AA1E5928CE4BBBBE4BD95E8B4A3E4BBBBE983BDE4B88DE8BDACE8AEA9E7BB99E4B999E696B9E8808CE4BB8DE794B1E794B2E696B9E689BFE68B85EFBC8CE4B999E696B9E6B2A1E69C89E8A681E6B182E68896E689BFE8AFBAE68EA5E58F97E38081E4BBA3E4B8BAE5B1A5E8A18CE794B2E696B9E59CA8E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BE79A84E4BBBBE4BD95E4B989E58AA1E68896E8B4A3E4BBBBEFBC9BE4B899E696B9E689BFE8AFBAE4B88DE4BBA5E794B2E696B9E79A84E4BBBBE4BD95E8A18CE4B8BAEFBC88E697A0E8AEBAE698AFE590A6E59CA8E4B88AE8BFB0E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BEFBC89E68A97E8BEA9E68896E68AB5E99480E68896E58F8DE7B4A2E4B899E696B9E5B0B1E8A2ABE8BDACE8AEA9E580BAE69D83E5BA94E59091E4B999E696B9E5B1A5E8A18CE5928CE689BFE68B85E79A84E4BBBBE4BD95E5928CE4B880E58887E4B989E58AA1E5928CE8B4A3E4BBBBE38082E5A682E59BA0E6ADA4E7BB99E4B999E696B9E980A0E68890E4BBBBE4BD95E68D9FE5A4B1EFBC8CE794B2E4B899E58F8CE696B9E5BA94E8B49FE8B4A3E5A6A5E59684E8A7A3E586B3E5B9B6E4BA88E4BBA5E8B594E581BFE3803F2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BA94E38081E5A682E58F91E7949FE4BA89E8AEAEEFBC8CE59084E696B9E5908CE6848FE58D8FE59586E8A7A3E586B3EFBC9BE58D8FE59586E4B88DE68890E79A84EFBC8CE59084E696B9E5908CE6848FE59CA8E4B999E696B9E79A84E4BD8FE68980E59CB0E4BABAE6B091E6B395E999A2E68F90E8B5B7E8AF89E8AEBCE3803F2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE585ADE38081E69CACE58D8FE8AEAEE794B1E794B2E4B999E4B899E4B889E696B9E59CA8E7AD96E8B5A2E7BD91E7BB9CE4BFA1E681AFE69C8DE58AA1E5B9B3E58FB0E6B3A8E5868CE79A84E585B7E5A487E7BB8FE58A9EE38081E5A48DE6A0B8E38081E5AEA1E689B9E8818CE883BDE79A84E794B5E5AD90E7ADBEE5908DE588B6E4BD9CE695B0E68DAEE59D87E5AFB9E69CACE4B889E696B9E58D8FE8AEAEE6ADA3E69687E794B5E5AD90E7ADBEE5908DE5908EE7949FE69588E3803F2F7370616E3E3C2F703E3C70207374796C653D2277686974652D73706163653A206E6F726D616C3B223E266E6273703B3C2F703E3C703E3C62722F3E3C2F703E3C703E266E6273703B3C2F703E, '101', null);
INSERT INTO `t_tripartiteagreementtemplate` VALUES ('6267a61b39344d938e084002e41108df', '10000', '60000010_1000030000021', '1', '6000001', '0_100003000002', '1.00', null, '1', 'admin', '2018-01-22 09:25:21', null, null, '1', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 0x3C703E6161616161616161616161616161616161616161616161616161616161613C2F703E, '100', null);
INSERT INTO `t_tripartiteagreementtemplate` VALUES ('7416a058f73f4d74bc38ebf7370044c4', '10000', '60000010_1000030000021', '1', '0_100001000013', '0_100003000002', '1.00', null, '1', 'admin', '2018-01-18 13:45:18', null, null, '1', 'aaaaaaaaaaa', 0x3C70207374796C653D22746578742D616C69676E3A2063656E7465723B2077686974652D73706163653A206E6F726D616C3B223E3C7374726F6E673E3C7370616E207374796C653D22666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20323470783B223EE5BA94E694B6E8B4A6E6ACBEE580BAE69D83E8BDACE8AEA9E4B889E696B9E58D8FE8AEAE3C2F7370616E3E3C2F7374726F6E673E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A2031323970783B2077686974652D73706163653A206E6F726D616C3B223E3C7374726F6E673E3C7370616E207374796C653D226C696E652D6865696768743A2033312E3570783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20323170783B223E266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B3C2F7370616E3E3C2F7374726F6E673E3C7374726F6E673E3C7370616E207374796C653D22666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A2031302E3570743B223EE7ADBEE8AEA2E697A5EFBC9A7B7369676E646174657D3C2F7370616E3E3C2F7374726F6E673E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE89E8DE8B584E4BC81E4B89AEFBC9A7B66696E616E63696E67636F6D70616E797D20EFBC88E4B88BE7AE80E7A7B0E794B2E696B9EFBC893C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BD8FE59D80EFBC9A7B66696E616E63696E67636F6D70616E79616464726573737D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6B395E5AE9AE4BBA3E8A1A8E4BABAEFBC88E68896E68E88E69D83E4BBA3E79086E4BABAEFBC89EFBC9A7B66696E616E63696E67636F6D70616E79726570726573656E7461746976657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E266E6273703B3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE89E8DE8B584E68F90E4BE9BE696B9EFBC9A7B62616E6B7D20EFBC88E4B88BE7AE80E7A7B0E4B999E696B9EFBC893C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BD8FE59D80EFBC9A7B62616E6B616464726573737D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6B395E5AE9AE4BBA3E8A1A8E4BABAEFBC88E68896E68E88E69D83E4BBA3E79086E4BABAEFBC89EFBC9A7B62616E6B726570726573656E7461746976657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E266E6273703B3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6A0B8E5BF83E4BC81E4B89AEFBC9A7B636F7265636F6D70616E797D20EFBC88E4B88BE7AE80E7A7B0E4B899E696B9EFBC893C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BD8FE59D80EFBC9A7B636F7265636F6D70616E79616464726573737D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6B395E5AE9AE4BBA3E8A1A8E4BABAEFBC88E68896E68E88E69D83E4BBA3E79086E4BABAEFBC89EFBC9A7B636F7265636F6D70616E79726570726573656E7461746976657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20343270783B206D617267696E2D746F703A20313670783B206D617267696E2D626F74746F6D3A20313370783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE989B4E4BA8EE794B2E4B999E58F8CE696B9E5B7B2E5B0B1E7BC96E58FB7E4B8BA5F5F5F5F5F7B6E756D6265727D5F5F5F5FE79A84E5BA94E694B6E8B4A6E6ACBEE580BAE69D8328E585B7E4BD93E8A781E4B88BE696B9E6B885E58D3FE8BDACE8AEA9E4B8BAE59FBAE7A180E8BEBEE68890E89E8DE8B584E6848FE684BFEFBC8CE78EB0E5B0B1E8AFA5E5BA94E694B6E8B4A6E6ACBEE580BAE69D83E79A84E7A1AEE8AEA4E58F8AE8BDACE8AEA9E9809AE79FA5E4BA8BE5AE9CEFBC8CE794B2E38081E4B999E38081E4B899E4B889E696B9E8BEBEE68890E5A682E4B88BE58D8FE8AEAEEFBC3F2F7370616E3E3C2F703E3C7461626C653E3C74626F64793E3C747220636C6173733D226669727374526F77223E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D2270616464696E673A20307078203770783B20626F726465723A2031707820736F6C696420626C61636B3B20626F726465722D696D6167653A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE59586E58AA1E59088E5908CE58F3F2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE58F91E7A5A8E58F3F2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE58F91E7A5A8E6973F2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BB98E6ACBEE588B0E69C9FE6973F2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE58F91E7A5A8E98791E9A29D28E4BABAE6B091E5B881E58583293C2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE8BDACE8AEA9E98791E9A29DEFBC88E4BABAE6B091E5B881E58583EFBC8928E4B88DE58897E6988EE8A1A8E7A4BAE585A8E9A29DE8BDACE8AE3F3C2F7370616E3E3C2F703E3C2F74643E3C2F74723E3C74723E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D20317078203170783B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C69643B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B3B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B636F6E74726163746E756D6265727D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B696E766F6963656E756D6265727D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B696E766F696365646174657D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B7061796D656E74646174657D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B696E766F6963656D6F6E65797D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B7472616E736665726D6F6E65797D3C2F7370616E3E3C2F74643E3C2F74723E3C2F74626F64793E3C2F7461626C653E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20343270783B206D617267696E2D746F703A20313670783B206D617267696E2D626F74746F6D3A20313370783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E266E6273703B3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4B880E38081E794B2E696B9E5908CE6848FE5B086E4B88AE8BFB0E5BA94E694B6E8B4A6E6ACBEE79A84E580BAE69D83E585A8E983A8E8BDACE8AEA9E7BB99E4B999E696B9EFBC8CE8AFA5E5BA94E694B6E8B4A6E6ACBEE698AFE68C87E794B2E696B9E59FBAE4BA8EE585B6E5928CE4B899E696B9E7ADBEE8AEA2E79A84E4B88AE8BFB0E6B885E58D95E4B8ADE79A84E59586E58AA1E59088E5908CE58F8AE59BA0E6B395E5BE8BE8A784E5AE9AE8808CE88EB7E5BE97E79A84E8A681E6B182E4B899E696B9E4BB98E6ACBEE58F8AE8BF94E8BF98E4B88DE5BD93E5BE97E588A9E58F8AE585B6E5AE83E8B4B9E794A8E79A84E69D83E588A9EFBC8CE58C85E68BACE78EB0E69C89E79A84E98791E992B1E580BAE69D83E58F8AE585B6E4BAA7E7949FE79A84E694B6E79B8AE7AD89EFBC8CE4BD86E4B88DE58C85E68BACE59BA0E7A5A8E68DAEE68896E585B6E4BB96E69C89E4BBB7E8AF81E588B8E8808CE4BAA7E7949FE79A84E4BB98E6ACBEE8AFB7E6B182E69D83E38082E4B899E696B9E58FAAE69C89E68C89E785A7E794B2E4B899E696B9E79A84E59FBAE7A180E4BAA4E69893E59088E5908CE5B9B6E981B5E785A7E4B999E696B9E79A84E4BB98E6ACBEE68C87E7A4BAE59091E4B999E696B9E68C87E5AE9AE79A84E4BBA3E79086E4BABAE4BB98E6ACBEEFBC8CE696B9E58FAFE8A7A3E999A4E585B6E4BB98E6ACBEE8B4A3E4BBBBE3803F2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BA8CE38081E4B899E696B9E7A1AEE8AEA4E4B88AE8BFB0E7BC96E58FB7E79A84E5BA94E694B6E8B4A6E6ACBEE4BFA1E681AFE4B8BAE585B6E79C9FE5AE9EE69C89E69588E79A84E5BA94E4BB98E8B4A6E6ACBEEFBC8CE7A1AEE8AEA4E4B88AE8BFB0E5BA94E694B6E8B4A6E6ACBEE580BAE69D83E8BDACE8AEA9E5AFB9E4B899E696B9E58F91E7949FE9809AE79FA5E69588E58A9BEFBC8CE4B899E696B9E5B086E59091E4B999E696B9E689BFE68B85E5928CE5B1A5E8A18CE4B88AE8BFB0E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BE79A84E580BAE58AA1E3803F2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4B889E38081E794B2E696B9E5908CE6848FE68B85E4BBBBE4B999E696B9E79A84E694B6E6ACBEE4BBA3E79086E4BABAEFBC8CE4B899E696B9E5908CE6848FE5B086E4B88AE8BFB0E5BA94E694B6E8B4A6E6ACBEE5AFB9E5BA94E79A84E5BA94E4BB98E5B890E6ACBEEFBC8CE5A682E69C9FE4BB98E887B3E4B999E696B9E68C87E5AE9AE79A84E5A682E4B88BE4BBA3E79086E4BABAE8B4A6E688B7EFBC88E4BF9DE79086E4B893E688B7EFBC89EFBC9A3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20353670783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE688B7E5908DEFBC9A7B6E616D657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20353670783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE5BC80E688B7E8A18CEFBC9A7B62616E6B6E616D657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20353670783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE8B4A6E58FB7EFBC9A7B62616E6B6163636F756E747D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE59B9BE38081E4B8BAE981BFE5858DE6ADA7E4B989EFBC8CE794B2E4B999E59CA8E6ADA4E7A1AEE8AEA4EFBC9AE794B2E696B9E59CA8E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BE79A84E4BBBBE4BD95E4B989E58AA1E5928CE4BBBBE4BD95E8B4A3E4BBBBE983BDE4B88DE8BDACE8AEA9E7BB99E4B999E696B9E8808CE4BB8DE794B1E794B2E696B9E689BFE68B85EFBC8CE4B999E696B9E6B2A1E69C89E8A681E6B182E68896E689BFE8AFBAE68EA5E58F97E38081E4BBA3E4B8BAE5B1A5E8A18CE794B2E696B9E59CA8E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BE79A84E4BBBBE4BD95E4B989E58AA1E68896E8B4A3E4BBBBEFBC9BE4B899E696B9E689BFE8AFBAE4B88DE4BBA5E794B2E696B9E79A84E4BBBBE4BD95E8A18CE4B8BAEFBC88E697A0E8AEBAE698AFE590A6E59CA8E4B88AE8BFB0E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BEFBC89E68A97E8BEA9E68896E68AB5E99480E68896E58F8DE7B4A2E4B899E696B9E5B0B1E8A2ABE8BDACE8AEA9E580BAE69D83E5BA94E59091E4B999E696B9E5B1A5E8A18CE5928CE689BFE68B85E79A84E4BBBBE4BD95E5928CE4B880E58887E4B989E58AA1E5928CE8B4A3E4BBBBE38082E5A682E59BA0E6ADA4E7BB99E4B999E696B9E980A0E68890E4BBBBE4BD95E68D9FE5A4B1EFBC8CE794B2E4B899E58F8CE696B9E5BA94E8B49FE8B4A3E5A6A5E59684E8A7A3E586B3E5B9B6E4BA88E4BBA5E8B594E581BFE3803F2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BA94E38081E5A682E58F91E7949FE4BA89E8AEAEEFBC8CE59084E696B9E5908CE6848FE58D8FE59586E8A7A3E586B3EFBC9BE58D8FE59586E4B88DE68890E79A84EFBC8CE59084E696B9E5908CE6848FE59CA8E4B999E696B9E79A84E4BD8FE68980E59CB0E4BABAE6B091E6B395E999A2E68F90E8B5B7E8AF89E8AEBCE3803F2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE585ADE38081E69CACE58D8FE8AEAEE794B1E794B2E4B999E4B899E4B889E696B9E59CA8E7AD96E8B5A2E7BD91E7BB9CE4BFA1E681AFE69C8DE58AA1E5B9B3E58FB0E6B3A8E5868CE79A84E585B7E5A487E7BB8FE58A9EE38081E5A48DE6A0B8E38081E5AEA1E689B9E8818CE883BDE79A84E794B5E5AD90E7ADBEE5908DE588B6E4BD9CE695B0E68DAEE59D87E5AFB9E69CACE4B889E696B9E58D8FE8AEAEE6ADA3E69687E794B5E5AD90E7ADBEE5908DE5908EE7949FE69588E3803F2F7370616E3E3C2F703E3C70207374796C653D2277686974652D73706163653A206E6F726D616C3B223E266E6273703B3C2F703E3C703E3C62722F3E3C2F703E3C703E266E6273703B3C2F703E, '100', null);
INSERT INTO `t_tripartiteagreementtemplate` VALUES ('8d455da5428f418c8900eab0b189a19a', '10000', '6000001b1', '1', '6000001', 'b', '1.00', null, '1', 'admin', '2018-01-22 16:15:20', null, null, '1', 'e', 0x64, '100', 'c');
INSERT INTO `t_tripartiteagreementtemplate` VALUES ('976932004f434176b199865fa9cf2397', '10000', '600000111', '1', '0_100001000013', '1', '1.00', null, '1', 'admin', '2018-01-17 14:48:16', null, null, '1', 'e', 0x3C70207374796C653D22746578742D616C69676E3A2063656E7465723B2077686974652D73706163653A206E6F726D616C3B223E3C7374726F6E673E3C7370616E207374796C653D22666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20323470783B223EE5BA94E694B6E8B4A6E6ACBEE580BAE69D83E8BDACE8AEA9E4B889E696B9E58D8FE8AEAE3C2F7370616E3E3C2F7374726F6E673E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A2031323970783B2077686974652D73706163653A206E6F726D616C3B223E3C7374726F6E673E3C7370616E207374796C653D226C696E652D6865696768743A2033312E3570783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20323170783B223E266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B3C2F7370616E3E3C2F7374726F6E673E3C7374726F6E673E3C7370616E207374796C653D22666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A2031302E3570743B223EE7ADBEE8AEA2E697A5EFBC9A7B7369676E646174657D3C2F7370616E3E3C2F7374726F6E673E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE89E8DE8B584E4BC81E4B89AEFBC9A7B66696E616E63696E67636F6D70616E797D20EFBC88E4B88BE7AE80E7A7B0E794B2E696B9EFBC893C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BD8FE59D80EFBC9A7B66696E616E63696E67636F6D70616E79616464726573737D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6B395E5AE9AE4BBA3E8A1A8E4BABAEFBC88E68896E68E88E69D83E4BBA3E79086E4BABAEFBC89EFBC9A7B66696E616E63696E67636F6D70616E79726570726573656E7461746976657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E266E6273703B3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE89E8DE8B584E68F90E4BE9BE696B9EFBC9A7B62616E6B7D20EFBC88E4B88BE7AE80E7A7B0E4B999E696B9EFBC893C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BD8FE59D80EFBC9A7B62616E6B616464726573737D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6B395E5AE9AE4BBA3E8A1A8E4BABAEFBC88E68896E68E88E69D83E4BBA3E79086E4BABAEFBC89EFBC9A7B62616E6B726570726573656E7461746976657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E266E6273703B3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6A0B8E5BF83E4BC81E4B89AEFBC9A7B636F7265636F6D70616E797D20EFBC88E4B88BE7AE80E7A7B0E4B899E696B9EFBC893C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BD8FE59D80EFBC9A7B636F7265636F6D70616E79616464726573737D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6B395E5AE9AE4BBA3E8A1A8E4BABAEFBC88E68896E68E88E69D83E4BBA3E79086E4BABAEFBC89EFBC9A7B636F7265636F6D70616E79726570726573656E7461746976657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20343270783B206D617267696E2D746F703A20313670783B206D617267696E2D626F74746F6D3A20313370783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE989B4E4BA8EE794B2E4B999E58F8CE696B9E5B7B2E5B0B1E7BC96E58FB7E4B8BA5F5F5F5F5F7B6E756D6265727D5F5F5F5FE79A84E5BA94E694B6E8B4A6E6ACBEE580BAE69D8328E585B7E4BD93E8A781E4B88BE696B9E6B885E58D3FE8BDACE8AEA9E4B8BAE59FBAE7A180E8BEBEE68890E89E8DE8B584E6848FE684BFEFBC8CE78EB0E5B0B1E8AFA5E5BA94E694B6E8B4A6E6ACBEE580BAE69D83E79A84E7A1AEE8AEA4E58F8AE8BDACE8AEA9E9809AE79FA5E4BA8BE5AE9CEFBC8CE794B2E38081E4B999E38081E4B899E4B889E696B9E8BEBEE68890E5A682E4B88BE58D8FE8AEAEEFBC3F2F7370616E3E3C2F703E3C7461626C653E3C74626F64793E3C747220636C6173733D226669727374526F77223E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D2270616464696E673A20307078203770783B20626F726465723A2031707820736F6C696420626C61636B3B20626F726465722D696D6167653A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE59586E58AA1E59088E5908CE58F3F2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE58F91E7A5A8E58F3F2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE58F91E7A5A8E6973F2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BB98E6ACBEE588B0E69C9FE6973F2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE58F91E7A5A8E98791E9A29D28E4BABAE6B091E5B881E58583293C2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE8BDACE8AEA9E98791E9A29DEFBC88E4BABAE6B091E5B881E58583EFBC8928E4B88DE58897E6988EE8A1A8E7A4BAE585A8E9A29DE8BDACE8AE3F3C2F7370616E3E3C2F703E3C2F74643E3C2F74723E3C74723E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D20317078203170783B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C69643B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B3B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B636F6E74726163746E756D6265727D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B696E766F6963656E756D6265727D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B696E766F696365646174657D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B7061796D656E74646174657D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B696E766F6963656D6F6E65797D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B7472616E736665726D6F6E65797D3C2F7370616E3E3C2F74643E3C2F74723E3C2F74626F64793E3C2F7461626C653E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20343270783B206D617267696E2D746F703A20313670783B206D617267696E2D626F74746F6D3A20313370783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E266E6273703B3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4B880E38081E794B2E696B9E5908CE6848FE5B086E4B88AE8BFB0E5BA94E694B6E8B4A6E6ACBEE79A84E580BAE69D83E585A8E983A8E8BDACE8AEA9E7BB99E4B999E696B9EFBC8CE8AFA5E5BA94E694B6E8B4A6E6ACBEE698AFE68C87E794B2E696B9E59FBAE4BA8EE585B6E5928CE4B899E696B9E7ADBEE8AEA2E79A84E4B88AE8BFB0E6B885E58D95E4B8ADE79A84E59586E58AA1E59088E5908CE58F8AE59BA0E6B395E5BE8BE8A784E5AE9AE8808CE88EB7E5BE97E79A84E8A681E6B182E4B899E696B9E4BB98E6ACBEE58F8AE8BF94E8BF98E4B88DE5BD93E5BE97E588A9E58F8AE585B6E5AE83E8B4B9E794A8E79A84E69D83E588A9EFBC8CE58C85E68BACE78EB0E69C89E79A84E98791E992B1E580BAE69D83E58F8AE585B6E4BAA7E7949FE79A84E694B6E79B8AE7AD89EFBC8CE4BD86E4B88DE58C85E68BACE59BA0E7A5A8E68DAEE68896E585B6E4BB96E69C89E4BBB7E8AF81E588B8E8808CE4BAA7E7949FE79A84E4BB98E6ACBEE8AFB7E6B182E69D83E38082E4B899E696B9E58FAAE69C89E68C89E785A7E794B2E4B899E696B9E79A84E59FBAE7A180E4BAA4E69893E59088E5908CE5B9B6E981B5E785A7E4B999E696B9E79A84E4BB98E6ACBEE68C87E7A4BAE59091E4B999E696B9E68C87E5AE9AE79A84E4BBA3E79086E4BABAE4BB98E6ACBEEFBC8CE696B9E58FAFE8A7A3E999A4E585B6E4BB98E6ACBEE8B4A3E4BBBBE3803F2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BA8CE38081E4B899E696B9E7A1AEE8AEA4E4B88AE8BFB0E7BC96E58FB7E79A84E5BA94E694B6E8B4A6E6ACBEE4BFA1E681AFE4B8BAE585B6E79C9FE5AE9EE69C89E69588E79A84E5BA94E4BB98E8B4A6E6ACBEEFBC8CE7A1AEE8AEA4E4B88AE8BFB0E5BA94E694B6E8B4A6E6ACBEE580BAE69D83E8BDACE8AEA9E5AFB9E4B899E696B9E58F91E7949FE9809AE79FA5E69588E58A9BEFBC8CE4B899E696B9E5B086E59091E4B999E696B9E689BFE68B85E5928CE5B1A5E8A18CE4B88AE8BFB0E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BE79A84E580BAE58AA1E3803F2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4B889E38081E794B2E696B9E5908CE6848FE68B85E4BBBBE4B999E696B9E79A84E694B6E6ACBEE4BBA3E79086E4BABAEFBC8CE4B899E696B9E5908CE6848FE5B086E4B88AE8BFB0E5BA94E694B6E8B4A6E6ACBEE5AFB9E5BA94E79A84E5BA94E4BB98E5B890E6ACBEEFBC8CE5A682E69C9FE4BB98E887B3E4B999E696B9E68C87E5AE9AE79A84E5A682E4B88BE4BBA3E79086E4BABAE8B4A6E688B7EFBC88E4BF9DE79086E4B893E688B7EFBC89EFBC9A3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20353670783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE688B7E5908DEFBC9A7B6E616D657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20353670783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE5BC80E688B7E8A18CEFBC9A7B62616E6B6E616D657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20353670783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE8B4A6E58FB7EFBC9A7B62616E6B6163636F756E747D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE59B9BE38081E4B8BAE981BFE5858DE6ADA7E4B989EFBC8CE794B2E4B999E59CA8E6ADA4E7A1AEE8AEA4EFBC9AE794B2E696B9E59CA8E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BE79A84E4BBBBE4BD95E4B989E58AA1E5928CE4BBBBE4BD95E8B4A3E4BBBBE983BDE4B88DE8BDACE8AEA9E7BB99E4B999E696B9E8808CE4BB8DE794B1E794B2E696B9E689BFE68B85EFBC8CE4B999E696B9E6B2A1E69C89E8A681E6B182E68896E689BFE8AFBAE68EA5E58F97E38081E4BBA3E4B8BAE5B1A5E8A18CE794B2E696B9E59CA8E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BE79A84E4BBBBE4BD95E4B989E58AA1E68896E8B4A3E4BBBBEFBC9BE4B899E696B9E689BFE8AFBAE4B88DE4BBA5E794B2E696B9E79A84E4BBBBE4BD95E8A18CE4B8BAEFBC88E697A0E8AEBAE698AFE590A6E59CA8E4B88AE8BFB0E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BEFBC89E68A97E8BEA9E68896E68AB5E99480E68896E58F8DE7B4A2E4B899E696B9E5B0B1E8A2ABE8BDACE8AEA9E580BAE69D83E5BA94E59091E4B999E696B9E5B1A5E8A18CE5928CE689BFE68B85E79A84E4BBBBE4BD95E5928CE4B880E58887E4B989E58AA1E5928CE8B4A3E4BBBBE38082E5A682E59BA0E6ADA4E7BB99E4B999E696B9E980A0E68890E4BBBBE4BD95E68D9FE5A4B1EFBC8CE794B2E4B899E58F8CE696B9E5BA94E8B49FE8B4A3E5A6A5E59684E8A7A3E586B3E5B9B6E4BA88E4BBA5E8B594E581BFE3803F2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BA94E38081E5A682E58F91E7949FE4BA89E8AEAEEFBC8CE59084E696B9E5908CE6848FE58D8FE59586E8A7A3E586B3EFBC9BE58D8FE59586E4B88DE68890E79A84EFBC8CE59084E696B9E5908CE6848FE59CA8E4B999E696B9E79A84E4BD8FE68980E59CB0E4BABAE6B091E6B395E999A2E68F90E8B5B7E8AF89E8AEBCE3803F2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE585ADE38081E69CACE58D8FE8AEAEE794B1E794B2E4B999E4B899E4B889E696B9E59CA8E7AD96E8B5A2E7BD91E7BB9CE4BFA1E681AFE69C8DE58AA1E5B9B3E58FB0E6B3A8E5868CE79A84E585B7E5A487E7BB8FE58A9EE38081E5A48DE6A0B8E38081E5AEA1E689B9E8818CE883BDE79A84E794B5E5AD90E7ADBEE5908DE588B6E4BD9CE695B0E68DAEE59D87E5AFB9E69CACE4B889E696B9E58D8FE8AEAEE6ADA3E69687E794B5E5AD90E7ADBEE5908DE5908EE7949FE69588E3803F2F7370616E3E3C2F703E3C70207374796C653D2277686974652D73706163653A206E6F726D616C3B223E266E6273703B3C2F703E3C703E3C62722F3E3C2F703E3C703E266E6273703B3C2F703E, '100', null);
INSERT INTO `t_tripartiteagreementtemplate` VALUES ('a71aaee89ac84a0c834b32d177f2e627', '10000', '60000011', '1', '6000001', '0_100003000001', '1.00', null, '1', 'admin', '2018-01-22 14:38:05', '系统管理员', '2018-01-22 16:45:34', '9', '新增测试3333332', 0x3C703E5048412B554568424B31564661454A4C4D565A475955564B54453157576B645A56565A4C56455578563164725A467057566C704D566B5656654659785A484A61526E4258566D787754565A72566C5A6C526C6C34576B684B59564A75516C68576258683356465A61636C5A746446644E617A45305632746F52315A58536B6868526D6861596B6453646C7056576D46534D575230556D3177546C5A755158645762475177596A4A4B52314E73566D6C53625868585757746B62314A4757586C6C52305A71596B5A77656C5A48654864574D6B70475930566F57466449516C425A616B5A72556A466B636C647361476C684D58425A56315A6B4D4752724D55646A52576873556D733163565258644746534D5656355456525356303158556B6C585645357A566A4A4B56564A55516D4653525670795758704761324D78634568685254564F596C646F59565A744D48684F526B3134596B5A6B566D4A48556C6C5A61325254566B5A73636C647264466469526E417756465A5351315A58536B646A526D526154555A4B53465A71526D46574D6B35485647314755314A5656586857567A423456573157644652725A465269526E425056465653516D5178576E4A57624535565456566165567046556D46684D44423459306847566D4578536C4E554D567044556B553557567047526D466C616B45315655564E4E575178516D35515644413454444E424B7A77766344343D3C2F703E, '100', '201');
INSERT INTO `t_tripartiteagreementtemplate` VALUES ('ac108fa8f7b2424b85a105214e0bc022', '10000', '60000010_1000030000021', '1', '0_100001000013', '0_100003000002', '1.00', null, '1', 'admin', '2018-01-18 14:19:17', null, null, '1', 'aaaaaaaaaaaaaaaaa', 0x3C70207374796C653D22746578742D616C69676E3A2063656E7465723B2077686974652D73706163653A206E6F726D616C3B223E3C7374726F6E673E3C7370616E207374796C653D22666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20323470783B223EE5BA94E694B6E8B4A6E6ACBEE580BAE69D83E8BDACE8AEA9E4B889E696B9E58D8FE8AEAE3C2F7370616E3E3C2F7374726F6E673E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A2031323970783B2077686974652D73706163653A206E6F726D616C3B223E3C7374726F6E673E3C7370616E207374796C653D226C696E652D6865696768743A2033312E3570783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20323170783B223E266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B3C2F7370616E3E3C2F7374726F6E673E3C7374726F6E673E3C7370616E207374796C653D22666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A2031302E3570743B223EE7ADBEE8AEA2E697A5EFBC9A7B7369676E646174657D3C2F7370616E3E3C2F7374726F6E673E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE89E8DE8B584E4BC81E4B89AEFBC9A7B66696E616E63696E67636F6D70616E797D20EFBC88E4B88BE7AE80E7A7B0E794B2E696B9EFBC893C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BD8FE59D80EFBC9A7B66696E616E63696E67636F6D70616E79616464726573737D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6B395E5AE9AE4BBA3E8A1A8E4BABAEFBC88E68896E68E88E69D83E4BBA3E79086E4BABAEFBC89EFBC9A7B66696E616E63696E67636F6D70616E79726570726573656E7461746976657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E266E6273703B3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE89E8DE8B584E68F90E4BE9BE696B9EFBC9A7B62616E6B7D20EFBC88E4B88BE7AE80E7A7B0E4B999E696B9EFBC893C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BD8FE59D80EFBC9A7B62616E6B616464726573737D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6B395E5AE9AE4BBA3E8A1A8E4BABAEFBC88E68896E68E88E69D83E4BBA3E79086E4BABAEFBC89EFBC9A7B62616E6B726570726573656E7461746976657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E266E6273703B3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6A0B8E5BF83E4BC81E4B89AEFBC9A7B636F7265636F6D70616E797D20EFBC88E4B88BE7AE80E7A7B0E4B899E696B9EFBC893C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BD8FE59D80EFBC9A7B636F7265636F6D70616E79616464726573737D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6B395E5AE9AE4BBA3E8A1A8E4BABAEFBC88E68896E68E88E69D83E4BBA3E79086E4BABAEFBC89EFBC9A7B636F7265636F6D70616E79726570726573656E7461746976657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20343270783B206D617267696E2D746F703A20313670783B206D617267696E2D626F74746F6D3A20313370783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE989B4E4BA8EE794B2E4B999E58F8CE696B9E5B7B2E5B0B1E7BC96E58FB7E4B8BA5F5F5F5F5F7B6E756D6265727D5F5F5F5FE79A84E5BA94E694B6E8B4A6E6ACBEE580BAE69D8328E585B7E4BD93E8A781E4B88BE696B9E6B885E58D3FE8BDACE8AEA9E4B8BAE59FBAE7A180E8BEBEE68890E89E8DE8B584E6848FE684BFEFBC8CE78EB0E5B0B1E8AFA5E5BA94E694B6E8B4A6E6ACBEE580BAE69D83E79A84E7A1AEE8AEA4E58F8AE8BDACE8AEA9E9809AE79FA5E4BA8BE5AE9CEFBC8CE794B2E38081E4B999E38081E4B899E4B889E696B9E8BEBEE68890E5A682E4B88BE58D8FE8AEAEEFBC3F2F7370616E3E3C2F703E3C7461626C653E3C74626F64793E3C747220636C6173733D226669727374526F77223E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D2270616464696E673A20307078203770783B20626F726465723A2031707820736F6C696420626C61636B3B20626F726465722D696D6167653A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE59586E58AA1E59088E5908CE58F3F2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE58F91E7A5A8E58F3F2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE58F91E7A5A8E6973F2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BB98E6ACBEE588B0E69C9FE6973F2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE58F91E7A5A8E98791E9A29D28E4BABAE6B091E5B881E58583293C2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE8BDACE8AEA9E98791E9A29DEFBC88E4BABAE6B091E5B881E58583EFBC8928E4B88DE58897E6988EE8A1A8E7A4BAE585A8E9A29DE8BDACE8AE3F3C2F7370616E3E3C2F703E3C2F74643E3C2F74723E3C74723E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D20317078203170783B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C69643B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B3B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B636F6E74726163746E756D6265727D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B696E766F6963656E756D6265727D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B696E766F696365646174657D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B7061796D656E74646174657D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B696E766F6963656D6F6E65797D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B7472616E736665726D6F6E65797D3C2F7370616E3E3C2F74643E3C2F74723E3C2F74626F64793E3C2F7461626C653E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20343270783B206D617267696E2D746F703A20313670783B206D617267696E2D626F74746F6D3A20313370783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E266E6273703B3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4B880E38081E794B2E696B9E5908CE6848FE5B086E4B88AE8BFB0E5BA94E694B6E8B4A6E6ACBEE79A84E580BAE69D83E585A8E983A8E8BDACE8AEA9E7BB99E4B999E696B9EFBC8CE8AFA5E5BA94E694B6E8B4A6E6ACBEE698AFE68C87E794B2E696B9E59FBAE4BA8EE585B6E5928CE4B899E696B9E7ADBEE8AEA2E79A84E4B88AE8BFB0E6B885E58D95E4B8ADE79A84E59586E58AA1E59088E5908CE58F8AE59BA0E6B395E5BE8BE8A784E5AE9AE8808CE88EB7E5BE97E79A84E8A681E6B182E4B899E696B9E4BB98E6ACBEE58F8AE8BF94E8BF98E4B88DE5BD93E5BE97E588A9E58F8AE585B6E5AE83E8B4B9E794A8E79A84E69D83E588A9EFBC8CE58C85E68BACE78EB0E69C89E79A84E98791E992B1E580BAE69D83E58F8AE585B6E4BAA7E7949FE79A84E694B6E79B8AE7AD89EFBC8CE4BD86E4B88DE58C85E68BACE59BA0E7A5A8E68DAEE68896E585B6E4BB96E69C89E4BBB7E8AF81E588B8E8808CE4BAA7E7949FE79A84E4BB98E6ACBEE8AFB7E6B182E69D83E38082E4B899E696B9E58FAAE69C89E68C89E785A7E794B2E4B899E696B9E79A84E59FBAE7A180E4BAA4E69893E59088E5908CE5B9B6E981B5E785A7E4B999E696B9E79A84E4BB98E6ACBEE68C87E7A4BAE59091E4B999E696B9E68C87E5AE9AE79A84E4BBA3E79086E4BABAE4BB98E6ACBEEFBC8CE696B9E58FAFE8A7A3E999A4E585B6E4BB98E6ACBEE8B4A3E4BBBBE3803F2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BA8CE38081E4B899E696B9E7A1AEE8AEA4E4B88AE8BFB0E7BC96E58FB7E79A84E5BA94E694B6E8B4A6E6ACBEE4BFA1E681AFE4B8BAE585B6E79C9FE5AE9EE69C89E69588E79A84E5BA94E4BB98E8B4A6E6ACBEEFBC8CE7A1AEE8AEA4E4B88AE8BFB0E5BA94E694B6E8B4A6E6ACBEE580BAE69D83E8BDACE8AEA9E5AFB9E4B899E696B9E58F91E7949FE9809AE79FA5E69588E58A9BEFBC8CE4B899E696B9E5B086E59091E4B999E696B9E689BFE68B85E5928CE5B1A5E8A18CE4B88AE8BFB0E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BE79A84E580BAE58AA1E3803F2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4B889E38081E794B2E696B9E5908CE6848FE68B85E4BBBBE4B999E696B9E79A84E694B6E6ACBEE4BBA3E79086E4BABAEFBC8CE4B899E696B9E5908CE6848FE5B086E4B88AE8BFB0E5BA94E694B6E8B4A6E6ACBEE5AFB9E5BA94E79A84E5BA94E4BB98E5B890E6ACBEEFBC8CE5A682E69C9FE4BB98E887B3E4B999E696B9E68C87E5AE9AE79A84E5A682E4B88BE4BBA3E79086E4BABAE8B4A6E688B7EFBC88E4BF9DE79086E4B893E688B7EFBC89EFBC9A3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20353670783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE688B7E5908DEFBC9A7B6E616D657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20353670783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE5BC80E688B7E8A18CEFBC9A7B62616E6B6E616D657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20353670783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE8B4A6E58FB7EFBC9A7B62616E6B6163636F756E747D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE59B9BE38081E4B8BAE981BFE5858DE6ADA7E4B989EFBC8CE794B2E4B999E59CA8E6ADA4E7A1AEE8AEA4EFBC9AE794B2E696B9E59CA8E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BE79A84E4BBBBE4BD95E4B989E58AA1E5928CE4BBBBE4BD95E8B4A3E4BBBBE983BDE4B88DE8BDACE8AEA9E7BB99E4B999E696B9E8808CE4BB8DE794B1E794B2E696B9E689BFE68B85EFBC8CE4B999E696B9E6B2A1E69C89E8A681E6B182E68896E689BFE8AFBAE68EA5E58F97E38081E4BBA3E4B8BAE5B1A5E8A18CE794B2E696B9E59CA8E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BE79A84E4BBBBE4BD95E4B989E58AA1E68896E8B4A3E4BBBBEFBC9BE4B899E696B9E689BFE8AFBAE4B88DE4BBA5E794B2E696B9E79A84E4BBBBE4BD95E8A18CE4B8BAEFBC88E697A0E8AEBAE698AFE590A6E59CA8E4B88AE8BFB0E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BEFBC89E68A97E8BEA9E68896E68AB5E99480E68896E58F8DE7B4A2E4B899E696B9E5B0B1E8A2ABE8BDACE8AEA9E580BAE69D83E5BA94E59091E4B999E696B9E5B1A5E8A18CE5928CE689BFE68B85E79A84E4BBBBE4BD95E5928CE4B880E58887E4B989E58AA1E5928CE8B4A3E4BBBBE38082E5A682E59BA0E6ADA4E7BB99E4B999E696B9E980A0E68890E4BBBBE4BD95E68D9FE5A4B1EFBC8CE794B2E4B899E58F8CE696B9E5BA94E8B49FE8B4A3E5A6A5E59684E8A7A3E586B3E5B9B6E4BA88E4BBA5E8B594E581BFE3803F2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BA94E38081E5A682E58F91E7949FE4BA89E8AEAEEFBC8CE59084E696B9E5908CE6848FE58D8FE59586E8A7A3E586B3EFBC9BE58D8FE59586E4B88DE68890E79A84EFBC8CE59084E696B9E5908CE6848FE59CA8E4B999E696B9E79A84E4BD8FE68980E59CB0E4BABAE6B091E6B395E999A2E68F90E8B5B7E8AF89E8AEBCE3803F2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE585ADE38081E69CACE58D8FE8AEAEE794B1E794B2E4B999E4B899E4B889E696B9E59CA8E7AD96E8B5A2E7BD91E7BB9CE4BFA1E681AFE69C8DE58AA1E5B9B3E58FB0E6B3A8E5868CE79A84E585B7E5A487E7BB8FE58A9EE38081E5A48DE6A0B8E38081E5AEA1E689B9E8818CE883BDE79A84E794B5E5AD90E7ADBEE5908DE588B6E4BD9CE695B0E68DAEE59D87E5AFB9E69CACE4B889E696B9E58D8FE8AEAEE6ADA3E69687E794B5E5AD90E7ADBEE5908DE5908EE7949FE69588E3803F2F7370616E3E3C2F703E3C70207374796C653D2277686974652D73706163653A206E6F726D616C3B223E266E6273703B3C2F703E3C703E3C62722F3E3C2F703E3C703E266E6273703B3C2F703E, '100', null);
INSERT INTO `t_tripartiteagreementtemplate` VALUES ('d588201ce0dd40cda2a23a331cd7b269', '10000', '60000010_1000030000021', '1', '0_100001000013', '0_100003000002', '1.00', null, '1', 'admin', '2018-01-18 13:44:47', null, null, '1', 'aaaaaaaaaaa', 0x3C70207374796C653D22746578742D616C69676E3A2063656E7465723B2077686974652D73706163653A206E6F726D616C3B223E3C7374726F6E673E3C7370616E207374796C653D22666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20323470783B223EE5BA94E694B6E8B4A6E6ACBEE580BAE69D83E8BDACE8AEA9E4B889E696B9E58D8FE8AEAE3C2F7370616E3E3C2F7374726F6E673E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A2031323970783B2077686974652D73706163653A206E6F726D616C3B223E3C7374726F6E673E3C7370616E207374796C653D226C696E652D6865696768743A2033312E3570783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20323170783B223E266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B3C2F7370616E3E3C2F7374726F6E673E3C7374726F6E673E3C7370616E207374796C653D22666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A2031302E3570743B223EE7ADBEE8AEA2E697A5EFBC9A7B7369676E646174657D3C2F7370616E3E3C2F7374726F6E673E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE89E8DE8B584E4BC81E4B89AEFBC9A7B66696E616E63696E67636F6D70616E797D20EFBC88E4B88BE7AE80E7A7B0E794B2E696B9EFBC893C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BD8FE59D80EFBC9A7B66696E616E63696E67636F6D70616E79616464726573737D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6B395E5AE9AE4BBA3E8A1A8E4BABAEFBC88E68896E68E88E69D83E4BBA3E79086E4BABAEFBC89EFBC9A7B66696E616E63696E67636F6D70616E79726570726573656E7461746976657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E266E6273703B3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE89E8DE8B584E68F90E4BE9BE696B9EFBC9A7B62616E6B7D20EFBC88E4B88BE7AE80E7A7B0E4B999E696B9EFBC893C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BD8FE59D80EFBC9A7B62616E6B616464726573737D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6B395E5AE9AE4BBA3E8A1A8E4BABAEFBC88E68896E68E88E69D83E4BBA3E79086E4BABAEFBC89EFBC9A7B62616E6B726570726573656E7461746976657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E266E6273703B3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6A0B8E5BF83E4BC81E4B89AEFBC9A7B636F7265636F6D70616E797D20EFBC88E4B88BE7AE80E7A7B0E4B899E696B9EFBC893C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BD8FE59D80EFBC9A7B636F7265636F6D70616E79616464726573737D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6B395E5AE9AE4BBA3E8A1A8E4BABAEFBC88E68896E68E88E69D83E4BBA3E79086E4BABAEFBC89EFBC9A7B636F7265636F6D70616E79726570726573656E7461746976657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20343270783B206D617267696E2D746F703A20313670783B206D617267696E2D626F74746F6D3A20313370783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE989B4E4BA8EE794B2E4B999E58F8CE696B9E5B7B2E5B0B1E7BC96E58FB7E4B8BA5F5F5F5F5F7B6E756D6265727D5F5F5F5FE79A84E5BA94E694B6E8B4A6E6ACBEE580BAE69D8328E585B7E4BD93E8A781E4B88BE696B9E6B885E58D3FE8BDACE8AEA9E4B8BAE59FBAE7A180E8BEBEE68890E89E8DE8B584E6848FE684BFEFBC8CE78EB0E5B0B1E8AFA5E5BA94E694B6E8B4A6E6ACBEE580BAE69D83E79A84E7A1AEE8AEA4E58F8AE8BDACE8AEA9E9809AE79FA5E4BA8BE5AE9CEFBC8CE794B2E38081E4B999E38081E4B899E4B889E696B9E8BEBEE68890E5A682E4B88BE58D8FE8AEAEEFBC3F2F7370616E3E3C2F703E3C7461626C653E3C74626F64793E3C747220636C6173733D226669727374526F77223E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D2270616464696E673A20307078203770783B20626F726465723A2031707820736F6C696420626C61636B3B20626F726465722D696D6167653A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE59586E58AA1E59088E5908CE58F3F2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE58F91E7A5A8E58F3F2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE58F91E7A5A8E6973F2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BB98E6ACBEE588B0E69C9FE6973F2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE58F91E7A5A8E98791E9A29D28E4BABAE6B091E5B881E58583293C2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE8BDACE8AEA9E98791E9A29DEFBC88E4BABAE6B091E5B881E58583EFBC8928E4B88DE58897E6988EE8A1A8E7A4BAE585A8E9A29DE8BDACE8AE3F3C2F7370616E3E3C2F703E3C2F74643E3C2F74723E3C74723E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D20317078203170783B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C69643B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B3B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B636F6E74726163746E756D6265727D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B696E766F6963656E756D6265727D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B696E766F696365646174657D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B7061796D656E74646174657D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B696E766F6963656D6F6E65797D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B7472616E736665726D6F6E65797D3C2F7370616E3E3C2F74643E3C2F74723E3C2F74626F64793E3C2F7461626C653E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20343270783B206D617267696E2D746F703A20313670783B206D617267696E2D626F74746F6D3A20313370783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E266E6273703B3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4B880E38081E794B2E696B9E5908CE6848FE5B086E4B88AE8BFB0E5BA94E694B6E8B4A6E6ACBEE79A84E580BAE69D83E585A8E983A8E8BDACE8AEA9E7BB99E4B999E696B9EFBC8CE8AFA5E5BA94E694B6E8B4A6E6ACBEE698AFE68C87E794B2E696B9E59FBAE4BA8EE585B6E5928CE4B899E696B9E7ADBEE8AEA2E79A84E4B88AE8BFB0E6B885E58D95E4B8ADE79A84E59586E58AA1E59088E5908CE58F8AE59BA0E6B395E5BE8BE8A784E5AE9AE8808CE88EB7E5BE97E79A84E8A681E6B182E4B899E696B9E4BB98E6ACBEE58F8AE8BF94E8BF98E4B88DE5BD93E5BE97E588A9E58F8AE585B6E5AE83E8B4B9E794A8E79A84E69D83E588A9EFBC8CE58C85E68BACE78EB0E69C89E79A84E98791E992B1E580BAE69D83E58F8AE585B6E4BAA7E7949FE79A84E694B6E79B8AE7AD89EFBC8CE4BD86E4B88DE58C85E68BACE59BA0E7A5A8E68DAEE68896E585B6E4BB96E69C89E4BBB7E8AF81E588B8E8808CE4BAA7E7949FE79A84E4BB98E6ACBEE8AFB7E6B182E69D83E38082E4B899E696B9E58FAAE69C89E68C89E785A7E794B2E4B899E696B9E79A84E59FBAE7A180E4BAA4E69893E59088E5908CE5B9B6E981B5E785A7E4B999E696B9E79A84E4BB98E6ACBEE68C87E7A4BAE59091E4B999E696B9E68C87E5AE9AE79A84E4BBA3E79086E4BABAE4BB98E6ACBEEFBC8CE696B9E58FAFE8A7A3E999A4E585B6E4BB98E6ACBEE8B4A3E4BBBBE3803F2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BA8CE38081E4B899E696B9E7A1AEE8AEA4E4B88AE8BFB0E7BC96E58FB7E79A84E5BA94E694B6E8B4A6E6ACBEE4BFA1E681AFE4B8BAE585B6E79C9FE5AE9EE69C89E69588E79A84E5BA94E4BB98E8B4A6E6ACBEEFBC8CE7A1AEE8AEA4E4B88AE8BFB0E5BA94E694B6E8B4A6E6ACBEE580BAE69D83E8BDACE8AEA9E5AFB9E4B899E696B9E58F91E7949FE9809AE79FA5E69588E58A9BEFBC8CE4B899E696B9E5B086E59091E4B999E696B9E689BFE68B85E5928CE5B1A5E8A18CE4B88AE8BFB0E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BE79A84E580BAE58AA1E3803F2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4B889E38081E794B2E696B9E5908CE6848FE68B85E4BBBBE4B999E696B9E79A84E694B6E6ACBEE4BBA3E79086E4BABAEFBC8CE4B899E696B9E5908CE6848FE5B086E4B88AE8BFB0E5BA94E694B6E8B4A6E6ACBEE5AFB9E5BA94E79A84E5BA94E4BB98E5B890E6ACBEEFBC8CE5A682E69C9FE4BB98E887B3E4B999E696B9E68C87E5AE9AE79A84E5A682E4B88BE4BBA3E79086E4BABAE8B4A6E688B7EFBC88E4BF9DE79086E4B893E688B7EFBC89EFBC9A3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20353670783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE688B7E5908DEFBC9A7B6E616D657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20353670783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE5BC80E688B7E8A18CEFBC9A7B62616E6B6E616D657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20353670783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE8B4A6E58FB7EFBC9A7B62616E6B6163636F756E747D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE59B9BE38081E4B8BAE981BFE5858DE6ADA7E4B989EFBC8CE794B2E4B999E59CA8E6ADA4E7A1AEE8AEA4EFBC9AE794B2E696B9E59CA8E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BE79A84E4BBBBE4BD95E4B989E58AA1E5928CE4BBBBE4BD95E8B4A3E4BBBBE983BDE4B88DE8BDACE8AEA9E7BB99E4B999E696B9E8808CE4BB8DE794B1E794B2E696B9E689BFE68B85EFBC8CE4B999E696B9E6B2A1E69C89E8A681E6B182E68896E689BFE8AFBAE68EA5E58F97E38081E4BBA3E4B8BAE5B1A5E8A18CE794B2E696B9E59CA8E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BE79A84E4BBBBE4BD95E4B989E58AA1E68896E8B4A3E4BBBBEFBC9BE4B899E696B9E689BFE8AFBAE4B88DE4BBA5E794B2E696B9E79A84E4BBBBE4BD95E8A18CE4B8BAEFBC88E697A0E8AEBAE698AFE590A6E59CA8E4B88AE8BFB0E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BEFBC89E68A97E8BEA9E68896E68AB5E99480E68896E58F8DE7B4A2E4B899E696B9E5B0B1E8A2ABE8BDACE8AEA9E580BAE69D83E5BA94E59091E4B999E696B9E5B1A5E8A18CE5928CE689BFE68B85E79A84E4BBBBE4BD95E5928CE4B880E58887E4B989E58AA1E5928CE8B4A3E4BBBBE38082E5A682E59BA0E6ADA4E7BB99E4B999E696B9E980A0E68890E4BBBBE4BD95E68D9FE5A4B1EFBC8CE794B2E4B899E58F8CE696B9E5BA94E8B49FE8B4A3E5A6A5E59684E8A7A3E586B3E5B9B6E4BA88E4BBA5E8B594E581BFE3803F2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BA94E38081E5A682E58F91E7949FE4BA89E8AEAEEFBC8CE59084E696B9E5908CE6848FE58D8FE59586E8A7A3E586B3EFBC9BE58D8FE59586E4B88DE68890E79A84EFBC8CE59084E696B9E5908CE6848FE59CA8E4B999E696B9E79A84E4BD8FE68980E59CB0E4BABAE6B091E6B395E999A2E68F90E8B5B7E8AF89E8AEBCE3803F2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE585ADE38081E69CACE58D8FE8AEAEE794B1E794B2E4B999E4B899E4B889E696B9E59CA8E7AD96E8B5A2E7BD91E7BB9CE4BFA1E681AFE69C8DE58AA1E5B9B3E58FB0E6B3A8E5868CE79A84E585B7E5A487E7BB8FE58A9EE38081E5A48DE6A0B8E38081E5AEA1E689B9E8818CE883BDE79A84E794B5E5AD90E7ADBEE5908DE588B6E4BD9CE695B0E68DAEE59D87E5AFB9E69CACE4B889E696B9E58D8FE8AEAEE6ADA3E69687E794B5E5AD90E7ADBEE5908DE5908EE7949FE69588E3803F2F7370616E3E3C2F703E3C70207374796C653D2277686974652D73706163653A206E6F726D616C3B223E266E6273703B3C2F703E3C703E3C62722F3E3C2F703E3C703E266E6273703B3C2F703E, '100', null);
INSERT INTO `t_tripartiteagreementtemplate` VALUES ('f0946a7b6aca4f0a9d80246b580a0634', '10000', '600000111', '1', '0_100001000013', '1', '1.00', null, '1', 'admin', '2018-01-17 17:22:00', null, null, '1', 'e', 0x3C70207374796C653D22746578742D616C69676E3A2063656E7465723B2077686974652D73706163653A206E6F726D616C3B223E3C7374726F6E673E3C7370616E207374796C653D22666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20323470783B223EE5BA94E694B6E8B4A6E6ACBEE580BAE69D83E8BDACE8AEA9E4B889E696B9E58D8FE8AEAE3C2F7370616E3E3C2F7374726F6E673E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A2031323970783B2077686974652D73706163653A206E6F726D616C3B223E3C7374726F6E673E3C7370616E207374796C653D226C696E652D6865696768743A2033312E3570783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20323170783B223E266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B3C2F7370616E3E3C2F7374726F6E673E3C7374726F6E673E3C7370616E207374796C653D22666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A2031302E3570743B223EE7ADBEE8AEA2E697A5EFBC9A7B7369676E646174657D3C2F7370616E3E3C2F7374726F6E673E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE89E8DE8B584E4BC81E4B89AEFBC9A7B66696E616E63696E67636F6D70616E797D20EFBC88E4B88BE7AE80E7A7B0E794B2E696B9EFBC893C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BD8FE59D80EFBC9A7B66696E616E63696E67636F6D70616E79616464726573737D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6B395E5AE9AE4BBA3E8A1A8E4BABAEFBC88E68896E68E88E69D83E4BBA3E79086E4BABAEFBC89EFBC9A7B66696E616E63696E67636F6D70616E79726570726573656E7461746976657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E266E6273703B3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE89E8DE8B584E68F90E4BE9BE696B9EFBC9A7B62616E6B7D20EFBC88E4B88BE7AE80E7A7B0E4B999E696B9EFBC893C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BD8FE59D80EFBC9A7B62616E6B616464726573737D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6B395E5AE9AE4BBA3E8A1A8E4BABAEFBC88E68896E68E88E69D83E4BBA3E79086E4BABAEFBC89EFBC9A7B62616E6B726570726573656E7461746976657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E266E6273703B3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6A0B8E5BF83E4BC81E4B89AEFBC9A7B636F7265636F6D70616E797D20EFBC88E4B88BE7AE80E7A7B0E4B899E696B9EFBC893C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BD8FE59D80EFBC9A7B636F7265636F6D70616E79616464726573737D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6B395E5AE9AE4BBA3E8A1A8E4BABAEFBC88E68896E68E88E69D83E4BBA3E79086E4BABAEFBC89EFBC9A7B636F7265636F6D70616E79726570726573656E7461746976657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20343270783B206D617267696E2D746F703A20313670783B206D617267696E2D626F74746F6D3A20313370783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE989B4E4BA8EE794B2E4B999E58F8CE696B9E5B7B2E5B0B1E7BC96E58FB7E4B8BA5F5F5F5F5F7B6E756D6265727D5F5F5F5FE79A84E5BA94E694B6E8B4A6E6ACBEE580BAE69D8328E585B7E4BD93E8A781E4B88BE696B9E6B885E58D3FE8BDACE8AEA9E4B8BAE59FBAE7A180E8BEBEE68890E89E8DE8B584E6848FE684BFEFBC8CE78EB0E5B0B1E8AFA5E5BA94E694B6E8B4A6E6ACBEE580BAE69D83E79A84E7A1AEE8AEA4E58F8AE8BDACE8AEA9E9809AE79FA5E4BA8BE5AE9CEFBC8CE794B2E38081E4B999E38081E4B899E4B889E696B9E8BEBEE68890E5A682E4B88BE58D8FE8AEAEEFBC3F2F7370616E3E3C2F703E3C7461626C653E3C74626F64793E3C747220636C6173733D226669727374526F77223E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D2270616464696E673A20307078203770783B20626F726465723A2031707820736F6C696420626C61636B3B20626F726465722D696D6167653A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE59586E58AA1E59088E5908CE58F3F2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE58F91E7A5A8E58F3F2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE58F91E7A5A8E6973F2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BB98E6ACBEE588B0E69C9FE6973F2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE58F91E7A5A8E98791E9A29D28E4BABAE6B091E5B881E58583293C2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE8BDACE8AEA9E98791E9A29DEFBC88E4BABAE6B091E5B881E58583EFBC8928E4B88DE58897E6988EE8A1A8E7A4BAE585A8E9A29DE8BDACE8AE3F3C2F7370616E3E3C2F703E3C2F74643E3C2F74723E3C74723E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D20317078203170783B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C69643B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B3B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B636F6E74726163746E756D6265727D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B696E766F6963656E756D6265727D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B696E766F696365646174657D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B7061796D656E74646174657D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B696E766F6963656D6F6E65797D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B7472616E736665726D6F6E65797D3C2F7370616E3E3C2F74643E3C2F74723E3C2F74626F64793E3C2F7461626C653E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20343270783B206D617267696E2D746F703A20313670783B206D617267696E2D626F74746F6D3A20313370783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E266E6273703B3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4B880E38081E794B2E696B9E5908CE6848FE5B086E4B88AE8BFB0E5BA94E694B6E8B4A6E6ACBEE79A84E580BAE69D83E585A8E983A8E8BDACE8AEA9E7BB99E4B999E696B9EFBC8CE8AFA5E5BA94E694B6E8B4A6E6ACBEE698AFE68C87E794B2E696B9E59FBAE4BA8EE585B6E5928CE4B899E696B9E7ADBEE8AEA2E79A84E4B88AE8BFB0E6B885E58D95E4B8ADE79A84E59586E58AA1E59088E5908CE58F8AE59BA0E6B395E5BE8BE8A784E5AE9AE8808CE88EB7E5BE97E79A84E8A681E6B182E4B899E696B9E4BB98E6ACBEE58F8AE8BF94E8BF98E4B88DE5BD93E5BE97E588A9E58F8AE585B6E5AE83E8B4B9E794A8E79A84E69D83E588A9EFBC8CE58C85E68BACE78EB0E69C89E79A84E98791E992B1E580BAE69D83E58F8AE585B6E4BAA7E7949FE79A84E694B6E79B8AE7AD89EFBC8CE4BD86E4B88DE58C85E68BACE59BA0E7A5A8E68DAEE68896E585B6E4BB96E69C89E4BBB7E8AF81E588B8E8808CE4BAA7E7949FE79A84E4BB98E6ACBEE8AFB7E6B182E69D83E38082E4B899E696B9E58FAAE69C89E68C89E785A7E794B2E4B899E696B9E79A84E59FBAE7A180E4BAA4E69893E59088E5908CE5B9B6E981B5E785A7E4B999E696B9E79A84E4BB98E6ACBEE68C87E7A4BAE59091E4B999E696B9E68C87E5AE9AE79A84E4BBA3E79086E4BABAE4BB98E6ACBEEFBC8CE696B9E58FAFE8A7A3E999A4E585B6E4BB98E6ACBEE8B4A3E4BBBBE3803F2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BA8CE38081E4B899E696B9E7A1AEE8AEA4E4B88AE8BFB0E7BC96E58FB7E79A84E5BA94E694B6E8B4A6E6ACBEE4BFA1E681AFE4B8BAE585B6E79C9FE5AE9EE69C89E69588E79A84E5BA94E4BB98E8B4A6E6ACBEEFBC8CE7A1AEE8AEA4E4B88AE8BFB0E5BA94E694B6E8B4A6E6ACBEE580BAE69D83E8BDACE8AEA9E5AFB9E4B899E696B9E58F91E7949FE9809AE79FA5E69588E58A9BEFBC8CE4B899E696B9E5B086E59091E4B999E696B9E689BFE68B85E5928CE5B1A5E8A18CE4B88AE8BFB0E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BE79A84E580BAE58AA1E3803F2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4B889E38081E794B2E696B9E5908CE6848FE68B85E4BBBBE4B999E696B9E79A84E694B6E6ACBEE4BBA3E79086E4BABAEFBC8CE4B899E696B9E5908CE6848FE5B086E4B88AE8BFB0E5BA94E694B6E8B4A6E6ACBEE5AFB9E5BA94E79A84E5BA94E4BB98E5B890E6ACBEEFBC8CE5A682E69C9FE4BB98E887B3E4B999E696B9E68C87E5AE9AE79A84E5A682E4B88BE4BBA3E79086E4BABAE8B4A6E688B7EFBC88E4BF9DE79086E4B893E688B7EFBC89EFBC9A3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20353670783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE688B7E5908DEFBC9A7B6E616D657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20353670783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE5BC80E688B7E8A18CEFBC9A7B62616E6B6E616D657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20353670783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE8B4A6E58FB7EFBC9A7B62616E6B6163636F756E747D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE59B9BE38081E4B8BAE981BFE5858DE6ADA7E4B989EFBC8CE794B2E4B999E59CA8E6ADA4E7A1AEE8AEA4EFBC9AE794B2E696B9E59CA8E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BE79A84E4BBBBE4BD95E4B989E58AA1E5928CE4BBBBE4BD95E8B4A3E4BBBBE983BDE4B88DE8BDACE8AEA9E7BB99E4B999E696B9E8808CE4BB8DE794B1E794B2E696B9E689BFE68B85EFBC8CE4B999E696B9E6B2A1E69C89E8A681E6B182E68896E689BFE8AFBAE68EA5E58F97E38081E4BBA3E4B8BAE5B1A5E8A18CE794B2E696B9E59CA8E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BE79A84E4BBBBE4BD95E4B989E58AA1E68896E8B4A3E4BBBBEFBC9BE4B899E696B9E689BFE8AFBAE4B88DE4BBA5E794B2E696B9E79A84E4BBBBE4BD95E8A18CE4B8BAEFBC88E697A0E8AEBAE698AFE590A6E59CA8E4B88AE8BFB0E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BEFBC89E68A97E8BEA9E68896E68AB5E99480E68896E58F8DE7B4A2E4B899E696B9E5B0B1E8A2ABE8BDACE8AEA9E580BAE69D83E5BA94E59091E4B999E696B9E5B1A5E8A18CE5928CE689BFE68B85E79A84E4BBBBE4BD95E5928CE4B880E58887E4B989E58AA1E5928CE8B4A3E4BBBBE38082E5A682E59BA0E6ADA4E7BB99E4B999E696B9E980A0E68890E4BBBBE4BD95E68D9FE5A4B1EFBC8CE794B2E4B899E58F8CE696B9E5BA94E8B49FE8B4A3E5A6A5E59684E8A7A3E586B3E5B9B6E4BA88E4BBA5E8B594E581BFE3803F2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BA94E38081E5A682E58F91E7949FE4BA89E8AEAEEFBC8CE59084E696B9E5908CE6848FE58D8FE59586E8A7A3E586B3EFBC9BE58D8FE59586E4B88DE68890E79A84EFBC8CE59084E696B9E5908CE6848FE59CA8E4B999E696B9E79A84E4BD8FE68980E59CB0E4BABAE6B091E6B395E999A2E68F90E8B5B7E8AF89E8AEBCE3803F2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE585ADE38081E69CACE58D8FE8AEAEE794B1E794B2E4B999E4B899E4B889E696B9E59CA8E7AD96E8B5A2E7BD91E7BB9CE4BFA1E681AFE69C8DE58AA1E5B9B3E58FB0E6B3A8E5868CE79A84E585B7E5A487E7BB8FE58A9EE38081E5A48DE6A0B8E38081E5AEA1E689B9E8818CE883BDE79A84E794B5E5AD90E7ADBEE5908DE588B6E4BD9CE695B0E68DAEE59D87E5AFB9E69CACE4B889E696B9E58D8FE8AEAEE6ADA3E69687E794B5E5AD90E7ADBEE5908DE5908EE7949FE69588E3803F2F7370616E3E3C2F703E3C70207374796C653D2277686974652D73706163653A206E6F726D616C3B223E266E6273703B3C2F703E3C703E3C62722F3E3C2F703E3C703E266E6273703B3C2F703E, '100', null);
INSERT INTO `t_tripartiteagreementtemplate` VALUES ('ff65b5b63ddb4930b1bc50ea37776ac6', '10000', '600000111', '1', '0_100001000013', '1', '1.00', null, '1', 'admin', '2018-01-17 17:28:34', null, null, '1', 'e', 0x3C70207374796C653D22746578742D616C69676E3A2063656E7465723B2077686974652D73706163653A206E6F726D616C3B223E3C7374726F6E673E3C7370616E207374796C653D22666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20323470783B223EE5BA94E694B6E8B4A6E6ACBEE580BAE69D83E8BDACE8AEA9E4B889E696B9E58D8FE8AEAE3C2F7370616E3E3C2F7374726F6E673E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A2031323970783B2077686974652D73706163653A206E6F726D616C3B223E3C7374726F6E673E3C7370616E207374796C653D226C696E652D6865696768743A2033312E3570783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20323170783B223E266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B3C2F7370616E3E3C2F7374726F6E673E3C7374726F6E673E3C7370616E207374796C653D22666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A2031302E3570743B223EE7ADBEE8AEA2E697A5EFBC9A7B7369676E646174657D3C2F7370616E3E3C2F7374726F6E673E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE89E8DE8B584E4BC81E4B89AEFBC9A7B66696E616E63696E67636F6D70616E797D20EFBC88E4B88BE7AE80E7A7B0E794B2E696B9EFBC893C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BD8FE59D80EFBC9A7B66696E616E63696E67636F6D70616E79616464726573737D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6B395E5AE9AE4BBA3E8A1A8E4BABAEFBC88E68896E68E88E69D83E4BBA3E79086E4BABAEFBC89EFBC9A7B66696E616E63696E67636F6D70616E79726570726573656E7461746976657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E266E6273703B3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE89E8DE8B584E68F90E4BE9BE696B9EFBC9A7B62616E6B7D20EFBC88E4B88BE7AE80E7A7B0E4B999E696B9EFBC893C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BD8FE59D80EFBC9A7B62616E6B616464726573737D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6B395E5AE9AE4BBA3E8A1A8E4BABAEFBC88E68896E68E88E69D83E4BBA3E79086E4BABAEFBC89EFBC9A7B62616E6B726570726573656E7461746976657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E266E6273703B3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6A0B8E5BF83E4BC81E4B89AEFBC9A7B636F7265636F6D70616E797D20EFBC88E4B88BE7AE80E7A7B0E4B899E696B9EFBC893C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BD8FE59D80EFBC9A7B636F7265636F6D70616E79616464726573737D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE6B395E5AE9AE4BBA3E8A1A8E4BABAEFBC88E68896E68E88E69D83E4BBA3E79086E4BABAEFBC89EFBC9A7B636F7265636F6D70616E79726570726573656E7461746976657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20343270783B206D617267696E2D746F703A20313670783B206D617267696E2D626F74746F6D3A20313370783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE989B4E4BA8EE794B2E4B999E58F8CE696B9E5B7B2E5B0B1E7BC96E58FB7E4B8BA5F5F5F5F5F7B6E756D6265727D5F5F5F5FE79A84E5BA94E694B6E8B4A6E6ACBEE580BAE69D8328E585B7E4BD93E8A781E4B88BE696B9E6B885E58D3FE8BDACE8AEA9E4B8BAE59FBAE7A180E8BEBEE68890E89E8DE8B584E6848FE684BFEFBC8CE78EB0E5B0B1E8AFA5E5BA94E694B6E8B4A6E6ACBEE580BAE69D83E79A84E7A1AEE8AEA4E58F8AE8BDACE8AEA9E9809AE79FA5E4BA8BE5AE9CEFBC8CE794B2E38081E4B999E38081E4B899E4B889E696B9E8BEBEE68890E5A682E4B88BE58D8FE8AEAEEFBC3F2F7370616E3E3C2F703E3C7461626C653E3C74626F64793E3C747220636C6173733D226669727374526F77223E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D2270616464696E673A20307078203770783B20626F726465723A2031707820736F6C696420626C61636B3B20626F726465722D696D6167653A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE59586E58AA1E59088E5908CE58F3F2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE58F91E7A5A8E58F3F2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE58F91E7A5A8E6973F2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BB98E6ACBEE588B0E69C9FE6973F2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE58F91E7A5A8E98791E9A29D28E4BABAE6B091E5B881E58583293C2F7370616E3E3C2F703E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A203170782031707820317078206D656469756D3B20626F726465722D7374796C653A20736F6C696420736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A20626C61636B20626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C70207374796C653D226D617267696E3A20313670782030707820313370783B206C696E652D6865696768743A20313530253B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE8BDACE8AEA9E98791E9A29DEFBC88E4BABAE6B091E5B881E58583EFBC8928E4B88DE58897E6988EE8A1A8E7A4BAE585A8E9A29DE8BDACE8AE3F3C2F7370616E3E3C2F703E3C2F74643E3C2F74723E3C74723E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D20317078203170783B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C69643B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B3B2070616464696E673A20307078203770783B20626F726465722D696D6167653A206E6F6E653B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D746F702D636F6C6F72733A206E6F6E653B202D6D6F7A2D626F726465722D626F74746F6D2D636F6C6F72733A206E6F6E653B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B636F6E74726163746E756D6265727D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B696E766F6963656E756D6265727D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B696E766F696365646174657D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B7061796D656E74646174657D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B696E766F6963656D6F6E65797D3C2F7370616E3E3C2F74643E3C74642077696474683D223935222076616C69676E3D22746F7022207374796C653D22626F726465722D77696474683A206D656469756D2031707820317078206D656469756D3B20626F726465722D7374796C653A206E6F6E6520736F6C696420736F6C6964206E6F6E653B20626F726465722D636F6C6F723A2063757272656E74436F6C6F7220626C61636B20626C61636B2063757272656E74436F6C6F723B2070616464696E673A20307078203770783B202D6D732D776F72642D627265616B3A20627265616B2D616C6C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313530253B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E7B7472616E736665726D6F6E65797D3C2F7370616E3E3C2F74643E3C2F74723E3C2F74626F64793E3C2F7461626C653E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20343270783B206D617267696E2D746F703A20313670783B206D617267696E2D626F74746F6D3A20313370783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223E266E6273703B3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4B880E38081E794B2E696B9E5908CE6848FE5B086E4B88AE8BFB0E5BA94E694B6E8B4A6E6ACBEE79A84E580BAE69D83E585A8E983A8E8BDACE8AEA9E7BB99E4B999E696B9EFBC8CE8AFA5E5BA94E694B6E8B4A6E6ACBEE698AFE68C87E794B2E696B9E59FBAE4BA8EE585B6E5928CE4B899E696B9E7ADBEE8AEA2E79A84E4B88AE8BFB0E6B885E58D95E4B8ADE79A84E59586E58AA1E59088E5908CE58F8AE59BA0E6B395E5BE8BE8A784E5AE9AE8808CE88EB7E5BE97E79A84E8A681E6B182E4B899E696B9E4BB98E6ACBEE58F8AE8BF94E8BF98E4B88DE5BD93E5BE97E588A9E58F8AE585B6E5AE83E8B4B9E794A8E79A84E69D83E588A9EFBC8CE58C85E68BACE78EB0E69C89E79A84E98791E992B1E580BAE69D83E58F8AE585B6E4BAA7E7949FE79A84E694B6E79B8AE7AD89EFBC8CE4BD86E4B88DE58C85E68BACE59BA0E7A5A8E68DAEE68896E585B6E4BB96E69C89E4BBB7E8AF81E588B8E8808CE4BAA7E7949FE79A84E4BB98E6ACBEE8AFB7E6B182E69D83E38082E4B899E696B9E58FAAE69C89E68C89E785A7E794B2E4B899E696B9E79A84E59FBAE7A180E4BAA4E69893E59088E5908CE5B9B6E981B5E785A7E4B999E696B9E79A84E4BB98E6ACBEE68C87E7A4BAE59091E4B999E696B9E68C87E5AE9AE79A84E4BBA3E79086E4BABAE4BB98E6ACBEEFBC8CE696B9E58FAFE8A7A3E999A4E585B6E4BB98E6ACBEE8B4A3E4BBBBE3803F2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BA8CE38081E4B899E696B9E7A1AEE8AEA4E4B88AE8BFB0E7BC96E58FB7E79A84E5BA94E694B6E8B4A6E6ACBEE4BFA1E681AFE4B8BAE585B6E79C9FE5AE9EE69C89E69588E79A84E5BA94E4BB98E8B4A6E6ACBEEFBC8CE7A1AEE8AEA4E4B88AE8BFB0E5BA94E694B6E8B4A6E6ACBEE580BAE69D83E8BDACE8AEA9E5AFB9E4B899E696B9E58F91E7949FE9809AE79FA5E69588E58A9BEFBC8CE4B899E696B9E5B086E59091E4B999E696B9E689BFE68B85E5928CE5B1A5E8A18CE4B88AE8BFB0E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BE79A84E580BAE58AA1E3803F2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4B889E38081E794B2E696B9E5908CE6848FE68B85E4BBBBE4B999E696B9E79A84E694B6E6ACBEE4BBA3E79086E4BABAEFBC8CE4B899E696B9E5908CE6848FE5B086E4B88AE8BFB0E5BA94E694B6E8B4A6E6ACBEE5AFB9E5BA94E79A84E5BA94E4BB98E5B890E6ACBEEFBC8CE5A682E69C9FE4BB98E887B3E4B999E696B9E68C87E5AE9AE79A84E5A682E4B88BE4BBA3E79086E4BABAE8B4A6E688B7EFBC88E4BF9DE79086E4B893E688B7EFBC89EFBC9A3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20353670783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE688B7E5908DEFBC9A7B6E616D657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20353670783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE5BC80E688B7E8A18CEFBC9A7B62616E6B6E616D657D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20353670783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE8B4A6E58FB7EFBC9A7B62616E6B6163636F756E747D3C2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE59B9BE38081E4B8BAE981BFE5858DE6ADA7E4B989EFBC8CE794B2E4B999E59CA8E6ADA4E7A1AEE8AEA4EFBC9AE794B2E696B9E59CA8E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BE79A84E4BBBBE4BD95E4B989E58AA1E5928CE4BBBBE4BD95E8B4A3E4BBBBE983BDE4B88DE8BDACE8AEA9E7BB99E4B999E696B9E8808CE4BB8DE794B1E794B2E696B9E689BFE68B85EFBC8CE4B999E696B9E6B2A1E69C89E8A681E6B182E68896E689BFE8AFBAE68EA5E58F97E38081E4BBA3E4B8BAE5B1A5E8A18CE794B2E696B9E59CA8E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BE79A84E4BBBBE4BD95E4B989E58AA1E68896E8B4A3E4BBBBEFBC9BE4B899E696B9E689BFE8AFBAE4B88DE4BBA5E794B2E696B9E79A84E4BBBBE4BD95E8A18CE4B8BAEFBC88E697A0E8AEBAE698AFE590A6E59CA8E4B88AE8BFB0E59FBAE7A180E4BAA4E69893E59088E5908CE9A1B9E4B88BEFBC89E68A97E8BEA9E68896E68AB5E99480E68896E58F8DE7B4A2E4B899E696B9E5B0B1E8A2ABE8BDACE8AEA9E580BAE69D83E5BA94E59091E4B999E696B9E5B1A5E8A18CE5928CE689BFE68B85E79A84E4BBBBE4BD95E5928CE4B880E58887E4B989E58AA1E5928CE8B4A3E4BBBBE38082E5A682E59BA0E6ADA4E7BB99E4B999E696B9E980A0E68890E4BBBBE4BD95E68D9FE5A4B1EFBC8CE794B2E4B899E58F8CE696B9E5BA94E8B49FE8B4A3E5A6A5E59684E8A7A3E586B3E5B9B6E4BA88E4BBA5E8B594E581BFE3803F2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE4BA94E38081E5A682E58F91E7949FE4BA89E8AEAEEFBC8CE59084E696B9E5908CE6848FE58D8FE59586E8A7A3E586B3EFBC9BE58D8FE59586E4B88DE68890E79A84EFBC8CE59084E696B9E5908CE6848FE59CA8E4B999E696B9E79A84E4BD8FE68980E59CB0E4BABAE6B091E6B395E999A2E68F90E8B5B7E8AF89E8AEBCE3803F2F7370616E3E3C2F703E3C70207374796C653D226C696E652D6865696768743A20323470783B20746578742D696E64656E743A20333270783B2077686974652D73706163653A206E6F726D616C3B223E3C7370616E207374796C653D226C696E652D6865696768743A20313870783B20666F6E742D66616D696C793A20E5AE8BE4BD933B20666F6E742D73697A653A20313270783B223EE585ADE38081E69CACE58D8FE8AEAEE794B1E794B2E4B999E4B899E4B889E696B9E59CA8E7AD96E8B5A2E7BD91E7BB9CE4BFA1E681AFE69C8DE58AA1E5B9B3E58FB0E6B3A8E5868CE79A84E585B7E5A487E7BB8FE58A9EE38081E5A48DE6A0B8E38081E5AEA1E689B9E8818CE883BDE79A84E794B5E5AD90E7ADBEE5908DE588B6E4BD9CE695B0E68DAEE59D87E5AFB9E69CACE4B889E696B9E58D8FE8AEAEE6ADA3E69687E794B5E5AD90E7ADBEE5908DE5908EE7949FE69588E3803F2F7370616E3E3C2F703E3C70207374796C653D2277686974652D73706163653A206E6F726D616C3B223E266E6273703B3C2F703E3C703E3C62722F3E3C2F703E3C703E266E6273703B3C2F703E, '100', null);

-- ----------------------------
-- View structure for `tsys_user_rights`
-- ----------------------------
DROP VIEW IF EXISTS `tsys_user_rights`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `tsys_user_rights` AS select distinct `ur`.`trans_code` AS `trans_code`,`ur`.`sub_trans_code` AS `sub_trans_code`,`ur`.`right_flag` AS `right_flag`,`ur`.`user_id` AS `user_id` from `tsys_user_right` `ur` union select distinct `rr`.`trans_code` AS `trans_code`,`rr`.`sub_trans_code` AS `sub_trans_code`,`rr`.`right_flag` AS `right_flag`,`urs`.`user_id` AS `user_id` from (`tsys_role_right` `rr` join `tsys_user_roles` `urs`) where ((`rr`.`role_code` = `urs`.`ROLE_CODE`) and (`rr`.`right_flag` = `urs`.`right_flag`)) ;

-- ----------------------------
-- View structure for `tsys_user_roles`
-- ----------------------------
DROP VIEW IF EXISTS `tsys_user_roles`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `tsys_user_roles` AS select distinct `r`.`role_code` AS `ROLE_CODE`,`r`.`role_name` AS `ROLE_NAME`,`r`.`creator` AS `CREATOR`,`r`.`remark` AS `REMARK`,`r`.`parent_id` AS `PARENT_ID`,`r`.`role_path` AS `ROLE_PATH`,`ru`.`right_flag` AS `right_flag`,`u`.`user_id` AS `user_id` from ((`tsys_role_user` `ru` join `tsys_user` `u`) join `tsys_role` `r`) where ((`ru`.`role_code` = `r`.`role_code`) and (`ru`.`user_code` = `u`.`user_id`)) union select distinct `r`.`role_code` AS `ROLE_CODE`,`r`.`role_name` AS `ROLE_NAME`,`r`.`creator` AS `CREATOR`,`r`.`remark` AS `REMARK`,`r`.`parent_id` AS `PARENT_ID`,`r`.`role_path` AS `ROLE_PATH`,'1' AS `right_flag`,`pu`.`user_id` AS `user_id` from ((`tsys_role` `r` join `tsys_position` `pos`) join `tsys_pos_user` `pu`) where ((`r`.`role_code` = `pos`.`role_code`) and (`pu`.`position_code` = `pos`.`position_code`)) union select distinct `r`.`role_code` AS `ROLE_CODE`,`r`.`role_name` AS `ROLE_NAME`,`r`.`creator` AS `CREATOR`,`r`.`remark` AS `REMARK`,`r`.`parent_id` AS `PARENT_ID`,`r`.`role_path` AS `ROLE_PATH`,'2' AS `right_flag`,`pu`.`user_id` AS `user_id` from ((`tsys_role` `r` join `tsys_position` `pos`) join `tsys_pos_user` `pu`) where ((`r`.`role_code` = `pos`.`role_code`) and (`pu`.`position_code` = `pos`.`position_code`)) ;
