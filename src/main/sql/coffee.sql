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

 Date: 17/04/2020 11:19:14
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for coffee
-- ----------------------------
DROP TABLE IF EXISTS `coffee`;
CREATE TABLE `coffee`  (
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `price` double(10, 2) DEFAULT NULL,
  `origin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `roast` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `flavor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `aroma` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `acidity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `body` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sold` int(255) DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coffee
-- ----------------------------
INSERT INTO `coffee` VALUES ('C001', 'Colombia, Whole, 1 lb', 17.99, 'Colombia', 'Medium', 'Rich and Hearty', 'Rich', 'Medium', 'Full', 0);
INSERT INTO `coffee` VALUES ('C002', 'Colombia, Ground, 1 lb', 18.75, 'Colombia', 'Medium', 'Rich and Hearty', 'Rich', 'Medium', 'Full', 1);
INSERT INTO `coffee` VALUES ('C007', 'Guatemala, Whole, 1 lb', 17.99, 'Guatemala', 'Medium', 'Rich and complex', 'Spicy', 'Medium to high', 'Medium to full', 1);
INSERT INTO `coffee` VALUES ('C008', 'Guatemala, Ground, 1 lb', 18.75, 'Guatamala', 'Medium', 'Rich and complex', 'Spicy', 'Medium to high', 'Medium to full', 2);

SET FOREIGN_KEY_CHECKS = 1;
