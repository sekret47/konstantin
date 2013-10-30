/*
Navicat MySQL Data Transfer

Source Server         : 1
Source Server Version : 50523
Source Host           : localhost:3306
Source Database       : oms

Target Server Type    : MYSQL
Target Server Version : 50523
File Encoding         : 65001

Date: 2013-10-30 21:16:13
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `auth_assignment`
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('admin', '1', null, null);
INSERT INTO `auth_assignment` VALUES ('admin', '18', null, 'N;');
INSERT INTO `auth_assignment` VALUES ('admin', '19', null, 'N;');
INSERT INTO `auth_assignment` VALUES ('customer', '20', null, 'N;');
INSERT INTO `auth_assignment` VALUES ('customer', '4', null, null);
INSERT INTO `auth_assignment` VALUES ('merchandiser', '3', null, null);
INSERT INTO `auth_assignment` VALUES ('supervisor', '2', null, null);

-- ----------------------------
-- Table structure for `auth_item`
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('admin', '2', null, null, null);
INSERT INTO `auth_item` VALUES ('customer', '2', null, null, null);
INSERT INTO `auth_item` VALUES ('merchandiser', '2', null, null, null);
INSERT INTO `auth_item` VALUES ('supervisor', '2', null, null, null);

-- ----------------------------
-- Table structure for `auth_item_child`
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `account_balance` decimal(6,2) DEFAULT NULL,
  `customer_type` enum('Standart','Silver','Gold','Platinum') DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('4', '2000.00', 'Gold');
INSERT INTO `customer` VALUES ('5', '1000.00', 'Silver');

-- ----------------------------
-- Table structure for `dimension`
-- ----------------------------
DROP TABLE IF EXISTS `dimension`;
CREATE TABLE `dimension` (
  `id_dimension` int(11) NOT NULL AUTO_INCREMENT,
  `dimension` varchar(255) NOT NULL,
  `count_of_items` int(11) NOT NULL,
  PRIMARY KEY (`id_dimension`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dimension
-- ----------------------------
INSERT INTO `dimension` VALUES ('1', 'Item', '1');
INSERT INTO `dimension` VALUES ('2', 'Box', '5');
INSERT INTO `dimension` VALUES ('3', 'Package', '10');

-- ----------------------------
-- Table structure for `item`
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `id_item` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(6,2) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id_item`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('1', '1.00', 'phone', 'apparatus for transmitting and receiving sound (mainly - human speech) at a distance.\r\n Modern phones transmit via electrical signals.', '67');
INSERT INTO `item` VALUES ('2', '2.00', 'Tablet PC 2 Exclusives', 'Just about any tablet from an established, reputable manufacturer would easily perform the functions you need', '89');
INSERT INTO `item` VALUES ('3', '3.00', 'phone', 'apparatus for transmitting and receiving sound (mainly - human speech) at a distance. Modern phones transmit via electrical signals.', '88');
INSERT INTO `item` VALUES ('4', '4.00', 'iPad mini 16gb', 'The screen is 7.9 \"(1024 x 768 pixels) with IPS-matrix / 16 million color / touch, capacitive / with oleophobic coating\nProcessor dual core Apple A5 (1GHz)\nWireless connectivity Wi-Fi (802.11a/b/g/n) / Bluetooth 4.0', '99');
INSERT INTO `item` VALUES ('5', '5.00', 'iPod Nano 7Gen 16GB (PRODUCT) RED', 'The display on the player: 2.5 Audio: AAC, Protected AAC, HE-AAC, MP3, MP3 VBR, Audible, Apple Lossless, AIFF and WAV Video: MPEG-4, m4v, mp4, mov, H.264 Power supply: Li-Ion battery Built-in memory, GB 16', '100');

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id_order` int(11) NOT NULL AUTO_INCREMENT,
  `order_name` varchar(128) NOT NULL,
  `total_price` decimal(12,2) NOT NULL,
  `auto_index` int(4) DEFAULT NULL,
  `max_discount` int(4) NOT NULL DEFAULT '0',
  `delivery_date` date NOT NULL DEFAULT '0000-00-00',
  `preferable_date` date NOT NULL,
  `order_date` date NOT NULL,
  `status` enum('Created','Delivered','Ordered','Pending') DEFAULT NULL,
  `assignee` int(11) NOT NULL,
  `customer` int(11) NOT NULL,
  `trash` bit(1) DEFAULT b'0',
  `gift` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id_order`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1', 'aaa1', '152.00', null, '2', '2012-12-06', '2002-11-09', '2002-12-07', 'Delivered', '3', '4', '\0', '\0');
INSERT INTO `order` VALUES ('2', 'aaa2', '1002.20', null, '20', '2012-12-08', '2002-11-09', '2002-11-09', 'Ordered', '1', '5', '\0', '\0');
INSERT INTO `order` VALUES ('3', 'rty42', '335.22', null, '22', '2013-03-23', '2002-11-09', '2002-11-09', 'Delivered', '3', '4', '\0', '\0');
INSERT INTO `order` VALUES ('4', 'ffgtr2', '5543.33', null, '11', '4120-12-08', '2002-11-09', '2002-11-09', 'Delivered', '2', '4', '\0', '');
INSERT INTO `order` VALUES ('5', 'eer41', '12346.43', null, '6', '1954-02-19', '2002-11-09', '2002-11-09', 'Delivered', '3', '4', '\0', '\0');
INSERT INTO `order` VALUES ('6', 'vbnbt2', '55632.22', null, '5', '2019-07-22', '2002-11-09', '2002-11-09', 'Ordered', '4', '5', '\0', '\0');
INSERT INTO `order` VALUES ('7', '2344vv2', '22356.15', null, '66', '2017-09-01', '2002-11-09', '2002-11-09', 'Delivered', '4', '4', '\0', '\0');
INSERT INTO `order` VALUES ('8', 'gvfv5r2', '5861.33', null, '5', '2100-01-07', '2002-11-09', '2002-11-09', 'Pending', '1', '4', '\0', '\0');
INSERT INTO `order` VALUES ('9', 'ddwwd2', '66543.23', null, '12', '1988-08-08', '2002-11-09', '2002-11-09', 'Ordered', '2', '5', '\0', '\0');
INSERT INTO `order` VALUES ('10', '11242', '2345.65', null, '44', '2012-08-23', '2002-11-09', '2002-11-09', 'Created', '3', '4', '\0', '\0');
INSERT INTO `order` VALUES ('11', 'vccd2', '1234.20', null, '54', '2012-06-08', '2002-11-09', '2002-11-09', 'Ordered', '1', '4', '\0', '\0');
INSERT INTO `order` VALUES ('12', 'aaa3', '5892.10', null, '40', '2009-10-11', '2002-11-09', '2002-11-09', 'Pending', '3', '5', '\0', '\0');
INSERT INTO `order` VALUES ('13', 'aaa4', '1402.29', null, '15', '2007-08-01', '2002-11-09', '2002-11-09', 'Created', '2', '5', '\0', '\0');

-- ----------------------------
-- Table structure for `order_details`
-- ----------------------------
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details` (
  `id_order_details` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `id_dimension` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id_order_details`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_details
-- ----------------------------
INSERT INTO `order_details` VALUES ('1', '1', '1', '2', '4', '10', '2200.00');
INSERT INTO `order_details` VALUES ('2', '2', '2', '2', '4', '20', '2200.22');
INSERT INTO `order_details` VALUES ('3', '3', '3', '3', '4', '30', '265.22');

-- ----------------------------
-- Table structure for `price`
-- ----------------------------
DROP TABLE IF EXISTS `price`;
CREATE TABLE `price` (
  `id_price` int(11) NOT NULL AUTO_INCREMENT,
  `id_item` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_price`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of price
-- ----------------------------
INSERT INTO `price` VALUES ('1', '1', '10', null);
INSERT INTO `price` VALUES ('2', '2', '20', null);
INSERT INTO `price` VALUES ('3', '3', '30', null);
INSERT INTO `price` VALUES ('4', '4', '40', null);
INSERT INTO `price` VALUES ('5', '5', '50', null);

-- ----------------------------
-- Table structure for `pxshj_assets`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_assets`;
CREATE TABLE `pxshj_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_assets
-- ----------------------------
INSERT INTO `pxshj_assets` VALUES ('1', '0', '1', '121', '0', 'root.1', 'Root Asset', '{\"core.login.site\":{\"6\":1,\"2\":1},\"core.login.admin\":{\"6\":1},\"core.login.offline\":{\"6\":1},\"core.admin\":{\"8\":1},\"core.manage\":{\"7\":1},\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}');
INSERT INTO `pxshj_assets` VALUES ('2', '1', '1', '2', '1', 'com_admin', 'com_admin', '{}');
INSERT INTO `pxshj_assets` VALUES ('3', '1', '3', '6', '1', 'com_banners', 'com_banners', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `pxshj_assets` VALUES ('4', '1', '7', '8', '1', 'com_cache', 'com_cache', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}');
INSERT INTO `pxshj_assets` VALUES ('5', '1', '9', '10', '1', 'com_checkin', 'com_checkin', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}');
INSERT INTO `pxshj_assets` VALUES ('6', '1', '11', '12', '1', 'com_config', 'com_config', '{}');
INSERT INTO `pxshj_assets` VALUES ('7', '1', '13', '16', '1', 'com_contact', 'com_contact', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}');
INSERT INTO `pxshj_assets` VALUES ('8', '1', '17', '60', '1', 'com_content', 'com_content', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}');
INSERT INTO `pxshj_assets` VALUES ('9', '1', '61', '62', '1', 'com_cpanel', 'com_cpanel', '{}');
INSERT INTO `pxshj_assets` VALUES ('10', '1', '63', '64', '1', 'com_installer', 'com_installer', '{\"core.admin\":[],\"core.manage\":{\"7\":0},\"core.delete\":{\"7\":0},\"core.edit.state\":{\"7\":0}}');
INSERT INTO `pxshj_assets` VALUES ('11', '1', '65', '66', '1', 'com_languages', 'com_languages', '{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `pxshj_assets` VALUES ('12', '1', '67', '68', '1', 'com_login', 'com_login', '{}');
INSERT INTO `pxshj_assets` VALUES ('13', '1', '69', '70', '1', 'com_mailto', 'com_mailto', '{}');
INSERT INTO `pxshj_assets` VALUES ('14', '1', '71', '72', '1', 'com_massmail', 'com_massmail', '{}');
INSERT INTO `pxshj_assets` VALUES ('15', '1', '73', '74', '1', 'com_media', 'com_media', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":{\"5\":1}}');
INSERT INTO `pxshj_assets` VALUES ('16', '1', '75', '76', '1', 'com_menus', 'com_menus', '{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `pxshj_assets` VALUES ('17', '1', '77', '78', '1', 'com_messages', 'com_messages', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}');
INSERT INTO `pxshj_assets` VALUES ('18', '1', '79', '80', '1', 'com_modules', 'com_modules', '{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `pxshj_assets` VALUES ('19', '1', '81', '84', '1', 'com_newsfeeds', 'com_newsfeeds', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}');
INSERT INTO `pxshj_assets` VALUES ('20', '1', '85', '86', '1', 'com_plugins', 'com_plugins', '{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `pxshj_assets` VALUES ('21', '1', '87', '88', '1', 'com_redirect', 'com_redirect', '{\"core.admin\":{\"7\":1},\"core.manage\":[]}');
INSERT INTO `pxshj_assets` VALUES ('22', '1', '89', '90', '1', 'com_search', 'com_search', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}');
INSERT INTO `pxshj_assets` VALUES ('23', '1', '91', '92', '1', 'com_templates', 'com_templates', '{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `pxshj_assets` VALUES ('24', '1', '93', '96', '1', 'com_users', 'com_users', '{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `pxshj_assets` VALUES ('25', '1', '97', '100', '1', 'com_weblinks', 'com_weblinks', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}');
INSERT INTO `pxshj_assets` VALUES ('26', '1', '101', '102', '1', 'com_wrapper', 'com_wrapper', '{}');
INSERT INTO `pxshj_assets` VALUES ('27', '8', '18', '33', '2', 'com_content.category.2', 'Uncategorised', '{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}');
INSERT INTO `pxshj_assets` VALUES ('28', '3', '4', '5', '2', 'com_banners.category.3', 'Uncategorised', '{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `pxshj_assets` VALUES ('29', '7', '14', '15', '2', 'com_contact.category.4', 'Uncategorised', '{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}');
INSERT INTO `pxshj_assets` VALUES ('30', '19', '82', '83', '2', 'com_newsfeeds.category.5', 'Uncategorised', '{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}');
INSERT INTO `pxshj_assets` VALUES ('31', '25', '98', '99', '2', 'com_weblinks.category.6', 'Uncategorised', '{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}');
INSERT INTO `pxshj_assets` VALUES ('32', '24', '94', '95', '1', 'com_users.category.7', 'Uncategorised', '{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `pxshj_assets` VALUES ('33', '1', '103', '104', '1', 'com_finder', 'com_finder', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}');
INSERT INTO `pxshj_assets` VALUES ('34', '1', '105', '106', '1', 'com_joomlaupdate', 'com_joomlaupdate', '{\"core.admin\":[],\"core.manage\":[],\"core.delete\":[],\"core.edit.state\":[]}');
INSERT INTO `pxshj_assets` VALUES ('35', '1', '107', '108', '1', 'com_helloworld', 'helloworld', '{}');
INSERT INTO `pxshj_assets` VALUES ('36', '27', '19', '20', '3', 'com_content.article.1', 'Главная', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}');
INSERT INTO `pxshj_assets` VALUES ('37', '27', '21', '22', '3', 'com_content.article.2', 'Галерея', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}');
INSERT INTO `pxshj_assets` VALUES ('38', '27', '23', '24', '3', 'com_content.article.3', 'Галерея 2', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}');
INSERT INTO `pxshj_assets` VALUES ('39', '27', '25', '26', '3', 'com_content.article.4', 'Услуги', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}');
INSERT INTO `pxshj_assets` VALUES ('40', '27', '27', '28', '3', 'com_content.article.5', 'Контакты', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}');
INSERT INTO `pxshj_assets` VALUES ('41', '27', '29', '30', '3', 'com_content.article.6', 'Список прайс-листов', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}');
INSERT INTO `pxshj_assets` VALUES ('42', '27', '31', '32', '3', 'com_content.article.7', 'Видео', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}');
INSERT INTO `pxshj_assets` VALUES ('43', '1', '117', '118', '1', 'com_youtubegallery', 'com_youtubegallery', '{}');
INSERT INTO `pxshj_assets` VALUES ('44', '1', '119', '120', '1', 'com_easy_youtube_gallery', 'com_easy_youtube_gallery', '{}');
INSERT INTO `pxshj_assets` VALUES ('45', '8', '34', '39', '2', 'com_content.category.8', 'Статьи', '{\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}');
INSERT INTO `pxshj_assets` VALUES ('46', '45', '35', '36', '3', 'com_content.article.8', 'Готовимся к ремонту.Быть или не быть?', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}');
INSERT INTO `pxshj_assets` VALUES ('47', '45', '37', '38', '3', 'com_content.article.9', 'Как сделать ремонт?', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}');
INSERT INTO `pxshj_assets` VALUES ('48', '8', '40', '41', '2', 'com_content.category.9', 'Капитальное строительство', '{\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}');
INSERT INTO `pxshj_assets` VALUES ('49', '8', '42', '49', '2', 'com_content.category.10', 'Натяжные потолки', '{\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}');
INSERT INTO `pxshj_assets` VALUES ('50', '49', '43', '44', '3', 'com_content.article.10', 'Натяжные потолки', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}');
INSERT INTO `pxshj_assets` VALUES ('51', '49', '45', '46', '3', 'com_content.article.11', 'Часто задаваемые вопросы', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}');
INSERT INTO `pxshj_assets` VALUES ('52', '49', '47', '48', '3', 'com_content.article.12', 'Общая информация и правила экспуатациии', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}');
INSERT INTO `pxshj_assets` VALUES ('53', '8', '50', '59', '2', 'com_content.category.11', 'Мебель', '{\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}');
INSERT INTO `pxshj_assets` VALUES ('54', '53', '51', '52', '3', 'com_content.article.13', 'Мебель', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}');
INSERT INTO `pxshj_assets` VALUES ('55', '53', '53', '54', '3', 'com_content.article.14', 'Галерея кухонь', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}');
INSERT INTO `pxshj_assets` VALUES ('56', '53', '55', '56', '3', 'com_content.article.15', 'Галерея кухонь 2', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}');
INSERT INTO `pxshj_assets` VALUES ('57', '53', '57', '58', '3', 'com_content.article.16', 'Галерея кухонь 3', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}');

-- ----------------------------
-- Table structure for `pxshj_associations`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_associations`;
CREATE TABLE `pxshj_associations` (
  `id` varchar(50) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_associations
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_banners`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_banners`;
CREATE TABLE `pxshj_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `custombannercode` varchar(2048) NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `params` text NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_banners
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_banner_clients`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_banner_clients`;
CREATE TABLE `pxshj_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_banner_clients
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_banner_tracks`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_banner_tracks`;
CREATE TABLE `pxshj_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_banner_tracks
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_categories`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_categories`;
CREATE TABLE `pxshj_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_categories
-- ----------------------------
INSERT INTO `pxshj_categories` VALUES ('1', '0', '0', '0', '21', '0', '', 'system', 'ROOT', 'root', '', '', '1', '0', '0000-00-00 00:00:00', '1', '{}', '', '', '', '0', '2009-10-18 16:07:09', '0', '0000-00-00 00:00:00', '0', '*');
INSERT INTO `pxshj_categories` VALUES ('2', '27', '1', '1', '2', '1', 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', '1', '512', '2013-10-26 14:43:58', '1', '{\"target\":\"\",\"image\":\"\"}', '', '', '{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}', '42', '2010-06-28 13:26:37', '0', '0000-00-00 00:00:00', '0', '*');
INSERT INTO `pxshj_categories` VALUES ('3', '28', '1', '3', '4', '1', 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', '1', '0', '0000-00-00 00:00:00', '1', '{\"target\":\"\",\"image\":\"\",\"foobar\":\"\"}', '', '', '{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}', '42', '2010-06-28 13:27:35', '0', '0000-00-00 00:00:00', '0', '*');
INSERT INTO `pxshj_categories` VALUES ('4', '29', '1', '5', '6', '1', 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', '1', '0', '0000-00-00 00:00:00', '1', '{\"target\":\"\",\"image\":\"\"}', '', '', '{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}', '42', '2010-06-28 13:27:57', '0', '0000-00-00 00:00:00', '0', '*');
INSERT INTO `pxshj_categories` VALUES ('5', '30', '1', '7', '8', '1', 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', '1', '0', '0000-00-00 00:00:00', '1', '{\"target\":\"\",\"image\":\"\"}', '', '', '{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}', '42', '2010-06-28 13:28:15', '0', '0000-00-00 00:00:00', '0', '*');
INSERT INTO `pxshj_categories` VALUES ('6', '31', '1', '9', '10', '1', 'uncategorised', 'com_weblinks', 'Uncategorised', 'uncategorised', '', '', '1', '0', '0000-00-00 00:00:00', '1', '{\"target\":\"\",\"image\":\"\"}', '', '', '{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}', '42', '2010-06-28 13:28:33', '0', '0000-00-00 00:00:00', '0', '*');
INSERT INTO `pxshj_categories` VALUES ('7', '32', '1', '11', '12', '1', 'uncategorised', 'com_users', 'Uncategorised', 'uncategorised', '', '', '1', '0', '0000-00-00 00:00:00', '1', '{\"target\":\"\",\"image\":\"\"}', '', '', '{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}', '42', '2010-06-28 13:28:33', '0', '0000-00-00 00:00:00', '0', '*');
INSERT INTO `pxshj_categories` VALUES ('8', '45', '1', '13', '14', '1', 'articles', 'com_content', 'Статьи', 'articles', '', '', '1', '512', '2013-10-28 09:22:19', '1', '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', '512', '2013-10-28 08:23:57', '0', '0000-00-00 00:00:00', '0', '*');
INSERT INTO `pxshj_categories` VALUES ('9', '48', '1', '15', '16', '1', '2013-10-28-11-22-14', 'com_content', 'Капитальное строительство', '2013-10-28-11-22-14', '', '', '1', '0', '0000-00-00 00:00:00', '1', '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', '512', '2013-10-28 11:22:14', '0', '0000-00-00 00:00:00', '0', '*');
INSERT INTO `pxshj_categories` VALUES ('10', '49', '1', '17', '18', '1', '2013-10-28-11-27-43', 'com_content', 'Натяжные потолки', '2013-10-28-11-27-43', '', '', '1', '0', '0000-00-00 00:00:00', '1', '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', '512', '2013-10-28 11:27:43', '0', '0000-00-00 00:00:00', '0', '*');
INSERT INTO `pxshj_categories` VALUES ('11', '53', '1', '19', '20', '1', '2013-10-29-14-39-00', 'com_content', 'Мебель', '2013-10-29-14-39-00', '', '', '1', '0', '0000-00-00 00:00:00', '1', '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', '512', '2013-10-29 14:39:00', '0', '0000-00-00 00:00:00', '0', '*');

-- ----------------------------
-- Table structure for `pxshj_contact_details`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_contact_details`;
CREATE TABLE `pxshj_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `imagepos` varchar(20) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  `sortname1` varchar(255) NOT NULL,
  `sortname2` varchar(255) NOT NULL,
  `sortname3` varchar(255) NOT NULL,
  `language` char(7) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_contact_details
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_content`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_content`;
CREATE TABLE `pxshj_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `title_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Deprecated in Joomla! 3.0',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `sectionid` int(10) unsigned NOT NULL DEFAULT '0',
  `mask` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` varchar(5120) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_content
-- ----------------------------
INSERT INTO `pxshj_content` VALUES ('1', '36', 'Главная', '2013-10-25-18-19-59', '', '<div class=\"article_background\">\r\n<h1 style=\"text-align: center;\">Отделка помещений.<br /> Ремонтно –отделочные работы.<br /> Комплексный и косметический ремонт квартир, домов, офисов в Севастополе.</h1>\r\n<h2 style=\"text-align: center;\"><em><strong>«Самый верный путь узнать стоимость ремонта — бесплатно вызвать замерщика»</strong></em></h2>\r\n<p>Мы занимаемся любыми видами ремонта: начиная от косметического ремонта в отдельных комнатах частных квартир и заканчивая глобальным «капитальным» ремонтом.</p>\r\n<p>Настоящий качественный ремонт квартиры — это задача не из легких. Решить ее самостоятельно достаточно сложно, ведь нужно иметь много свободного времени и обладать определенными знаниями и опытом в ремонте квартир. Поэтому опытные люди, решившись на ремонт квартир или другого жилья, предпочитают обращаться к профессионалам. Тут Вам и гарантия результата, и умеренные цены, и работа, сданная в срок и главное — ремонт. Хороший и долговечный, который будет радовать Вас изо дня в день.</p>\r\n<p>Мы выполняем ремонт в Севастополе уже более 18 лет. Для нас ремонт типовых квартир— основной вид деятельности. Взявшись за дом, офис или квартиру, мы привносим частичку своего творчества, умения и души, помогая нашим клиентам сделать их помещения более красивыми, надежными, функциональными, совершенными, стильными и безопасными.</p>\r\n<p>Любому человеку хочется, чтобы его дом всегда был таким, как будто его только что отремонтировали. Свежесть, эффект новизны — все это добавляет жизни радости, которой очень не хватает в современном мире. Продлить этот эффект можно, но только при условии, что ремонт квартиры выполнен профессионалами.</p>\r\n<p>С помощью нас и наших надежных партнеров по ремонту квартир любые Ваши идеи касательно дизайна интерьера, капитального и косметического ремонта, установки металлопластиковых окон и дверей, систем кондиционирования,натяжных потолков будут реализованы.</p>\r\n<p>Ремонт квартиры, офиса или дома всегда сопряжен с огромным количеством физической работы, расчетов, долгими подборами строительных материалов, грудой мусора и так далее. Наши специалисты выполнят качественный ремонт квартир «под ключ», который не ассоциируется у наших клиентов с трудностями. Мы все берем на себя: перепланировки, смену сантехники, подбор материалов, отделку помещений, смену дверей, а так же установку бытовых приборов.</p>\r\n<h2 style=\"text-align: center;\">Строительство домов, коттеджей.</h2>\r\n<p>Наши надежные партнеры по строительству домов, построят дом или коттедж, быстро, качественно и с гарантией, по завершению строительства дома мы можем приступить к ремонтно – отделочным работам, изготовить и установить корпусную мебель по размерам и стилю Вашего построенного дома. Таким образом объединив наши усилия мы сможем построить дом Вашей мечты.</p>\r\n<p>Перед тем, как приступить к работе мы спланируют будущий проект помещения и составим общую смету, чтобы задуманное обошлось Вам как можно дешевле.</p>\r\n<h3 style=\"text-align: center;\">Мы воплощаем пожелания клиентов в реальность.</h3>\r\n</div>', '', '1', '0', '0', '2', '2013-10-25 18:19:59', '512', '', '2013-10-28 10:00:48', '512', '0', '0000-00-00 00:00:00', '2013-10-25 18:19:59', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"0\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"0\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"show_vote\":\"0\",\"show_hits\":\"0\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', '10', '0', '7', '', '', '1', '0', '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', '1', '*', '');
INSERT INTO `pxshj_content` VALUES ('2', '37', 'Галерея', '2013-10-26-15-06-31', '', '<p>ввввввв</p>\r\n<p>{gallery}gallery1{/gallery}</p>', '', '1', '0', '0', '2', '2013-10-26 15:06:31', '512', '', '2013-10-26 19:28:46', '512', '0', '0000-00-00 00:00:00', '2013-10-26 15:06:31', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', '6', '0', '6', '', '', '1', '47', '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', '0', '*', '');
INSERT INTO `pxshj_content` VALUES ('3', '38', 'Галерея 2', '2', '', '<p>{gallery}gallery1{/gallery}</p>', '', '1', '0', '0', '2', '2013-10-26 19:27:54', '512', '', '0000-00-00 00:00:00', '0', '0', '0000-00-00 00:00:00', '2013-10-26 19:27:54', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', '1', '0', '5', '', '', '1', '7', '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', '0', '*', '');
INSERT INTO `pxshj_content` VALUES ('4', '39', 'Услуги', '2013-10-26-19-51-09', '', '<div class=\"art-article\">\r\n<h1 style=\"text-align: center;\">ВСЕ ВИДЫ РЕМОНТНО-ОТДЕЛОЧНЫХ РАБОТ:</h1>\r\n<ul>\r\n<li>\r\n<h3><span style=\"color: #000000;\">демонтаж</span></h3>\r\n</li>\r\n<li>\r\n<h3 style=\"text-align: left;\"><span style=\"color: #000000;\">монтажные работы</span></h3>\r\n</li>\r\n<li>\r\n<h3 style=\"text-align: left;\"><span style=\"color: #000000;\">штукатурные</span></h3>\r\n</li>\r\n<li>\r\n<h3><span style=\"color: #000000;\">малярные</span></h3>\r\n</li>\r\n<li></li>\r\n<li>\r\n<h3 style=\"text-align: left;\"><span style=\"color: #000000;\">конструкции из гипсокартона</span></h3>\r\n</li>\r\n<li>\r\n<h3><span style=\"color: #000000;\">кафельная плитка</span></h3>\r\n</li>\r\n<li>\r\n<h3><span style=\"color: #000000;\">столярные</span></h3>\r\n</li>\r\n<li>\r\n<h3><span style=\"color: #000000;\">электромонтажные</span></h3>\r\n</li>\r\n<li>\r\n<h3><span style=\"color: #000000;\">сантехнические</span></h3>\r\n</li>\r\n<li>\r\n<h3 style=\"text-align: left;\"><span style=\"color: #000000;\">консультация</span></h3>\r\n</li>\r\n<li>\r\n<h3 style=\"text-align: left;\"><span style=\"color: #000000;\">помощь в подборе стройматериалов</span></h3>\r\n</li>\r\n<li>\r\n<h3 style=\"text-align: left;\"><span style=\"color: #000000;\">доставка материала на объект</span></h3>\r\n</li>\r\n</ul>\r\n</div>', '', '1', '0', '0', '2', '2013-10-26 19:51:09', '512', '', '0000-00-00 00:00:00', '0', '0', '0000-00-00 00:00:00', '2013-10-26 19:51:09', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', '1', '0', '4', '', '', '1', '4', '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', '0', '*', '');
INSERT INTO `pxshj_content` VALUES ('5', '40', 'Контакты', '2013-10-26-19-54-10', '', '<ul>\r\n<li>\r\n<h3>моб.(095)218-79-44</h3>\r\n</li>\r\n<li>\r\n<h3>тел.(0692)93-34-94</h3>\r\n</li>\r\n<li>\r\n<h3>E-mail: <a href=\"mailto:konstant-1@ya.ru\">konstant-1@ya.ru</a></h3>\r\n</li>\r\n</ul>', '', '1', '0', '0', '2', '2013-10-26 19:54:10', '512', '', '0000-00-00 00:00:00', '0', '0', '0000-00-00 00:00:00', '2013-10-26 19:54:10', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', '1', '0', '3', '', '', '1', '4', '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', '0', '*', '');
INSERT INTO `pxshj_content` VALUES ('6', '41', 'Список прайс-листов', '2013-10-26-20-00-41', '', '<p><a href=\"https://docs.google.com/document/d/1ln4vXHgaZGjsOp6ezff09VtG0RubQQb4eeD85C_rW1s/edit\">Прайс-лист ремонтно строительных работ</a></p>', '', '1', '0', '0', '2', '2013-10-26 20:00:41', '512', '', '0000-00-00 00:00:00', '0', '0', '0000-00-00 00:00:00', '2013-10-26 20:00:41', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', '1', '0', '2', '', '', '1', '9', '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', '0', '*', '');
INSERT INTO `pxshj_content` VALUES ('7', '42', 'Видео', '2013-10-26-20-14-56', '', '<div id=\"frame\"> </div>', '', '1', '0', '0', '2', '2013-10-26 20:14:56', '512', '', '2013-10-29 12:43:48', '512', '0', '0000-00-00 00:00:00', '2013-10-26 20:14:56', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', '35', '0', '1', '', '', '1', '88', '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', '0', '*', '');
INSERT INTO `pxshj_content` VALUES ('8', '46', 'Готовимся к ремонту.Быть или не быть?', 'gotovimsiya-k-remontu', '', '<h1 style=\"text-align: center;\">Готовимся к ремонту. Быть или не быть?  </h1>\r\n<p> </p>\r\n<p>В каждом доме рано или поздно встает вопрос о ремонте. Но как же быть с тем утверждением, что ремонт можно начать, но не закончить. Так ли это? Скорее всего, поговорка относится к тем, кто принимает решение делать ремонт самостоятельно, в свободное от работы время. Мы не будем рассказывать вам, сколько проблем может повлечь за собой подобное решение, но поверьте — они будут. Лучше сразу доверить ремонтные работы профессионалам. Ведь такой шаг гарантирует Вам не только качество, но и строгое соблюдение сроков.</p>\r\n', '\r\n<p> </p>\r\n<p>   Итак, вы на пороге перемен в вашей квартире. С чего начать ремонт? Как выбрать отделочные материалы?</p>\r\n<p>Какими должны быть преобразования: чисто косметическими или капитальными с перепланировкой? Вопросов много, но ответить на них может только специалист, то есть человек, имеющий большой опыт работы в этой сфере.</p>\r\n<p>В общих чертах мы расскажем вам о существующих видах ремонтных работ: <span style=\"font-size: 15px; font-family: Arial; background-color: transparent; font-weight: normal; font-style: italic; vertical-align: baseline; white-space: pre-wrap;\">косметический, капитальный и евроремонт</span><span style=\"font-size: 15px; font-family: Arial; background-color: transparent; font-weight: normal; vertical-align: baseline; white-space: pre-wrap;\">.</span></p>\r\n<p>ремонт является самым недорогим видом реставрации вашего жилья или офиса. Вам заменят обои, покрасят потолки, сделают напольное покрытие, заменят деревянные рамы стеклопакетами, а так же обновят двери и наличники.</p>\r\n<p>ремонт может быть комплексным или выборочным. И та и другая разновидность предполагает полную замену сантехники, окон и дверей, демонтаж старых покрытий, облицовку стен и полов плиткой, замену коммуникаций инженерного оборудования. Кроме того, в ходе ремонта может быть частично изменена планировка квартиры (разумеется, перемещаются или сносятся не несущие стены), а также приведены в исправное состояние конструктивные элементы дома.  </p>\r\n<p>квартир является самым дорогостоящим и сложным в исполнении видом преобразования вашего дома. Зачастую он начинается с разработки индивидуального  дизайн - проекта. Поэтапно включает в себя: монтаж электропроводки и электрооборудования, монтаж климатической техники, сантехнических коммуникаций, монтаж систем наблюдения и защиты, монтаж подвесных или натяжных потолков, укладку напольного покрытия, замену радиаторов, окон и дверей, полную замену сантехники, укладку облицовочной плитки…</p>\r\n<p>  Все вышеперечисленные виды ремонта весьма приблизительны. То, что необходимо именно вам решается индивидуально. Поэтому начните долгожданные перемены в доме с вызова сметчика, чтобы он оценил объемы предстоящих работ, рассчитал расходные материалы, учел все нюансы предстоящего ремонта.</p>\r\n<p>  Ни одна консультация по телефону относительно стоимости ремонта вашей квартиры не заменит выезд специалиста к вам на дом. Специалиста можно вызвать по телефонам <span style=\"font-size: 15px; font-family: Arial; background-color: transparent; vertical-align: baseline; white-space: pre-wrap;\">(095) 218-79-44, (0692) 93-34-94</span><span style=\"font-size: 15px; font-family: Arial; background-color: transparent; font-weight: normal; vertical-align: baseline; white-space: pre-wrap;\"> или с помощью заполнения формы на сайте.</span></p>', '1', '0', '0', '8', '2013-10-28 08:28:21', '512', '', '2013-10-28 09:17:34', '512', '0', '0000-00-00 00:00:00', '2013-10-28 08:28:21', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\\u0427\\u0438\\u0442\\u0430\\u0442\\u044c \\u0434\\u0430\\u043b\\u0435\\u0435...\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', '7', '0', '0', '', '', '1', '2', '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', '0', '*', '');
INSERT INTO `pxshj_content` VALUES ('9', '47', 'Как сделать ремонт?', 'kak-sdelat-remont', '', '<h1 style=\"text-align: center;\">Как сделать ремонт?</h1>\r\n<p>   Ремонт давно уже перестал быть глобальной проблемой и стал просто одним из этапов жизни, пунктом в плане, который необходимо методично проработать, а потом поэтапно реализовать. В наше время есть все предпосылки для того, чтобы обновление вашего жилья или офиса протекало легко и быстро.</p>\r\n', '\r\n<p>Самим закупать материалы, искать подрядчиков и бригаду, гоняться за дизайнерами, с целью получить давно обещанный проект, а тем более браться за ремонт самостоятельно – все это прошлый век, архаизмы, надеемся, навсегда ушедшие в прошлое. На сегодняшний день рынок предлагает куда более простые и удобные решения.</p>\r\n<p>   Современный ремонт – это ремонт «под ключ», при котором все необходимые вопросы, начиная от составления договора, закупки материалов и заканчивая перестановкой мебели и выносом строительного мусора из отремонтированного уже помещения, занимается подрядчик.</p>\r\n<p>   Мы понимаем, что ремонт – сложная для вас задача. Вы далеки от строительной отрасли и не хотите вникать в подробности. Вам необходим обновленный, комфортный дом или офис. Именно поэтому мы предлагаем вам ремонт под ключ – замечательное решение, при котором вы не участник, а координатор процесса.</p>\r\n<p>Как это происходит?</p>\r\n<p>Вы задаетесь целью сделать ремонт. Уровень сложности и цена вопроса не имеет значения. Это может быть ремонт отдельно санузла в вашей квартире или переоборудование огромной торговой площадки.</p>\r\n<p>Вы оставляете заявку на сайте подрядчика. Или звоните нам по телефону. Мы перезванивает Вам и договаривается о времени, когда вам удобней принять замерщика.</p>\r\n<p>К вам приезжает замерщик. После проведения всех необходимых расчетов специалист проконсультирует вас по материалам, которые понадобятся в процессе ремонта, поделится некоторыми профессиональными секретами, которые помогут Вам держать бюджет ремонта в рамках разумного.</p>\r\n<p>Далее составляется смета, эта услуга совершенно бесплатна.</p>\r\n<p>Вы заключаете договор с подрядчиком, и мастера приступают к работе.</p>\r\n<p style=\"margin-top: 0pt; margin-bottom: 0pt; text-align: left;\" dir=\"ltr\"><strong id=\"internal-source-marker_0.3535447174217552\" style=\"font-family: \'Times New Roman\'; font-size: medium;\"><span style=\"font-size: 15px; font-family: Arial; background-color: transparent; vertical-align: baseline; white-space: pre-wrap;\">6.</span><span style=\"font-size: 15px; font-family: Arial; background-color: transparent; font-weight: normal; vertical-align: baseline; white-space: pre-wrap;\"> Точно в оговоренный срок вы своим ключом открываете дверь в обновленную квартиру и новую жизнь. В этом смысл ремонта «под ключ». Вы принимаете решения и получаете результат.</span></strong></p>\r\n<p style=\"margin-top: 0pt; margin-bottom: 0pt; text-align: left;\" dir=\"ltr\"><strong id=\"internal-source-marker_0.3535447174217552\" style=\"font-family: \'Times New Roman\'; font-size: medium;\"><span style=\"font-size: 15px; font-family: Arial; background-color: transparent; vertical-align: baseline; white-space: pre-wrap;\">Нюансы:</span></strong></p>\r\n<p style=\"margin-top: 0pt; margin-bottom: 0pt; text-align: left;\" dir=\"ltr\"><strong style=\"font-family: \'Times New Roman\'; font-size: medium;\"><span style=\"font-size: 15px; font-family: Arial; background-color: transparent; vertical-align: baseline; white-space: pre-wrap;\"> </span></strong></p>\r\n<p style=\"margin-top: 0pt; margin-bottom: 0pt; text-align: left;\" dir=\"ltr\"><strong id=\"internal-source-marker_0.3535447174217552\" style=\"font-family: \'Times New Roman\'; font-size: medium;\"><span style=\"font-size: 15px; font-family: Arial; background-color: transparent; font-weight: normal; vertical-align: baseline; white-space: pre-wrap;\">    И напоследок мы расскажем вам о некоторых нюансах ремонта, чтобы вы лучше представляли себе, с чем столкнетесь.</span></strong></p>\r\n<p style=\"margin-top: 0pt; margin-bottom: 0pt; text-align: left;\" dir=\"ltr\"><strong style=\"font-family: \'Times New Roman\'; font-size: medium;\"><span style=\"font-size: 15px; font-family: Arial; background-color: transparent; font-weight: normal; vertical-align: baseline; white-space: pre-wrap;\"> </span></strong></p>\r\n<p style=\"margin-top: 0pt; margin-bottom: 0pt; text-align: left;\" dir=\"ltr\"><strong id=\"internal-source-marker_0.3535447174217552\" style=\"font-family: \'Times New Roman\'; font-size: medium;\"><span style=\"font-size: 15px; font-family: Arial; background-color: transparent; font-weight: normal; vertical-align: baseline; white-space: pre-wrap;\">    Смета ремонта – один из основных документов и для вас и для подрядчика. Она состоит из двух частей: стоимость работ и стоимость материалов.  Есть моменты, которые никто кроме вас просчитать не сможет. В основном это относится к покупке сантехники и столярки. Ведь можно выбрать унитаз за 500 грн., а можно и за 5 000 грн. Так же огромен разброс цен на душевые кабины, ванные, двери, кафель и напольные покрытия. Выбирайте с умом, изучайте рынок, а при покупке обращайте внимания на качество, а не на внешнюю атрибутику.  Часть материалов обязательно должна покупаться с небольшим запасом – все это необходимо предусмотреть</span></strong></p>', '1', '0', '0', '8', '2013-10-28 08:33:30', '512', '', '2013-10-28 09:26:22', '512', '0', '0000-00-00 00:00:00', '2013-10-28 08:33:30', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\\u0427\\u0438\\u0442\\u0430\\u0442\\u044c \\u0434\\u0430\\u043b\\u0435\\u0435...\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', '8', '0', '0', '', '', '1', '13', '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', '0', '*', '');
INSERT INTO `pxshj_content` VALUES ('10', '50', 'Натяжные потолки', 'natyajnye-potolki', '', '<div class=\"article_background\">\r\n<h1 class=\"MsoNormal\" style=\"text-align: center;\">Натяжные потолки<br />{gallery}ceiling{/gallery}</h1>\r\n<p>Навигация: <a class=\"inside_link\" href=\"#preimuwestva\">Преимущества натяжных потолков</a> <a class=\"inside_link\" href=\"#pravila-uhoda\">Правила ухода</a><a class=\"inside_link\" href=\"#forms\">Формы и типы потолков</a><a class=\"inside_link\" href=\"#montaj\">Монтаж</a><br /><a class=\"inside_link\" href=\"#sravnenie\">Сравнение с традиционными способами отделки</a> <a class=\"inside_link\" href=\"#tu\">Технические условия для помещений с натяжными потолками</a></p>\r\n<h2><strong>Часто задаваемые вопросы</strong></h2>\r\n<p>1.<strong><span>Где можно устанавливать натяжной потолок?</span></strong></p>\r\n<p><span>Натяжные потолки устанавливаются практически в любом помещении с температурным режимом от +5 до +60 0С.</span></p>\r\n<p><span>2.</span><strong><span>Какие пленки используются компанией «Новый Дом» для изготовления натяжных потолков?</span></strong></p>\r\n<p><span>Мы используем высококачественные ПВХ-пленки европейского производства Франция, Германия и Бельгия. В наличии всегда имеется более 150 цветов и оттенков.</span></p>\r\n<p><span>3.</span><strong><span>Будет ли виден шов в натяжном потолке?</span></strong></p>\r\n<p><span>Да, будет. Полотна ( в нерастянутом состоянии) имеют ширину от 1,3 до 5 м, и расположение и количество швов зависит от того, какое полотно выберет заказчик. Но, в любом случае, наши специалисты сделают все возможное и расположат шов так, чтобы его практически не было видно.</span></p>\r\n<p><span>4.</span><strong><span>Какую систему крепления используют в натяжных потолках «Новый Дом»?</span></strong></p>\r\n<p><span>Компания </span><strong><span>«Новый Дом»</span></strong><span> использует самую надежную и прогрессивную гарпунную систему крепления.</span></p>\r\n<p><span>5.</span><strong><span>Есть ли запах у натяжных потолков «Новый Дом»?</span></strong></p>\r\n<p><span>Да, есть, как и у любой новой вещи, запах выветривается в течении 3х дней максимум.</span></p>\r\n<p><span>6.</span><strong><span>Сколько цветов имеют натяжные потолки «Новый Дом»?</span></strong></p>\r\n<p><span>Всегда в наличии имеется более 150 цветов и оттенков ПВХ -пленки и 5 видов различных фактур полотен.</span></p>\r\n<p><span>7.</span><strong><span>Могут ли устанавливаться светильники в натяжные потолки?</span></strong></p>\r\n<p><span>Да, могут. Однако мощность устанавливаемых встроенных светильников не должна превышать для ламп накаливания 60Вт, а для галогенных 30Вт, для светодиодных не ограничено.</span></p>\r\n<p><span>8.</span><strong><span>Как вызвать замерщика?</span></strong></p>\r\n<p><span>Для проведения замеров потолка специалисты нашей компании бесплатно выезжают на объекты в удобное для Вас время.</span></p>\r\n<p><span>9.</span><strong><span>Какой срок службы (эксплуатации) натяжного потолка?</span></strong></p>\r\n<p><span>При нормальной эксплуатации срок службы натяжного потолка практически неограничен. Компания </span><strong><span>«Новый Дом» </span></strong><span>дает 20-ти летнюю гарантию.</span></p>\r\n<p><span>10.</span><strong><span>Говорят, что натяжные потолки не дышат?</span></strong></p>\r\n<p><span>Потолки из ПВХ-пленок, так же, как и моющиеся обои, пластиковые окна, покрытые лаком паркетные полы, железобетонные панели и фирменные добротные гипсокартонные потолки, воздух не пропускают. Между тем, качество используемых компанией </span><strong><span>«Новый Дом» </span></strong><span>материалов при изготовлении натяжных потолков подтверждено Сертификатами производителей, «Выводом государственной санитарно – эпидемиологической экспертизы» Министерства охраны здоровья Украины.</span></p>\r\n<p><span>11.</span><strong><span>Какой срок установки натяжных потолков?</span></strong></p>\r\n<p><span>Монтаж натяжных потолков осуществляется в кратчайшие сроки в удобное для заказчика время.</span></p>\r\n<p><span>12.</span><strong><span>На каком этапе ремонта устанавливаются натяжные потолки?</span></strong></p>\r\n<p><span>Как правило, на заключительном этапе, во избежание загрязнения натяжного потолка.</span></p>\r\n<p><span>13.</span><strong><span>На какое расстояние от основного потолка опускается натяжной?</span></strong></p>\r\n<p><span>При отсутствии встроенных светильников на 3-7см, а при их наличии- на высоту светильника.</span></p>\r\n<p><span>14.</span><strong><span>Насколько безопасны натяжные потолки?</span></strong></p>\r\n<p><span>Натяжные потолки не выделяют и не поглощают химические вещества, не поддерживают горение и не имеют запаха. Материалы потолков сертифицированы и соответствуют требованием гигиены и пожарной безопасности.</span></p>\r\n<p><span>15.</span><strong><span>Есть ли у Вас необходимые лицензии и сертификаты?</span></strong></p>\r\n<p><span>Конечно, есть. При необходимости мы предоставим Вам их копии.</span></p>\r\n<p><span>16.</span><strong><span>Сколько стоит натяжной потолок?</span></strong></p>\r\n<p><span>Стоимость натяжного потолка зависит от нескольких факторов:</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: .0001pt; margin-left: 15.0pt; text-align: justify; text-justify: inter-ideograph; text-indent: -18.0pt; line-height: 12.0pt; mso-list: l0 level1 lfo2; tab-stops: list 36.0pt;\"><span style=\"font-size: 10.0pt; mso-bidi-font-size: 8.5pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; color: black;\"><span style=\"mso-list: Ignore;\">·</span></span><span>от фактуры пленки и ширины;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: .0001pt; margin-left: 15.0pt; text-align: justify; text-justify: inter-ideograph; text-indent: -18.0pt; line-height: 12.0pt; mso-list: l0 level1 lfo2; tab-stops: list 36.0pt;\"><span style=\"font-size: 10.0pt; mso-bidi-font-size: 8.5pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; color: black;\"><span style=\"mso-list: Ignore;\">·</span></span><span>площади и формы Вашего потолка;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: .0001pt; margin-left: 15.0pt; text-align: justify; text-justify: inter-ideograph; text-indent: -18.0pt; line-height: 12.0pt; mso-list: l0 level1 lfo2; tab-stops: list 36.0pt;\"><span style=\"font-size: 10.0pt; mso-bidi-font-size: 8.5pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; color: black;\"><span style=\"mso-list: Ignore;\">·</span></span><span>количества углов и криволинейности потолка;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: .0001pt; margin-left: 15.0pt; text-align: justify; text-justify: inter-ideograph; text-indent: -18.0pt; line-height: 12.0pt; mso-list: l0 level1 lfo2; tab-stops: list 36.0pt;\"><span style=\"font-size: 10.0pt; mso-bidi-font-size: 8.5pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; color: black;\"><span style=\"mso-list: Ignore;\">·</span></span><span>наличия светильников, систем вентиляции и т.д.</span></p>\r\n<p> </p>\r\n<p id=\"preimuwestva\"><strong><span style=\"font-size: 14.0pt; line-height: 115%;\">Преимущества натяжных потолков</span></strong></p>\r\n<p>Изобретенные еще в 60-х годах прошлого века в Швеции, натяжные потолки решают практически все проблемы, связанные с потолками, при этом, давая неограниченные возможности удовлетворять фантазии заказчика. Поэтому натяжные потолки получили быстрое развитие и распространение, как в Европе, так и во всем мире.</p>\r\n<p>Итак, обо всем по порядку:</p>\r\n<p><strong>1. Внешний вид, дизайн интерьера.</strong></p>\r\n<p>Технология натяжных потолков позволяет создавать идеально ровные поверхности, скрывая любые дефекты и неровности базового потолка. При этом, натяжной потолок отлично спрячет инженерные коммуникации, расположенные в припотолочной зоне – проводку, системы вентиляции, сигнализации и т.п.</p>\r\n<p>Только натяжные потолки позволяют создавать поверхности практически любой формы – арочные, волнообразные, конусовидные и т.д. Натяжной потолок можно устанавливать под любым наклоном или даже в разных плоскостях, причем можно делать резкие и плавные переходы из одной плоскости в другую.</p>\r\n<p>Добавьте к этому десятки и сотни различных цветов, многообразие фактур полотна (лаковая, матовая,с рисунком, перламутровая), возможности комбинировать разные полотна и формы в рамках одного потолка – и в Ваших руках технология, которая позволит воплотить любую фантазию.</p>\r\n<p><strong>2. Высокая прочность и эластичность материала.</strong></p>\r\n<p>Технология натяжных потолков основана на применении высокопрочной и, в то же время, эластичной поливинилхлоридной пленки. Прочность поливинилхлоридной пленки доказана делом, а также подтверждена использованием данного материала в натяжных потолках на протяжении десятилетий. Поверхность натяжных потолков не трескается, и не боится ударов.</p>\r\n<p>Для наглядности часто проводится эксперимент, когда взрослый мужчина стоит на каркасе из поливинилхлоридной пленки. При этом полотно прогибается под весом, однако не деформируется и не лопается, а после окончания эксперимента принимает первоначальную форму.</p>\r\n<p>Еще один красноречивый пример: пробка от шампанского, выстрелившая из бутылки, отскочит от натяжного потолка , не оставив на нем ни малейшего следа, тогда как любому другому потолочному покрытию от такого эксперимента не поздоровится.</p>\r\n<p> </p>\r\n<p><strong>3. Практичность, долговечность, простота ухода.</strong></p>\r\n<p>Натяжные потолки не дают трещин при усадке дома, не изменяют своих свойств при перепадах температуры воздуха от -5 до +50 градусов, являются очень неприхотливыми в уходе и не требуют периодического ремонта, экономя тем самым силы и время своего владельца. Когда, по прошествии нескольких лет потолок слегка потеряет свой первоначальный блеск, достаточно всего лишь протереть его, и он снова засияет как в первый день.</p>\r\n<p>Гарантийный срок службы натяжного потолка составляет не менее двадцати лет, и за это время потолок абсолютно сохранит свой цвет, эластичность, форму и другие важные характеристики.</p>\r\n<p><strong>4. Водонепроницаемость и влагостойкость.</strong></p>\r\n<p>Благодаря водонепроницаемости пленки, между полотном и основным потолком не образуется конденсат, что позволяет избежать образования плесени и всевозможного грибка в квартире или офисе.</p>\r\n<p>Также благодаря высокой прочности и возможности выдерживать большие нагрузки, натяжной потолок может выдержать около ста литров воды на один квадратный метр полотна в случае затопления помещения соседями сверху, что убережет дорогой интерьер, приняв всю массу воды на себя. Это не только доказывает высокую прочность потолка, но также дает защитное преимущество натяжных потолков над всеми остальными технологиями.</p>\r\n<p>Натяжные потолки также очень хорошо подходят для помещений, имеющих большую влажность воздуха, поскольку на них не скапливается статическое электричество и конденсат. Поэтому натяжные потолки часто устанавливают в ванной комнате или в бассейне.</p>\r\n<p><strong>5. Пожарная безопасность.</strong></p>\r\n<p>Натяжные потолки не поддерживают горение, не воспламеняются. Они имеют высшую степень пожарной безопасности: М-1.</p>\r\n<p><strong>6. Экологичность.</strong></p>\r\n<p>Натяжные потолки не выделяют вредных веществ, аллергенов, не имеют запаха, особый состав натяжных потолков исключает скопление на их поверхности статического электричества.</p>\r\n<p><strong>7. Быстрая и чистая установка.</strong></p>\r\n<p>Большим преимуществом натяжного потолка является отсутствие пыли, грязи и строительного мусора при его монтаже. Отделка или обработка основного потолка не требуется, поэтому увеличивается скорость установки и, соответственно, снижается стоимость работы. Монтаж натяжного потолка не принесет практически никаких неудобств владельцу помещения и займет всего несколько часов.</p>\r\n<p><strong>8. Универсальность использования.</strong></p>\r\n<p>Благодаря своим качествам натяжные потолки прекрасно подходят практически для любого помещения, в каждом случае предоставляя неоспоримые преимущества: возможности уникального дизайна — для жилых и офисных помещений, влагостойкость и химическую нейтральность – для бассейнов и ванных комнат, бактерицидную пленку для детских и медицинских учреждений.</p>\r\n<p><strong>9. Возможность демонтажа и повторного монтажа без потери первоначального вида.</strong></p>\r\n<p>В завершение хотелось бы коснуться вопроса стоимости. Изготовленные из высококачественных европейских материалов, натяжные потолки дешевле любого другого подвесного потолка (гипсокартон, пластик, армстронг,…).</p>\r\n<p><strong>10. Возможность скрыть коммуникации.</strong></p>\r\n<p>В натяжной потолок можно спрятать системы вентиляции, сигнализации и противопожарной безопасности. При необходимости возможно применение дополнительных теплоизоляционных материалов.</p>\r\n<p>Стоимость натяжного потолка <strong><span style=\"font-size: 8.5pt; mso-bidi-font-size: 11.0pt; line-height: 115%; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">«Новый Дом»</span></strong> Вы можете оценить у нас на сайте. Сравнивайте, выбирайте, звоните!</p>\r\n<p><strong><span style=\"font-size: 14.0pt; line-height: 115%;\">Общая информация о натяжных потолках</span></strong></p>\r\n<p>Практически все марки потолков делаются с использованием пленки из мягкого поливинилхлорида (ПВХ) толщиной 0,17 - 0,22 мм. Ее удельный вес порядка 180 - 320 г/м?; коэффициент звукопоглощения – 0,4; коэффициент светопоглощения – от 30% («лаковые») до 95 % («бархатные» фактуры); предел прочности на разрыв по длине – 17 N/мм?, по ширине – 13 N/мм?; под нагрузкой пленка может вытягиваться в 2,2 раза. Материал водонепроницаем, не боится ударов, не трескается и легко моется. При изготовлении пластик хорошо прокрашивается на всю толщину (палитра цветов и оттенков превышает 100 градаций). Пленка поставляется рулонами шириной 1,3 - 5 м, полотна легко соединяются сваркой ТВЧ с образованием прочного и малозаметного шва.<strong><span style=\"font-size: 14.0pt; line-height: 115%;\"><br style=\"mso-special-character: line-break; page-break-before: always;\" clear=\"all\" /> </span></strong></p>\r\n<p id=\"pravila-uhoda\"><strong><span style=\"font-size: 14.0pt; line-height: 115%;\">Правила эксплуатации и ухода за натяжным потолком</span></strong></p>\r\n<p>Натяжной потолок достаточно прост в эксплуатации. Он в течение длительного времени не меняет своих свойств, не выгорает. Компания <strong><span style=\"font-size: 8.5pt; mso-bidi-font-size: 11.0pt; line-height: 115%; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">«Новый Дом» </span></strong>дает 20-летнюю гарантию на натяжные потолки. При этом, при правильной эксплуатации потолка срок его службы практически не ограничен.</p>\r\n<p>Чтобы сохранить натяжной потолок в прекрасном состоянии, соблюдайте несколько простых правил, изложенных ниже.</p>\r\n<p>При загрязнении мойте натяжной потолок обычным моющим средством при температуре 30-40 градусов фланелевой тряпочкой. Не используйте абразивные моющие средства, так как они могут повредить поверхность потолка.</p>\r\n<p>Смоченной в растворе фланелью лёгкими движениями по направлению шва удаляйте загрязнения, затем влажной тряпкой снимите остатки мыльного раствора, после чего поверхность натяжного потолка окончательно протрите сухой фланелью.</p>\r\n<p>Кроме того, существуют специальные полироли для натяжных потолков, которыми Вы можете воспользоваться для достижения наилучшего результата. Лаковые полотна лучше протирать спиртосодержащими моющими средствами во избежание разводов. Замшевые полотна рекомендуется чистить мягкой щеткой.</p>\r\n<p>При мытье натяжных потолков обязательно регулируйте силу нажима; при соприкосновении полотна с базовым потолком может произойти повреждение полотна.</p>\r\n<p>Потолок следует оберегать от воздействия острых предметов, а в случае его прокола или царапины незамедлительно заклейте поврежденный участок скотчем и вызовите мастера-профессионала для устранения повреждения.</p>\r\n<p>Натяжные потолки рекомендуется устанавливать и эксплуатировать в отапливаемых помещениях. Допустимый температурный режим, который переносит натяжной потолок — до минус 5 градусов; при более низких температурах полотно может потрескаться.</p>\r\n<p>Важно правильно выбирать мощность осветительных приборов: для ламп накаливания — не более 60 Вт, для галогенных — не более 30 Вт, для светодиодных ламп не ограничено; если мощность превышена, может произойти расплавление или провисание натяжного потолка.</p>\r\n<p>В случае повреждения не ремонтируйте натяжной потолок собственными силами. Для ремонта или при необходимости демонтажа натяжного потолка необходимо вызывать представителей фирмы-установщика. Они обладают необходимыми навыками и оборудованием для того, чтобы сохранить Ваш натяжной потолок от повреждений и позволить ему радовать Вас долгие годы.</p>\r\n<p><strong><span id=\"forms\" style=\"font-size: 14.0pt; line-height: 115%;\">Базовые формы и типы натяжных потолков</span></strong></p>\r\n<p>Одно из бесспорных преимуществ натяжных потолков перед другими современными способами отделки потолка — это поистине безграничный простор для фантазии дизайнера. В этой статье мы сделаем краткий обзор геометрических форм, которые может принимать натяжной потолок. Комбинируя эти базовые формы, а также используя различные сочетания цветов и фактур полотна, Вы сможете создать действительно неповторимый интерьер.</p>\r\n<p>Плоскость</p>\r\n<p> <img src=\"images/ceiling/ceiling_docs/2.png\" border=\"0\" alt=\"\" /></p>\r\n<p>Плоская форма потолка Классическая форма натяжного потолка представляет собой ровную плоскость. Возможно использование как в строго горизонтальном уровне, так и под любым углом. Натяжной потолок будет выглядеть как идеально ровный и плоский, что является решением проблем выравнивания базового потолка, сокрытия возможных перепадов, трещин и любых конструктивных элементов базового помещения.</p>\r\n<p> </p>\r\n<p>Переход уровня</p>\r\n<p> <img src=\"images/ceiling/ceiling_docs/1.png\" border=\"0\" alt=\"\" /></p>\r\n<p>Форма потолка с переходом уровня. Форма, характеризующая переход потолка из одного уровня в другой. Эта конструкция натяжного потолка — одна из самых богатых вариациями. Технически количество уровней неограниченно. Особенно эффектно выглядит комбинация перехода уровня и изгиба. <strong><span style=\"font-size: 8.5pt; mso-bidi-font-size: 11.0pt; line-height: 115%; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">«Новый Дом»</span></strong> поможет воплотить дизайнерскую идею в любом технически сложном интерьере.</p>\r\n<p> </p>\r\n<p>Арка</p>\r\n<p> <img src=\"images/ceiling/ceiling_docs/arka.png\" border=\"0\" alt=\"\" /></p>\r\n<p>Натяжной потолок в форме арки. Натяжной потолок в форме арки. Характеризуется плавным переходом стен в потолок. Используется для изменения стандартной прямоугольной геометрии помещения и придания ей новой формы, а также для воспроизведения куполообразных сводов потолка.</p>\r\n<p> </p>\r\n<p>Применяется как с одной, так и с нескольких сторон помещения, или же по всему периметру. Последний вариант расположения арок можно свести к форме купола.</p>\r\n<p> </p>\r\n<p>Дюна</p>\r\n<p> <img src=\"images/ceiling/ceiling_docs/duna.png\" border=\"0\" alt=\"\" /></p>\r\n<p>Натяжной потолок в форме дюны. Локальная форма натяжного потолка в виде колокола. Придает помещению нетривиальный вид. Оригинальный стиль потолка достигается за счет объемной, трехмерной формы, визуально напоминающей холмы или дюны. Кратер вулкана, только вовнутрь. Особенно гармонично выглядит комбинация дюн и различных конструкций светильников.</p>\r\n<p> </p>\r\n<p>Конус</p>\r\n<p> <img src=\"images/ceiling/ceiling_docs/konus.png\" border=\"0\" alt=\"\" /></p>\r\n<p>Натяжной потолок в форме конуса. Форма натяжного потолка в виде ниспадающего конуса. Используется для создания необычных форм и добавляет элемент декора в интерьер. Возможно использование конуса как в качестве самостоятельного объекта, так и для комбинации с другими элементами декора.</p>\r\n<p>Для обыгрывания различных идей дизайна интерьера нижняя часть конуса может быть выполнена в форме капли, усеченной плоскости (как с отверстием, так и глухой), имеющей разнообразную форму нижней поверхности: овал, круг, прямоугольник, квадрат. Возможна комбинация нескольких конусов в одной фигуре.</p>\r\n<p>Волна</p>\r\n<p> <img src=\"images/ceiling/ceiling_docs/volna.png\" border=\"0\" alt=\"\" /></p>\r\n<p>Натяжной потолок в форме волны. Форма потолка, характеризующаяся плавными изгибами в вертикальной плоскости, напоминающая волны. Одна из сложных и наиболее красивых форм натяжного потолка.</p>\r\n<p>Возможны различные формы волн: равномерная, плавно затухающая, изменяющая шаг и высоту гребней. Волну можно воплотить в разных конфигурациях: вдоль одной стены — односторонняя, вдоль двух стен — двусторонняя, вдоль четырех и более стен — многосторонняя, в последнем случае потолок напоминает поверхность моря.</p>\r\n<p> </p>\r\n<p><strong>Многоуровневые натяжные потолки</strong></p>\r\n<p><strong><img src=\"images/ceiling/ceiling_docs/urovni.png\" border=\"0\" alt=\"\" /></strong></p>\r\n<p>Классическая конструкция натяжного потолка представляет собой одноуровневую ровную плоскость. Однако существуют и многоуровневые конструкции. Многоуровневый натяжной потолок даёт возможность визуально разделить помещение на области, разграниченные по высоте. Багеты, на которые крепят полотна, могут быть не только прямыми, но и криволинейными. Натяжной потолок в форме арки или дюны позволяет организовать плавный переход между потолком и стенами, что достигается за счет объемной формы, визуально напоминающей холмы или дюны.</p>\r\n<p><strong>Фотопечать</strong></p>\r\n<p><strong><img src=\"images/ceiling/ceiling_docs/fotopechat.png\" border=\"0\" alt=\"\" /></strong></p>\r\n<p>Художественными натяжными потолками обычно называют натяжные потолки с нанесённым на их поверхность изображением. Наиболее широко в качестве рисунка используется изображение неба и облаков. Изображение наносится на специальных печатных машинах (принтерах) методом сольвентной или ультрафиолетовой печати с разрешением до 1200 dpi. Для потолков из ПВХ-плёнки макет изображения разбивается на полосы, затем во время изготовления потолка напечатанные полосы свариваются. Для бесшовных потолков изображение наносится сразу на всю ширину полотнища.</p>\r\n<p><strong>Звездное небо</strong></p>\r\n<p><br /><strong><img src=\"images/ceiling/ceiling_docs/nebo.png\" border=\"0\" alt=\"\" /></strong></p>\r\n<p>Отдельно от всего ряда фактур и цветов натяжных потолков выделяют натяжной потолок типа «звёздное небо». Одноимённый визуальный эффект достигается с совмещением натяжного потолка и технологий освещения. Существуют четыре основных технологий реализации визуального эффекта «звездное небо»:</p>\r\n<p>Эффект звездного неба достигается за счет специального источника света к которым подключают оптоволоконные нити. Имитация «Звездное небо» достигается за счет хаотичного мерцания. Оптоволоконные нити вплотную подводят к натяжному потолку или прокалывается и наружу выводится нить на 1 мм, на 1 кв. м. подводятся от 100 нитей. Днем же такой потолок ничем не отличается от обычного потолка.</p>\r\n<p>В целом он полностью напоминает предыдущий, с той лишь разницей, что оптоволоконные волокна не спрятаны за тыльной поверхностью натяжного полотна, а выводятся сквозь него на длину от 20 см до 100 см в зависимости от необходимого эффекта. В результате этого сбоку можно увидеть прямые лучи света, напоминающие тонкие лазеры.</p>\r\n<p>В этот варианте в дополнение к оптоволоконным системам или только самостоятельно используются специальные хрустальные рассеиватели Swarovski, благодаря которым можно выделить наиболее яркие звезды звездных систем.</p>\r\n<p>Натяжной потолок типа \"звездное небо\" часто реализуют с предварительным нанесенным на полотно посредством фотопечати изображением.</p>\r\n<p><strong><span id=\"montaj\" style=\"font-size: 14.0pt; line-height: 115%;\">Монтаж</span></strong></p>\r\n<p>Важным фактором выбора натяжных потолков является быстрота установки: время монтажа одного потолка средней сложности в помещении среднего размера составляет несколько часов. Более того, необходимо заметить удобство планирования и подготовительных условий для проведения ремонтных работ в целом. Монтаж натяжного потолка чаще всего проводится на завершающих стадиях ремонта, после завершения пыльных работ. Вызов специалистов для замера назначается перед наклеиванием обоев.</p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify; text-justify: inter-ideograph; tab-stops: 97.5pt;\">Технология монтажа натяжных потолков любых типов требует отступить от чернового или несущего потолочного покрытия минимум 3 см и более, если за натяжным потолком предполагается монтаж любых других устройств (светильников, коммуникаций, проводки).</p>\r\n<p>Первым делом на стены по периметру помещения закрепляется багет, представляющий собой алюминиевый профиль, за который впоследствии и зацепляется гарпуном полотно потолка. Для выполнения этой операции прежде всего с помощью уровня определяется самый низкий угол базового потолка помещения. После того, как выставлен горизонт, стеновой багет крепится к стене. При этом следует помнить, что усилие натяжения потолка на отрыв багета примерно равно 60 кг/м.п., поэтому багет долженбыть прикреплен к стенам очень прочно. Расстояние, через которое устанавливается крепеж составляет как правило 10-15 см. При необходимости, в случае сыпучих стен, или невозможности закрепиться к стене в каком то месте, ставятся специальные упоры.</p>\r\n<p>Следующий этап – установка полотна. Уровень, до которого следует прогревать полотно, определяется только опытом монтажника. Если полотно не прогрето, его трудно будет натягивать и устанавливать, если перегрето – оно будет выскакивать из зацепления, а матовое полотно можно просто испортить. Нормально прогретое полотно должно достаточно легко растягиваться вместе с гарпуном и крепко держаться в замках багета. Только после достижения этого температурного режима и разогретого состояния полотна следует начинать непосредственно установку потолка.</p>\r\n<p>Зазоры между сопряжением натяжного потолка со стенами, как правило, скрываются багетом или пластиковой декоративной накладкой (вставкой) из твердого или гибкого ПВХ.</p>\r\n<p>Перед монтажом натяжного потолка требуется специальная подготовка помещения, включающая обеспечение свободного доступа к стенам помещения по периметру потолка, герметизацию щелей, очисткой поверхности потолка от плохо закреплённых или неровных деталей. Оклейку комнаты обоями лучше делать после монтажа натяжных потолков. а вот \"грязные работы\" желательно закончить до.</p>\r\n<p><strong><span id=\"sravnenie\" style=\"font-size: 14.0pt; line-height: 115%;\">Сравнение с традиционными способами отделки</span></strong></p>\r\n<p style=\"background: white;\"><span style=\"font-size: 8.0pt; font-family: \'Tahoma\',\'sans-serif\'; color: #3f3e3b;\">Декоративные и технические характеристики натяжных потолков позволяют выйти на качественно новый уровень отделки и дизайна помещений, недостижимый при использовании традиционных потолочных перекрытий. Ниже приведена сводная таблица сравнительных характеристик различных потолков.</span></p>\r\n<table class=\"MsoNormalTable\" style=\"mso-cellspacing: .7pt; background: white; border: solid black 1.0pt; mso-border-alt: solid black .25pt; mso-yfti-tbllook: 1184; mso-padding-alt: 1.5pt 1.5pt 1.5pt 1.5pt;\" border=\"1\" cellspacing=\"1\" cellpadding=\"0\">\r\n<tbody>\r\n<tr style=\"mso-yfti-irow: 0; mso-yfti-firstrow: yes;\">\r\n<td style=\"border: none; background: #CC0000; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\">\r\n<p class=\"MsoNormal\" style=\"text-align: center;\" align=\"center\"><strong><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\'; color: white;\">Позиции</span></strong></p>\r\n</td>\r\n<td style=\"border: none; background: #CC0000; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\">\r\n<p class=\"MsoNormal\" style=\"text-align: center;\" align=\"center\"><strong><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\'; color: white;\">Побеленный потолок</span></strong></p>\r\n</td>\r\n<td style=\"border: none; background: #CC0000; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\">\r\n<p class=\"MsoNormal\" style=\"text-align: center;\" align=\"center\"><strong><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\'; color: white;\">Подвесной потолок</span></strong></p>\r\n</td>\r\n<td style=\"border: none; background: #CC0000; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\">\r\n<p class=\"MsoNormal\" style=\"text-align: center;\" align=\"center\"><strong><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\'; color: white;\">Натяжной<br /> потолок ПВХ</span></strong></p>\r\n</td>\r\n<td style=\"border: none; background: #CC0000; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\">\r\n<p class=\"MsoNormal\" style=\"text-align: center;\" align=\"center\"><strong><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\'; color: white;\">Потолки из гипсокартона</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 1;\">\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">Предварительная подготовка помещения</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">требует подготовки</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">требует подготовки</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">не требует<br /> подготовки</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">требует подготовки</span></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 2;\">\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">Предварительная подготовка основного потолка</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">требует подготовки:<br /> 1. удаление побелки;<br /> 2. шпаклевка;<br /> 3. штукатурка.</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">не требует подготовки</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">вынос предметов, чувствительных к нагреванию</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">требует подготовки</span></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 3;\">\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">Внешний вид</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">поверхность неровная шершавая</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">естественные стыки материалов</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">наличие еле заметных сварных швов</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">поверхность ровная, шершавая</span></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 4;\">\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">Долговечность</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">2 - 4 года</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">5 - 8 лет</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">более 10 лет</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">не декларируется</span></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 5;\">\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">Способность защитить от протечек</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">Отсутствует</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">отсутствует</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">выдерживает до 100 л воды на 1 м²</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">отсутствует</span></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 6;\">\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">Противопожарные свойства</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">не поддерживает горение</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">не поддерживает горение</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">не поддерживает горение</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">не поддерживает горение</span></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 7;\">\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">Влагостойкость</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">Отсутствует</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">конденсирует влагу</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">не конденсирует влагу</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">Отсутствует</span></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 8;\">\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">Возможность влажной уборки</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">Отсутствует</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">необходима</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">возможна</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">Отсутствует</span></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 9;\">\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">Эксплуатационные свойства</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">возможно появление трещин и отслоение штукатурки</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">возможно появление щелей</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">идеальное сохранение вида, долговечность</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">возможно появление трещин и отслоение штукатурки</span></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 10;\">\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">Минимальное расстояние от основного потолка</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">Отсутствует</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">5 см.</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">3,5 - 4 см.</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">7 см.</span></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 11;\">\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">Конструктивность</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">только плоская поверхность</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">только плоская поверхность</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">многообразие форм</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">многообразие форм</span></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 12;\">\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">Швы и трещины</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">неизбежно появление трещин</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">естественные стыки материалов</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">малозаметные швы</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">неизбежно появление трещин</span></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 13;\">\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\"> </td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\"> </td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\"> </td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\"> </td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\"> </td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 14;\">\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">Очевидные неудобства при работе (установке)</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">пыль, грязь, строительный мусор, вынос мебели</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">грязь, строительный мусор</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">необходим прогрев помещения</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">пыль, грязь, строительный мусор, вынос мебели</span></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 15;\">\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">Место установки</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">кроме помещений с повышенной влажностью</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">во всех помещениях</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">В любых помещениях, с плюсовой температурой до 60 градусов.</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">кроме помещений с повышенной влажностью</span></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 16;\">\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">Наличие гигиенических сертификатов</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">Нет</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">не у всех производителей</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">не у всех производителей</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">нет</span></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 17;\">\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">Наличие пожарного сертификата</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">Нет</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">не у всех производителей</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">не у всех производителей</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">нет</span></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 18;\">\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">Гарантия</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">1 - 1,2 года</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">1 - 2 года</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">20 лет</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">1 год</span></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 19;\">\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">Сроки изготовления материалов</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">со склада</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">со склада или под заказ</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\"> под заказ</span></p>\r\n</td>\r\n<td style=\"border: none; background: #F4F4F4; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">Под заказ</span></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 20; mso-yfti-lastrow: yes;\">\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">Сроки исполнения (для помещений до 15 м²)</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">5 - 7 дней</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">2 - 3 дня</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">1 день</span></p>\r\n</td>\r\n<td style=\"border: none; padding: 1.5pt 1.5pt 1.5pt 1.5pt;\" valign=\"top\">\r\n<p class=\"MsoNormal\"><span style=\"font-size: 7.5pt; line-height: 115%; font-family: \'Tahoma\',\'sans-serif\';\">5 - 10 дней</span></p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p> </p>\r\n<p><strong><span id=\"tu\" style=\"font-size: 14.0pt; line-height: 115%;\">Технические условия для помещений с натяжными потолками</span></strong></p>\r\n<p>Заказчик должен подготовить помещение следующим образом:</p>\r\n<p>все строительные работы должны быть выполнены полностью с тщательной уборкойстроительного мусора;</p>\r\n<p>к каждому светильнику должны быть подведены кабельные линии, обеспечивающие гарантированное включение и отключение напряжения;</p>\r\n<p>помещения, где производится монтаж натяжных потолков, должны быть максимально освобождены от мебели; все объекты, не переносящие повышенный нагрев (до 65 градусов), должны быть убраны. Также в помещениях не должно быть сквозняков, и они должны быть отапливаемыми в холодное время года; стены в местах крепления потолков должны быть прочными, неповрежденными, прямолинейными. Гипсокартон, керамическая плитка и другие конструктивные и отделочные материалы должны быть надежно закреплены;</p>\r\n<p>под керамической плиткой не должно быть пустот во избежаниепорчи плитки;</p>\r\n<p>навесное оборудование (кухни, полки, вытяжки, и т.д.) должны быть демонтированы</p>\r\n<p>поверхность основного потолка должна быть ровной и чистой, исключающей отслоение старой отделки;</p>\r\n<p>на поверхности основного потолка «Заказчик»должен указать место расположения светильников любым, хорошо видимым после нанесения пишущим предметом;</p>\r\n<p>в случае монтажа натяжного потолка над бассейном «Заказчик» должен подготовить настил на бассейн;</p>\r\n<p>заказчик обязан обеспечить отсутствие внешних оттоков воздуха в запотолочном пространстве (т.е.щелей и отверстий в базовом потолке). В противном случае возможен эффект засасывания потолка;</p>\r\n<p>в соответствии с технологией плоскости потолков выставляются горизонтально по гидроуровню;</p>\r\n<p>Заказчик обязан предоставить полную информацию о местоположении электропроводки в стенах.</p>\r\n</div>', '', '1', '0', '0', '10', '2013-10-28 11:36:24', '512', '', '2013-10-29 14:19:18', '512', '0', '0000-00-00 00:00:00', '2013-10-28 11:36:24', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', '31', '0', '1', '', '', '1', '54', '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', '0', '*', '');
INSERT INTO `pxshj_content` VALUES ('11', '51', 'Часто задаваемые вопросы', 'questions', '', '<p><!--[if gte mso 9]><xml>\r\n <o:OfficeDocumentSettings>\r\n  <o:RelyOnVML/>\r\n  <o:AllowPNG/>\r\n </o:OfficeDocumentSettings>\r\n</xml><![endif]--></p>\r\n<p><!--[if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves/>\r\n  <w:TrackFormatting/>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:DoNotPromoteQF/>\r\n  <w:LidThemeOther>RU</w:LidThemeOther>\r\n  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>\r\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:SplitPgBreakAndParaMark/>\r\n   <w:DontVertAlignCellWithSp/>\r\n   <w:DontBreakConstrainedForcedTables/>\r\n   <w:DontVertAlignInTxbx/>\r\n   <w:Word11KerningPairs/>\r\n   <w:CachedColBalance/>\r\n   <w:UseFELayout/>\r\n  </w:Compatibility>\r\n  <m:mathPr>\r\n   <m:mathFont m:val=\"Cambria Math\"/>\r\n   <m:brkBin m:val=\"before\"/>\r\n   <m:brkBinSub m:val=\"&#45;-\"/>\r\n   <m:smallFrac m:val=\"off\"/>\r\n   <m:dispDef/>\r\n   <m:lMargin m:val=\"0\"/>\r\n   <m:rMargin m:val=\"0\"/>\r\n   <m:defJc m:val=\"centerGroup\"/>\r\n   <m:wrapIndent m:val=\"1440\"/>\r\n   <m:intLim m:val=\"subSup\"/>\r\n   <m:naryLim m:val=\"undOvr\"/>\r\n  </m:mathPr></w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState=\"false\" DefUnhideWhenUsed=\"true\"\r\n  DefSemiHidden=\"true\" DefQFormat=\"false\" DefPriority=\"99\"\r\n  LatentStyleCount=\"267\">\r\n  <w:LsdException Locked=\"false\" Priority=\"0\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Normal\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"heading 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 7\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 8\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 9\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 7\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 8\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 9\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"35\" QFormat=\"true\" Name=\"caption\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"10\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Title\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"1\" Name=\"Default Paragraph Font\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"11\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Subtitle\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"22\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Strong\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"20\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"59\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Table Grid\"/>\r\n  <w:LsdException Locked=\"false\" UnhideWhenUsed=\"false\" Name=\"Placeholder Text\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"1\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"No Spacing\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" UnhideWhenUsed=\"false\" Name=\"Revision\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"34\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"List Paragraph\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"29\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Quote\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"30\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Intense Quote\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"19\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Subtle Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"21\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Intense Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"31\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Subtle Reference\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"32\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Intense Reference\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"33\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Book Title\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"37\" Name=\"Bibliography\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" QFormat=\"true\" Name=\"TOC Heading\"/>\r\n </w:LatentStyles>\r\n</xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n	{mso-style-name:\"Обычная таблица\";\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-priority:99;\r\n	mso-style-qformat:yes;\r\n	mso-style-parent:\"\";\r\n	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;\r\n	mso-para-margin-top:0cm;\r\n	mso-para-margin-right:0cm;\r\n	mso-para-margin-bottom:10.0pt;\r\n	mso-para-margin-left:0cm;\r\n	line-height:115%;\r\n	mso-pagination:widow-orphan;\r\n	font-size:11.0pt;\r\n	font-family:\"Calibri\",\"sans-serif\";\r\n	mso-ascii-font-family:Calibri;\r\n	mso-ascii-theme-font:minor-latin;\r\n	mso-hansi-font-family:Calibri;\r\n	mso-hansi-theme-font:minor-latin;\r\n	mso-bidi-font-family:\"Times New Roman\";\r\n	mso-bidi-theme-font:minor-bidi;}\r\n</style>\r\n<![endif]--></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 3.0pt; text-align: justify; text-justify: inter-ideograph; text-indent: 15.0pt; line-height: 21.0pt; mso-outline-level: 1;\"><strong><span style=\"font-size: 10.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: #dc0081; mso-font-kerning: 18.0pt;\">Часто задаваемые вопросы</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: .0001pt; margin-left: 15.0pt; text-align: justify; text-justify: inter-ideograph; text-indent: -18.0pt; line-height: 12.0pt; mso-list: l1 level1 lfo1; tab-stops: list 36.0pt;\"><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: Verdana; mso-bidi-font-family: Verdana; color: black;\"><span style=\"mso-list: Ignore;\">1.<span style=\"font: 7.0pt \'Times New Roman\';\">     </span></span></span><strong><span style=\"font-size: 8.5pt; mso-bidi-font-size: 11.0pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">Где можно устанавливать натяжной потолок?</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; text-align: justify; text-justify: inter-ideograph; text-indent: 15.0pt; line-height: 12.0pt;\"><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">Натяжные потолки устанавливаются практически в любом помещении с температурным режимом от +5 до +60 0С.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: .0001pt; margin-left: 15.0pt; text-align: justify; text-justify: inter-ideograph; text-indent: -18.0pt; line-height: 12.0pt; mso-list: l1 level1 lfo1; tab-stops: list 36.0pt;\"><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: Verdana; mso-bidi-font-family: Verdana; color: black;\"><span style=\"mso-list: Ignore;\">2.<span style=\"font: 7.0pt \'Times New Roman\';\">     </span></span></span><strong><span style=\"font-size: 8.5pt; mso-bidi-font-size: 11.0pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">Какие пленки используются компанией «Новый Дом» для изготовления натяжных потолков?</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; text-align: justify; text-justify: inter-ideograph; text-indent: 15.0pt; line-height: 12.0pt;\"><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">Мы используем высококачественные ПВХ-пленки европейского производства Франция, Германия и Бельгия. В наличии всегда имеется более 150 цветов и оттенков.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: .0001pt; margin-left: 15.0pt; text-align: justify; text-justify: inter-ideograph; text-indent: -18.0pt; line-height: 12.0pt; mso-list: l1 level1 lfo1; tab-stops: list 36.0pt;\"><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: Verdana; mso-bidi-font-family: Verdana; color: black;\"><span style=\"mso-list: Ignore;\">3.<span style=\"font: 7.0pt \'Times New Roman\';\">     </span></span></span><strong><span style=\"font-size: 8.5pt; mso-bidi-font-size: 11.0pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">Будет ли виден шов в натяжном потолке?</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; text-align: justify; text-justify: inter-ideograph; text-indent: 15.0pt; line-height: 12.0pt;\"><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">Да, будет. Полотна ( в нерастянутом состоянии) имеют ширину от 1,3 до 5 м, и расположение и количество швов зависит от того, какое полотно выберет заказчик. Но, в любом случае, наши специалисты сделают все возможное и расположат шов так, чтобы его практически не было видно.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: .0001pt; margin-left: 15.0pt; text-align: justify; text-justify: inter-ideograph; text-indent: -18.0pt; line-height: 12.0pt; mso-list: l1 level1 lfo1; tab-stops: list 36.0pt;\"><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: Verdana; mso-bidi-font-family: Verdana; color: black;\"><span style=\"mso-list: Ignore;\">4.<span style=\"font: 7.0pt \'Times New Roman\';\">     </span></span></span><strong><span style=\"font-size: 8.5pt; mso-bidi-font-size: 11.0pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">Какую систему крепления используют в натяжных потолках «Новый Дом»?</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; text-align: justify; text-justify: inter-ideograph; text-indent: 15.0pt; line-height: 12.0pt;\"><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">Компания </span><strong><span style=\"font-size: 8.5pt; mso-bidi-font-size: 11.0pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">«Новый Дом»</span></strong><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\"> использует самую надежную и прогрессивную гарпунную систему крепления.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: .0001pt; margin-left: 15.0pt; text-align: justify; text-justify: inter-ideograph; text-indent: -18.0pt; line-height: 12.0pt; mso-list: l1 level1 lfo1; tab-stops: list 36.0pt;\"><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: Verdana; mso-bidi-font-family: Verdana; color: black;\"><span style=\"mso-list: Ignore;\">5.<span style=\"font: 7.0pt \'Times New Roman\';\">     </span></span></span><strong><span style=\"font-size: 8.5pt; mso-bidi-font-size: 11.0pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">Есть ли запах у натяжных потолков «Новый Дом»?</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; text-align: justify; text-justify: inter-ideograph; text-indent: 15.0pt; line-height: 12.0pt;\"><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">Да, есть, как и у любой новой вещи, запах выветривается в течении 3х дней максимум.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: .0001pt; margin-left: 15.0pt; text-align: justify; text-justify: inter-ideograph; text-indent: -18.0pt; line-height: 12.0pt; mso-list: l1 level1 lfo1; tab-stops: list 36.0pt;\"><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: Verdana; mso-bidi-font-family: Verdana; color: black;\"><span style=\"mso-list: Ignore;\">6.<span style=\"font: 7.0pt \'Times New Roman\';\">     </span></span></span><strong><span style=\"font-size: 8.5pt; mso-bidi-font-size: 11.0pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">Сколько цветов имеют натяжные потолки «Новый Дом»?</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; text-align: justify; text-justify: inter-ideograph; text-indent: 15.0pt; line-height: 12.0pt;\"><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">Всегда в наличии имеется более 150 цветов и оттенков ПВХ -пленки и 5 видов различных фактур полотен.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: .0001pt; margin-left: 15.0pt; text-align: justify; text-justify: inter-ideograph; text-indent: -18.0pt; line-height: 12.0pt; mso-list: l1 level1 lfo1; tab-stops: list 36.0pt;\"><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: Verdana; mso-bidi-font-family: Verdana; color: black;\"><span style=\"mso-list: Ignore;\">7.<span style=\"font: 7.0pt \'Times New Roman\';\">     </span></span></span><strong><span style=\"font-size: 8.5pt; mso-bidi-font-size: 11.0pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">Могут ли устанавливаться светильники в натяжные потолки?</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; text-align: justify; text-justify: inter-ideograph; text-indent: 15.0pt; line-height: 12.0pt;\"><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">Да, могут. Однако мощность устанавливаемых встроенных светильников не должна превышать для ламп накаливания 60Вт, а для галогенных 30Вт, для светодиодных не ограничено.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: .0001pt; margin-left: 15.0pt; text-align: justify; text-justify: inter-ideograph; text-indent: -18.0pt; line-height: 12.0pt; mso-list: l1 level1 lfo1; tab-stops: list 36.0pt;\"><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: Verdana; mso-bidi-font-family: Verdana; color: black;\"><span style=\"mso-list: Ignore;\">8.<span style=\"font: 7.0pt \'Times New Roman\';\">     </span></span></span><strong><span style=\"font-size: 8.5pt; mso-bidi-font-size: 11.0pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">Как вызвать замерщика?</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; text-align: justify; text-justify: inter-ideograph; text-indent: 15.0pt; line-height: 12.0pt;\"><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">Для проведения замеров потолка специалисты нашей компании бесплатно выезжают на объекты в удобное для Вас время.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: .0001pt; margin-left: 15.0pt; text-align: justify; text-justify: inter-ideograph; text-indent: -18.0pt; line-height: 12.0pt; mso-list: l1 level1 lfo1; tab-stops: list 36.0pt;\"><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: Verdana; mso-bidi-font-family: Verdana; color: black;\"><span style=\"mso-list: Ignore;\">9.<span style=\"font: 7.0pt \'Times New Roman\';\">     </span></span></span><strong><span style=\"font-size: 8.5pt; mso-bidi-font-size: 11.0pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">Какой срок службы (эксплуатации) натяжного потолка?</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; text-align: justify; text-justify: inter-ideograph; text-indent: 15.0pt; line-height: 12.0pt;\"><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">При нормальной эксплуатации срок службы натяжного потолка практически неограничен. Компания </span><strong><span style=\"font-size: 8.5pt; mso-bidi-font-size: 11.0pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">«Новый Дом» </span></strong><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">дает 20-ти летнюю гарантию.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: .0001pt; margin-left: 15.0pt; text-align: justify; text-justify: inter-ideograph; text-indent: -18.0pt; line-height: 12.0pt; mso-list: l1 level1 lfo1; tab-stops: list 36.0pt;\"><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: Verdana; mso-bidi-font-family: Verdana; color: black;\"><span style=\"mso-list: Ignore;\">10.<span style=\"font: 7.0pt \'Times New Roman\';\">  </span></span></span><strong><span style=\"font-size: 8.5pt; mso-bidi-font-size: 11.0pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">Говорят, что натяжные потолки не дышат?</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; text-align: justify; text-justify: inter-ideograph; text-indent: 15.0pt; line-height: 12.0pt;\"><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">Потолки из ПВХ-пленок, так же, как и моющиеся обои, пластиковые окна, покрытые лаком паркетные полы, железобетонные панели и фирменные добротные гипсокартонные потолки, воздух не пропускают. Между тем, качество используемых компанией </span><strong><span style=\"font-size: 8.5pt; mso-bidi-font-size: 11.0pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">«Новый Дом» </span></strong><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">материалов при изготовлении натяжных потолков подтверждено Сертификатами производителей, «Выводом государственной санитарно – эпидемиологической экспертизы» Министерства охраны здоровья Украины.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: .0001pt; margin-left: 15.0pt; text-align: justify; text-justify: inter-ideograph; text-indent: -18.0pt; line-height: 12.0pt; mso-list: l1 level1 lfo1; tab-stops: list 36.0pt;\"><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: Verdana; mso-bidi-font-family: Verdana; color: black;\"><span style=\"mso-list: Ignore;\">11.<span style=\"font: 7.0pt \'Times New Roman\';\">  </span></span></span><strong><span style=\"font-size: 8.5pt; mso-bidi-font-size: 11.0pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">Какой срок установки натяжных потолков?</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; text-align: justify; text-justify: inter-ideograph; text-indent: 15.0pt; line-height: 12.0pt;\"><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">Монтаж натяжных потолков осуществляется в кратчайшие сроки в удобное для заказчика время.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: .0001pt; margin-left: 15.0pt; text-align: justify; text-justify: inter-ideograph; text-indent: -18.0pt; line-height: 12.0pt; mso-list: l1 level1 lfo1; tab-stops: list 36.0pt;\"><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: Verdana; mso-bidi-font-family: Verdana; color: black;\"><span style=\"mso-list: Ignore;\">12.<span style=\"font: 7.0pt \'Times New Roman\';\">  </span></span></span><strong><span style=\"font-size: 8.5pt; mso-bidi-font-size: 11.0pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">На каком этапе ремонта устанавливаются натяжные потолки?</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; text-align: justify; text-justify: inter-ideograph; text-indent: 15.0pt; line-height: 12.0pt;\"><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">Как правило, на заключительном этапе, во избежание загрязнения натяжного потолка.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: .0001pt; margin-left: 15.0pt; text-align: justify; text-justify: inter-ideograph; text-indent: -18.0pt; line-height: 12.0pt; mso-list: l1 level1 lfo1; tab-stops: list 36.0pt;\"><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: Verdana; mso-bidi-font-family: Verdana; color: black;\"><span style=\"mso-list: Ignore;\">13.<span style=\"font: 7.0pt \'Times New Roman\';\">  </span></span></span><strong><span style=\"font-size: 8.5pt; mso-bidi-font-size: 11.0pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">На какое расстояние от основного потолка опускается натяжной?</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; text-align: justify; text-justify: inter-ideograph; text-indent: 15.0pt; line-height: 12.0pt;\"><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">При отсутствии встроенных светильников на 3-7см, а при их наличии- на высоту светильника.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: .0001pt; margin-left: 15.0pt; text-align: justify; text-justify: inter-ideograph; text-indent: -18.0pt; line-height: 12.0pt; mso-list: l1 level1 lfo1; tab-stops: list 36.0pt;\"><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: Verdana; mso-bidi-font-family: Verdana; color: black;\"><span style=\"mso-list: Ignore;\">14.<span style=\"font: 7.0pt \'Times New Roman\';\">  </span></span></span><strong><span style=\"font-size: 8.5pt; mso-bidi-font-size: 11.0pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">Насколько безопасны натяжные потолки?</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; text-align: justify; text-justify: inter-ideograph; text-indent: 15.0pt; line-height: 12.0pt;\"><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">Натяжные потолки не выделяют и не поглощают химические вещества, не поддерживают горение и не имеют запаха. Материалы потолков сертифицированы и соответствуют требованием гигиены и пожарной безопасности.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: .0001pt; margin-left: 15.0pt; text-align: justify; text-justify: inter-ideograph; text-indent: -18.0pt; line-height: 12.0pt; mso-list: l1 level1 lfo1; tab-stops: list 36.0pt;\"><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: Verdana; mso-bidi-font-family: Verdana; color: black;\"><span style=\"mso-list: Ignore;\">15.<span style=\"font: 7.0pt \'Times New Roman\';\">  </span></span></span><strong><span style=\"font-size: 8.5pt; mso-bidi-font-size: 11.0pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">Есть ли у Вас необходимые лицензии и сертификаты?</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; text-align: justify; text-justify: inter-ideograph; text-indent: 15.0pt; line-height: 12.0pt;\"><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">Конечно, есть. При необходимости мы предоставим Вам их копии.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: .0001pt; margin-left: 15.0pt; text-align: justify; text-justify: inter-ideograph; text-indent: -18.0pt; line-height: 12.0pt; mso-list: l1 level1 lfo1; tab-stops: list 36.0pt;\"><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: Verdana; mso-bidi-font-family: Verdana; color: black;\"><span style=\"mso-list: Ignore;\">16.<span style=\"font: 7.0pt \'Times New Roman\';\">  </span></span></span><strong><span style=\"font-size: 8.5pt; mso-bidi-font-size: 11.0pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">Сколько стоит натяжной потолок?</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; text-align: justify; text-justify: inter-ideograph; text-indent: 15.0pt; line-height: 12.0pt;\"><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">Стоимость натяжного потолка зависит от нескольких факторов:</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: .0001pt; margin-left: 15.0pt; text-align: justify; text-justify: inter-ideograph; text-indent: -18.0pt; line-height: 12.0pt; mso-list: l0 level1 lfo2; tab-stops: list 36.0pt;\"><span style=\"font-size: 10.0pt; mso-bidi-font-size: 8.5pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; color: black;\"><span style=\"mso-list: Ignore;\">·<span style=\"font: 7.0pt \'Times New Roman\';\">         </span></span></span><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">от фактуры пленки и ширины;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: .0001pt; margin-left: 15.0pt; text-align: justify; text-justify: inter-ideograph; text-indent: -18.0pt; line-height: 12.0pt; mso-list: l0 level1 lfo2; tab-stops: list 36.0pt;\"><span style=\"font-size: 10.0pt; mso-bidi-font-size: 8.5pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; color: black;\"><span style=\"mso-list: Ignore;\">·<span style=\"font: 7.0pt \'Times New Roman\';\">         </span></span></span><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">площади и формы Вашего потолка;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: .0001pt; margin-left: 15.0pt; text-align: justify; text-justify: inter-ideograph; text-indent: -18.0pt; line-height: 12.0pt; mso-list: l0 level1 lfo2; tab-stops: list 36.0pt;\"><span style=\"font-size: 10.0pt; mso-bidi-font-size: 8.5pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; color: black;\"><span style=\"mso-list: Ignore;\">·<span style=\"font: 7.0pt \'Times New Roman\';\">         </span></span></span><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">количества углов и криволинейности потолка;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: .0001pt; margin-left: 15.0pt; text-align: justify; text-justify: inter-ideograph; text-indent: -18.0pt; line-height: 12.0pt; mso-list: l0 level1 lfo2; tab-stops: list 36.0pt;\"><span style=\"font-size: 10.0pt; mso-bidi-font-size: 8.5pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; color: black;\"><span style=\"mso-list: Ignore;\">·<span style=\"font: 7.0pt \'Times New Roman\';\">         </span></span></span><span style=\"font-size: 8.5pt; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">наличия светильников, систем вентиляции и т.д.</span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify; text-justify: inter-ideograph;\"> </p>', '', '1', '0', '0', '10', '2013-10-28 11:57:39', '512', '', '0000-00-00 00:00:00', '0', '512', '2013-10-28 12:00:08', '2013-10-28 11:57:39', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', '1', '0', '0', '', '', '1', '7', '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', '0', '*', '');
INSERT INTO `pxshj_content` VALUES ('12', '52', 'Общая информация и правила экспуатациии', '2013-10-28-12-14-30', '', '<p><!--[if gte mso 9]><xml>\r\n <o:OfficeDocumentSettings>\r\n  <o:RelyOnVML/>\r\n  <o:AllowPNG/>\r\n </o:OfficeDocumentSettings>\r\n</xml><![endif]--></p>\r\n<p><!--[if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves/>\r\n  <w:TrackFormatting/>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:DoNotPromoteQF/>\r\n  <w:LidThemeOther>RU</w:LidThemeOther>\r\n  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>\r\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:SplitPgBreakAndParaMark/>\r\n   <w:DontVertAlignCellWithSp/>\r\n   <w:DontBreakConstrainedForcedTables/>\r\n   <w:DontVertAlignInTxbx/>\r\n   <w:Word11KerningPairs/>\r\n   <w:CachedColBalance/>\r\n   <w:UseFELayout/>\r\n  </w:Compatibility>\r\n  <m:mathPr>\r\n   <m:mathFont m:val=\"Cambria Math\"/>\r\n   <m:brkBin m:val=\"before\"/>\r\n   <m:brkBinSub m:val=\"&#45;-\"/>\r\n   <m:smallFrac m:val=\"off\"/>\r\n   <m:dispDef/>\r\n   <m:lMargin m:val=\"0\"/>\r\n   <m:rMargin m:val=\"0\"/>\r\n   <m:defJc m:val=\"centerGroup\"/>\r\n   <m:wrapIndent m:val=\"1440\"/>\r\n   <m:intLim m:val=\"subSup\"/>\r\n   <m:naryLim m:val=\"undOvr\"/>\r\n  </m:mathPr></w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState=\"false\" DefUnhideWhenUsed=\"true\"\r\n  DefSemiHidden=\"true\" DefQFormat=\"false\" DefPriority=\"99\"\r\n  LatentStyleCount=\"267\">\r\n  <w:LsdException Locked=\"false\" Priority=\"0\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Normal\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"heading 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 7\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 8\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 9\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 7\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 8\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 9\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"35\" QFormat=\"true\" Name=\"caption\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"10\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Title\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"1\" Name=\"Default Paragraph Font\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"11\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Subtitle\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"22\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Strong\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"20\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"59\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Table Grid\"/>\r\n  <w:LsdException Locked=\"false\" UnhideWhenUsed=\"false\" Name=\"Placeholder Text\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"1\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"No Spacing\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" UnhideWhenUsed=\"false\" Name=\"Revision\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"34\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"List Paragraph\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"29\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Quote\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"30\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Intense Quote\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"19\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Subtle Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"21\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Intense Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"31\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Subtle Reference\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"32\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Intense Reference\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"33\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Book Title\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"37\" Name=\"Bibliography\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" QFormat=\"true\" Name=\"TOC Heading\"/>\r\n </w:LatentStyles>\r\n</xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n	{mso-style-name:\"Обычная таблица\";\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-priority:99;\r\n	mso-style-qformat:yes;\r\n	mso-style-parent:\"\";\r\n	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;\r\n	mso-para-margin-top:0cm;\r\n	mso-para-margin-right:0cm;\r\n	mso-para-margin-bottom:10.0pt;\r\n	mso-para-margin-left:0cm;\r\n	line-height:115%;\r\n	mso-pagination:widow-orphan;\r\n	font-size:11.0pt;\r\n	font-family:\"Calibri\",\"sans-serif\";\r\n	mso-ascii-font-family:Calibri;\r\n	mso-ascii-theme-font:minor-latin;\r\n	mso-hansi-font-family:Calibri;\r\n	mso-hansi-theme-font:minor-latin;\r\n	mso-bidi-font-family:\"Times New Roman\";\r\n	mso-bidi-theme-font:minor-bidi;}\r\n</style>\r\n<![endif]--></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify; text-justify: inter-ideograph;\"><strong style=\"mso-bidi-font-weight: normal;\"><span style=\"font-size: 14.0pt; line-height: 115%;\">Правила эксплуатации и ухода за натяжным потолком</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify; text-justify: inter-ideograph;\">Натяжной потолок достаточно прост в эксплуатации. Он в течение длительного времени не меняет своих свойств, не выгорает. Компания <strong><span style=\"font-size: 8.5pt; mso-bidi-font-size: 11.0pt; line-height: 115%; font-family: \'Verdana\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; color: black;\">«Новый Дом» </span></strong>дает 20-летнюю гарантию на натяжные потолки. При этом, при правильной эксплуатации потолка срок его службы практически не ограничен.</p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify; text-justify: inter-ideograph;\">Чтобы сохранить натяжной потолок в прекрасном состоянии, соблюдайте несколько простых правил, изложенных ниже.</p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify; text-justify: inter-ideograph;\">При загрязнении мойте натяжной потолок обычным моющим средством при температуре 30-40 градусов фланелевой тряпочкой. Не используйте абразивные моющие средства, так как они могут повредить поверхность потолка.</p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify; text-justify: inter-ideograph;\">Смоченной в растворе фланелью лёгкими движениями по направлению шва удаляйте загрязнения, затем влажной тряпкой снимите остатки мыльного раствора, после чего поверхность натяжного потолка окончательно протрите сухой фланелью.</p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify; text-justify: inter-ideograph;\">Кроме того, существуют специальные полироли для натяжных потолков, которыми Вы можете воспользоваться для достижения наилучшего результата. Лаковые полотна лучше протирать спиртосодержащими моющими средствами во избежание разводов. Замшевые полотна рекомендуется чистить мягкой щеткой.</p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify; text-justify: inter-ideograph;\">При мытье натяжных потолков обязательно регулируйте силу нажима; при соприкосновении полотна с базовым потолком может произойти повреждение полотна.</p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify; text-justify: inter-ideograph;\">Потолок следует оберегать от воздействия острых предметов, а в случае его прокола или царапины незамедлительно заклейте поврежденный участок скотчем и вызовите мастера-профессионала для устранения повреждения.</p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify; text-justify: inter-ideograph;\">Натяжные потолки рекомендуется устанавливать и эксплуатировать в отапливаемых помещениях. Допустимый температурный режим, который переносит натяжной потолок — до минус 5 градусов; при более низких температурах полотно может потрескаться.</p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify; text-justify: inter-ideograph;\">Важно правильно выбирать мощность осветительных приборов: для ламп накаливания — не более 60 Вт, для галогенных — не более 30 Вт, для светодиодных ламп не ограничено; если мощность превышена, может произойти расплавление или провисание натяжного потолка.</p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify; text-justify: inter-ideograph;\">В случае повреждения не ремонтируйте натяжной потолок собственными силами. Для ремонта или при необходимости демонтажа натяжного потолка необходимо вызывать представителей фирмы-установщика. Они обладают необходимыми навыками и оборудованием для того, чтобы сохранить Ваш натяжной потолок от повреждений и позволить ему радовать Вас долгие годы.</p>', '', '1', '0', '0', '10', '2013-10-28 12:14:30', '512', '', '2013-10-28 12:20:31', '512', '0', '0000-00-00 00:00:00', '2013-10-28 12:14:30', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', '3', '0', '0', '', '', '1', '2', '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', '0', '*', '');
INSERT INTO `pxshj_content` VALUES ('13', '54', 'Мебель', 'mebel', '', '<p>{gallery}mebel/gallery1{/gallery}</p>\r\n<div class=\"article_background\">\r\n<p><a class=\"inside_link\" href=\"index.php/mebel/kuhni\">Галерея кухонь</a><a class=\"inside_link\" href=\"index.php/mebel/kuhni2\">Галерея кухонь 2</a> <a class=\"inside_link\" href=\"index.php/mebel/kuhni3\">Галерея кухонь 3</a></p>\r\n<h1 style=\"text-align: center;\">Мебель на заказ</h1>\r\n<p>Выбор и покупка мебели – это приятные хлопоты, но и тем не менее сложная задача. В специализированных магазинах и мебельных салонах Вам на выбор представлено достаточно большое разнообразие мебельной продукции, но все равно люди не всегда могут найти то, что нужно именно им. Поэтому <strong><em>мебель на заказ</em></strong> – единственный выход для Вас, чтобы купить достойную и качественную мебель, которая бы полностью соответствовало Вашим требованиям и желаниям.</p>\r\n<p>Существует множество преимуществ изготовления <strong><em>мебели на заказ</em></strong>. К примеру, Вы можете выступить в роли дизайнера и самостоятельно разработать дизайн будущей мебели. А наши мастера изготовят именно такую мебель, которая будет полностью соответствовать Вашим желаниям и фантазиям. Да и материал выбирается именно такой, какой хочет заказчик. Но даже если вы не обладаете фантазией и не сможете составить свой дизайн, то в этом случае Вам на помощь придут профессионалы, которые сделают эту работу за Вас.</p>\r\n<p>Говоря о качестве <strong><em>мебели на заказ</em></strong>, то в качестве можно не сомневаться ни на секунду. Дело все в том что, оборудование для производства мебеливысококачественное, и поэтому нет никаких сомнений, что и мебель, сделанная на нем, будет такой же качественной.</p>\r\n<p>Большой популярностью пользуется встраиваемая мебель. Это шкафы-купе, кухни и прихожие. Такая мебель является многофункциональной и часто имеет самый разный дизайн, что позволяет существенно сэкономить пространство и решить задачу с размещением большого количества вещей и кухонной утвари. Таким образом, если Вы закажете шкаф-купе, то можно сделать так, чтобы он занял минимум полезного места в помещении.</p>\r\n<p>Договорившись с нами об изготовлении <strong><em>мебели на заказ </em></strong>у нас, мы учтём все Ваши пожелания, особенности помещения и встраиваемой бытовой техники. Совместная деятельность наших строителей и мебельщиков даст Вам оптимальный результат, гарантию и качество.</p>\r\n<p>Изготовление <strong><em>мебели на заказ</em></strong> – отличный вариант для многих наших клиентов.</p>\r\n</div>', '', '1', '0', '0', '11', '2013-10-29 14:39:27', '512', '', '2013-10-29 16:10:02', '512', '512', '2013-10-29 16:10:02', '2013-10-29 14:39:27', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', '8', '0', '2', '', '', '1', '41', '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', '0', '*', '');
INSERT INTO `pxshj_content` VALUES ('14', '55', 'Галерея кухонь', '2013-10-29-15-39-14', '', '<p>{gallery}mebel/kuhni1{/gallery}</p>', '', '1', '0', '0', '11', '2013-10-29 15:39:14', '512', '', '2013-10-29 15:56:01', '512', '0', '0000-00-00 00:00:00', '2013-10-29 15:39:14', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', '2', '0', '3', '', '', '1', '3', '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', '0', '*', '');
INSERT INTO `pxshj_content` VALUES ('15', '56', 'Галерея кухонь 2', '2', '', '<p>{gallery}mebel/kuhni1/2{/gallery}</p>', '', '1', '0', '0', '11', '2013-10-29 15:57:46', '512', '', '0000-00-00 00:00:00', '0', '0', '0000-00-00 00:00:00', '2013-10-29 15:57:46', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', '1', '0', '1', '', '', '1', '3', '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', '0', '*', '');
INSERT INTO `pxshj_content` VALUES ('16', '57', 'Галерея кухонь 3', '3', '', '<p>{gallery}mebel/kuhni1/3{/gallery}</p>', '', '1', '0', '0', '11', '2013-10-29 16:06:57', '512', '', '0000-00-00 00:00:00', '0', '0', '0000-00-00 00:00:00', '2013-10-29 16:06:57', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', '1', '0', '0', '', '', '1', '1', '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', '0', '*', '');

-- ----------------------------
-- Table structure for `pxshj_content_frontpage`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_content_frontpage`;
CREATE TABLE `pxshj_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_content_frontpage
-- ----------------------------
INSERT INTO `pxshj_content_frontpage` VALUES ('1', '1');

-- ----------------------------
-- Table structure for `pxshj_content_rating`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_content_rating`;
CREATE TABLE `pxshj_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_content_rating
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_core_log_searches`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_core_log_searches`;
CREATE TABLE `pxshj_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_core_log_searches
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_ec_video_items`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_ec_video_items`;
CREATE TABLE `pxshj_ec_video_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ordering` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `catid` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `youtubethumb` int(11) NOT NULL,
  `description` text NOT NULL,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_ec_video_items
-- ----------------------------
INSERT INTO `pxshj_ec_video_items` VALUES ('1', '1', '1', '0', '0000-00-00 00:00:00', '0', 'kjj', 'http://www.youtube.com/watch?v=jReOpOIyLqY&feature=share&list=PLXP2TjEe8q37UlXjEaKaoKWYycKMEHhzy.com/watch?v=O-tykgVlkhI', '', '1', '', '0');

-- ----------------------------
-- Table structure for `pxshj_extensions`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_extensions`;
CREATE TABLE `pxshj_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `element` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` int(10) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text NOT NULL,
  `params` text NOT NULL,
  `custom_data` text NOT NULL,
  `system_data` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10014 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_extensions
-- ----------------------------
INSERT INTO `pxshj_extensions` VALUES ('1', 'com_mailto', 'component', 'com_mailto', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"com_mailto\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_MAILTO_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('2', 'com_wrapper', 'component', 'com_wrapper', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"com_wrapper\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_WRAPPER_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('3', 'com_admin', 'component', 'com_admin', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"com_admin\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_ADMIN_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('4', 'com_banners', 'component', 'com_banners', '', '1', '1', '1', '0', '{\"legacy\":false,\"name\":\"com_banners\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_BANNERS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"purchase_type\":\"3\",\"track_impressions\":\"0\",\"track_clicks\":\"0\",\"metakey_prefix\":\"\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('5', 'com_cache', 'component', 'com_cache', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"com_cache\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CACHE_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('6', 'com_categories', 'component', 'com_categories', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"com_categories\",\"type\":\"component\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('7', 'com_checkin', 'component', 'com_checkin', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"com_checkin\",\"type\":\"component\",\"creationDate\":\"Unknown\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2008 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CHECKIN_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('8', 'com_contact', 'component', 'com_contact', '', '1', '1', '1', '0', '{\"legacy\":false,\"name\":\"com_contact\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CONTACT_XML_DESCRIPTION\",\"group\":\"\"}', '{\"show_contact_category\":\"hide\",\"show_contact_list\":\"0\",\"presentation_style\":\"sliders\",\"show_name\":\"1\",\"show_position\":\"1\",\"show_email\":\"0\",\"show_street_address\":\"1\",\"show_suburb\":\"1\",\"show_state\":\"1\",\"show_postcode\":\"1\",\"show_country\":\"1\",\"show_telephone\":\"1\",\"show_mobile\":\"1\",\"show_fax\":\"1\",\"show_webpage\":\"1\",\"show_misc\":\"1\",\"show_image\":\"1\",\"image\":\"\",\"allow_vcard\":\"0\",\"show_articles\":\"0\",\"show_profile\":\"0\",\"show_links\":\"0\",\"linka_name\":\"\",\"linkb_name\":\"\",\"linkc_name\":\"\",\"linkd_name\":\"\",\"linke_name\":\"\",\"contact_icons\":\"0\",\"icon_address\":\"\",\"icon_email\":\"\",\"icon_telephone\":\"\",\"icon_mobile\":\"\",\"icon_fax\":\"\",\"icon_misc\":\"\",\"show_headings\":\"1\",\"show_position_headings\":\"1\",\"show_email_headings\":\"0\",\"show_telephone_headings\":\"1\",\"show_mobile_headings\":\"0\",\"show_fax_headings\":\"0\",\"allow_vcard_headings\":\"0\",\"show_suburb_headings\":\"1\",\"show_state_headings\":\"1\",\"show_country_headings\":\"1\",\"show_email_form\":\"1\",\"show_email_copy\":\"1\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"1\",\"custom_reply\":\"0\",\"redirect\":\"\",\"show_category_crumb\":\"0\",\"metakey\":\"\",\"metadesc\":\"\",\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('9', 'com_cpanel', 'component', 'com_cpanel', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"com_cpanel\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CPANEL_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('10', 'com_installer', 'component', 'com_installer', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"com_installer\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_INSTALLER_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('11', 'com_languages', 'component', 'com_languages', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"com_languages\",\"type\":\"component\",\"creationDate\":\"2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\"}', '{\"administrator\":\"en-GB\",\"site\":\"en-GB\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('12', 'com_login', 'component', 'com_login', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"com_login\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_LOGIN_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('13', 'com_media', 'component', 'com_media', '', '1', '1', '0', '1', '{\"legacy\":false,\"name\":\"com_media\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_MEDIA_XML_DESCRIPTION\",\"group\":\"\"}', '{\"upload_extensions\":\"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\",\"upload_maxsize\":\"10\",\"file_path\":\"images\",\"image_path\":\"images\",\"restrict_uploads\":\"1\",\"allowed_media_usergroup\":\"3\",\"check_mime\":\"1\",\"image_extensions\":\"bmp,gif,jpg,png\",\"ignore_extensions\":\"\",\"upload_mime\":\"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip\",\"upload_mime_illegal\":\"text\\/html\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('14', 'com_menus', 'component', 'com_menus', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"com_menus\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_MENUS_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('15', 'com_messages', 'component', 'com_messages', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"com_messages\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_MESSAGES_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('16', 'com_modules', 'component', 'com_modules', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"com_modules\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_MODULES_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('17', 'com_newsfeeds', 'component', 'com_newsfeeds', '', '1', '1', '1', '0', '{\"legacy\":false,\"name\":\"com_newsfeeds\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"show_feed_image\":\"1\",\"show_feed_description\":\"1\",\"show_item_description\":\"1\",\"feed_word_count\":\"0\",\"show_headings\":\"1\",\"show_name\":\"1\",\"show_articles\":\"0\",\"show_link\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"1\",\"display_num\":\"\",\"show_pagination_limit\":\"1\",\"show_pagination\":\"1\",\"show_pagination_results\":\"1\",\"show_cat_items\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('18', 'com_plugins', 'component', 'com_plugins', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"com_plugins\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_PLUGINS_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('19', 'com_search', 'component', 'com_search', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"com_search\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_SEARCH_XML_DESCRIPTION\",\"group\":\"\"}', '{\"enabled\":\"0\",\"show_date\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('20', 'com_templates', 'component', 'com_templates', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"com_templates\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_TEMPLATES_XML_DESCRIPTION\",\"group\":\"\"}', '{\"template_positions_display\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('21', 'com_weblinks', 'component', 'com_weblinks', '', '1', '1', '1', '0', '{\"legacy\":false,\"name\":\"com_weblinks\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_WEBLINKS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"show_comp_description\":\"1\",\"comp_description\":\"\",\"show_link_hits\":\"1\",\"show_link_description\":\"1\",\"show_other_cats\":\"0\",\"show_headings\":\"0\",\"show_numbers\":\"0\",\"show_report\":\"1\",\"count_clicks\":\"1\",\"target\":\"0\",\"link_icons\":\"\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('22', 'com_content', 'component', 'com_content', '', '1', '1', '0', '1', '{\"legacy\":false,\"name\":\"com_content\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CONTENT_XML_DESCRIPTION\",\"group\":\"\"}', '{\"article_layout\":\"_:default\",\"show_title\":\"0\",\"link_titles\":\"0\",\"show_intro\":\"1\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_parent_category\":\"0\",\"link_parent_category\":\"0\",\"show_author\":\"0\",\"link_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"0\",\"show_item_navigation\":\"0\",\"show_vote\":\"0\",\"show_readmore\":\"1\",\"show_readmore_title\":\"0\",\"readmore_limit\":\"100\",\"show_icons\":\"0\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"show_hits\":\"0\",\"show_noauth\":\"0\",\"urls_position\":\"0\",\"show_publishing_options\":\"1\",\"show_article_options\":\"1\",\"show_urls_images_frontend\":\"0\",\"show_urls_images_backend\":\"1\",\"targeta\":0,\"targetb\":0,\"targetc\":0,\"float_intro\":\"left\",\"float_fulltext\":\"left\",\"category_layout\":\"_:blog\",\"show_category_heading_title_text\":\"1\",\"show_category_title\":\"0\",\"show_description\":\"0\",\"show_description_image\":\"0\",\"maxLevel\":\"1\",\"show_empty_categories\":\"0\",\"show_no_articles\":\"1\",\"show_subcat_desc\":\"1\",\"show_cat_num_articles\":\"0\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_num_articles_cat\":\"1\",\"num_leading_articles\":\"0\",\"num_intro_articles\":\"4\",\"num_columns\":\"1\",\"num_links\":\"4\",\"multi_column_order\":\"0\",\"show_subcategory_content\":\"0\",\"show_pagination_limit\":\"1\",\"filter_field\":\"hide\",\"show_headings\":\"1\",\"list_show_date\":\"0\",\"date_format\":\"\",\"list_show_hits\":\"1\",\"list_show_author\":\"1\",\"orderby_pri\":\"order\",\"orderby_sec\":\"rdate\",\"order_date\":\"published\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"show_feed_link\":\"1\",\"feed_summary\":\"0\",\"feed_show_readmore\":\"0\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('23', 'com_config', 'component', 'com_config', '', '1', '1', '0', '1', '{\"legacy\":false,\"name\":\"com_config\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CONFIG_XML_DESCRIPTION\",\"group\":\"\"}', '{\"filters\":{\"1\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"6\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"7\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"2\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"3\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"4\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"5\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"10\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"12\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"8\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"}}}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('24', 'com_redirect', 'component', 'com_redirect', '', '1', '1', '0', '1', '{\"legacy\":false,\"name\":\"com_redirect\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('25', 'com_users', 'component', 'com_users', '', '1', '1', '0', '1', '{\"legacy\":false,\"name\":\"com_users\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_USERS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"allowUserRegistration\":\"1\",\"new_usertype\":\"2\",\"guest_usergroup\":\"1\",\"sendpassword\":\"1\",\"useractivation\":\"2\",\"mail_to_admin\":\"1\",\"captcha\":\"\",\"frontend_userparams\":\"1\",\"site_language\":\"0\",\"change_login_name\":\"0\",\"reset_count\":\"10\",\"reset_time\":\"1\",\"mailSubjectPrefix\":\"\",\"mailBodySuffix\":\"\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('27', 'com_finder', 'component', 'com_finder', '', '1', '1', '0', '0', '{\"legacy\":false,\"name\":\"com_finder\",\"type\":\"component\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_FINDER_XML_DESCRIPTION\",\"group\":\"\"}', '{\"show_description\":\"1\",\"description_length\":255,\"allow_empty_query\":\"0\",\"show_url\":\"1\",\"show_advanced\":\"1\",\"expand_advanced\":\"0\",\"show_date_filters\":\"0\",\"highlight_terms\":\"1\",\"opensearch_name\":\"\",\"opensearch_description\":\"\",\"batch_size\":\"50\",\"memory_table_limit\":30000,\"title_multiplier\":\"1.7\",\"text_multiplier\":\"0.7\",\"meta_multiplier\":\"1.2\",\"path_multiplier\":\"2.0\",\"misc_multiplier\":\"0.3\",\"stemmer\":\"snowball\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('28', 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', '1', '1', '0', '1', '{\"legacy\":false,\"name\":\"com_joomlaupdate\",\"type\":\"component\",\"creationDate\":\"February 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('100', 'PHPMailer', 'library', 'phpmailer', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"PHPMailer\",\"type\":\"library\",\"creationDate\":\"2001\",\"author\":\"PHPMailer\",\"copyright\":\"(c) 2001-2003, Brent R. Matzelle, (c) 2004-2009, Andy Prevost. All Rights Reserved., (c) 2010-2011, Jim Jagielski. All Rights Reserved.\",\"authorEmail\":\"jimjag@gmail.com\",\"authorUrl\":\"https:\\/\\/code.google.com\\/a\\/apache-extras.org\\/p\\/phpmailer\\/\",\"version\":\"5.2\",\"description\":\"LIB_PHPMAILER_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('101', 'SimplePie', 'library', 'simplepie', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"SimplePie\",\"type\":\"library\",\"creationDate\":\"2004\",\"author\":\"SimplePie\",\"copyright\":\"Copyright (c) 2004-2009, Ryan Parman and Geoffrey Sneddon\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/simplepie.org\\/\",\"version\":\"1.2\",\"description\":\"LIB_SIMPLEPIE_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('102', 'phputf8', 'library', 'phputf8', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"phputf8\",\"type\":\"library\",\"creationDate\":\"2006\",\"author\":\"Harry Fuecks\",\"copyright\":\"Copyright various authors\",\"authorEmail\":\"hfuecks@gmail.com\",\"authorUrl\":\"http:\\/\\/sourceforge.net\\/projects\\/phputf8\",\"version\":\"0.5\",\"description\":\"LIB_PHPUTF8_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('103', 'Joomla! Platform', 'library', 'joomla', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"Joomla! Platform\",\"type\":\"library\",\"creationDate\":\"2008\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"http:\\/\\/www.joomla.org\",\"version\":\"11.4\",\"description\":\"LIB_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('200', 'mod_articles_archive', 'module', 'mod_articles_archive', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_articles_archive\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters.\\n\\t\\tAll rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('201', 'mod_articles_latest', 'module', 'mod_articles_latest', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_articles_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_LATEST_NEWS_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('202', 'mod_articles_popular', 'module', 'mod_articles_popular', '', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_articles_popular\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('203', 'mod_banners', 'module', 'mod_banners', '', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_banners\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_BANNERS_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('204', 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_breadcrumbs\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_BREADCRUMBS_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('205', 'mod_custom', 'module', 'mod_custom', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('206', 'mod_feed', 'module', 'mod_feed', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('207', 'mod_footer', 'module', 'mod_footer', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_footer\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_FOOTER_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('208', 'mod_login', 'module', 'mod_login', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('209', 'mod_menu', 'module', 'mod_menu', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('210', 'mod_articles_news', 'module', 'mod_articles_news', '', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_articles_news\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_ARTICLES_NEWS_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('211', 'mod_random_image', 'module', 'mod_random_image', '', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_random_image\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_RANDOM_IMAGE_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('212', 'mod_related_items', 'module', 'mod_related_items', '', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_related_items\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_RELATED_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('213', 'mod_search', 'module', 'mod_search', '', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_search\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_SEARCH_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('214', 'mod_stats', 'module', 'mod_stats', '', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_stats\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('215', 'mod_syndicate', 'module', 'mod_syndicate', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_syndicate\",\"type\":\"module\",\"creationDate\":\"May 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_SYNDICATE_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('216', 'mod_users_latest', 'module', 'mod_users_latest', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_users_latest\",\"type\":\"module\",\"creationDate\":\"December 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_USERS_LATEST_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('217', 'mod_weblinks', 'module', 'mod_weblinks', '', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_weblinks\",\"type\":\"module\",\"creationDate\":\"July 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_WEBLINKS_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('218', 'mod_whosonline', 'module', 'mod_whosonline', '', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_whosonline\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_WHOSONLINE_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('219', 'mod_wrapper', 'module', 'mod_wrapper', '', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_wrapper\",\"type\":\"module\",\"creationDate\":\"October 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_WRAPPER_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('220', 'mod_articles_category', 'module', 'mod_articles_category', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_articles_category\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('221', 'mod_articles_categories', 'module', 'mod_articles_categories', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_articles_categories\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('222', 'mod_languages', 'module', 'mod_languages', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_languages\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('223', 'mod_finder', 'module', 'mod_finder', '', '0', '1', '0', '0', '{\"legacy\":false,\"name\":\"mod_finder\",\"type\":\"module\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_FINDER_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('300', 'mod_custom', 'module', 'mod_custom', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('301', 'mod_feed', 'module', 'mod_feed', '', '1', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('302', 'mod_latest', 'module', 'mod_latest', '', '1', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_LATEST_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('303', 'mod_logged', 'module', 'mod_logged', '', '1', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_logged\",\"type\":\"module\",\"creationDate\":\"January 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_LOGGED_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('304', 'mod_login', 'module', 'mod_login', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"March 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('305', 'mod_menu', 'module', 'mod_menu', '', '1', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('307', 'mod_popular', 'module', 'mod_popular', '', '1', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_popular\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('308', 'mod_quickicon', 'module', 'mod_quickicon', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_quickicon\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_QUICKICON_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('309', 'mod_status', 'module', 'mod_status', '', '1', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_status\",\"type\":\"module\",\"creationDate\":\"Feb 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_STATUS_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('310', 'mod_submenu', 'module', 'mod_submenu', '', '1', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_submenu\",\"type\":\"module\",\"creationDate\":\"Feb 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_SUBMENU_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('311', 'mod_title', 'module', 'mod_title', '', '1', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_title\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_TITLE_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('312', 'mod_toolbar', 'module', 'mod_toolbar', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_toolbar\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_TOOLBAR_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('313', 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', '1', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_multilangstatus\",\"type\":\"module\",\"creationDate\":\"September 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_MULTILANGSTATUS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"cache\":\"0\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('314', 'mod_version', 'module', 'mod_version', '', '1', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_version\",\"type\":\"module\",\"creationDate\":\"January 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_VERSION_XML_DESCRIPTION\",\"group\":\"\"}', '{\"format\":\"short\",\"product\":\"1\",\"cache\":\"0\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('400', 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', '0', '0', '1', '0', '{\"legacy\":false,\"name\":\"plg_authentication_gmail\",\"type\":\"plugin\",\"creationDate\":\"February 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_GMAIL_XML_DESCRIPTION\",\"group\":\"\"}', '{\"applysuffix\":\"0\",\"suffix\":\"\",\"verifypeer\":\"1\",\"user_blacklist\":\"\"}', '', '', '0', '0000-00-00 00:00:00', '1', '0');
INSERT INTO `pxshj_extensions` VALUES ('401', 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"plg_authentication_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_AUTH_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('402', 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', '0', '0', '1', '0', '{\"legacy\":false,\"name\":\"plg_authentication_ldap\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_LDAP_XML_DESCRIPTION\",\"group\":\"\"}', '{\"host\":\"\",\"port\":\"389\",\"use_ldapV3\":\"0\",\"negotiate_tls\":\"0\",\"no_referrals\":\"0\",\"auth_method\":\"bind\",\"base_dn\":\"\",\"search_string\":\"\",\"users_dn\":\"\",\"username\":\"admin\",\"password\":\"bobby7\",\"ldap_fullname\":\"fullName\",\"ldap_email\":\"mail\",\"ldap_uid\":\"uid\"}', '', '', '0', '0000-00-00 00:00:00', '3', '0');
INSERT INTO `pxshj_extensions` VALUES ('404', 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_content_emailcloak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION\",\"group\":\"\"}', '{\"mode\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '1', '0');
INSERT INTO `pxshj_extensions` VALUES ('405', 'plg_content_geshi', 'plugin', 'geshi', 'content', '0', '0', '1', '0', '{\"legacy\":false,\"name\":\"plg_content_geshi\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"qbnz.com\\/highlighter\",\"version\":\"2.5.0\",\"description\":\"PLG_CONTENT_GESHI_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '2', '0');
INSERT INTO `pxshj_extensions` VALUES ('406', 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_content_loadmodule\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_LOADMODULE_XML_DESCRIPTION\",\"group\":\"\"}', '{\"style\":\"xhtml\"}', '', '', '0', '2011-09-18 15:22:50', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('407', 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"plg_content_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\"}', '{\"title\":\"1\",\"multipage_toc\":\"1\",\"showall\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '4', '0');
INSERT INTO `pxshj_extensions` VALUES ('408', 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"plg_content_pagenavigation\",\"type\":\"plugin\",\"creationDate\":\"January 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_PAGENAVIGATION_XML_DESCRIPTION\",\"group\":\"\"}', '{\"position\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '5', '0');
INSERT INTO `pxshj_extensions` VALUES ('409', 'plg_content_vote', 'plugin', 'vote', 'content', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"plg_content_vote\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_VOTE_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '6', '0');
INSERT INTO `pxshj_extensions` VALUES ('410', 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"plg_editors_codemirror\",\"type\":\"plugin\",\"creationDate\":\"28 March 2011\",\"author\":\"Marijn Haverbeke\",\"copyright\":\"\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"PLG_CODEMIRROR_XML_DESCRIPTION\",\"group\":\"\"}', '{\"linenumbers\":\"0\",\"tabmode\":\"indent\"}', '', '', '0', '0000-00-00 00:00:00', '1', '0');
INSERT INTO `pxshj_extensions` VALUES ('411', 'plg_editors_none', 'plugin', 'none', 'editors', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"plg_editors_none\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Unknown\",\"copyright\":\"\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"\",\"version\":\"2.5.0\",\"description\":\"PLG_NONE_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '2', '0');
INSERT INTO `pxshj_extensions` VALUES ('412', 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"plg_editors_tinymce\",\"type\":\"plugin\",\"creationDate\":\"2005-2013\",\"author\":\"Moxiecode Systems AB\",\"copyright\":\"Moxiecode Systems AB\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"tinymce.moxiecode.com\\/\",\"version\":\"3.5.4.1\",\"description\":\"PLG_TINY_XML_DESCRIPTION\",\"group\":\"\"}', '{\"mode\":\"1\",\"skin\":\"0\",\"entity_encoding\":\"raw\",\"lang_mode\":\"0\",\"lang_code\":\"en\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"invalid_elements\":\"applet\",\"extended_elements\":\"\",\"toolbar\":\"top\",\"toolbar_align\":\"left\",\"html_height\":\"550\",\"html_width\":\"750\",\"resizing\":\"true\",\"resize_horizontal\":\"false\",\"element_path\":\"1\",\"fonts\":\"1\",\"paste\":\"1\",\"searchreplace\":\"1\",\"insertdate\":\"1\",\"format_date\":\"%Y-%m-%d\",\"inserttime\":\"1\",\"format_time\":\"%H:%M:%S\",\"colors\":\"1\",\"table\":\"1\",\"smilies\":\"1\",\"media\":\"1\",\"hr\":\"1\",\"directionality\":\"1\",\"fullscreen\":\"1\",\"style\":\"1\",\"layer\":\"1\",\"xhtmlxtras\":\"1\",\"visualchars\":\"1\",\"visualblocks\":\"1\",\"nonbreaking\":\"1\",\"template\":\"1\",\"blockquote\":\"1\",\"wordcount\":\"1\",\"advimage\":\"1\",\"advlink\":\"1\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"inlinepopups\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"}', '', '', '0', '0000-00-00 00:00:00', '3', '0');
INSERT INTO `pxshj_extensions` VALUES ('413', 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"plg_editors-xtd_article\",\"type\":\"plugin\",\"creationDate\":\"October 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_ARTICLE_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '1', '0');
INSERT INTO `pxshj_extensions` VALUES ('414', 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_editors-xtd_image\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_IMAGE_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '2', '0');
INSERT INTO `pxshj_extensions` VALUES ('415', 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_editors-xtd_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '3', '0');
INSERT INTO `pxshj_extensions` VALUES ('416', 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_editors-xtd_readmore\",\"type\":\"plugin\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_READMORE_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '4', '0');
INSERT INTO `pxshj_extensions` VALUES ('417', 'plg_search_categories', 'plugin', 'categories', 'search', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_search_categories\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}', '{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('418', 'plg_search_contacts', 'plugin', 'contacts', 'search', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_search_contacts\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SEARCH_CONTACTS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('419', 'plg_search_content', 'plugin', 'content', 'search', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_search_content\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SEARCH_CONTENT_XML_DESCRIPTION\",\"group\":\"\"}', '{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('420', 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_search_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('421', 'plg_search_weblinks', 'plugin', 'weblinks', 'search', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_search_weblinks\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SEARCH_WEBLINKS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('422', 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', '0', '0', '1', '1', '{\"legacy\":false,\"name\":\"plg_system_languagefilter\",\"type\":\"plugin\",\"creationDate\":\"July 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '1', '0');
INSERT INTO `pxshj_extensions` VALUES ('423', 'plg_system_p3p', 'plugin', 'p3p', 'system', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"plg_system_p3p\",\"type\":\"plugin\",\"creationDate\":\"September 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_P3P_XML_DESCRIPTION\",\"group\":\"\"}', '{\"headers\":\"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM\"}', '', '', '0', '0000-00-00 00:00:00', '2', '0');
INSERT INTO `pxshj_extensions` VALUES ('424', 'plg_system_cache', 'plugin', 'cache', 'system', '0', '0', '1', '1', '{\"legacy\":false,\"name\":\"plg_system_cache\",\"type\":\"plugin\",\"creationDate\":\"February 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CACHE_XML_DESCRIPTION\",\"group\":\"\"}', '{\"browsercache\":\"0\",\"cachetime\":\"15\"}', '', '', '0', '0000-00-00 00:00:00', '9', '0');
INSERT INTO `pxshj_extensions` VALUES ('425', 'plg_system_debug', 'plugin', 'debug', 'system', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_system_debug\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_DEBUG_XML_DESCRIPTION\",\"group\":\"\"}', '{\"profile\":\"1\",\"queries\":\"1\",\"memory\":\"1\",\"language_files\":\"1\",\"language_strings\":\"1\",\"strip-first\":\"1\",\"strip-prefix\":\"\",\"strip-suffix\":\"\"}', '', '', '0', '0000-00-00 00:00:00', '4', '0');
INSERT INTO `pxshj_extensions` VALUES ('426', 'plg_system_log', 'plugin', 'log', 'system', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"plg_system_log\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_LOG_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '5', '0');
INSERT INTO `pxshj_extensions` VALUES ('427', 'plg_system_redirect', 'plugin', 'redirect', 'system', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"plg_system_redirect\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_REDIRECT_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '6', '0');
INSERT INTO `pxshj_extensions` VALUES ('428', 'plg_system_remember', 'plugin', 'remember', 'system', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"plg_system_remember\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_REMEMBER_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '7', '0');
INSERT INTO `pxshj_extensions` VALUES ('429', 'plg_system_sef', 'plugin', 'sef', 'system', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_system_sef\",\"type\":\"plugin\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SEF_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '8', '0');
INSERT INTO `pxshj_extensions` VALUES ('430', 'plg_system_logout', 'plugin', 'logout', 'system', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"plg_system_logout\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '3', '0');
INSERT INTO `pxshj_extensions` VALUES ('431', 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', '0', '0', '1', '1', '{\"legacy\":false,\"name\":\"plg_user_contactcreator\",\"type\":\"plugin\",\"creationDate\":\"August 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CONTACTCREATOR_XML_DESCRIPTION\",\"group\":\"\"}', '{\"autowebpage\":\"\",\"category\":\"34\",\"autopublish\":\"0\"}', '', '', '0', '0000-00-00 00:00:00', '1', '0');
INSERT INTO `pxshj_extensions` VALUES ('432', 'plg_user_joomla', 'plugin', 'joomla', 'user', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_user_joomla\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2009 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_USER_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}', '{\"autoregister\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '2', '0');
INSERT INTO `pxshj_extensions` VALUES ('433', 'plg_user_profile', 'plugin', 'profile', 'user', '0', '0', '1', '1', '{\"legacy\":false,\"name\":\"plg_user_profile\",\"type\":\"plugin\",\"creationDate\":\"January 2008\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_USER_PROFILE_XML_DESCRIPTION\",\"group\":\"\"}', '{\"register-require_address1\":\"1\",\"register-require_address2\":\"1\",\"register-require_city\":\"1\",\"register-require_region\":\"1\",\"register-require_country\":\"1\",\"register-require_postal_code\":\"1\",\"register-require_phone\":\"1\",\"register-require_website\":\"1\",\"register-require_favoritebook\":\"1\",\"register-require_aboutme\":\"1\",\"register-require_tos\":\"1\",\"register-require_dob\":\"1\",\"profile-require_address1\":\"1\",\"profile-require_address2\":\"1\",\"profile-require_city\":\"1\",\"profile-require_region\":\"1\",\"profile-require_country\":\"1\",\"profile-require_postal_code\":\"1\",\"profile-require_phone\":\"1\",\"profile-require_website\":\"1\",\"profile-require_favoritebook\":\"1\",\"profile-require_aboutme\":\"1\",\"profile-require_tos\":\"1\",\"profile-require_dob\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('434', 'plg_extension_joomla', 'plugin', 'joomla', 'extension', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"plg_extension_joomla\",\"type\":\"plugin\",\"creationDate\":\"May 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '1', '0');
INSERT INTO `pxshj_extensions` VALUES ('435', 'plg_content_joomla', 'plugin', 'joomla', 'content', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_content_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CONTENT_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('436', 'plg_system_languagecode', 'plugin', 'languagecode', 'system', '0', '0', '1', '0', '{\"legacy\":false,\"name\":\"plg_system_languagecode\",\"type\":\"plugin\",\"creationDate\":\"November 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '10', '0');
INSERT INTO `pxshj_extensions` VALUES ('437', 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', 'quickicon', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"plg_quickicon_joomlaupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('438', 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', 'quickicon', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"plg_quickicon_extensionupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('439', 'plg_captcha_recaptcha', 'plugin', 'recaptcha', 'captcha', '0', '0', '1', '0', '{\"legacy\":false,\"name\":\"plg_captcha_recaptcha\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION\",\"group\":\"\"}', '{\"public_key\":\"\",\"private_key\":\"\",\"theme\":\"clean\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('440', 'plg_system_highlight', 'plugin', 'highlight', 'system', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_system_highlight\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '7', '0');
INSERT INTO `pxshj_extensions` VALUES ('441', 'plg_content_finder', 'plugin', 'finder', 'content', '0', '0', '1', '0', '{\"legacy\":false,\"name\":\"plg_content_finder\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CONTENT_FINDER_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('442', 'plg_finder_categories', 'plugin', 'categories', 'finder', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_finder_categories\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_FINDER_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '1', '0');
INSERT INTO `pxshj_extensions` VALUES ('443', 'plg_finder_contacts', 'plugin', 'contacts', 'finder', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_finder_contacts\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_FINDER_CONTACTS_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '2', '0');
INSERT INTO `pxshj_extensions` VALUES ('444', 'plg_finder_content', 'plugin', 'content', 'finder', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_finder_content\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_FINDER_CONTENT_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '3', '0');
INSERT INTO `pxshj_extensions` VALUES ('445', 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', 'finder', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_finder_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '4', '0');
INSERT INTO `pxshj_extensions` VALUES ('446', 'plg_finder_weblinks', 'plugin', 'weblinks', 'finder', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_finder_weblinks\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_FINDER_WEBLINKS_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '5', '0');
INSERT INTO `pxshj_extensions` VALUES ('500', 'atomic', 'template', 'atomic', '', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"atomic\",\"type\":\"template\",\"creationDate\":\"10\\/10\\/09\",\"author\":\"Ron Severdia\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"contact@kontentdesign.com\",\"authorUrl\":\"http:\\/\\/www.kontentdesign.com\",\"version\":\"2.5.0\",\"description\":\"TPL_ATOMIC_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('502', 'bluestork', 'template', 'bluestork', '', '1', '1', '1', '0', '{\"legacy\":false,\"name\":\"bluestork\",\"type\":\"template\",\"creationDate\":\"07\\/02\\/09\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"TPL_BLUESTORK_XML_DESCRIPTION\",\"group\":\"\"}', '{\"useRoundedCorners\":\"1\",\"showSiteName\":\"0\",\"textBig\":\"0\",\"highContrast\":\"0\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('503', 'beez_20', 'template', 'beez_20', '', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"beez_20\",\"type\":\"template\",\"creationDate\":\"25 November 2009\",\"author\":\"Angie Radtke\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"a.radtke@derauftritt.de\",\"authorUrl\":\"http:\\/\\/www.der-auftritt.de\",\"version\":\"2.5.0\",\"description\":\"TPL_BEEZ2_XML_DESCRIPTION\",\"group\":\"\"}', '{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"sitetitle\":\"\",\"sitedescription\":\"\",\"navposition\":\"center\",\"templatecolor\":\"nature\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('504', 'hathor', 'template', 'hathor', '', '1', '1', '1', '0', '{\"legacy\":false,\"name\":\"hathor\",\"type\":\"template\",\"creationDate\":\"May 2010\",\"author\":\"Andrea Tarr\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"hathor@tarrconsulting.com\",\"authorUrl\":\"http:\\/\\/www.tarrconsulting.com\",\"version\":\"2.5.0\",\"description\":\"TPL_HATHOR_XML_DESCRIPTION\",\"group\":\"\"}', '{\"showSiteName\":\"0\",\"colourChoice\":\"0\",\"boldText\":\"0\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('505', 'beez5', 'template', 'beez5', '', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"beez5\",\"type\":\"template\",\"creationDate\":\"21 May 2010\",\"author\":\"Angie Radtke\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"a.radtke@derauftritt.de\",\"authorUrl\":\"http:\\/\\/www.der-auftritt.de\",\"version\":\"2.5.0\",\"description\":\"TPL_BEEZ5_XML_DESCRIPTION\",\"group\":\"\"}', '{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"sitetitle\":\"\",\"sitedescription\":\"\",\"navposition\":\"center\",\"html5\":\"0\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('600', 'English (United Kingdom)', 'language', 'en-GB', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"English (United Kingdom)\",\"type\":\"language\",\"creationDate\":\"2008-03-15\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.10\",\"description\":\"en-GB site language\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('601', 'English (United Kingdom)', 'language', 'en-GB', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"English (United Kingdom)\",\"type\":\"language\",\"creationDate\":\"2008-03-15\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.10\",\"description\":\"en-GB administrator language\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('700', 'files_joomla', 'file', 'joomla', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"files_joomla\",\"type\":\"file\",\"creationDate\":\"July 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.13\",\"description\":\"FILES_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('800', 'PKG_JOOMLA', 'package', 'pkg_joomla', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"PKG_JOOMLA\",\"type\":\"package\",\"creationDate\":\"2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"http:\\/\\/www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PKG_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('10000', 'helloworld', 'component', 'com_helloworld', '', '1', '0', '0', '0', 'false', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('10001', 'helloworld', 'component', 'com_helloworld', '', '1', '0', '0', '0', 'false', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('10002', 'helloworld', 'component', 'com_helloworld', '', '1', '0', '0', '0', 'false', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('10003', 'helloworld', 'component', 'com_helloworld', '', '1', '0', '0', '0', 'false', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('10004', 'helloworld', 'component', 'com_helloworld', '', '1', '1', '0', '0', '{\"legacy\":false,\"name\":\"Hello World!\",\"type\":\"component\",\"creationDate\":\"\\u0418\\u044e\\u043b\\u044c 2012\",\"author\":\"\\u0412\\u0430\\u0441\\u044f \\u041f\\u0443\\u043f\\u043a\\u0438\\u043d\",\"copyright\":\"\\u0418\\u043d\\u0444\\u043e\\u0440\\u043c\\u0430\\u0446\\u0438\\u044f \\u043e \\u043a\\u043e\\u043f\\u0438\\u0440\\u0430\\u0439\\u0442\\u0435\",\"authorEmail\":\"\\u0412\\u0430\\u0448 e-mail\",\"authorUrl\":\"\\u0412\\u0430\\u0448 \\u0441\\u0430\\u0439\\u0442\",\"version\":\"0.0.1\",\"description\":\"\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 \\u043a\\u043e\\u043c\\u043f\\u043e\\u043d\\u0435\\u043d\\u0442\\u0430 Hello World! ...\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('10005', 'vt_personal', 'template', 'vt_personal', '', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"vt_personal\",\"type\":\"template\",\"creationDate\":\"2011\\/01\\/01\",\"author\":\"VTEM.NET\",\"copyright\":\"\\u00a9 copyright 2011 VTEM\",\"authorEmail\":\"tuyen0110@gmail.com\",\"authorUrl\":\"http:\\/\\/www.vtem.net\",\"version\":\"1.1\",\"description\":\"\\n<h3>Overview of VTEM Templates<\\/h3>\\n<p>This Template is a generation template framework developed by VTEM for Joomla! 1.5 and above. This template is a sophisticated Joomla template framework with the sole intention of being the best platform to build a solid template with. This template takes all the lessons learned during the development of many VTEM templates and distills that knowledge into a single super-flexible framework that is easy to configure, simple to extend, and powerful enough to handle anything we want to throw at it.<\\/p>\\n<h3>Key Features<\\/h3>\\n<ul>\\n   <li>960 Grid System (http:\\/\\/960.gs) for simple consistent layout. 12 and 16 column support<\\/li>\\n   <li>VTEM-menu control over all functionality<\\/li>\\n   <li>Ability to save\\/remove custom presets<\\/li>\\n   <li>Built-in AJAX Support<\\/li>\\n   <li>RTL language support<\\/li>\\n   <li>Support Google font - give you added control when using linked font<\\/li>\\n   <li>CSS & JS Compress - minify the number and weight of files<\\/li>\\n   <li>Multi-themes & User theme support.<\\/li>\\n<\\/ul>\\n\",\"group\":\"\"}', '{\"TemplateStyle\":\"style1\",\"layout\":\"br\",\"logo\":\"0\",\"logotext\":\"VTEM LOGO\",\"slogan\":\"Professional vision\",\"copyright\":\"1\",\"SystemMessages\":\"1\",\"IE6Warning\":\"1\",\"GoogleAnalytics\":\"0\",\"gacode\":\"\",\"custommenu\":\"0\",\"menutype\":\"top\",\"menustyle\":\"1\",\"mootransition\":\"fade\",\"startLevel\":\"0\",\"endLevel\":\"10\",\"templatewidth\":\"980\",\"leftwidth\":\"30\",\"rightwidth\":\"30\",\"drawertype\":\"1\",\"drawermanual1\":\"20\",\"drawermanual2\":\"20\",\"drawermanual3\":\"20\",\"drawermanual4\":\"20\",\"drawermanual5\":\"20\",\"drawermanual6\":\"0\",\"headertype\":\"1\",\"headermanual1\":\"20\",\"headermanual2\":\"20\",\"headermanual3\":\"20\",\"headermanual4\":\"20\",\"headermanual5\":\"20\",\"headermanual6\":\"0\",\"toptype\":\"1\",\"topmanual1\":\"20\",\"topmanual2\":\"20\",\"topmanual3\":\"20\",\"topmanual4\":\"20\",\"topmanual5\":\"20\",\"topmanual6\":\"0\",\"showcasetype\":\"1\",\"showcasemanual1\":\"20\",\"showcasemanual2\":\"20\",\"showcasemanual3\":\"20\",\"showcasemanual4\":\"20\",\"showcasemanual5\":\"20\",\"showcasemanual6\":\"0\",\"featuretype\":\"1\",\"featuremanual1\":\"20\",\"featuremanual2\":\"20\",\"featuremanual3\":\"20\",\"featuremanual4\":\"20\",\"featuremanual5\":\"20\",\"featuremanual6\":\"0\",\"utilitytype\":\"1\",\"utilitymanual1\":\"20\",\"utilitymanual2\":\"20\",\"utilitymanual3\":\"20\",\"utilitymanual4\":\"20\",\"utilitymanual5\":\"20\",\"utilitymanual6\":\"0\",\"bottomtype\":\"1\",\"bottommanual1\":\"20\",\"bottommanual2\":\"20\",\"bottommanual3\":\"20\",\"bottommanual4\":\"20\",\"bottommanual5\":\"20\",\"bottommanual6\":\"0\",\"footertype\":\"1\",\"footermanual1\":\"20\",\"footermanual2\":\"20\",\"footermanual3\":\"20\",\"footermanual4\":\"20\",\"footermanual5\":\"20\",\"footermanual6\":\"0\",\"copyrighttype\":\"1\",\"copyrightmanual1\":\"20\",\"copyrightmanual2\":\"20\",\"copyrightmanual3\":\"20\",\"copyrightmanual4\":\"20\",\"copyrightmanual5\":\"20\",\"copyrightmanual6\":\"0\",\"fontfamily\":\"Arial, Helvetica, sans-serif\",\"fontsize\":\"12px\",\"totop\":\"1\",\"responsive\":\"1\",\"PageSuffix\":\"1\",\"jquery\":\"0\",\"webfont\":\"0\",\"googlefont\":\"no\",\"googlefontelements\":\"h3,#vtem_menu\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('10006', 'VTEM Image Show', 'module', 'mod_vtem_imageshow', '', '0', '1', '0', '0', '{\"legacy\":false,\"name\":\"VTEM Image Show\",\"type\":\"module\",\"creationDate\":\"01\\/01\\/2011\",\"author\":\"Nguyen Van Tuyen\",\"copyright\":\"(C) 2011 vtem.net - All rights reserved.\",\"authorEmail\":\"tuyen0110@gmail.com\",\"authorUrl\":\"www.vtem.net\",\"version\":\"1.1\",\"description\":\"\\n\\t\\t<style type=\'text\\/css\'>span.readonly { padding: 10px; font-family: Arial; font-size:13px !important; font-weight: normal !important; text-align: justify; color: #4d4d4d; line-height: 24px; } span.readonly h1 { clear:both; font-family: Georgia, sans-serif; font-size:38px; margin:30px 20px 23px; padding:0px 0px 24px 10px; color:#333; border-bottom: 1px solid #eee; font-weight: normal; } span.readonly p { margin: 0 26px 10px } span.readonly p a { color: #ab3f0a } span.readonly p.homepage { margin-top: 30px }.panel fieldset.panelform > ul > li > label{color: #999;font-size:10px;text-transform:uppercase;height: 24px;line-height: 24px;max-width: 35% !important;min-width: 35% !important;padding:0 5px;}.panel fieldset.panelform ul li{border-top:1px solid #f3f3f3;clear:both;}.pane-sliders .panel h3.title{padding: 12px 0;margin: 2px 0;border:1px solid #ddd;-moz-border-radius:3px;-webkit-border-radius:3px;border-radius:3px;}.pane-sliders .panel{border:none !important;}.pane-sliders .content input,.pane-sliders .content select,.pane-sliders .content textarea{padding:5px; border:1px solid #ddd;-moz-border-radius:3px;-webkit-border-radius:3px;border-radius:3px; font-size:12px;font-family:Arial, Helvetica, sans-serif; color:#666;-webkit-box-shadow: inset 0px 0px 2px 2px #f5f5f5;\\n-moz-box-shadow: inset 0px 0px 2px 2px #f5f5f5;box-shadow: inset 0px 0px 2px 2px #f5f5f5;}.pane-sliders .spacer,#options-basic .spacer{background: none repeat scroll 0 0 #EEEEEE;display: block;height: 5px;margin: 15px 0;width:442px;}.pane-sliders .spacer label,#options-basic .spacer label{background:#FFFFFF;color: #03A8D2;float: none;font-size: 10px; margin: -10px auto 0;padding: 5px 15px;text-align: center;text-transform: uppercase;width: 110px;}#options-basic .spacer label{position: relative;top: -12px;}<\\/style><span class=\'readonly\'><h1>VTEM Image Show<\\/h1><p>This version is new generation dedicated to Joomla 1.6+.<\\/p><p>These are awesome module for displaying and animating pictures in limited space but sometime you want to pack more features in a lightweight and simple slideshow solutions ..., just like VTEM Image Show. It is a feature rich and flexible slideshow that comes with 38 unique and smooth animations.<\\/p> <p class=\'homepage\'>Find out more about our modules: <a href=\'http:\\/\\/vtem.net\\/extensions.html\' target=\'_blank\'>http:\\/\\/vtem.net\\/extensions.html<\\/a><\\/p><\\/span>\\n\\t\",\"group\":\"\"}', '{\"width\":\"100%\",\"height\":\"250px\",\"imagePath\":\"images\\/sampledata\\/fruitshop\",\"sortCriteria\":\"0\",\"sortOrder\":\"0\",\"sortOrderManual\":\"\",\"fx\":\"cube\",\"autostart\":\"1\",\"slideSpeed\":\"3500\",\"navigation\":\"dots\",\"navigationalign\":\"left\",\"pauseonhover\":\"0\",\"keyboard_move\":\"1\",\"progressbar\":\"0\",\"prev_next\":\"1\",\"link_images\":\"0\",\"target\":\"0\",\"urls\":\"http:\\/\\/www.google.com;http:\\/\\/www.cnn.com;http:\\/\\/www.apple.com\",\"showcaption\":\"0\",\"imagetitle\":\"Your title1; Your title2; Your title3\",\"imagecontent\":\"Your content1; Your content2; Your content3\",\"jquery\":\"0\",\"css\":\"\",\"moduleclass_sfx\":\"\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('10007', 'Simple Image Gallery Pro (by JoomlaWorks)', 'plugin', 'jw_sigpro', 'content', '0', '1', '1', '0', '{\"legacy\":true,\"name\":\"Simple Image Gallery Pro (by JoomlaWorks)\",\"type\":\"plugin\",\"creationDate\":\"March 7th, 2012\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright (c) 2006 - 2012 JoomlaWorks Ltd. This code cannot be redistributed without permission from JoomlaWorks Ltd.\",\"authorEmail\":\"contact@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"2.5.7\",\"description\":\"<a href=\\\"http:\\/\\/redbitz.com\\\" target=\\\"_blank\\\"><font size=\'4px\' color=\\\"red\\\">Visit REdBitZ.COM<\\/a>  || Allah is one, there is no other God and Prophet Muhammad(S) is the Final Messenger.<\\/font><br\\/><h2>Simple Image Pro Installed Successfully<\\/h2>\",\"group\":\"\"}', '{\"galleries_rootfolder\":\"images\",\"popup_engine\":\"lytebox\",\"thb_template\":\"Polaroids\",\"thb_width\":\"160\",\"thb_height\":\"120\",\"smartResize\":\"0\",\"jpg_quality\":\"80\",\"singlethumbmode\":\"0\",\"sortorder\":\"0\",\"showcaptions\":\"0\",\"wordlimit\":\"\",\"enabledownload\":\"0\",\"loadmoduleposition\":\"\",\"flickrApiKey\":\"\",\"flickrImageCount\":\"20\",\"cache_expire_time\":\"120\",\"yqlMaxAge\":\"60\",\"memoryLimit\":\"\",\"debugMode\":\"0\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('10008', 'Content - Youtube Gallery', 'plugin', 'youtubegallery', 'content', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"Content - Youtube Gallery\",\"type\":\"plugin\",\"creationDate\":\"October 2013\",\"author\":\"DesignCompass corp\",\"copyright\":\"Copyright (C) 2009-2013 DesignCompass corp. All rights reserved.\",\"authorEmail\":\"support@joomlaboat.com\",\"authorUrl\":\"http:\\/\\/www.joomlaboat.com\\/\",\"version\":\"3.5.3\",\"description\":\"YOUTUBEGALLERYDESCRIPTION\",\"group\":\"\"}', '{\"cache\":\"0\",\"cache_time\":\"900\",\"cachemode\":\"static\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('10009', 'Youtube Gallery Module', 'module', 'mod_youtubegallery', '', '0', '1', '0', '0', '{\"legacy\":false,\"name\":\"Youtube Gallery Module\",\"type\":\"module\",\"creationDate\":\"October 2013\",\"author\":\"Design Compass corp\",\"copyright\":\"Copyright (C) 2009-2013 DesignCompass corp. All rights reserved.\",\"authorEmail\":\"support@joomlaboat.com\",\"authorUrl\":\"http:\\/\\/www.joomlaboat.com\\/\",\"version\":\"3.5.3\",\"description\":\"<p>YoutubeGallery Module to show Video Gallery (Video List with Theme) already created in Components\\/YoutubeGallery.<\\/p>\\n    \",\"group\":\"\"}', '{\"cache\":\"0\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"allowcontentplugins\":\"0\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('10010', 'com_youtubegallery', 'component', 'com_youtubegallery', '', '1', '1', '0', '0', '{\"legacy\":false,\"name\":\"COM_YOUTUBEGALLERY\",\"type\":\"component\",\"creationDate\":\"October 2013\",\"author\":\"DesignCompass corp\",\"copyright\":\"Copyright (C) Design Compass corp. All rights reserved.\",\"authorEmail\":\"support@joomlaboat.com\",\"authorUrl\":\"http:\\/\\/joomlaboat.com\",\"version\":\"3.5.3\",\"description\":\"COM_YOUTUBEGALLERY_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('10011', 'com_easy_youtube_gallery', 'component', 'com_easy_youtube_gallery', '', '1', '1', '0', '0', '{\"legacy\":false,\"name\":\"com_easy_youtube_gallery\",\"type\":\"component\",\"creationDate\":\"2012-12-30\",\"author\":\"moti\",\"copyright\":\"Copyright (C) 2012. All rights reserved.\",\"authorEmail\":\"joomlacook@gmail.com\",\"authorUrl\":\"http:\\/\\/www.extensioncook.com\\/\",\"version\":\"1.0.0\",\"description\":\"This component allow you add to a gallery of videos from YouTube, creating thumbnails from YouTube or upload from your computer.\\nThe gallery can be viewed as list, or thumbnails or channel page (with scroll-bar). Also the video will open in light-box, or on themselves or on the channel\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('10012', 'AllVideos (by JoomlaWorks)', 'plugin', 'jw_allvideos', 'content', '0', '0', '1', '0', '{\"legacy\":false,\"name\":\"AllVideos (by JoomlaWorks)\",\"type\":\"plugin\",\"creationDate\":\"February 27th, 2013\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright (c) 2006 - 2013 JoomlaWorks Ltd. All rights reserved.\",\"authorEmail\":\"contact@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"4.5.0\",\"description\":\"JW_PLG_AV_XML_DESC\",\"group\":\"\"}', '{\"\":\"JW_PLG_AV_PERFORMANCE_PARAMETERS\",\"playerTemplate\":\"Classic\",\"vfolder\":\"images\\/videos\",\"vwidth\":\"400\",\"vheight\":\"300\",\"transparency\":\"transparent\",\"background\":\"#010101\",\"controlBarLocation\":\"bottom\",\"backgroundQT\":\"black\",\"afolder\":\"images\\/audio\",\"awidth\":\"480\",\"aheight\":\"24\",\"abackground\":\"#010101\",\"afrontcolor\":\"#FFFFFF\",\"alightcolor\":\"#00ADE3\",\"allowAudioDownloading\":\"0\",\"autoplay\":\"0\",\"gzipScripts\":\"0\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `pxshj_extensions` VALUES ('10013', 'YouTube Plugin', 'plugin', 'youtubeplugin', 'content', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"YouTube Plugin\",\"type\":\"plugin\",\"creationDate\":\"Jan 2013\",\"author\":\"Benjamin Golding\",\"copyright\":\"Benjamin Golding 2013. All rights reserved.\",\"authorEmail\":\"awesome24@hush.ai\",\"authorUrl\":\"joomlacode.org\\/gf\\/project\\/youtubeplugin\\/\",\"version\":\"1.1\",\"description\":\"\\n\\t\\n<p>With this plugin, you can embed YouTube videos into articles simply by copying and pasting a youtube\'s video parameter between the youtube flags: {youtube}xxxxxx{\\/youtube}. So for instance if the URL is: www.youtube.com\\/watch?v=2jvLalY6ubc <br\\/><br\\/>Then you would insert the following text to your article:<br\\/>\\n{youtube}2jvLalY6ubc{\\/youtube}<br\\/><br\\/> You can find more information here: http:\\/\\/joomlacode.org\\/gf\\/project\\/youtubeplugin\\/  <\\/p><p>-----<b>But first <\\/b>go to the plugin manager (From the toolbar: Extension -> Plug-in Manager) and enable the plugin by switching the button near it from red to green.<\\/p>\\n\\t\\n\\t\",\"group\":\"\"}', '{\"width\":\"425\",\"height\":\"344\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');

-- ----------------------------
-- Table structure for `pxshj_finder_filters`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_finder_filters`;
CREATE TABLE `pxshj_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_finder_filters
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_finder_links`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_finder_links`;
CREATE TABLE `pxshj_finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_finder_links
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_finder_links_terms0`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_finder_links_terms0`;
CREATE TABLE `pxshj_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_finder_links_terms0
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_finder_links_terms1`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_finder_links_terms1`;
CREATE TABLE `pxshj_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_finder_links_terms1
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_finder_links_terms2`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_finder_links_terms2`;
CREATE TABLE `pxshj_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_finder_links_terms2
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_finder_links_terms3`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_finder_links_terms3`;
CREATE TABLE `pxshj_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_finder_links_terms3
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_finder_links_terms4`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_finder_links_terms4`;
CREATE TABLE `pxshj_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_finder_links_terms4
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_finder_links_terms5`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_finder_links_terms5`;
CREATE TABLE `pxshj_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_finder_links_terms5
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_finder_links_terms6`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_finder_links_terms6`;
CREATE TABLE `pxshj_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_finder_links_terms6
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_finder_links_terms7`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_finder_links_terms7`;
CREATE TABLE `pxshj_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_finder_links_terms7
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_finder_links_terms8`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_finder_links_terms8`;
CREATE TABLE `pxshj_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_finder_links_terms8
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_finder_links_terms9`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_finder_links_terms9`;
CREATE TABLE `pxshj_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_finder_links_terms9
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_finder_links_termsa`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_finder_links_termsa`;
CREATE TABLE `pxshj_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_finder_links_termsa
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_finder_links_termsb`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_finder_links_termsb`;
CREATE TABLE `pxshj_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_finder_links_termsb
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_finder_links_termsc`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_finder_links_termsc`;
CREATE TABLE `pxshj_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_finder_links_termsc
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_finder_links_termsd`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_finder_links_termsd`;
CREATE TABLE `pxshj_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_finder_links_termsd
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_finder_links_termse`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_finder_links_termse`;
CREATE TABLE `pxshj_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_finder_links_termse
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_finder_links_termsf`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_finder_links_termsf`;
CREATE TABLE `pxshj_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_finder_links_termsf
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_finder_taxonomy`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_finder_taxonomy`;
CREATE TABLE `pxshj_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_finder_taxonomy
-- ----------------------------
INSERT INTO `pxshj_finder_taxonomy` VALUES ('1', '0', 'ROOT', '0', '0', '0');

-- ----------------------------
-- Table structure for `pxshj_finder_taxonomy_map`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_finder_taxonomy_map`;
CREATE TABLE `pxshj_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_finder_taxonomy_map
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_finder_terms`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_finder_terms`;
CREATE TABLE `pxshj_finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_finder_terms
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_finder_terms_common`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_finder_terms_common`;
CREATE TABLE `pxshj_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_finder_terms_common
-- ----------------------------
INSERT INTO `pxshj_finder_terms_common` VALUES ('a', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('about', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('after', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('ago', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('all', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('am', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('an', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('and', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('ani', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('any', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('are', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('aren\'t', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('as', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('at', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('be', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('but', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('by', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('for', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('from', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('get', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('go', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('how', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('if', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('in', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('into', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('is', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('isn\'t', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('it', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('its', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('me', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('more', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('most', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('must', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('my', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('new', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('no', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('none', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('not', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('noth', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('nothing', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('of', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('off', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('often', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('old', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('on', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('onc', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('once', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('onli', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('only', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('or', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('other', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('our', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('ours', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('out', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('over', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('page', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('she', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('should', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('small', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('so', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('some', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('than', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('thank', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('that', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('the', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('their', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('theirs', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('them', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('then', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('there', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('these', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('they', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('this', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('those', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('thus', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('time', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('times', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('to', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('too', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('true', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('under', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('until', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('up', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('upon', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('use', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('user', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('users', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('veri', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('version', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('very', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('via', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('want', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('was', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('way', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('were', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('what', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('when', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('where', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('whi', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('which', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('who', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('whom', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('whose', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('why', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('wide', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('will', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('with', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('within', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('without', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('would', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('yes', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('yet', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('you', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('your', 'en');
INSERT INTO `pxshj_finder_terms_common` VALUES ('yours', 'en');

-- ----------------------------
-- Table structure for `pxshj_finder_tokens`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_finder_tokens`;
CREATE TABLE `pxshj_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_finder_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_finder_tokens_aggregate`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_finder_tokens_aggregate`;
CREATE TABLE `pxshj_finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_finder_tokens_aggregate
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_finder_types`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_finder_types`;
CREATE TABLE `pxshj_finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_finder_types
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_languages`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_languages`;
CREATE TABLE `pxshj_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` char(7) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_native` varchar(50) NOT NULL,
  `sef` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `sitename` varchar(1024) NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_image` (`image`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_languages
-- ----------------------------
INSERT INTO `pxshj_languages` VALUES ('1', 'en-GB', 'English (UK)', 'English (UK)', 'en', 'en', '', '', '', '', '1', '0', '1');

-- ----------------------------
-- Table structure for `pxshj_menu`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_menu`;
CREATE TABLE `pxshj_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(1024) NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `ordering` int(11) NOT NULL DEFAULT '0' COMMENT 'The relative ordering of the menu item in the tree.',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`,`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_path` (`path`(255)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_menu
-- ----------------------------
INSERT INTO `pxshj_menu` VALUES ('1', '', 'Menu_Item_Root', 'root', '', '', '', '', '1', '0', '0', '0', '0', '0', '0000-00-00 00:00:00', '0', '0', '', '0', '', '0', '81', '0', '*', '0');
INSERT INTO `pxshj_menu` VALUES ('2', 'menu', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', '0', '1', '1', '4', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:banners', '0', '', '1', '10', '0', '*', '1');
INSERT INTO `pxshj_menu` VALUES ('3', 'menu', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners', 'component', '0', '2', '2', '4', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:banners', '0', '', '2', '3', '0', '*', '1');
INSERT INTO `pxshj_menu` VALUES ('4', 'menu', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', '0', '2', '2', '6', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:banners-cat', '0', '', '4', '5', '0', '*', '1');
INSERT INTO `pxshj_menu` VALUES ('5', 'menu', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', '0', '2', '2', '4', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:banners-clients', '0', '', '6', '7', '0', '*', '1');
INSERT INTO `pxshj_menu` VALUES ('6', 'menu', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', '0', '2', '2', '4', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:banners-tracks', '0', '', '8', '9', '0', '*', '1');
INSERT INTO `pxshj_menu` VALUES ('7', 'menu', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', '0', '1', '1', '8', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:contact', '0', '', '11', '16', '0', '*', '1');
INSERT INTO `pxshj_menu` VALUES ('8', 'menu', 'com_contact', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', '0', '7', '2', '8', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:contact', '0', '', '12', '13', '0', '*', '1');
INSERT INTO `pxshj_menu` VALUES ('9', 'menu', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', '0', '7', '2', '6', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:contact-cat', '0', '', '14', '15', '0', '*', '1');
INSERT INTO `pxshj_menu` VALUES ('10', 'menu', 'com_messages', 'Messaging', '', 'Messaging', 'index.php?option=com_messages', 'component', '0', '1', '1', '15', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:messages', '0', '', '17', '22', '0', '*', '1');
INSERT INTO `pxshj_menu` VALUES ('11', 'menu', 'com_messages_add', 'New Private Message', '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', '0', '10', '2', '15', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:messages-add', '0', '', '18', '19', '0', '*', '1');
INSERT INTO `pxshj_menu` VALUES ('12', 'menu', 'com_messages_read', 'Read Private Message', '', 'Messaging/Read Private Message', 'index.php?option=com_messages', 'component', '0', '10', '2', '15', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:messages-read', '0', '', '20', '21', '0', '*', '1');
INSERT INTO `pxshj_menu` VALUES ('13', 'menu', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', '0', '1', '1', '17', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:newsfeeds', '0', '', '23', '28', '0', '*', '1');
INSERT INTO `pxshj_menu` VALUES ('14', 'menu', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', '0', '13', '2', '17', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:newsfeeds', '0', '', '24', '25', '0', '*', '1');
INSERT INTO `pxshj_menu` VALUES ('15', 'menu', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', '0', '13', '2', '6', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:newsfeeds-cat', '0', '', '26', '27', '0', '*', '1');
INSERT INTO `pxshj_menu` VALUES ('16', 'menu', 'com_redirect', 'Redirect', '', 'Redirect', 'index.php?option=com_redirect', 'component', '0', '1', '1', '24', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:redirect', '0', '', '41', '42', '0', '*', '1');
INSERT INTO `pxshj_menu` VALUES ('17', 'menu', 'com_search', 'Basic Search', '', 'Basic Search', 'index.php?option=com_search', 'component', '0', '1', '1', '19', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:search', '0', '', '33', '34', '0', '*', '1');
INSERT INTO `pxshj_menu` VALUES ('18', 'menu', 'com_weblinks', 'Weblinks', '', 'Weblinks', 'index.php?option=com_weblinks', 'component', '0', '1', '1', '21', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:weblinks', '0', '', '35', '40', '0', '*', '1');
INSERT INTO `pxshj_menu` VALUES ('19', 'menu', 'com_weblinks_links', 'Links', '', 'Weblinks/Links', 'index.php?option=com_weblinks', 'component', '0', '18', '2', '21', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:weblinks', '0', '', '36', '37', '0', '*', '1');
INSERT INTO `pxshj_menu` VALUES ('20', 'menu', 'com_weblinks_categories', 'Categories', '', 'Weblinks/Categories', 'index.php?option=com_categories&extension=com_weblinks', 'component', '0', '18', '2', '6', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:weblinks-cat', '0', '', '38', '39', '0', '*', '1');
INSERT INTO `pxshj_menu` VALUES ('21', 'menu', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', '0', '1', '1', '27', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:finder', '0', '', '31', '32', '0', '*', '1');
INSERT INTO `pxshj_menu` VALUES ('22', 'menu', 'com_joomlaupdate', 'Joomla! Update', '', 'Joomla! Update', 'index.php?option=com_joomlaupdate', 'component', '0', '1', '1', '28', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:joomlaupdate', '0', '', '43', '44', '0', '*', '1');
INSERT INTO `pxshj_menu` VALUES ('101', 'mainmenu', 'Главная', 'home', '', 'home', 'index.php?option=com_content&view=featured', 'component', '1', '1', '1', '22', '0', '0', '0000-00-00 00:00:00', '0', '1', '', '0', '{\"featured_categories\":[\"\"],\"layout_type\":\"blog\",\"num_leading_articles\":\"1\",\"num_intro_articles\":\"3\",\"num_columns\":\"3\",\"num_links\":\"0\",\"multi_column_order\":\"1\",\"orderby_pri\":\"\",\"orderby_sec\":\"front\",\"order_date\":\"\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"1\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":1,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', '29', '30', '1', '*', '0');
INSERT INTO `pxshj_menu` VALUES ('106', 'main', 'Hello World!', 'hello-world', '', 'hello-world', 'index.php?option=com_helloworld', 'component', '0', '1', '1', '10000', '0', '0', '0000-00-00 00:00:00', '0', '1', 'class:component', '0', '', '45', '46', '0', '', '1');
INSERT INTO `pxshj_menu` VALUES ('107', 'mainmenu', 'Галерея', '2013-10-26-15-09-55', '', '2013-10-26-15-09-55', 'index.php?option=com_content&view=article&id=2', 'component', '1', '1', '1', '22', '0', '0', '0000-00-00 00:00:00', '0', '1', '', '0', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', '47', '52', '0', '*', '0');
INSERT INTO `pxshj_menu` VALUES ('108', 'mainmenu', 'Галерея 1', 'gallery1', '', '2013-10-26-15-09-55/gallery1', 'index.php?option=com_content&view=article&id=3', 'component', '1', '107', '2', '22', '0', '0', '0000-00-00 00:00:00', '0', '1', '', '0', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', '48', '49', '0', '*', '0');
INSERT INTO `pxshj_menu` VALUES ('109', 'mainmenu', 'Услуги', 'uslugi', '', 'uslugi', 'index.php?option=com_content&view=article&id=4', 'component', '1', '1', '1', '22', '0', '0', '0000-00-00 00:00:00', '0', '1', '', '0', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', '53', '54', '0', '*', '0');
INSERT INTO `pxshj_menu` VALUES ('110', 'mainmenu', 'Контакты', 'kontacts', '', 'kontacts', 'index.php?option=com_content&view=article&id=5', 'component', '1', '1', '1', '22', '0', '0', '0000-00-00 00:00:00', '0', '1', '', '0', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', '55', '56', '0', '*', '0');
INSERT INTO `pxshj_menu` VALUES ('111', 'mainmenu', 'Прайс-лист', 'price-list', '', 'price-list', 'index.php?option=com_content&view=article&id=6', 'component', '1', '1', '1', '22', '0', '0', '0000-00-00 00:00:00', '0', '1', '', '0', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', '57', '58', '0', '*', '0');
INSERT INTO `pxshj_menu` VALUES ('112', 'mainmenu', 'Видео', 'video', '', '2013-10-26-15-09-55/video', 'index.php?option=com_content&view=article&id=7', 'component', '1', '107', '2', '22', '0', '0', '0000-00-00 00:00:00', '0', '1', '', '0', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', '50', '51', '0', '*', '0');
INSERT INTO `pxshj_menu` VALUES ('113', 'main', 'COM_YOUTUBEGALLERY_MENU', 'com-youtubegallery-menu', '', 'com-youtubegallery-menu', 'index.php?option=com_youtubegallery', 'component', '0', '1', '1', '10010', '0', '0', '0000-00-00 00:00:00', '0', '1', 'class:component', '0', '', '59', '60', '0', '', '1');
INSERT INTO `pxshj_menu` VALUES ('114', 'main', 'COM_EASY_YOUTUBE_GALLERY', 'com-easy-youtube-gallery', '', 'com-easy-youtube-gallery', 'index.php?option=com_easy_youtube_gallery', 'component', '0', '1', '1', '10011', '0', '0', '0000-00-00 00:00:00', '0', '1', 'components/com_easy_youtube_gallery/assets/images/s_com_easy_youtube_gallery.png', '0', '', '61', '64', '0', '', '1');
INSERT INTO `pxshj_menu` VALUES ('115', 'main', 'COM_EASY_YOUTUBE_GALLERY_TITLE_VIDEOS', 'com-easy-youtube-gallery-title-videos', '', 'com-easy-youtube-gallery/com-easy-youtube-gallery-title-videos', 'index.php?option=com_easy_youtube_gallery&view=videos', 'component', '0', '114', '2', '10011', '0', '0', '0000-00-00 00:00:00', '0', '1', 'components/com_easy_youtube_gallery/assets/images/s_videos.png', '0', '', '62', '63', '0', '', '1');
INSERT INTO `pxshj_menu` VALUES ('116', 'mainmenu', 'Статьи', 'articles', '', 'articles', 'index.php?option=com_content&view=category&layout=blog&id=8', 'component', '1', '1', '1', '22', '0', '0', '0000-00-00 00:00:00', '0', '1', '', '0', '{\"layout_type\":\"blog\",\"show_category_heading_title_text\":\"\",\"show_category_title\":\"\",\"show_description\":\"\",\"show_description_image\":\"\",\"maxLevel\":\"\",\"show_empty_categories\":\"\",\"show_no_articles\":\"\",\"show_subcat_desc\":\"\",\"show_cat_num_articles\":\"\",\"page_subheading\":\"\",\"num_leading_articles\":\"\",\"num_intro_articles\":\"\",\"num_columns\":\"\",\"num_links\":\"\",\"multi_column_order\":\"\",\"show_subcategory_content\":\"\",\"orderby_pri\":\"\",\"orderby_sec\":\"\",\"order_date\":\"\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', '65', '66', '0', '*', '0');
INSERT INTO `pxshj_menu` VALUES ('117', 'hidden', 'Потолки', 'potolki', '', 'potolki', 'index.php?option=com_content&view=article&id=10', 'component', '1', '1', '1', '22', '0', '0', '0000-00-00 00:00:00', '0', '1', '', '0', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', '67', '72', '0', '*', '0');
INSERT INTO `pxshj_menu` VALUES ('118', 'hidden', 'Частозадаваемые вопросы', 'questions', '', 'potolki/questions', 'index.php?option=com_content&view=article&id=11', 'component', '1', '117', '2', '22', '0', '0', '0000-00-00 00:00:00', '0', '1', '', '0', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', '68', '69', '0', '*', '0');
INSERT INTO `pxshj_menu` VALUES ('119', 'hidden', 'Общая информация и правила экспуатациии', 'pravila-uhoda', '', 'potolki/pravila-uhoda', 'index.php?option=com_content&view=article&id=12', 'component', '1', '117', '2', '22', '0', '0', '0000-00-00 00:00:00', '0', '1', '', '0', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', '70', '71', '0', '*', '0');
INSERT INTO `pxshj_menu` VALUES ('120', 'hidden', 'Мебель', 'mebel', '', 'mebel', 'index.php?option=com_content&view=article&id=13', 'component', '1', '1', '1', '22', '0', '0', '0000-00-00 00:00:00', '0', '1', '', '0', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', '73', '80', '0', '*', '0');
INSERT INTO `pxshj_menu` VALUES ('121', 'hidden', 'Галерея кухонь', 'kuhni', '', 'mebel/kuhni', 'index.php?option=com_content&view=article&id=14', 'component', '1', '120', '2', '22', '0', '0', '0000-00-00 00:00:00', '0', '1', '', '0', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', '74', '75', '0', '*', '0');
INSERT INTO `pxshj_menu` VALUES ('122', 'hidden', 'Галерея кухонь 2', 'kuhni2', '', 'mebel/kuhni2', 'index.php?option=com_content&view=article&id=15', 'component', '1', '120', '2', '22', '0', '0', '0000-00-00 00:00:00', '0', '1', '', '0', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', '76', '77', '0', '*', '0');
INSERT INTO `pxshj_menu` VALUES ('123', 'hidden', 'Галерея кухонь 3', 'kuhni3', '', 'mebel/kuhni3', 'index.php?option=com_content&view=article&id=16', 'component', '1', '120', '2', '22', '0', '0', '0000-00-00 00:00:00', '0', '1', '', '0', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', '78', '79', '0', '*', '0');

-- ----------------------------
-- Table structure for `pxshj_menu_types`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_menu_types`;
CREATE TABLE `pxshj_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_menu_types
-- ----------------------------
INSERT INTO `pxshj_menu_types` VALUES ('1', 'mainmenu', 'Main Menu', 'The main menu for the site');
INSERT INTO `pxshj_menu_types` VALUES ('2', 'hidden', 'hidden', '');

-- ----------------------------
-- Table structure for `pxshj_messages`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_messages`;
CREATE TABLE `pxshj_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_messages
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_messages_cfg`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_messages_cfg`;
CREATE TABLE `pxshj_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_messages_cfg
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_modules`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_modules`;
CREATE TABLE `pxshj_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_modules
-- ----------------------------
INSERT INTO `pxshj_modules` VALUES ('1', 'Main Menu', '', '', '1', 'position-7', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_menu', '1', '1', '{\"menutype\":\"mainmenu\",\"startLevel\":\"0\",\"endLevel\":\"0\",\"showAllChildren\":\"0\",\"tag_id\":\"\",\"class_sfx\":\"\",\"window_open\":\"\",\"layout\":\"\",\"moduleclass_sfx\":\"_menu\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}', '0', '*');
INSERT INTO `pxshj_modules` VALUES ('2', 'Login', '', '', '1', 'login', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_login', '1', '1', '', '1', '*');
INSERT INTO `pxshj_modules` VALUES ('3', 'Popular Articles', '', '', '3', 'cpanel', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_popular', '3', '1', '{\"count\":\"5\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"automatic_title\":\"1\"}', '1', '*');
INSERT INTO `pxshj_modules` VALUES ('4', 'Recently Added Articles', '', '', '4', 'cpanel', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_latest', '3', '1', '{\"count\":\"5\",\"ordering\":\"c_dsc\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"automatic_title\":\"1\"}', '1', '*');
INSERT INTO `pxshj_modules` VALUES ('8', 'Toolbar', '', '', '1', 'toolbar', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_toolbar', '3', '1', '', '1', '*');
INSERT INTO `pxshj_modules` VALUES ('9', 'Quick Icons', '', '', '1', 'icon', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_quickicon', '3', '1', '', '1', '*');
INSERT INTO `pxshj_modules` VALUES ('10', 'Logged-in Users', '', '', '2', 'cpanel', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_logged', '3', '1', '{\"count\":\"5\",\"name\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"automatic_title\":\"1\"}', '1', '*');
INSERT INTO `pxshj_modules` VALUES ('12', 'Admin Menu', '', '', '1', 'menu', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_menu', '3', '1', '{\"layout\":\"\",\"moduleclass_sfx\":\"\",\"shownew\":\"1\",\"showhelp\":\"1\",\"cache\":\"0\"}', '1', '*');
INSERT INTO `pxshj_modules` VALUES ('13', 'Admin Submenu', '', '', '1', 'submenu', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_submenu', '3', '1', '', '1', '*');
INSERT INTO `pxshj_modules` VALUES ('14', 'User Status', '', '', '2', 'status', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_status', '3', '1', '', '1', '*');
INSERT INTO `pxshj_modules` VALUES ('15', 'Title', '', '', '1', 'title', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_title', '3', '1', '', '1', '*');
INSERT INTO `pxshj_modules` VALUES ('16', 'Login Form', '', '', '7', 'position-7', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_login', '1', '1', '{\"greeting\":\"1\",\"name\":\"0\"}', '0', '*');
INSERT INTO `pxshj_modules` VALUES ('17', 'Breadcrumbs', '', '', '1', 'position-2', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_breadcrumbs', '1', '1', '{\"moduleclass_sfx\":\"\",\"showHome\":\"1\",\"homeText\":\"Home\",\"showComponent\":\"1\",\"separator\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}', '0', '*');
INSERT INTO `pxshj_modules` VALUES ('79', 'Multilanguage status', '', '', '1', 'status', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', 'mod_multilangstatus', '3', '1', '{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}', '1', '*');
INSERT INTO `pxshj_modules` VALUES ('86', 'Joomla Version', '', '', '1', 'footer', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_version', '3', '1', '{\"format\":\"short\",\"product\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}', '1', '*');
INSERT INTO `pxshj_modules` VALUES ('87', 'VTEM Image Show', '', '', '1', 'showcase1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_vtem_imageshow', '1', '0', '{\"width\":\"100%\",\"height\":\"400px\",\"imagePath\":\"images\\/sampledata\\/fruitshop\",\"sortCriteria\":\"0\",\"sortOrder\":\"0\",\"sortOrderManual\":\"\",\"fx\":\"cube\",\"autostart\":\"1\",\"slideSpeed\":\"3500\",\"navigation\":\"dots\",\"navigationalign\":\"center\",\"pauseonhover\":\"0\",\"keyboard_move\":\"1\",\"progressbar\":\"0\",\"prev_next\":\"1\",\"link_images\":\"0\",\"target\":\"0\",\"urls\":\"http:\\/\\/www.google.com;http:\\/\\/www.cnn.com;http:\\/\\/www.apple.com\",\"showcaption\":\"0\",\"imagetitle\":\"Your title1; Your title2; Your title3\",\"imagecontent\":\"Your content1; Your content2; Your content3\",\"jquery\":\"0\",\"css\":\"\",\"moduleclass_sfx\":\"\"}', '0', '*');
INSERT INTO `pxshj_modules` VALUES ('88', 'Youtube Gallery Module', '', '', '0', '', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', 'mod_youtubegallery', '1', '1', '', '0', '*');
INSERT INTO `pxshj_modules` VALUES ('89', 'Дома и коттеджи', '', '<p><img src=\"images/building/house.JPG\" border=\"0\" alt=\"\" /></p>', '1', 'utility1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_custom', '1', '1', '{\"prepare_content\":\"0\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}', '0', '*');
INSERT INTO `pxshj_modules` VALUES ('90', 'Натяжные потолки', '', '<p><a href=\"index.php/potolki\"><img src=\"images/ceiling/ceiling.jpg\" border=\"0\" alt=\"\" /></a></p>', '1', 'utility2', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_custom', '1', '1', '{\"prepare_content\":\"0\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}', '0', '*');
INSERT INTO `pxshj_modules` VALUES ('91', 'Мебель под заказ', '', '<p><a href=\"index.php/mebel\"><img src=\"images/mebel/P1050186.JPG\" border=\"0\" alt=\"\" /></a></p>', '1', 'utility3', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_custom', '1', '1', '{\"prepare_content\":\"0\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}', '0', '*');
INSERT INTO `pxshj_modules` VALUES ('92', 'Мебель-шмебель', '', '<p>аививаива</p>\r\n<p>в аи</p>', '1', 'utility1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_custom', '1', '1', '{\"prepare_content\":\"0\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}', '0', '*');
INSERT INTO `pxshj_modules` VALUES ('93', 'Наши партнеры', '', '<p>Наши партнеры</p>', '2', 'utility2', '512', '2013-10-28 12:29:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_custom', '1', '1', '{\"prepare_content\":\"0\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}', '0', '*');

-- ----------------------------
-- Table structure for `pxshj_modules_menu`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_modules_menu`;
CREATE TABLE `pxshj_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_modules_menu
-- ----------------------------
INSERT INTO `pxshj_modules_menu` VALUES ('1', '0');
INSERT INTO `pxshj_modules_menu` VALUES ('2', '0');
INSERT INTO `pxshj_modules_menu` VALUES ('3', '0');
INSERT INTO `pxshj_modules_menu` VALUES ('4', '0');
INSERT INTO `pxshj_modules_menu` VALUES ('6', '0');
INSERT INTO `pxshj_modules_menu` VALUES ('7', '0');
INSERT INTO `pxshj_modules_menu` VALUES ('8', '0');
INSERT INTO `pxshj_modules_menu` VALUES ('9', '0');
INSERT INTO `pxshj_modules_menu` VALUES ('10', '0');
INSERT INTO `pxshj_modules_menu` VALUES ('12', '0');
INSERT INTO `pxshj_modules_menu` VALUES ('13', '0');
INSERT INTO `pxshj_modules_menu` VALUES ('14', '0');
INSERT INTO `pxshj_modules_menu` VALUES ('15', '0');
INSERT INTO `pxshj_modules_menu` VALUES ('16', '0');
INSERT INTO `pxshj_modules_menu` VALUES ('17', '0');
INSERT INTO `pxshj_modules_menu` VALUES ('79', '0');
INSERT INTO `pxshj_modules_menu` VALUES ('86', '0');
INSERT INTO `pxshj_modules_menu` VALUES ('87', '101');
INSERT INTO `pxshj_modules_menu` VALUES ('89', '0');
INSERT INTO `pxshj_modules_menu` VALUES ('90', '0');
INSERT INTO `pxshj_modules_menu` VALUES ('91', '0');
INSERT INTO `pxshj_modules_menu` VALUES ('92', '0');
INSERT INTO `pxshj_modules_menu` VALUES ('93', '0');

-- ----------------------------
-- Table structure for `pxshj_newsfeeds`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_newsfeeds`;
CREATE TABLE `pxshj_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
  `filename` varchar(200) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_newsfeeds
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_overrider`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_overrider`;
CREATE TABLE `pxshj_overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) NOT NULL,
  `string` text NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_overrider
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_redirect_links`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_redirect_links`;
CREATE TABLE `pxshj_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(255) NOT NULL,
  `new_url` varchar(255) NOT NULL,
  `referer` varchar(150) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_link_old` (`old_url`),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_redirect_links
-- ----------------------------
INSERT INTO `pxshj_redirect_links` VALUES ('1', 'http://test1.local/joomla/index.php?option=com_helloworld', '', '', '', '2', '0', '2013-10-18 12:56:03', '0000-00-00 00:00:00');
INSERT INTO `pxshj_redirect_links` VALUES ('2', 'http://test1.local/joomla/index.php/natyajnye-potolki', '', '', '', '1', '0', '2013-10-28 11:42:16', '0000-00-00 00:00:00');
INSERT INTO `pxshj_redirect_links` VALUES ('3', 'http://test1.local/joomla/index.php/natyajnye-potolki.html', '', '', '', '1', '0', '2013-10-28 11:42:22', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `pxshj_schemas`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_schemas`;
CREATE TABLE `pxshj_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_schemas
-- ----------------------------
INSERT INTO `pxshj_schemas` VALUES ('700', '2.5.13');
INSERT INTO `pxshj_schemas` VALUES ('10000', '0.0.1');
INSERT INTO `pxshj_schemas` VALUES ('10001', '');
INSERT INTO `pxshj_schemas` VALUES ('10002', '0.0.1');
INSERT INTO `pxshj_schemas` VALUES ('10003', '0.0.1');
INSERT INTO `pxshj_schemas` VALUES ('10004', '0.0.1');
INSERT INTO `pxshj_schemas` VALUES ('10010', '3.4.8');

-- ----------------------------
-- Table structure for `pxshj_session`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_session`;
CREATE TABLE `pxshj_session` (
  `session_id` varchar(200) NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `guest` tinyint(4) unsigned DEFAULT '1',
  `time` varchar(14) DEFAULT '',
  `data` mediumtext,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) DEFAULT '',
  `usertype` varchar(50) DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_session
-- ----------------------------
INSERT INTO `pxshj_session` VALUES ('0c0740ea4e0a1bb6bed72152f8dd6707', '1', '1', '1383081782', '__default|a:8:{s:22:\"session.client.browser\";s:65:\"Mozilla/5.0 (Windows NT 6.1; rv:24.0) Gecko/20100101 Firefox/24.0\";s:15:\"session.counter\";i:7;s:8:\"registry\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":0:{}}s:4:\"user\";O:5:\"JUser\":25:{s:9:\"\0*\0isRoot\";N;s:2:\"id\";i:0;s:4:\"name\";N;s:8:\"username\";N;s:5:\"email\";N;s:8:\"password\";N;s:14:\"password_clear\";s:0:\"\";s:8:\"usertype\";N;s:5:\"block\";N;s:9:\"sendEmail\";i:0;s:12:\"registerDate\";N;s:13:\"lastvisitDate\";N;s:10:\"activation\";N;s:6:\"params\";N;s:6:\"groups\";a:0:{}s:5:\"guest\";i:1;s:13:\"lastResetTime\";N;s:10:\"resetCount\";N;s:10:\"\0*\0_params\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":0:{}}s:14:\"\0*\0_authGroups\";N;s:14:\"\0*\0_authLevels\";a:2:{i:0;i:1;i:1;i:1;}s:15:\"\0*\0_authActions\";N;s:12:\"\0*\0_errorMsg\";N;s:10:\"\0*\0_errors\";a:0:{}s:3:\"aid\";i:0;}s:13:\"session.token\";s:32:\"241b8d192e467958baf7cf5d039b3913\";s:19:\"session.timer.start\";i:1383077582;s:18:\"session.timer.last\";i:1383080942;s:17:\"session.timer.now\";i:1383081782;}', '0', '', '');
INSERT INTO `pxshj_session` VALUES ('c0e0834fb16c5c237a8156dcae394954', '1', '1', '1383076743', '__default|a:8:{s:15:\"session.counter\";i:1;s:19:\"session.timer.start\";i:1383076743;s:18:\"session.timer.last\";i:1383076743;s:17:\"session.timer.now\";i:1383076743;s:22:\"session.client.browser\";s:65:\"Mozilla/5.0 (Windows NT 6.1; rv:24.0) Gecko/20100101 Firefox/24.0\";s:8:\"registry\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":0:{}}s:4:\"user\";O:5:\"JUser\":25:{s:9:\"\0*\0isRoot\";N;s:2:\"id\";i:0;s:4:\"name\";N;s:8:\"username\";N;s:5:\"email\";N;s:8:\"password\";N;s:14:\"password_clear\";s:0:\"\";s:8:\"usertype\";N;s:5:\"block\";N;s:9:\"sendEmail\";i:0;s:12:\"registerDate\";N;s:13:\"lastvisitDate\";N;s:10:\"activation\";N;s:6:\"params\";N;s:6:\"groups\";a:0:{}s:5:\"guest\";i:1;s:13:\"lastResetTime\";N;s:10:\"resetCount\";N;s:10:\"\0*\0_params\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":0:{}}s:14:\"\0*\0_authGroups\";N;s:14:\"\0*\0_authLevels\";a:2:{i:0;i:1;i:1;i:1;}s:15:\"\0*\0_authActions\";N;s:12:\"\0*\0_errorMsg\";N;s:10:\"\0*\0_errors\";a:0:{}s:3:\"aid\";i:0;}s:13:\"session.token\";s:32:\"b1abe56b1d363a0ccf0f0e4d75264741\";}', '0', '', '');

-- ----------------------------
-- Table structure for `pxshj_template_styles`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_template_styles`;
CREATE TABLE `pxshj_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_template_styles
-- ----------------------------
INSERT INTO `pxshj_template_styles` VALUES ('2', 'bluestork', '1', '1', 'Bluestork - Default', '{\"useRoundedCorners\":\"1\",\"showSiteName\":\"0\"}');
INSERT INTO `pxshj_template_styles` VALUES ('3', 'atomic', '0', '0', 'Atomic - Default', '{}');
INSERT INTO `pxshj_template_styles` VALUES ('4', 'beez_20', '0', '0', 'Beez2 - Default', '{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"logo\":\"images\\/joomla_black.gif\",\"sitetitle\":\"Joomla!\",\"sitedescription\":\"Open Source Content Management\",\"navposition\":\"left\",\"templatecolor\":\"personal\",\"html5\":\"0\"}');
INSERT INTO `pxshj_template_styles` VALUES ('5', 'hathor', '1', '0', 'Hathor - Default', '{\"showSiteName\":\"0\",\"colourChoice\":\"\",\"boldText\":\"0\"}');
INSERT INTO `pxshj_template_styles` VALUES ('6', 'beez5', '0', '0', 'Beez5 - Default', '{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"logo\":\"images\\/sampledata\\/fruitshop\\/fruits.gif\",\"sitetitle\":\"Joomla!\",\"sitedescription\":\"Open Source Content Management\",\"navposition\":\"left\",\"html5\":\"0\"}');
INSERT INTO `pxshj_template_styles` VALUES ('7', 'vt_personal', '0', '1', 'vt_personal - Default', '{\"TemplateStyle\":\"style2\",\"layout\":\"wf\",\"logo\":\"1\",\"logotext\":\"SEV-REMONT.COM\",\"slogan\":\"\\u0414\\u043e\\u0432\\u0435\\u0440\\u044c\\u0442\\u0435 \\u0440\\u0435\\u043c\\u043e\\u0442 \\u043f\\u0440\\u043e\\u0444\\u0435\\u0441\\u0441\\u0438\\u043e\\u043d\\u0430\\u043b\\u0430\\u043c\",\"copyright\":\"1\",\"SystemMessages\":\"1\",\"IE6Warning\":\"1\",\"GoogleAnalytics\":\"0\",\"gacode\":\"\",\"custommenu\":\"0\",\"menutype\":\"mainmenu\",\"menustyle\":\"1\",\"mootransition\":\"fade\",\"startLevel\":\"0\",\"endLevel\":\"10\",\"templatewidth\":\"980\",\"leftwidth\":\"30\",\"rightwidth\":\"30\",\"drawertype\":\"1\",\"drawermanual1\":\"20\",\"drawermanual2\":\"20\",\"drawermanual3\":\"20\",\"drawermanual4\":\"20\",\"drawermanual5\":\"20\",\"drawermanual6\":\"0\",\"headertype\":\"1\",\"headermanual1\":\"20\",\"headermanual2\":\"20\",\"headermanual3\":\"20\",\"headermanual4\":\"20\",\"headermanual5\":\"20\",\"headermanual6\":\"0\",\"toptype\":\"1\",\"topmanual1\":\"20\",\"topmanual2\":\"20\",\"topmanual3\":\"20\",\"topmanual4\":\"20\",\"topmanual5\":\"20\",\"topmanual6\":\"0\",\"showcasetype\":\"1\",\"showcasemanual1\":\"80%\",\"showcasemanual2\":\"20\",\"showcasemanual3\":\"0\",\"showcasemanual4\":\"0\",\"showcasemanual5\":\"0\",\"showcasemanual6\":\"0\",\"featuretype\":\"1\",\"featuremanual1\":\"20\",\"featuremanual2\":\"20\",\"featuremanual3\":\"20\",\"featuremanual4\":\"20\",\"featuremanual5\":\"20\",\"featuremanual6\":\"0\",\"utilitytype\":\"1\",\"utilitymanual1\":\"20\",\"utilitymanual2\":\"20\",\"utilitymanual3\":\"20\",\"utilitymanual4\":\"20\",\"utilitymanual5\":\"20\",\"utilitymanual6\":\"0\",\"bottomtype\":\"1\",\"bottommanual1\":\"20\",\"bottommanual2\":\"20\",\"bottommanual3\":\"20\",\"bottommanual4\":\"20\",\"bottommanual5\":\"20\",\"bottommanual6\":\"0\",\"footertype\":\"1\",\"footermanual1\":\"20\",\"footermanual2\":\"20\",\"footermanual3\":\"20\",\"footermanual4\":\"20\",\"footermanual5\":\"20\",\"footermanual6\":\"0\",\"copyrighttype\":\"1\",\"copyrightmanual1\":\"20\",\"copyrightmanual2\":\"20\",\"copyrightmanual3\":\"20\",\"copyrightmanual4\":\"20\",\"copyrightmanual5\":\"20\",\"copyrightmanual6\":\"0\",\"fontfamily\":\"Arial, Helvetica, sans-serif\",\"fontsize\":\"12px\",\"totop\":\"1\",\"responsive\":\"1\",\"PageSuffix\":\"1\",\"jquery\":\"1\",\"webfont\":\"0\",\"googlefont\":\"no\",\"googlefontelements\":\"h3,#vtem_menu\"}');

-- ----------------------------
-- Table structure for `pxshj_updates`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_updates`;
CREATE TABLE `pxshj_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `categoryid` int(11) DEFAULT '0',
  `name` varchar(100) DEFAULT '',
  `description` text NOT NULL,
  `element` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `folder` varchar(20) DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(10) DEFAULT '',
  `data` text NOT NULL,
  `detailsurl` text NOT NULL,
  `infourl` text NOT NULL,
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Available Updates';

-- ----------------------------
-- Records of pxshj_updates
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_update_categories`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_update_categories`;
CREATE TABLE `pxshj_update_categories` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT '',
  `description` text NOT NULL,
  `parent` int(11) DEFAULT '0',
  `updatesite` int(11) DEFAULT '0',
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Update Categories';

-- ----------------------------
-- Records of pxshj_update_categories
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_update_sites`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_update_sites`;
CREATE TABLE `pxshj_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `location` text NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Update Sites';

-- ----------------------------
-- Records of pxshj_update_sites
-- ----------------------------
INSERT INTO `pxshj_update_sites` VALUES ('1', 'Joomla Core', 'collection', 'http://update.joomla.org/core/list.xml', '0', '1382099998');
INSERT INTO `pxshj_update_sites` VALUES ('2', 'Joomla Extension Directory', 'collection', 'http://update.joomla.org/jed/list.xml', '0', '1382099998');
INSERT INTO `pxshj_update_sites` VALUES ('3', 'Accredited Joomla! Translations', 'collection', 'http://update.joomla.org/language/translationlist.xml', '0', '1382099998');
INSERT INTO `pxshj_update_sites` VALUES ('4', 'AllVideos', 'extension', 'http://www.joomlaworks.net/updates/jw_allvideos.xml', '1', '1383049269');

-- ----------------------------
-- Table structure for `pxshj_update_sites_extensions`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_update_sites_extensions`;
CREATE TABLE `pxshj_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links extensions to update sites';

-- ----------------------------
-- Records of pxshj_update_sites_extensions
-- ----------------------------
INSERT INTO `pxshj_update_sites_extensions` VALUES ('1', '700');
INSERT INTO `pxshj_update_sites_extensions` VALUES ('2', '700');
INSERT INTO `pxshj_update_sites_extensions` VALUES ('3', '600');
INSERT INTO `pxshj_update_sites_extensions` VALUES ('4', '10012');

-- ----------------------------
-- Table structure for `pxshj_usergroups`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_usergroups`;
CREATE TABLE `pxshj_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_usergroups
-- ----------------------------
INSERT INTO `pxshj_usergroups` VALUES ('1', '0', '1', '20', 'Public');
INSERT INTO `pxshj_usergroups` VALUES ('2', '1', '6', '17', 'Registered');
INSERT INTO `pxshj_usergroups` VALUES ('3', '2', '7', '14', 'Author');
INSERT INTO `pxshj_usergroups` VALUES ('4', '3', '8', '11', 'Editor');
INSERT INTO `pxshj_usergroups` VALUES ('5', '4', '9', '10', 'Publisher');
INSERT INTO `pxshj_usergroups` VALUES ('6', '1', '2', '5', 'Manager');
INSERT INTO `pxshj_usergroups` VALUES ('7', '6', '3', '4', 'Administrator');
INSERT INTO `pxshj_usergroups` VALUES ('8', '1', '18', '19', 'Super Users');

-- ----------------------------
-- Table structure for `pxshj_users`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_users`;
CREATE TABLE `pxshj_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `usertype` varchar(25) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  PRIMARY KEY (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=513 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_users
-- ----------------------------
INSERT INTO `pxshj_users` VALUES ('512', 'Super User', 'admin', 'adin@adin.ru', 'cf70052778c3390e1bc4449b31bb0830:Tu5Y68tho31Sh4ubwRR0fB4EEHiGAU68', 'deprecated', '0', '1', '2013-10-18 12:39:34', '2013-10-29 12:39:03', '0', '', '0000-00-00 00:00:00', '0');

-- ----------------------------
-- Table structure for `pxshj_user_notes`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_user_notes`;
CREATE TABLE `pxshj_user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_user_notes
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_user_profiles`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_user_profiles`;
CREATE TABLE `pxshj_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) NOT NULL,
  `profile_value` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Simple user profile storage table';

-- ----------------------------
-- Records of pxshj_user_profiles
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_user_usergroup_map`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_user_usergroup_map`;
CREATE TABLE `pxshj_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_user_usergroup_map
-- ----------------------------
INSERT INTO `pxshj_user_usergroup_map` VALUES ('512', '8');

-- ----------------------------
-- Table structure for `pxshj_viewlevels`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_viewlevels`;
CREATE TABLE `pxshj_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_viewlevels
-- ----------------------------
INSERT INTO `pxshj_viewlevels` VALUES ('1', 'Public', '0', '[1]');
INSERT INTO `pxshj_viewlevels` VALUES ('2', 'Registered', '1', '[6,2,8]');
INSERT INTO `pxshj_viewlevels` VALUES ('3', 'Special', '2', '[6,3,8]');

-- ----------------------------
-- Table structure for `pxshj_weblinks`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_weblinks`;
CREATE TABLE `pxshj_weblinks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `access` int(11) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `language` char(7) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if link is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_weblinks
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_youtubegallery_categories`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_youtubegallery_categories`;
CREATE TABLE `pxshj_youtubegallery_categories` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `parentid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_youtubegallery_categories
-- ----------------------------
INSERT INTO `pxshj_youtubegallery_categories` VALUES ('1', 'Разное', '', '', '0');

-- ----------------------------
-- Table structure for `pxshj_youtubegallery_settings`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_youtubegallery_settings`;
CREATE TABLE `pxshj_youtubegallery_settings` (
  `option` varchar(50) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`option`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_youtubegallery_settings
-- ----------------------------

-- ----------------------------
-- Table structure for `pxshj_youtubegallery_themes`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_youtubegallery_themes`;
CREATE TABLE `pxshj_youtubegallery_themes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `themename` varchar(50) NOT NULL,
  `showtitle` tinyint(1) NOT NULL,
  `playvideo` tinyint(1) NOT NULL,
  `repeat` tinyint(1) NOT NULL,
  `fullscreen` tinyint(1) NOT NULL,
  `autoplay` tinyint(1) NOT NULL,
  `related` tinyint(1) NOT NULL,
  `showinfo` tinyint(1) NOT NULL,
  `bgcolor` varchar(20) NOT NULL,
  `cols` smallint(6) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `cssstyle` varchar(255) NOT NULL,
  `navbarstyle` varchar(255) NOT NULL,
  `thumbnailstyle` varchar(255) NOT NULL,
  `linestyle` varchar(255) NOT NULL,
  `showlistname` tinyint(1) NOT NULL,
  `listnamestyle` varchar(255) NOT NULL,
  `showactivevideotitle` tinyint(1) NOT NULL,
  `activevideotitlestyle` varchar(255) NOT NULL,
  `color1` varchar(255) NOT NULL,
  `color2` varchar(255) NOT NULL,
  `border` smallint(6) NOT NULL,
  `description` tinyint(1) NOT NULL,
  `descr_position` smallint(6) NOT NULL,
  `descr_style` varchar(255) NOT NULL,
  `openinnewwindow` smallint(6) NOT NULL,
  `rel` varchar(255) NOT NULL,
  `hrefaddon` varchar(255) NOT NULL,
  `pagination` smallint(6) NOT NULL,
  `customlimit` smallint(6) NOT NULL,
  `controls` tinyint(1) NOT NULL DEFAULT '1',
  `youtubeparams` varchar(450) NOT NULL,
  `playertype` smallint(6) NOT NULL,
  `useglass` tinyint(1) NOT NULL DEFAULT '0',
  `logocover` varchar(255) NOT NULL,
  `customlayout` text NOT NULL,
  `prepareheadtags` smallint(6) NOT NULL DEFAULT '0',
  `muteonplay` tinyint(1) NOT NULL DEFAULT '0',
  `volume` smallint(6) NOT NULL DEFAULT '-1',
  `orderby` varchar(50) NOT NULL,
  `customnavlayout` text NOT NULL,
  `responsive` smallint(6) NOT NULL DEFAULT '0',
  `mediafolder` varchar(255) NOT NULL,
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  `headscript` text NOT NULL,
  `themedescription` text NOT NULL,
  `nocookie` tinyint(1) NOT NULL DEFAULT '0',
  `changepagetitle` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_youtubegallery_themes
-- ----------------------------
INSERT INTO `pxshj_youtubegallery_themes` VALUES ('1', 'default', '0', '1', '0', '0', '0', '0', '0', '', '5', '600', '400', '', '', '', '', '0', '', '0', '', '', '', '1', '0', '0', '', '0', '', '', '0', '0', '1', '', '1', '0', '', '', '1', '0', '50', 'publisheddate', '', '1', '', '0', '', '', '0', '0');

-- ----------------------------
-- Table structure for `pxshj_youtubegallery_videolists`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_youtubegallery_videolists`;
CREATE TABLE `pxshj_youtubegallery_videolists` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `listname` varchar(50) NOT NULL,
  `videolist` text,
  `catid` int(11) NOT NULL,
  `updateperiod` float NOT NULL DEFAULT '7',
  `lastplaylistupdate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_youtubegallery_videolists
-- ----------------------------
INSERT INTO `pxshj_youtubegallery_videolists` VALUES ('1', 'other', 'http://www.youtube.com/watch?v=O-tykgVlkhI\r\nhttp://www.youtube.com/watch?v=e1aVfqwUn_o\r\nhttp://www.youtube.com/watch?v=GTcjKLH0N5Y\r\nhttp://www.youtube.com/watch?v=IoHmKDXFMw0\r\nhttp://www.youtube.com/watch?v=u6FVabZxYGs', '1', '7', '2013-10-26 23:32:54');

-- ----------------------------
-- Table structure for `pxshj_youtubegallery_videos`
-- ----------------------------
DROP TABLE IF EXISTS `pxshj_youtubegallery_videos`;
CREATE TABLE `pxshj_youtubegallery_videos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `listid` int(11) NOT NULL,
  `parentid` int(11) NOT NULL,
  `videosource` varchar(30) NOT NULL,
  `videoid` varchar(30) NOT NULL,
  `imageurl` varchar(1024) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `custom_imageurl` varchar(255) NOT NULL,
  `custom_title` varchar(255) NOT NULL,
  `custom_description` text NOT NULL,
  `specialparams` varchar(255) NOT NULL,
  `lastupdate` datetime NOT NULL,
  `allowupdates` tinyint(1) NOT NULL DEFAULT '0',
  `status` smallint(6) NOT NULL,
  `isvideo` tinyint(1) NOT NULL DEFAULT '0',
  `link` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `publisheddate` datetime NOT NULL,
  `duration` int(11) NOT NULL DEFAULT '0',
  `rating_average` float NOT NULL DEFAULT '0',
  `rating_max` smallint(6) NOT NULL DEFAULT '0',
  `rating_min` smallint(6) NOT NULL DEFAULT '0',
  `rating_numRaters` int(11) NOT NULL DEFAULT '0',
  `statistics_favoriteCount` int(11) NOT NULL DEFAULT '0',
  `statistics_viewCount` int(11) NOT NULL DEFAULT '0',
  `keywords` text NOT NULL,
  `startsecond` smallint(6) NOT NULL DEFAULT '0',
  `endsecond` smallint(6) NOT NULL DEFAULT '0',
  `likes` int(11) NOT NULL DEFAULT '0',
  `dislikes` int(11) NOT NULL DEFAULT '0',
  `commentcount` int(11) NOT NULL DEFAULT '0',
  `channel_username` varchar(255) NOT NULL,
  `channel_title` varchar(255) NOT NULL,
  `channel_subscribers` int(11) NOT NULL DEFAULT '0',
  `channel_subscribed` smallint(6) NOT NULL DEFAULT '0',
  `channel_location` varchar(5) NOT NULL,
  `channel_commentcount` int(11) NOT NULL DEFAULT '0',
  `channel_viewcount` int(11) NOT NULL DEFAULT '0',
  `channel_videocount` int(11) NOT NULL DEFAULT '0',
  `channel_description` text NOT NULL,
  `channel_totaluploadviews` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pxshj_youtubegallery_videos
-- ----------------------------
INSERT INTO `pxshj_youtubegallery_videos` VALUES ('1', '1', '0', 'youtube', 'O-tykgVlkhI', 'http://i1.ytimg.com/vi/O-tykgVlkhI/default.jpg,http://i1.ytimg.com/vi/O-tykgVlkhI/mqdefault.jpg,http://i1.ytimg.com/vi/O-tykgVlkhI/hqdefault.jpg,http://i1.ytimg.com/vi/O-tykgVlkhI/sddefault.jpg,http://i1.ytimg.com/vi/O-tykgVlkhI/1.jpg,http://i1.ytimg.com/vi/O-tykgVlkhI/2.jpg,http://i1.ytimg.com/vi/O-tykgVlkhI/3.jpg', 'ремонт под ключ', '', '', '', '', '', '2013-10-26 23:46:47', '1', '200', '1', 'http://www.youtube.com/watch?v=O-tykgVlkhI', '10000', '2012-05-21 11:55:45', '294', '0', '0', '0', '0', '0', '149', '', '0', '0', '0', '0', '0', '', '', '0', '0', '', '0', '0', '0', '', '0');
INSERT INTO `pxshj_youtubegallery_videos` VALUES ('2', '1', '0', 'youtube', 'e1aVfqwUn_o', 'http://i1.ytimg.com/vi/e1aVfqwUn_o/default.jpg,http://i1.ytimg.com/vi/e1aVfqwUn_o/mqdefault.jpg,http://i1.ytimg.com/vi/e1aVfqwUn_o/hqdefault.jpg,http://i1.ytimg.com/vi/e1aVfqwUn_o/sddefault.jpg,http://i1.ytimg.com/vi/e1aVfqwUn_o/1.jpg,http://i1.ytimg.com/vi/e1aVfqwUn_o/2.jpg,http://i1.ytimg.com/vi/e1aVfqwUn_o/3.jpg', 'ремонт 3 х комн  квартиры', '', '', '', '', '', '2013-10-26 23:46:47', '1', '200', '1', 'http://www.youtube.com/watch?v=e1aVfqwUn_o', '20000', '2012-05-21 11:16:26', '106', '0', '0', '0', '0', '0', '156', '', '0', '0', '0', '0', '0', '', '', '0', '0', '', '0', '0', '0', '', '0');
INSERT INTO `pxshj_youtubegallery_videos` VALUES ('3', '1', '0', 'youtube', 'GTcjKLH0N5Y', 'http://i1.ytimg.com/vi/GTcjKLH0N5Y/default.jpg,http://i1.ytimg.com/vi/GTcjKLH0N5Y/mqdefault.jpg,http://i1.ytimg.com/vi/GTcjKLH0N5Y/hqdefault.jpg,http://i1.ytimg.com/vi/GTcjKLH0N5Y/sddefault.jpg,http://i1.ytimg.com/vi/GTcjKLH0N5Y/1.jpg,http://i1.ytimg.com/vi/GTcjKLH0N5Y/2.jpg,http://i1.ytimg.com/vi/GTcjKLH0N5Y/3.jpg', 'потолочное освещение ал м', '', '', '', '', '', '2013-10-26 23:46:48', '1', '200', '1', 'http://www.youtube.com/watch?v=GTcjKLH0N5Y', '30000', '2012-05-21 14:29:07', '84', '0', '0', '0', '0', '0', '138', '', '0', '0', '0', '0', '0', '', '', '0', '0', '', '0', '0', '0', '', '0');
INSERT INTO `pxshj_youtubegallery_videos` VALUES ('4', '1', '0', 'youtube', 'IoHmKDXFMw0', 'http://i1.ytimg.com/vi/IoHmKDXFMw0/default.jpg,http://i1.ytimg.com/vi/IoHmKDXFMw0/mqdefault.jpg,http://i1.ytimg.com/vi/IoHmKDXFMw0/hqdefault.jpg,http://i1.ytimg.com/vi/IoHmKDXFMw0/sddefault.jpg,http://i1.ytimg.com/vi/IoHmKDXFMw0/1.jpg,http://i1.ytimg.com/vi/IoHmKDXFMw0/2.jpg,http://i1.ytimg.com/vi/IoHmKDXFMw0/3.jpg', 'кафель и сантехника', '', '', '', '', '', '2013-10-26 23:46:47', '1', '200', '1', 'http://www.youtube.com/watch?v=IoHmKDXFMw0', '40000', '2012-05-21 09:55:00', '44', '0', '0', '0', '0', '0', '70', '', '0', '0', '0', '0', '0', '', '', '0', '0', '', '0', '0', '0', '', '0');
INSERT INTO `pxshj_youtubegallery_videos` VALUES ('5', '1', '0', 'youtube', 'u6FVabZxYGs', 'http://i1.ytimg.com/vi/u6FVabZxYGs/default.jpg,http://i1.ytimg.com/vi/u6FVabZxYGs/mqdefault.jpg,http://i1.ytimg.com/vi/u6FVabZxYGs/hqdefault.jpg,http://i1.ytimg.com/vi/u6FVabZxYGs/sddefault.jpg,http://i1.ytimg.com/vi/u6FVabZxYGs/1.jpg,http://i1.ytimg.com/vi/u6FVabZxYGs/2.jpg,http://i1.ytimg.com/vi/u6FVabZxYGs/3.jpg', 'гипсокартон и лепка', '', '', '', '', '', '2013-10-26 23:46:47', '1', '200', '1', 'http://www.youtube.com/watch?v=u6FVabZxYGs', '50000', '2012-05-21 09:15:22', '48', '0', '0', '0', '0', '0', '143', '', '0', '0', '0', '0', '0', '', '', '0', '0', '', '0', '0', '0', '', '0');

-- ----------------------------
-- Table structure for `tbl_migration`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_migration`;
CREATE TABLE `tbl_migration` (
  `version` varchar(255) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_migration
-- ----------------------------
INSERT INTO `tbl_migration` VALUES ('m000000_000000_base', '1381487596');
INSERT INTO `tbl_migration` VALUES ('m130829_101129_create_user_table', '1381487606');
INSERT INTO `tbl_migration` VALUES ('m130902_184202_ordering_tables_creation', '1381487607');
INSERT INTO `tbl_migration` VALUES ('m130904_142508_create_user_login_table', '1381487607');
INSERT INTO `tbl_migration` VALUES ('m130916_193254_create_items', '1381487608');
INSERT INTO `tbl_migration` VALUES ('m130917_194729_create_price', '1381487608');
INSERT INTO `tbl_migration` VALUES ('m130919_171013_create_auth_tables', '1381487609');
INSERT INTO `tbl_migration` VALUES ('m130925_193254_create_dimension', '1381487609');
INSERT INTO `tbl_migration` VALUES ('m130925_193254_create_orderDetails', '1381487610');
INSERT INTO `tbl_migration` VALUES ('m130926_181129_create_customer_table', '1381487610');
INSERT INTO `tbl_migration` VALUES ('m131003_222249_add_users', '1381487613');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `role` enum('admin','supervisor','merchandiser','customer') DEFAULT NULL,
  `firstname` varchar(128) DEFAULT NULL,
  `lastname` varchar(128) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `region` enum('north','south','west','east') DEFAULT 'north',
  `deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin01', '$2a$13$cjQyuflcJrU/dTYB1xoj9u8Rub6HaUwuGNpUzfG0T8VXfqFdmPUgq', 'admin', 'Izambard', 'Brunnel', 'a@a.com', 'north', '\0');
INSERT INTO `user` VALUES ('2', 'supervisor01', '$2a$13$YQD346e0bMui4.FzwSQC9ea6BN4MsW3PYGGSmBlO2qiNYdOExZ0lW', 'supervisor', 'Jakkard', 'Stannok', 'a@a.com', 'south', '\0');
INSERT INTO `user` VALUES ('3', 'merchandiser01', '$2a$13$T2NOhdW9VhHnRHQfY2jypOrCSQl5mxeuJaBf0hKlOSbV4jvXOrDPm', 'merchandiser', 'Ned', 'Ludd', 'a@a.com', 'east', '\0');
INSERT INTO `user` VALUES ('4', 'customer01', '$2a$13$6XPsbCc15u6ATsoomS9BceETOJ7rY0u4wOfOvQEyP/a5XIyO1AwqW', 'customer', 'Thomas', 'Newcomen', 'a@a.com', 'south', '\0');
INSERT INTO `user` VALUES ('5', 'customer02', '$2a$13$W4pExnAeMpUrqVh.ZyzHpu84uM7wf.CZF626e38lRZ9ae5SmbE/fy', 'customer', 'Frank', 'Smith', '2sd@4rfefrd.com', 'south', '\0');
INSERT INTO `user` VALUES ('6', 'admin02jjj', '$2a$13$IS6hhzIxuXrd.zxKDHngPeIrBiJ5.6pMp6msaHXaHeNhuydcCDX8S', 'admin', 'Clement', 'Walladingen', 'cw@nowhere.com', 'north', '');
INSERT INTO `user` VALUES ('7', 'admin03', '$2a$13$37USDOsWxlAoC0UpS2H8t.9RKxq0E/gdwDeHDpiQ9dCFMRBB8LTCa', 'admin', 'Anabella', 'Byron', 'anb@nowhere.com', 'east', '\0');
INSERT INTO `user` VALUES ('8', 'admin04', '$2a$13$v3WEzWT7NFB6PGnm1GYYTe6JnirdJTgjvmHGzUcq3qi/a1N8jTs2K', 'admin', 'Alphonse', 'Lamartine', 'all@nowhere.com', 'south', '');
INSERT INTO `user` VALUES ('9', 'admin05', '$2a$13$Tdka1An5DMIeDn5OeRBDe.Pa9sSD8XAtmzl0MVrGHPcgpU/ZvT5h.', 'admin', 'Gotie', 'Teofille', 'got@nowhere.com', 'north', '');
INSERT INTO `user` VALUES ('10', 'admin06', '$2a$13$KotPGSrupiUTxfBGsaJDAOwNAC/TijQq1I5PyBVr1KDdrbFqIT40S', 'admin', 'Elizabeth', 'Hovard', 'elh@nowhere.com', 'north', '');
INSERT INTO `user` VALUES ('11', 'customer03', '$2a$13$37USDOsWxlAoC0UpS2H8t.9RKxq0E/gdwDeHDpiQ9dCFMRBB8LTCa', 'customer', 'Henry', 'Bessemer', 'hbs@nowhere.com', 'north', '\0');
INSERT INTO `user` VALUES ('12', 'customer04', '$2a$13$37USDOsWxlAoC0UpS2H8t.9RKxq0E/gdwDeHDpiQ9dCFMRBB8LTCa', 'customer', 'Fransua', 'Talma', 'fta@nowhere.com', 'north', '\0');
INSERT INTO `user` VALUES ('13', 'customer05', '$2a$13$37USDOsWxlAoC0UpS2H8t.9RKxq0E/gdwDeHDpiQ9dCFMRBB8LTCa', 'customer', 'Josef', 'Grimaldi', 'jgr@nowhere.com', 'north', '\0');
INSERT INTO `user` VALUES ('14', 'merchandiser02', '$2a$13$37USDOsWxlAoC0UpS2H8t.9RKxq0E/gdwDeHDpiQ9dCFMRBB8LTCa', 'merchandiser', 'Lafayet', 'Fokke', 'lafo@nowhere.com', 'north', '\0');
INSERT INTO `user` VALUES ('15', 'merchandiser03', '$2a$13$37USDOsWxlAoC0UpS2H8t.9RKxq0E/gdwDeHDpiQ9dCFMRBB8LTCa', 'merchandiser', 'Olkok', 'Rezerford', 'lafo@nowhere.com', 'south', '\0');
INSERT INTO `user` VALUES ('16', 'supervisor02', '$2a$13$37USDOsWxlAoC0UpS2H8t.9RKxq0E/gdwDeHDpiQ9dCFMRBB8LTCa', 'supervisor', 'Jak', 'Bertilion', 'jak@nowhere.com', 'west', '\0');
INSERT INTO `user` VALUES ('17', 'supervisor03', '$2a$13$37USDOsWxlAoC0UpS2H8t.9RKxq0E/gdwDeHDpiQ9dCFMRBB8LTCa', 'supervisor', 'Charles', 'Dulittle', 'chd@nowhere.com', 'west', '\0');
INSERT INTO `user` VALUES ('18', 'admin45', '$2a$13$LX5zlOkVtNKNUf7Q/sDepOwnhncUyNnN.0R6AudLJrMz1BzMj68yC', 'admin', 'aaaaa', 'ssaasasas', 'eee@wed.com', 'north', '\0');
INSERT INTO `user` VALUES ('19', 'bt5gb', '$2a$13$HCoixgqJTCAV8NPXY2hdr.nQLiYKIrXdcSPVbr/Uq6dRkOxcUaUGO', 'admin', 'Izambard', 'Brunnel', 'a@a.com', 'north', '\0');
INSERT INTO `user` VALUES ('20', 'admin4545454', '$2a$13$dw5sjxkOg5xl0JI7IyGkeelayOBwm./bdZyXiFKcrxpjswKxd7N36', 'customer', 'Dima', 'Vasin', 'erwr@wer.com', 'north', '\0');

-- ----------------------------
-- Table structure for `user_attempt`
-- ----------------------------
DROP TABLE IF EXISTS `user_attempt`;
CREATE TABLE `user_attempt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_ip` varchar(16) NOT NULL,
  `attempt_count` tinyint(3) unsigned DEFAULT NULL,
  `blocked_until` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_attempt
-- ----------------------------

-- ----------------------------
-- Table structure for `user_login`
-- ----------------------------
DROP TABLE IF EXISTS `user_login`;
CREATE TABLE `user_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `last_action_time` int(11) DEFAULT NULL,
  `user_agent` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_login
-- ----------------------------
