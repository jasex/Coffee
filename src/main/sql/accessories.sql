/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : coffee

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 17/04/2020 11:19:08
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accessories
-- ----------------------------
DROP TABLE IF EXISTS `accessories`;
CREATE TABLE `accessories`  (
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `price` double(10, 2) DEFAULT NULL,
  `sold` int(255) DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accessories
-- ----------------------------
INSERT INTO `accessories` VALUES ('A001', 'Almond Flavored Syrup', 9.00, 0);
INSERT INTO `accessories` VALUES ('A002', 'Irish Creme Flavored Syrup', 9.00, 1);
INSERT INTO `accessories` VALUES ('A005', 'Gourmet Coffee Cookies', 12.00, 2);
INSERT INTO `accessories` VALUES ('A007', 'Gourmet Coffee Ceramic Mug', 8.00, 3);
INSERT INTO `accessories` VALUES ('A009', 'Gourmet Coffee 36 Cup Filters', 45.00, 4);

SET FOREIGN_KEY_CHECKS = 1;
