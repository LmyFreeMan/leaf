/*
Navicat MySQL Data Transfer

Source Server         : centos7
Source Server Version : 50642
Source Host           : localhost:3306
Source Database       : leaf

Target Server Type    : MYSQL
Target Server Version : 50642
File Encoding         : 65001

Date: 2019-11-04 18:28:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(100) NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `token` varchar(59) NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员表';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'Admin', 'a0a7a42737972bff8bd9862d028e699c', 'c8e886', '/assets/img/avatar.png', 'admin@admin.com', '0', '1547380073', '1492186163', '1547380073', 'c07d6b71-e9ba-4e28-b0ae-73810ec3e423', 'normal');
INSERT INTO `admin` VALUES ('2', 'admin2', 'admin2', '9a28ce07ce875fbd14172a9ca5357d3c', '2dHDmj', '/assets/img/avatar.png', 'admin2@fastadmin.net', '0', '1505450906', '1492186163', '1505450906', 'df45fdd5-26f4-45ca-83b3-47e4491a315a', 'normal');
INSERT INTO `admin` VALUES ('3', 'admin3', 'admin3', '1c11f945dfcd808a130a8c2a8753fe62', 'WOKJEn', '/assets/img/avatar.png', 'admin3@fastadmin.net', '0', '1501980868', '1492186201', '1501982377', '', 'normal');
INSERT INTO `admin` VALUES ('4', 'admin22', 'admin22', '1c1a0aa0c3c56a8c1a908aab94519648', 'Aybcn5', '/assets/img/avatar.png', 'admin22@fastadmin.net', '0', '0', '1492186240', '1492186240', '', 'normal');
INSERT INTO `admin` VALUES ('5', 'admin32', 'admin32', 'ade94d5d7a7033afa7d84ac3066d0a02', 'FvYK0u', '/assets/img/avatar.png', 'admin32@fastadmin.net', '0', '0', '1492186263', '1492186263', '', 'normal');

-- ----------------------------
-- Table structure for admin_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_log`;
CREATE TABLE `admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员日志表';

-- ----------------------------
-- Records of admin_log
-- ----------------------------
INSERT INTO `admin_log` VALUES ('1', '1', 'admin', '/dashboard/public/index.php/admin/index/login', '登录', '{\"__token__\":\"35d79a203a9974ce07a671d84c13e687\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1541476824');
INSERT INTO `admin_log` VALUES ('2', '1', 'admin', '/dashboard/public/index.php/admin/general.config/edit', '常规管理 系统配置 编辑', '{\"row\":{\"name\":\"\\u6728\\u53f6\\u6c47\\u534eLite\",\"beian\":\"\",\"cdnurl\":\"\",\"version\":\"1.0.1\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{\\\"backend\\\":\\\"zh-cn\\\",\\\"frontend\\\":\\\"zh-cn\\\"}\",\"fixedpage\":\"dashboard\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1541480002');
INSERT INTO `admin_log` VALUES ('3', '1', 'admin', '/dashboard/public/index.php/admin/auth/group/roletree', '', '{\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1541490581');
INSERT INTO `admin_log` VALUES ('4', '1', 'admin', '/dashboard/public/index.php/admin/user/add?dialog=1', '登陆中心 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"test\",\"sex\":[\"\\u5973\"],\"schoolnum\":\"2015515981\",\"imageaddress\":\"xxxx\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1541491327');
INSERT INTO `admin_log` VALUES ('5', '1', 'admin', '/dashboard/public/index.php/admin/user/edit/ids/1?dialog=1', '登陆中心 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"dsad \",\"sex\":[\"\\u7537\"],\"schoolnum\":\"201651222\",\"imageaddress\":\"2131\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1541491367');
INSERT INTO `admin_log` VALUES ('6', '1', 'admin', '/dashboard/public/index.php/admin/user/edit/ids/2?dialog=1', '登陆中心 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"dasda\",\"sex\":[\"\\u5973\"],\"schoolnum\":\"dasd\",\"imageaddress\":\"dasd\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1541491540');
INSERT INTO `admin_log` VALUES ('7', '1', 'admin', '/dashboard/public/index.php/admin/ajax/upload', '', '{\"name\":\"20181102_102746.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1541491953');
INSERT INTO `admin_log` VALUES ('8', '1', 'admin', '/dashboard/public/index.php/admin/ajax/upload', '', '{\"name\":\"20181102_102733.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1541491958');
INSERT INTO `admin_log` VALUES ('9', '1', 'admin', '/dashboard/public/index.php/admin/ajax/upload', '', '{\"name\":\"logo.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1541491963');
INSERT INTO `admin_log` VALUES ('10', '1', 'admin', '/dashboard/public/index.php/admin/user/edit/ids/2?dialog=1', '登陆中心 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"test\",\"sex\":[\"\\u7537\"],\"schoolnum\":\"dasd\",\"image\":\"\\/uploads\\/20181106\\/dd79bad1d4cda77d8343e500e41ba1f1.png\",\"refreshtime\":\"2018-11-06 16:12:56\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1541491983');
INSERT INTO `admin_log` VALUES ('11', '1', 'admin', '/dashboard/public/index.php/admin/user/del/ids/2', '登陆中心 删除', '{\"action\":\"del\",\"ids\":\"2\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1541491996');
INSERT INTO `admin_log` VALUES ('12', '1', 'admin', '/dashboard/public/index.php/admin/ajax/upload', '', '{\"name\":\"logo.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1541492011');
INSERT INTO `admin_log` VALUES ('13', '1', 'admin', '/dashboard/public/index.php/admin/user/edit/ids/1?dialog=1', '登陆中心 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"test\",\"sex\":[\"\\u7537\"],\"schoolnum\":\"2016512999\",\"image\":\"\\/uploads\\/20181106\\/dd79bad1d4cda77d8343e500e41ba1f1.png\",\"refreshtime\":\"1970-01-01 08:00:00\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1541492016');
INSERT INTO `admin_log` VALUES ('14', '1', 'admin', '/dashboard/public/index.php/admin/user/edit/ids/1?dialog=1', '登陆中心 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"test\",\"sex\":[\"\\u7537\"],\"schoolnum\":\"2016512999\",\"image\":\"\\/uploads\\/20181106\\/dd\",\"refreshtime\":\"1970-01-21 08:00:00\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1541492028');
INSERT INTO `admin_log` VALUES ('15', '0', 'Unknown', '/dashboard/public/index.php/admin/user/index', '', '{\"name\":\"\\u5c0f\\u80d6\",\"schoolnum\":\"2016512981\",\"gender\":\"1\",\"image\":\"https:\\/\\/wx.qlogo.cn\\/mmopen\\/vi_32\\/jXbwicoDwia7rDYLuibAt3W19GODlVS9yPLV7tj8XPDQQjug4p6VXzkicApzSN2sJ0ibPzefiaJQLh9weTRp9XL6iaIAQ\\/132\"}', '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1 wechatdevtools/1.02.1810250 MicroMessenger/6.5.7 Language/zh_CN webview/ token/9bb657140199a30e90038b64cd4a145c', '1541498409');
INSERT INTO `admin_log` VALUES ('16', '0', 'Unknown', '/dashboard/public/index.php/admin/user/index', '', '{\"name\":\"\\u5c0f\\u80d6\",\"schoolnum\":\"2016512981\",\"gender\":\"1\",\"image\":\"https:\\/\\/wx.qlogo.cn\\/mmopen\\/vi_32\\/jXbwicoDwia7rDYLuibAt3W19GODlVS9yPLV7tj8XPDQQjug4p6VXzkicApzSN2sJ0ibPzefiaJQLh9weTRp9XL6iaIAQ\\/132\"}', '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1 wechatdevtools/1.02.1810250 MicroMessenger/6.5.7 Language/zh_CN webview/ token/9bb657140199a30e90038b64cd4a145c', '1541498696');
INSERT INTO `admin_log` VALUES ('17', '0', 'Unknown', '/dashboard/public/index.php/admin/user/index', '', '{\"name\":\"\\u5c0f\\u80d6\",\"schoolnum\":\"2016512981\",\"gender\":\"1\",\"image\":\"https:\\/\\/wx.qlogo.cn\\/mmopen\\/vi_32\\/jXbwicoDwia7rDYLuibAt3W19GODlVS9yPLV7tj8XPDQQjug4p6VXzkicApzSN2sJ0ibPzefiaJQLh9weTRp9XL6iaIAQ\\/132\"}', '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1 wechatdevtools/1.02.1810250 MicroMessenger/6.5.7 Language/zh_CN webview/ token/9bb657140199a30e90038b64cd4a145c', '1541498812');
INSERT INTO `admin_log` VALUES ('18', '0', 'Unknown', '/dashboard/public/index.php/admin/user/index', '', '{\"name\":\"\\u5c0f\\u80d6\",\"schoolnum\":\"2016512981\",\"gender\":\"1\",\"image\":\"https:\\/\\/wx.qlogo.cn\\/mmopen\\/vi_32\\/jXbwicoDwia7rDYLuibAt3W19GODlVS9yPLV7tj8XPDQQjug4p6VXzkicApzSN2sJ0ibPzefiaJQLh9weTRp9XL6iaIAQ\\/132\"}', '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1 wechatdevtools/1.02.1810250 MicroMessenger/6.5.7 Language/zh_CN webview/ token/9bb657140199a30e90038b64cd4a145c', '1541498864');
INSERT INTO `admin_log` VALUES ('19', '0', 'Unknown', '/dashboard/public/index.php/admin/user/index', '', '{\"name\":\"\\u5c0f\\u80d6\",\"schoolnum\":\"2016512981\",\"gender\":\"1\",\"image\":\"https:\\/\\/wx.qlogo.cn\\/mmopen\\/vi_32\\/jXbwicoDwia7rDYLuibAt3W19GODlVS9yPLV7tj8XPDQQjug4p6VXzkicApzSN2sJ0ibPzefiaJQLh9weTRp9XL6iaIAQ\\/132\"}', '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1 wechatdevtools/1.02.1810250 MicroMessenger/6.5.7 Language/zh_CN webview/ token/889cc0bead37ee5d309afd840d8a7e3c', '1541554924');
INSERT INTO `admin_log` VALUES ('20', '0', 'Unknown', '/dashboard/public/index.php/admin/user/index', '', '{\"name\":\"\\u5c0f\\u80d6\",\"schoolnum\":\"2016512981\",\"gender\":\"1\",\"image\":\"https:\\/\\/wx.qlogo.cn\\/mmopen\\/vi_32\\/jXbwicoDwia7rDYLuibAt3W19GODlVS9yPLV7tj8XPDQQjug4p6VXzkicApzSN2sJ0ibPzefiaJQLh9weTRp9XL6iaIAQ\\/132\"}', '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1 wechatdevtools/1.02.1810250 MicroMessenger/6.5.7 Language/zh_CN webview/ token/889cc0bead37ee5d309afd840d8a7e3c', '1541555212');
INSERT INTO `admin_log` VALUES ('21', '1', 'admin', '/dashboard/public/index.php/admin/index/login?url=%2Fdashboard%2Fpublic%2Findex.php%2Fadmin', '登录', '{\"url\":\"\\/dashboard\\/public\\/index.php\\/admin\",\"__token__\":\"719bdfe072306a3a9979f80e999e537d\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1541556152');
INSERT INTO `admin_log` VALUES ('22', '1', 'admin', '/dashboard/public/admin/ajax/upload', '', '{\"name\":\"logo.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1541557604');
INSERT INTO `admin_log` VALUES ('23', '1', 'admin', '/dashboard/public/admin/user/edit/ids/4?dialog=1', '登陆中心 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u5c0f\\u80d6\",\"sex\":[\"\\u7537\"],\"image\":\"\\/uploads\\/20181107\\/dd79bad1d4cda77d8343e500e41ba1f1.png\",\"t\":\"dsa\"},\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1541557609');
INSERT INTO `admin_log` VALUES ('24', '1', 'admin', '/dashboard/public/admin/content/del/ids/7', '内容 删除', '{\"action\":\"del\",\"ids\":\"7\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1541573681');
INSERT INTO `admin_log` VALUES ('25', '1', 'admin', '/dashboard/public/admin/content/del/ids/6', '内容 删除', '{\"action\":\"del\",\"ids\":\"6\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1541573684');
INSERT INTO `admin_log` VALUES ('26', '1', 'admin', '/dashboard/public/admin/content/del/ids/5', '内容 删除', '{\"action\":\"del\",\"ids\":\"5\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1541573686');
INSERT INTO `admin_log` VALUES ('27', '1', 'admin', '/dashboard/public/admin/content/del/ids/4', '内容 删除', '{\"action\":\"del\",\"ids\":\"4\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1541573687');
INSERT INTO `admin_log` VALUES ('28', '1', 'admin', '/dashboard/public/admin/content/del/ids/3', '内容 删除', '{\"action\":\"del\",\"ids\":\"3\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1541573689');
INSERT INTO `admin_log` VALUES ('29', '1', 'admin', '/dashboard/public/admin/content/del/ids/2', '内容 删除', '{\"action\":\"del\",\"ids\":\"2\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1541573691');
INSERT INTO `admin_log` VALUES ('30', '1', 'admin', '/dashboard/public/admin/content/del/ids/1', '内容 删除', '{\"action\":\"del\",\"ids\":\"1\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1541573694');
INSERT INTO `admin_log` VALUES ('31', '1', 'admin', '/dashboard/public/admin/content/del/ids/8', '内容 删除', '{\"action\":\"del\",\"ids\":\"8\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1541573697');
INSERT INTO `admin_log` VALUES ('32', '1', 'admin', '/dashboard/public/admin/content/del/ids/16,15,14,13,12,11,10,9', '内容 删除', '{\"action\":\"del\",\"ids\":\"16,15,14,13,12,11,10,9\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1541574689');
INSERT INTO `admin_log` VALUES ('33', '0', 'Unknown', '/admin/index/login', '登录', '{\"__token__\":\"acf7c36eb2f0469bbec78946e8f98196\",\"username\":\"admin\"}', '124.236.147.167', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1542634020');
INSERT INTO `admin_log` VALUES ('34', '1', 'admin', '/admin/index/login', '登录', '{\"__token__\":\"a5fddb577021f8717c2f22322b464139\",\"username\":\"admin\"}', '124.236.147.167', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1542634025');
INSERT INTO `admin_log` VALUES ('35', '1', 'admin', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"1f2b85f26b2daeaaea7d958ff2f02e4c\",\"username\":\"admin\"}', '124.236.147.167', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1542674438');
INSERT INTO `admin_log` VALUES ('36', '1', 'admin', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"d08741fd3d7a9ba649eb85fbd483910a\",\"username\":\"admin\"}', '124.236.229.83', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1542859878');
INSERT INTO `admin_log` VALUES ('37', '0', 'Unknown', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"2354b04a1c860dbd37307432e46e0c8e\",\"username\":\"admin\"}', '124.236.229.83', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1542970525');
INSERT INTO `admin_log` VALUES ('38', '1', 'admin', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"ceaa3d8ca5336bda9d4f147df8ab48de\",\"username\":\"admin\"}', '124.236.229.83', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1542970530');
INSERT INTO `admin_log` VALUES ('39', '1', 'admin', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"fb5022bb5f6d005f781c24df3cd0330b\",\"username\":\"admin\"}', '124.236.147.76', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1543035095');
INSERT INTO `admin_log` VALUES ('40', '1', 'admin', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"b0af1741774309def87adb9cf5a63acb\",\"username\":\"admin\"}', '36.98.31.171', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1543309426');
INSERT INTO `admin_log` VALUES ('41', '1', 'admin', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"efd3fd6d6ff111b41f9927506f694786\",\"username\":\"admin\"}', '36.98.31.171', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '1543312816');
INSERT INTO `admin_log` VALUES ('42', '1', 'admin', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"9d5473079c6da75e150fd27d558fa69f\",\"username\":\"admin\"}', '106.114.245.112', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1545277568');
INSERT INTO `admin_log` VALUES ('43', '1', 'admin', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"156ea7ebcf0b937dfe0ae621bdb3bce2\",\"username\":\"admin\"}', '106.114.245.112', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1545311134');
INSERT INTO `admin_log` VALUES ('44', '1', 'admin', '/admin/auth/rule/multi/ids/1', '', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"ismenu=0\"}', '106.114.245.112', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1545320384');
INSERT INTO `admin_log` VALUES ('45', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '106.114.245.112', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1545320384');
INSERT INTO `admin_log` VALUES ('46', '1', 'admin', '/admin/auth/rule/multi/ids/1', '', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"ismenu=1\"}', '106.114.245.112', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1545320388');
INSERT INTO `admin_log` VALUES ('47', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '106.114.245.112', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1545320388');
INSERT INTO `admin_log` VALUES ('48', '1', 'admin', '/admin/auth/rule/multi/ids/1', '', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"ismenu=0\"}', '106.114.245.112', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1545320390');
INSERT INTO `admin_log` VALUES ('49', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '106.114.245.112', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1545320390');
INSERT INTO `admin_log` VALUES ('50', '1', 'admin', '/admin/auth/rule/multi/ids/241', '', '{\"action\":\"\",\"ids\":\"241\",\"params\":\"ismenu=0\"}', '106.114.245.112', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1545320403');
INSERT INTO `admin_log` VALUES ('51', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '106.114.245.112', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1545320404');
INSERT INTO `admin_log` VALUES ('52', '1', 'admin', '/admin/ajax/weigh', '', '{\"ids\":\"1,2,241,6,7,8,5,9,10,11,12,211,217,223,229,235\",\"changeid\":\"241\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\"}', '106.114.245.112', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1545320422');
INSERT INTO `admin_log` VALUES ('53', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '106.114.245.112', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1545320423');
INSERT INTO `admin_log` VALUES ('54', '1', 'admin', '/admin/ajax/weigh', '', '{\"ids\":\"1,2,6,7,8,5,9,10,11,12,211,217,223,241,229,235\",\"changeid\":\"241\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\"}', '106.114.245.112', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1545320433');
INSERT INTO `admin_log` VALUES ('55', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '106.114.245.112', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1545320434');
INSERT INTO `admin_log` VALUES ('56', '1', 'admin', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"00a62aabfd6a080bba9cc96d745d59d3\",\"username\":\"admin\"}', '182.51.84.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1545652811');
INSERT INTO `admin_log` VALUES ('57', '1', 'admin', '/admin/general.config/edit', '常规管理 系统配置 编辑', '{\"row\":{\"name\":\"\\u6728\\u53f6\\u6c47\\u534eLeaf\",\"beian\":\"\",\"cdnurl\":\"\",\"version\":\"1.0.1\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{\\\"backend\\\":\\\"zh-cn\\\",\\\"frontend\\\":\\\"zh-cn\\\"}\",\"fixedpage\":\"dashboard\"}}', '182.51.84.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1545653019');
INSERT INTO `admin_log` VALUES ('58', '0', 'Unknown', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"d76b4b3a9bdc8f7ae20c0d369b13579e\",\"username\":\"admin\"}', '124.236.148.126', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '1545834554');
INSERT INTO `admin_log` VALUES ('59', '1', 'admin', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"228098bb2ad88fcf243e65a6d3e5506e\",\"username\":\"admin\"}', '106.9.67.38', 'Mozilla/5.0 (Linux; U; Android 8.0.0zh-cn; STF-AL10 Build/HUAWEISTF-AL10) AppleWebKit/537.36 (KHTML, like Gecko)Version/4.0 Chrome/57.0.2987.132 MQQBrowser/8.1 Mobile Safari/537.36', '1546415854');
INSERT INTO `admin_log` VALUES ('60', '0', 'Unknown', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"bb94f4916c4055723322af4e910143a3\",\"username\":\"admin\"}', '222.30.255.144', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1547380070');
INSERT INTO `admin_log` VALUES ('61', '1', 'admin', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"383d0a46e3b5d3778f23e064607334a7\",\"username\":\"admin\"}', '222.30.255.144', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1547380073');

-- ----------------------------
-- Table structure for attachment
-- ----------------------------
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) NOT NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) NOT NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建日期',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `storage` varchar(100) NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='附件表';

-- ----------------------------
-- Records of attachment
-- ----------------------------
INSERT INTO `attachment` VALUES ('1', '1', '0', '/assets/img/qrcode.png', '150', '150', 'png', '0', '21859', 'image/png', '', '1499681848', '1499681848', '1499681848', 'local', '17163603d0263e4838b9387ff2cd4877e8b018f6');
INSERT INTO `attachment` VALUES ('2', '1', '0', '/uploads/20181106/dd79bad1d4cda77d8343e500e41ba1f1.png', '363', '173', 'png', '0', '20151', 'image/png', '', '1541491963', '1541491963', '1541491963', 'local', '676293d505c9ef4ebf66dc7516419cedab0e1eea');
INSERT INTO `attachment` VALUES ('3', '1', '0', '/uploads/20181106/dd79bad1d4cda77d8343e500e41ba1f1.png', '363', '173', 'png', '0', '20151', 'image/png', '', '1541492010', '1541492010', '1541492010', 'local', '676293d505c9ef4ebf66dc7516419cedab0e1eea');
INSERT INTO `attachment` VALUES ('4', '1', '0', '/uploads/20181107/dd79bad1d4cda77d8343e500e41ba1f1.png', '363', '173', 'png', '0', '20151', 'image/png', '', '1541557604', '1541557604', '1541557604', 'local', '676293d505c9ef4ebf66dc7516419cedab0e1eea');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text NOT NULL COMMENT '规则ID',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='分组表';

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES ('1', '0', 'Admin group', '*', '1490883540', '149088354', 'normal');
INSERT INTO `auth_group` VALUES ('2', '1', 'Second group', '13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5', '1490883540', '1505465692', 'normal');
INSERT INTO `auth_group` VALUES ('3', '2', 'Third group', '1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5', '1490883540', '1502205322', 'normal');
INSERT INTO `auth_group` VALUES ('4', '1', 'Second group 2', '1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65', '1490883540', '1502205350', 'normal');
INSERT INTO `auth_group` VALUES ('5', '2', 'Third group 2', '1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34', '1490883540', '1502205344', 'normal');

-- ----------------------------
-- Table structure for auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_access`;
CREATE TABLE `auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='权限分组表';

-- ----------------------------
-- Records of auth_group_access
-- ----------------------------
INSERT INTO `auth_group_access` VALUES ('1', '1');
INSERT INTO `auth_group_access` VALUES ('2', '2');
INSERT INTO `auth_group_access` VALUES ('3', '3');
INSERT INTO `auth_group_access` VALUES ('4', '5');
INSERT INTO `auth_group_access` VALUES ('5', '5');

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`),
  KEY `weigh` (`weigh`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节点表';

-- ----------------------------
-- Records of auth_rule
-- ----------------------------
INSERT INTO `auth_rule` VALUES ('1', 'file', '0', 'dashboard', 'Dashboard', 'fa fa-dashboard', '', 'Dashboard tips', '0', '1497429920', '1545320390', '143', 'normal');
INSERT INTO `auth_rule` VALUES ('2', 'file', '0', 'general', 'General', 'fa fa-cogs', '', '', '1', '1497429920', '1497430169', '137', 'normal');
INSERT INTO `auth_rule` VALUES ('5', 'file', '0', 'auth', 'Auth', 'fa fa-group', '', '', '1', '1497429920', '1497430092', '99', 'normal');
INSERT INTO `auth_rule` VALUES ('6', 'file', '2', 'general/config', 'Config', 'fa fa-cog', '', 'Config tips', '1', '1497429920', '1497430683', '60', 'normal');
INSERT INTO `auth_rule` VALUES ('7', 'file', '2', 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', 'Attachment tips', '1', '1497429920', '1497430699', '53', 'normal');
INSERT INTO `auth_rule` VALUES ('8', 'file', '2', 'general/profile', 'Profile', 'fa fa-user', '', '', '1', '1497429920', '1497429920', '34', 'normal');
INSERT INTO `auth_rule` VALUES ('9', 'file', '5', 'auth/admin', 'Admin', 'fa fa-user', '', 'Admin tips', '1', '1497429920', '1497430320', '118', 'normal');
INSERT INTO `auth_rule` VALUES ('10', 'file', '5', 'auth/adminlog', 'Admin log', 'fa fa-list-alt', '', 'Admin log tips', '1', '1497429920', '1497430307', '113', 'normal');
INSERT INTO `auth_rule` VALUES ('11', 'file', '5', 'auth/group', 'Group', 'fa fa-group', '', 'Group tips', '1', '1497429920', '1497429920', '109', 'normal');
INSERT INTO `auth_rule` VALUES ('12', 'file', '5', 'auth/rule', 'Rule', 'fa fa-bars', '', 'Rule tips', '1', '1497429920', '1497430581', '104', 'normal');
INSERT INTO `auth_rule` VALUES ('13', 'file', '1', 'dashboard/index', 'View', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '136', 'normal');
INSERT INTO `auth_rule` VALUES ('14', 'file', '1', 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '135', 'normal');
INSERT INTO `auth_rule` VALUES ('15', 'file', '1', 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '133', 'normal');
INSERT INTO `auth_rule` VALUES ('16', 'file', '1', 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '134', 'normal');
INSERT INTO `auth_rule` VALUES ('17', 'file', '1', 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '132', 'normal');
INSERT INTO `auth_rule` VALUES ('18', 'file', '6', 'general/config/index', 'View', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '52', 'normal');
INSERT INTO `auth_rule` VALUES ('19', 'file', '6', 'general/config/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '51', 'normal');
INSERT INTO `auth_rule` VALUES ('20', 'file', '6', 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '50', 'normal');
INSERT INTO `auth_rule` VALUES ('21', 'file', '6', 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '49', 'normal');
INSERT INTO `auth_rule` VALUES ('22', 'file', '6', 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '48', 'normal');
INSERT INTO `auth_rule` VALUES ('23', 'file', '7', 'general/attachment/index', 'View', 'fa fa-circle-o', '', 'Attachment tips', '0', '1497429920', '1497429920', '59', 'normal');
INSERT INTO `auth_rule` VALUES ('24', 'file', '7', 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '58', 'normal');
INSERT INTO `auth_rule` VALUES ('25', 'file', '7', 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '57', 'normal');
INSERT INTO `auth_rule` VALUES ('26', 'file', '7', 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '56', 'normal');
INSERT INTO `auth_rule` VALUES ('27', 'file', '7', 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '55', 'normal');
INSERT INTO `auth_rule` VALUES ('28', 'file', '7', 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '54', 'normal');
INSERT INTO `auth_rule` VALUES ('29', 'file', '8', 'general/profile/index', 'View', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '33', 'normal');
INSERT INTO `auth_rule` VALUES ('30', 'file', '8', 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '32', 'normal');
INSERT INTO `auth_rule` VALUES ('31', 'file', '8', 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '31', 'normal');
INSERT INTO `auth_rule` VALUES ('32', 'file', '8', 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '30', 'normal');
INSERT INTO `auth_rule` VALUES ('33', 'file', '8', 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '29', 'normal');
INSERT INTO `auth_rule` VALUES ('34', 'file', '8', 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '28', 'normal');
INSERT INTO `auth_rule` VALUES ('40', 'file', '9', 'auth/admin/index', 'View', 'fa fa-circle-o', '', 'Admin tips', '0', '1497429920', '1497429920', '117', 'normal');
INSERT INTO `auth_rule` VALUES ('41', 'file', '9', 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '116', 'normal');
INSERT INTO `auth_rule` VALUES ('42', 'file', '9', 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '115', 'normal');
INSERT INTO `auth_rule` VALUES ('43', 'file', '9', 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '114', 'normal');
INSERT INTO `auth_rule` VALUES ('44', 'file', '10', 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', 'Admin log tips', '0', '1497429920', '1497429920', '112', 'normal');
INSERT INTO `auth_rule` VALUES ('45', 'file', '10', 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '111', 'normal');
INSERT INTO `auth_rule` VALUES ('46', 'file', '10', 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '110', 'normal');
INSERT INTO `auth_rule` VALUES ('47', 'file', '11', 'auth/group/index', 'View', 'fa fa-circle-o', '', 'Group tips', '0', '1497429920', '1497429920', '108', 'normal');
INSERT INTO `auth_rule` VALUES ('48', 'file', '11', 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '107', 'normal');
INSERT INTO `auth_rule` VALUES ('49', 'file', '11', 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '106', 'normal');
INSERT INTO `auth_rule` VALUES ('50', 'file', '11', 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '105', 'normal');
INSERT INTO `auth_rule` VALUES ('51', 'file', '12', 'auth/rule/index', 'View', 'fa fa-circle-o', '', 'Rule tips', '0', '1497429920', '1497429920', '103', 'normal');
INSERT INTO `auth_rule` VALUES ('52', 'file', '12', 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '102', 'normal');
INSERT INTO `auth_rule` VALUES ('53', 'file', '12', 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '101', 'normal');
INSERT INTO `auth_rule` VALUES ('54', 'file', '12', 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '100', 'normal');
INSERT INTO `auth_rule` VALUES ('211', 'file', '0', 'user', '登陆中心', 'fa fa-user', '', '', '1', '1541576856', '1541576856', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('212', 'file', '211', 'user/index', '查看', 'fa fa-circle-o', '', '', '0', '1541576856', '1541576856', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('213', 'file', '211', 'user/add', '添加', 'fa fa-circle-o', '', '', '0', '1541576856', '1541576856', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('214', 'file', '211', 'user/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1541576856', '1541576856', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('215', 'file', '211', 'user/del', '删除', 'fa fa-circle-o', '', '', '0', '1541576856', '1541576856', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('216', 'file', '211', 'user/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1541576856', '1541576856', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('217', 'file', '0', 'ownner', '用户中心', 'fa fa-circle-o', '', '', '1', '1545318123', '1545318123', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('218', 'file', '217', 'ownner/index', '查看', 'fa fa-circle-o', '', '', '0', '1545318123', '1545318123', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('219', 'file', '217', 'ownner/add', '添加', 'fa fa-circle-o', '', '', '0', '1545318123', '1545318123', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('220', 'file', '217', 'ownner/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1545318123', '1545318123', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('221', 'file', '217', 'ownner/del', '删除', 'fa fa-circle-o', '', '', '0', '1545318123', '1545318123', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('222', 'file', '217', 'ownner/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1545318123', '1545318123', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('223', 'file', '0', 'content', '内容中心', 'fa fa-circle-o', '', '', '1', '1545318173', '1545318173', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('224', 'file', '223', 'content/index', '查看', 'fa fa-circle-o', '', '', '0', '1545318173', '1545318173', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('225', 'file', '223', 'content/add', '添加', 'fa fa-circle-o', '', '', '0', '1545318173', '1545318173', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('226', 'file', '223', 'content/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1545318173', '1545318173', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('227', 'file', '223', 'content/del', '删除', 'fa fa-circle-o', '', '', '0', '1545318173', '1545318173', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('228', 'file', '223', 'content/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1545318173', '1545318173', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('229', 'file', '0', 'comment', '评论中心', 'fa fa-comment', '', '', '1', '1545318185', '1545318185', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('230', 'file', '229', 'comment/index', '查看', 'fa fa-circle-o', '', '', '0', '1545318185', '1545318185', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('231', 'file', '229', 'comment/add', '添加', 'fa fa-circle-o', '', '', '0', '1545318185', '1545318185', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('232', 'file', '229', 'comment/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1545318185', '1545318185', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('233', 'file', '229', 'comment/del', '删除', 'fa fa-circle-o', '', '', '0', '1545318185', '1545318185', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('234', 'file', '229', 'comment/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1545318185', '1545318185', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('235', 'file', '0', 'picture', '图片中心', 'fa fa-circle-o', '', '', '1', '1545318271', '1545318271', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('236', 'file', '235', 'picture/index', '查看', 'fa fa-circle-o', '', '', '0', '1545318271', '1545318271', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('237', 'file', '235', 'picture/add', '添加', 'fa fa-circle-o', '', '', '0', '1545318271', '1545318271', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('238', 'file', '235', 'picture/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1545318271', '1545318271', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('239', 'file', '235', 'picture/del', '删除', 'fa fa-circle-o', '', '', '0', '1545318271', '1545318271', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('240', 'file', '235', 'picture/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1545318271', '1545318271', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('241', 'file', '0', 'zan', '评赞中心', 'fa fa-circle-o', '', '', '0', '1545318298', '1545320403', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('242', 'file', '241', 'zan/index', '查看', 'fa fa-circle-o', '', '', '0', '1545318298', '1545318298', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('243', 'file', '241', 'zan/add', '添加', 'fa fa-circle-o', '', '', '0', '1545318298', '1545318298', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('244', 'file', '241', 'zan/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1545318298', '1545318298', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('245', 'file', '241', 'zan/del', '删除', 'fa fa-circle-o', '', '', '0', '1545318298', '1545318298', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('246', 'file', '241', 'zan/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1545318298', '1545318298', '0', 'normal');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `contentid` varchar(255) NOT NULL COMMENT '评论序号',
  `content` varchar(255) CHARACTER SET gb2312 NOT NULL COMMENT '评论内容',
  `commenter` varchar(255) CHARACTER SET gb2312 NOT NULL COMMENT '评论人',
  `commentschoolnum` varchar(255) NOT NULL COMMENT '评论人学号',
  `isshow` varchar(255) NOT NULL COMMENT '是否显示',
  `commentcontent` varchar(255) CHARACTER SET gb2312 NOT NULL COMMENT '评论内容',
  `t` varchar(255) NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1 COMMENT='评论中心';

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('11', '4', '腾讯，你真好', '小胖', '2016512981', '1', '大萨达撒', '2018-11-25 15:07:14');
INSERT INTO `comment` VALUES ('12', '4', '腾讯，你真好', '', '', '1', '腾讯', '2018-11-25 15:17:13');
INSERT INTO `comment` VALUES ('13', '4', '腾讯，你真好', '', '', '1', '6666', '2018-11-25 15:17:18');
INSERT INTO `comment` VALUES ('14', '4', '腾讯，你真好', '', '', '1', '000123', '2018-11-25 15:17:23');
INSERT INTO `comment` VALUES ('15', '26', '表白殷嘉乐', '气质草郭', '2018510800', '0', '介绍个', '2018-11-27 17:52:39');
INSERT INTO `comment` VALUES ('16', '18', '1111', '小胖', '2016512981', '0', '大', '2018-11-27 22:10:41');
INSERT INTO `comment` VALUES ('17', '48', '表白我自己', '支小推', '2016512186', '0', 'dei', '2018-11-28 13:49:24');
INSERT INTO `comment` VALUES ('18', '74', '电路好难', '暂聆风吟', '2018510669', '0', '可怜你', '2018-11-28 13:58:47');
INSERT INTO `comment` VALUES ('19', '78', '我好想睡觉哇', '香草冰激凌', '2018510527', '0', '＋1', '2018-11-28 15:58:23');
INSERT INTO `comment` VALUES ('20', '101', '默默无闻', '小胖', '2016512981', '0', '55', '2018-11-28 16:49:28');
INSERT INTO `comment` VALUES ('21', '18', '1111', 'BOBO', '2018510493', '0', '1', '2018-11-28 20:13:02');
INSERT INTO `comment` VALUES ('22', '18', '1111', 'BOBO', '2018510493', '0', '1', '2018-11-28 20:13:03');
INSERT INTO `comment` VALUES ('23', '48', '表白我自己', '小胖', '2016512981', '0', '垃圾', '2018-11-30 00:00:13');
INSERT INTO `comment` VALUES ('24', '105', '表白一个小姐姐，希望她能看到。', '小胖', '2016512981', '0', '垃圾', '2018-11-30 00:00:39');
INSERT INTO `comment` VALUES ('25', '18', '1111', '小胖', '2016512981', '0', '哦哦', '2018-11-30 16:35:40');
INSERT INTO `comment` VALUES ('26', '108', '表白兄弟连！！！', '小胖', '2016512981', '0', '咯', '2018-11-30 16:40:46');
INSERT INTO `comment` VALUES ('27', '48', '表白我自己', 'a', '2017510489', '0', '略略略', '2018-12-03 12:35:06');
INSERT INTO `comment` VALUES ('28', '92', '表白吴宗震学长！！！！！', '小胖', '2016512981', '0', '好的', '2018-12-12 20:12:41');
INSERT INTO `comment` VALUES ('29', '131', 'test', '小胖', '2016512981', '0', '大', '2018-12-20 21:24:45');
INSERT INTO `comment` VALUES ('30', '48', '表白我自己', '宝藏女孩-', '2017510552', '0', '啊哈哈哈哈哈哈哈哈哈哈哈哈', '2018-12-20 23:54:15');
INSERT INTO `comment` VALUES ('31', '89', '真好', '宝藏女孩-', '2017510552', '0', '真好', '2018-12-20 23:54:44');
INSERT INTO `comment` VALUES ('32', '66', '我生命中的千山万水，任你一一告别。世间事，除了生死，哪一件不是闲事。', '玲珑', '2014512525', '0', '试试', '2018-12-21 08:34:47');
INSERT INTO `comment` VALUES ('33', '89', '真好', '玲珑', '2014512525', '0', '加油', '2018-12-21 08:35:03');
INSERT INTO `comment` VALUES ('34', '48', '表白我自己', '小胖', '2016512981', '0', '汇华', '2018-12-21 11:19:12');
INSERT INTO `comment` VALUES ('35', '26', '表白殷嘉乐', '', '', '0', '下次匿名吧，气质草郭一看就知道是谁了', '2018-12-24 08:43:18');
INSERT INTO `comment` VALUES ('36', '141', '大', '涛', '2016512372', '0', '  0', '2019-01-12 15:52:36');

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text NOT NULL COMMENT '变量值',
  `content` text NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统配置';

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', 'name', 'basic', 'Site name', '请填写站点名称', 'string', '木叶汇华Leaf', '', 'required', '');
INSERT INTO `config` VALUES ('2', 'beian', 'basic', 'Beian', '粤ICP备15054802号-4', 'string', '', '', '', '');
INSERT INTO `config` VALUES ('3', 'cdnurl', 'basic', 'Cdn url', '如果静态资源使用第三方云储存请配置该值', 'string', '', '', '', '');
INSERT INTO `config` VALUES ('4', 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '1.0.1', '', 'required', '');
INSERT INTO `config` VALUES ('5', 'timezone', 'basic', 'Timezone', '', 'string', 'Asia/Shanghai', '', 'required', '');
INSERT INTO `config` VALUES ('6', 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', '');
INSERT INTO `config` VALUES ('7', 'languages', 'basic', 'Languages', '', 'array', '{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}', '', 'required', '');
INSERT INTO `config` VALUES ('8', 'fixedpage', 'basic', 'Fixed page', '请尽量输入左侧菜单栏存在的链接', 'string', 'dashboard', '', 'required', '');
INSERT INTO `config` VALUES ('9', 'categorytype', 'dictionary', 'Category type', '', 'array', '{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}', '', '', '');
INSERT INTO `config` VALUES ('10', 'configgroup', 'dictionary', 'Config group', '', 'array', '{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}', '', '', '');
INSERT INTO `config` VALUES ('11', 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '1', '[\"Please select\",\"SMTP\",\"Mail\"]', '', '');
INSERT INTO `config` VALUES ('12', 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', 'smtp.qq.com', '', '', '');
INSERT INTO `config` VALUES ('13', 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '465', '', '', '');
INSERT INTO `config` VALUES ('14', 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '10000', '', '', '');
INSERT INTO `config` VALUES ('15', 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码）', 'string', 'password', '', '', '');
INSERT INTO `config` VALUES ('16', 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '2', '[\"None\",\"TLS\",\"SSL\"]', '', '');
INSERT INTO `config` VALUES ('17', 'mail_from', 'email', 'Mail from', '', 'string', '10000@qq.com', '', '', '');

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `schoolnum` varchar(255) NOT NULL DEFAULT '' COMMENT '学号',
  `name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '姓名',
  `maintext` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '评论内容',
  `type` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '评论类型',
  `niming` int(255) NOT NULL DEFAULT '0' COMMENT '是否匿名',
  `isdel` int(255) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `zanshu` int(255) NOT NULL COMMENT '赞数',
  `isshow` int(11) NOT NULL COMMENT '是否显示',
  `comment` varchar(255) NOT NULL COMMENT '评论数',
  `t` varchar(255) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=latin1 COMMENT='内容中心';

-- ----------------------------
-- Records of content
-- ----------------------------


-- ----------------------------
-- Table structure for ownner
-- ----------------------------
DROP TABLE IF EXISTS `ownner`;
CREATE TABLE `ownner` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `name` varchar(20) CHARACTER SET gbk NOT NULL COMMENT '名字',
  `sex` set('女','男') NOT NULL DEFAULT '' COMMENT '性别',
  `schoolnum` varchar(20) NOT NULL COMMENT '学号',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `image` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '图片地址',
  `openid` varchar(255) NOT NULL,
  `t` varchar(50) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8 COMMENT='用户中心';

-- ----------------------------
-- Records of ownner
-- ----------------------------


-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contenid` int(11) DEFAULT NULL COMMENT '内容序号',
  `openid` varchar(255) NOT NULL COMMENT 'openid',
  `path` varchar(255) NOT NULL COMMENT '路径',
  `isshow` int(255) DEFAULT NULL COMMENT '是否展示',
  `t` varchar(255) NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=latin1 COMMENT='图片中心';

-- ----------------------------
-- Records of picture
-- ----------------------------


-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `name` varchar(20) CHARACTER SET gbk NOT NULL COMMENT '名字',
  `sex` set('女','男') NOT NULL DEFAULT '' COMMENT '性别',
  `schoolnum` varchar(20) NOT NULL COMMENT '学号',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `image` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '图片地址',
  `openid` varchar(50) NOT NULL,
  `t` varchar(50) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=675 DEFAULT CHARSET=utf8 COMMENT='登陆中心';

-- ----------------------------
-- Records of user
-- ----------------------------


-- ----------------------------
-- Table structure for zan
-- ----------------------------
DROP TABLE IF EXISTS `zan`;
CREATE TABLE `zan` (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `zanid` int(255) NOT NULL COMMENT '被赞序号',
  `zaner` varchar(255) CHARACTER SET gb2312 NOT NULL COMMENT '赞人姓名',
  `iszan` varchar(255) NOT NULL COMMENT '是否被赞',
  `zanerschoolnum` varchar(255) NOT NULL COMMENT '攒者学号',
  `t` varchar(255) NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=latin1 COMMENT='评赞中心';

-- ----------------------------
-- Records of zan
-- ----------------------------
