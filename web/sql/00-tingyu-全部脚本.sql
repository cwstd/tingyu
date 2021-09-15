/*
Navicat MySQL Data Transfer

Source Server         : 509
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : 01-tingyu

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2020-02-23 23:53:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `aid` int(10) NOT NULL AUTO_INCREMENT,
  `aname` varchar(100) NOT NULL,
  `apwd` varchar(100) NOT NULL,
  `aphone` char(11) NOT NULL,
  `starttime` datetime NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'admin', '123', '15500223366', '2020-02-17 17:02:20');

-- ----------------------------
-- Table structure for `t_admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_role`;
CREATE TABLE `t_admin_role` (
  `aid` int(10) NOT NULL,
  `rid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin_role
-- ----------------------------
INSERT INTO `t_admin_role` VALUES ('1', '1');

-- ----------------------------
-- Table structure for `t_company`
-- ----------------------------
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company` (
  `cid` int(10) NOT NULL AUTO_INCREMENT,
  `cpwd` varchar(100) NOT NULL,
  `cname` varchar(100) NOT NULL,
  `cphone` char(11) DEFAULT NULL,
  `ceo` varchar(100) NOT NULL,
  `cmail` varchar(100) NOT NULL,
  `starttime` datetime NOT NULL,
  `status` char(15) NOT NULL,
  `ordernumber` int(10) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_company
-- ----------------------------
INSERT INTO `t_company` VALUES ('1', '123', '北京尚学堂2222', '15645', '高琪', '122@qq.com', '2020-02-21 11:54:08', '0', '100');
INSERT INTO `t_company` VALUES ('2', '123', '上海尚学堂', '35415', '李毅', '1231@qq.com', '2020-02-21 11:54:53', '1', '200');
INSERT INTO `t_company` VALUES ('3', '123', '深圳尚学堂', '123', '老夏', '1231@qq.com', '2020-02-21 11:55:30', '1', '300');
INSERT INTO `t_company` VALUES ('4', '123', '北京太有才公司', '123', '占山', '123', '2020-02-21 14:11:59', '1', null);

-- ----------------------------
-- Table structure for `t_host`
-- ----------------------------
DROP TABLE IF EXISTS `t_host`;
CREATE TABLE `t_host` (
  `hid` int(10) NOT NULL AUTO_INCREMENT,
  `hname` varchar(100) NOT NULL,
  `hpwd` varchar(100) NOT NULL,
  `hphone` char(11) NOT NULL,
  `starttime` datetime NOT NULL,
  `status` char(11) NOT NULL,
  `strong` char(2) NOT NULL,
  `ordernumber` int(10) DEFAULT NULL,
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_host
-- ----------------------------
INSERT INTO `t_host` VALUES ('1', '刘星星', '123', '1918191815', '2020-02-18 15:04:57', '0', '90', '19');
INSERT INTO `t_host` VALUES ('2', '张三三', '123', '19123815', '2020-02-18 15:04:57', '1', '20', '22');
INSERT INTO `t_host` VALUES ('3', '刘思思', '123', '1918321815', '2020-02-18 15:04:57', '1', '30', '30');
INSERT INTO `t_host` VALUES ('4', '王呜呜', '123', '1918191815', '2020-02-18 15:04:58', '1', '40', '40');
INSERT INTO `t_host` VALUES ('5', '王思思', '123', '13291815', '2020-02-18 15:04:58', '1', '10', '50');
INSERT INTO `t_host` VALUES ('6', '李洒洒', '123', '191235', '2020-02-18 15:04:58', '1', '10', '0');
INSERT INTO `t_host` VALUES ('7', '周六六', '123', '33191815', '2020-02-18 15:04:58', '1', '20', '0');
INSERT INTO `t_host` VALUES ('8', '赵三三', '123', '156654', '2020-02-20 14:40:39', '1', '60', '0');
INSERT INTO `t_host` VALUES ('9', '张其', '123', '1231', '2020-02-20 14:44:08', '1', '60', '0');
INSERT INTO `t_host` VALUES ('10', '美滋滋', '123', '123123', '2020-02-20 14:52:46', '1', '60', '0');
INSERT INTO `t_host` VALUES ('11', '张三三三', '123', '123123', '2020-02-20 14:53:12', '1', '60', '0');

-- ----------------------------
-- Table structure for `t_host_power`
-- ----------------------------
DROP TABLE IF EXISTS `t_host_power`;
CREATE TABLE `t_host_power` (
  `hpid` int(10) NOT NULL AUTO_INCREMENT,
  `hpstar` char(2) DEFAULT NULL,
  `hpstart_begindate` date DEFAULT NULL,
  `hpstar_enddate` date DEFAULT NULL,
  `hp_order_power` char(4) DEFAULT NULL,
  `hpstar_begintime` time DEFAULT NULL,
  `hpstar_endtime` time DEFAULT NULL,
  `hpdiscount` int(2) DEFAULT NULL,
  `hp_dis_starttime` date DEFAULT NULL,
  `hp_dis_endtime` date DEFAULT NULL,
  `hpprice` double DEFAULT NULL,
  `hpcosts` double DEFAULT NULL,
  `hostid` int(10) DEFAULT NULL,
  PRIMARY KEY (`hpid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_host_power
-- ----------------------------
INSERT INTO `t_host_power` VALUES ('1', '1', '2020-02-18', '2020-02-26', '1', '08:30:00', '18:30:00', '9', '2020-02-17', '2020-02-26', '5000', '2000', '1');
INSERT INTO `t_host_power` VALUES ('2', '1', '2020-02-18', '2020-02-18', '1', '08:30:00', '18:30:00', '9', '2020-02-18', '2020-02-18', '5000', '2000', '2');
INSERT INTO `t_host_power` VALUES ('3', '1', '2020-02-18', '2020-02-18', '1', '08:00:00', '16:00:00', '6', '2020-02-18', '2020-02-18', '2000', '1000', '3');
INSERT INTO `t_host_power` VALUES ('4', '1', '2020-02-18', '2020-02-18', '1', '08:00:00', '16:00:00', '6', '2020-02-18', '2020-02-18', '2000', '1000', '4');
INSERT INTO `t_host_power` VALUES ('5', '1', '2020-02-18', '2020-02-18', '1', '08:00:00', '16:00:00', '6', '2020-02-18', '2020-02-18', '2000', '1000', '5');
INSERT INTO `t_host_power` VALUES ('6', '1', '2020-02-18', '2020-02-18', '1', '08:00:00', '16:00:00', '6', '2020-02-18', '2020-02-18', '2000', '1000', '6');
INSERT INTO `t_host_power` VALUES ('7', '1', '2020-02-18', '2020-02-18', '1', '08:00:00', '16:00:00', '6', '2020-02-18', '2020-02-18', '2000', '1000', '7');
INSERT INTO `t_host_power` VALUES ('8', '1', '2020-02-17', '2020-02-26', null, '08:30:00', '18:30:00', '9', '2020-02-24', '2020-02-28', '2000', '2000', '11');

-- ----------------------------
-- Table structure for `t_married_person`
-- ----------------------------
DROP TABLE IF EXISTS `t_married_person`;
CREATE TABLE `t_married_person` (
  `pid` int(10) NOT NULL AUTO_INCREMENT,
  `ppwd` varchar(100) NOT NULL,
  `pname` varchar(100) NOT NULL,
  `phone` char(11) NOT NULL,
  `pmail` varchar(100) NOT NULL,
  `marrydate` date NOT NULL,
  `regdate` datetime NOT NULL,
  `status` char(8) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_married_person
-- ----------------------------
INSERT INTO `t_married_person` VALUES ('1', '123', '张三', '123', '123', '2020-02-21', '2020-02-21 15:43:03', '1');
INSERT INTO `t_married_person` VALUES ('2', '123', '李四', '123', '123', '2020-02-21', '2020-02-21 15:43:19', '1');
INSERT INTO `t_married_person` VALUES ('3', '123', '王五', '123', '123', '2020-02-21', '2020-02-21 15:43:36', '1');

-- ----------------------------
-- Table structure for `t_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `mid` int(10) NOT NULL AUTO_INCREMENT,
  `mname` varchar(100) NOT NULL,
  `pid` int(10) NOT NULL,
  `isparent` char(2) NOT NULL,
  `status` char(2) NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  `mdesc` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('1', '成员管理', '0', '1', '0', null, '一级菜单');
INSERT INTO `t_menu` VALUES ('2', '成员订单中心', '0', '1', '0', null, '一级菜单');
INSERT INTO `t_menu` VALUES ('3', '内容管理', '0', '1', '0', null, '一级菜单');
INSERT INTO `t_menu` VALUES ('4', '其他管理', '0', '1', '0', null, '一级菜单');
INSERT INTO `t_menu` VALUES ('5', '主持人管理', '1', '1', '0', 'memberManager/zhcManager.jsp', '二级菜单');
INSERT INTO `t_menu` VALUES ('6', '婚庆公司管理', '1', '0', '0', 'memberManager/companyManager.jsp', '二级菜单');
INSERT INTO `t_menu` VALUES ('7', '新人管理', '1', '0', '0', 'memberManager/marriedManager.jsp', '二级菜单');
INSERT INTO `t_menu` VALUES ('8', '主持人订单中心', '2', '0', '0', null, '二级菜单');
INSERT INTO `t_menu` VALUES ('9', 'banner管理', '3', '0', '0', null, '二级菜单');
INSERT INTO `t_menu` VALUES ('10', '首页推荐管理', '3', '0', '0', null, '二级菜单');
INSERT INTO `t_menu` VALUES ('11', '底部文案、二维码设置', '3', '0', '0', null, '二级菜单');
INSERT INTO `t_menu` VALUES ('12', '加入团队介绍文案', '3', '0', '0', null, '二级菜单');
INSERT INTO `t_menu` VALUES ('13', '关于团队文案', '3', '0', '0', null, '二级菜单');
INSERT INTO `t_menu` VALUES ('14', '菜单管理', '4', '0', '0', 'otherManager/menuManager.jsp', '二级菜单');
INSERT INTO `t_menu` VALUES ('15', '角色管理', '4', '0', '0', 'otherManager/roleManager.jsp', '二级菜单');
INSERT INTO `t_menu` VALUES ('16', '管理员管理', '4', '0', '0', null, '二级菜单');
INSERT INTO `t_menu` VALUES ('24', '222', '5', '0', '0', '222', '222');

-- ----------------------------
-- Table structure for `t_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `oid` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL,
  `cid` int(10) NOT NULL,
  `hid` int(10) NOT NULL,
  `hotelname` varchar(100) NOT NULL,
  `hoteladdress` varchar(100) NOT NULL,
  `ordertime` datetime NOT NULL,
  `wedding_time` datetime NOT NULL,
  `wedding_split` char(2) DEFAULT NULL,
  `deposit` double DEFAULT NULL,
  `money` double DEFAULT NULL,
  `status` char(2) DEFAULT NULL,
  `comment` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------

-- ----------------------------
-- Table structure for `t_planner`
-- ----------------------------
DROP TABLE IF EXISTS `t_planner`;
CREATE TABLE `t_planner` (
  `nid` int(10) NOT NULL AUTO_INCREMENT,
  `nname` varchar(100) NOT NULL,
  `nphone` char(11) NOT NULL,
  `addtime` datetime NOT NULL,
  `status` char(8) NOT NULL,
  `cid` int(10) NOT NULL,
  `ordernumber` int(10) DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_planner
-- ----------------------------
INSERT INTO `t_planner` VALUES ('1', '赵珊珊', '132', '2020-02-21 15:16:48', '1', '1', '100');
INSERT INTO `t_planner` VALUES ('2', '马海洋', '31152', '2020-02-26 15:17:15', '1', '1', '100');
INSERT INTO `t_planner` VALUES ('3', '刘凯立', '123', '2020-02-21 15:17:30', '1', '1', '100');

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `rid` int(10) NOT NULL AUTO_INCREMENT,
  `rname` varchar(100) NOT NULL,
  `rdesc` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '超级管理员222', '可以操作所有的菜单信息');
INSERT INTO `t_role` VALUES ('2', '成员管理员', '成员管理和成员订单中心');
INSERT INTO `t_role` VALUES ('3', '内容管理员', '内容管理');

-- ----------------------------
-- Table structure for `t_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu` (
  `rid` int(10) NOT NULL,
  `mid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES ('2', '1');
INSERT INTO `t_role_menu` VALUES ('2', '2');
INSERT INTO `t_role_menu` VALUES ('2', '5');
INSERT INTO `t_role_menu` VALUES ('2', '6');
INSERT INTO `t_role_menu` VALUES ('2', '7');
INSERT INTO `t_role_menu` VALUES ('3', '3');
INSERT INTO `t_role_menu` VALUES ('3', '9');
INSERT INTO `t_role_menu` VALUES ('3', '10');
INSERT INTO `t_role_menu` VALUES ('3', '11');
INSERT INTO `t_role_menu` VALUES ('3', '12');
INSERT INTO `t_role_menu` VALUES ('3', '13');
INSERT INTO `t_role_menu` VALUES ('1', '1');
INSERT INTO `t_role_menu` VALUES ('1', '5');
INSERT INTO `t_role_menu` VALUES ('1', '6');
INSERT INTO `t_role_menu` VALUES ('1', '7');
INSERT INTO `t_role_menu` VALUES ('1', '17');
INSERT INTO `t_role_menu` VALUES ('1', '18');
INSERT INTO `t_role_menu` VALUES ('1', '19');
INSERT INTO `t_role_menu` VALUES ('1', '20');
INSERT INTO `t_role_menu` VALUES ('1', '21');
INSERT INTO `t_role_menu` VALUES ('1', '2');
INSERT INTO `t_role_menu` VALUES ('1', '8');
INSERT INTO `t_role_menu` VALUES ('1', '3');
INSERT INTO `t_role_menu` VALUES ('1', '9');
INSERT INTO `t_role_menu` VALUES ('1', '10');
INSERT INTO `t_role_menu` VALUES ('1', '11');
INSERT INTO `t_role_menu` VALUES ('1', '12');
INSERT INTO `t_role_menu` VALUES ('1', '13');
INSERT INTO `t_role_menu` VALUES ('1', '4');
INSERT INTO `t_role_menu` VALUES ('1', '14');
INSERT INTO `t_role_menu` VALUES ('1', '15');
INSERT INTO `t_role_menu` VALUES ('1', '16');
