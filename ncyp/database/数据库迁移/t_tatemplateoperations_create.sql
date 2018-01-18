/*
Navicat MySQL Data Transfer

Source Server         : mysql57
Source Server Version : 50717
Source Host           : localhost:3307
Source Database       : boss

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-01-02 11:24:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_tatemplateoperations`
-- ----------------------------
DROP TABLE IF EXISTS `t_tatemplateoperations`;
CREATE TABLE `t_tatemplateoperations` (
  `urid` varchar(32) NOT NULL,
  `tatemplate_id` varchar(32) NOT NULL,
  `operator` varchar(32) NOT NULL,
  `operate_org_id` varchar(32) NOT NULL,
  `operate_date` datetime NOT NULL,
  `operate_flag` varchar(4) NOT NULL,
  `signature` varchar(128) DEFAULT NULL,
  `createby` varchar(32) NOT NULL,
  `createdon` datetime NOT NULL,
  `lastmodifiedby` varchar(32) DEFAULT NULL,
  `lastmodifiedon` datetime DEFAULT NULL,
  `rowversion` decimal(4,0) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `relateoperate_id` varchar(32) DEFAULT NULL,
  `blockchainaddress` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`urid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tatemplateoperations
-- ----------------------------
