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

 Date: 17/04/2020 11:19:21
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for coffeebrewing
-- ----------------------------
DROP TABLE IF EXISTS `coffeebrewing`;
CREATE TABLE `coffeebrewing`  (
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `price` double(10, 2) DEFAULT NULL,
  `model` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `waterSupply` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `numOfCups` int(255) DEFAULT NULL,
  `sold` int(255) DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coffeebrewing
-- ----------------------------
INSERT INTO `coffeebrewing` VALUES ('B001', 'Home Coffee Brewer', 150.00, 'Brewer 100', 'Pourover', 6, 2);
INSERT INTO `coffeebrewing` VALUES ('B002', 'Coffee Brewer, 2 Warmers', 200.00, 'Brewer 200', 'Pourover', 12, 3);
INSERT INTO `coffeebrewing` VALUES ('B003', 'Coffee Brewer, 3 Warmers', 280.00, 'Brewer 210', 'Pouerover', 12, 4);
INSERT INTO `coffeebrewing` VALUES ('B004', 'Commercial Brewer, 20 cups', 380.00, 'Quick Coffee 100', 'Automatic', 20, 5);
INSERT INTO `coffeebrewing` VALUES ('B005', 'Commercial Brewer, 40 cups', 480.00, 'Quick Coffee 200', 'Automatic', 40, 6);

SET FOREIGN_KEY_CHECKS = 1;
