/*
 Navicat Premium Data Transfer

 Source Server         : local connection
 Source Server Type    : MySQL
 Source Server Version : 100428 (10.4.28-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : hotel_db

 Target Server Type    : MySQL
 Target Server Version : 100428 (10.4.28-MariaDB)
 File Encoding         : 65001

 Date: 25/11/2023 06:16:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for checked
-- ----------------------------
DROP TABLE IF EXISTS `checked`;
CREATE TABLE `checked`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ref_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `room_id` int NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contact_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date_in` datetime NOT NULL,
  `date_out` datetime NOT NULL,
  `booked_cid` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = pending, 1=checked in , 2 = checked out',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of checked
-- ----------------------------
INSERT INTO `checked` VALUES (4, '0000\n', 1, 'John Smith', '+14526-5455-44', '2020-09-19 11:48:09', '2020-09-22 11:48:09', 0, 2, '2020-09-19 13:11:34');
INSERT INTO `checked` VALUES (5, '9564082520\n', 1, 'John Smith', '+14526-5455-44', '2020-09-19 11:48:33', '2020-09-22 11:48:33', 0, 2, '2020-09-19 13:12:19');
INSERT INTO `checked` VALUES (6, '2765813481\n', 1, 'asdasd asdas as', '8747808787', '2020-09-19 13:16:00', '2020-09-24 13:16:00', 0, 2, '2020-09-19 13:43:21');
INSERT INTO `checked` VALUES (7, '4392831400\n', 3, 'Sample', '5205525544', '2020-09-19 13:00:00', '2020-09-23 13:00:00', 0, 2, '2020-09-19 16:00:55');
INSERT INTO `checked` VALUES (10, '6479004224\n', 1, 'John Smith', '+14526-5455-44', '2020-09-23 10:31:00', '2020-09-29 10:31:00', 3, 1, '2020-09-19 16:39:59');

-- ----------------------------
-- Table structure for room_categories
-- ----------------------------
DROP TABLE IF EXISTS `room_categories`;
CREATE TABLE `room_categories`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` float NOT NULL,
  `cover_img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room_categories
-- ----------------------------
INSERT INTO `room_categories` VALUES (2, 'Deluxe Room', 500, '1600480260_4.jpg');
INSERT INTO `room_categories` VALUES (3, 'Single Room', 120, '1600480680_2.jpg');
INSERT INTO `room_categories` VALUES (4, 'Family Room', 350, '1600480680_room-1.jpg');
INSERT INTO `room_categories` VALUES (6, 'Twin Bed Room', 200, '1600482780_3.jpg');

-- ----------------------------
-- Table structure for roombook
-- ----------------------------
DROP TABLE IF EXISTS `roombook`;
CREATE TABLE `roombook`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Title` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `FName` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `LName` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `Email` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `National` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Country` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Phone` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `TRoom` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Bed` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `NRoom` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Meal` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cin` date NULL DEFAULT NULL,
  `cout` date NULL DEFAULT NULL,
  `stat` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nodays` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roombook
-- ----------------------------
INSERT INTO `roombook` VALUES (2, 'Dr.', 'dsd', 'sdd', 'anasraza5617717@gmail.com', 'Sri Lankan', 'Pakistan', '03208868760', 'Deluxe Room', 'Double', '1', 'Breakfast', '2023-11-03', '2023-11-12', 'Not Conform', 9);
INSERT INTO `roombook` VALUES (3, 'Miss.', 'sana', 'rsa', 'raza@gmail.com', 'Sri Lankan', 'Pakistan', '03208868760', 'Superior Room', 'Single', '2', 'Full Board', '2023-11-11', '2023-12-03', 'Not Conform', 22);
INSERT INTO `roombook` VALUES (4, 'Miss.', 'sana', 'rsa', 'raseza@gmail.com', 'Sri Lankan', 'Andorra', 'das', 'Deluxe Room', 'Triple', '2', 'Breakfast', '2023-12-07', '2023-12-03', 'Not Conform', -4);
INSERT INTO `roombook` VALUES (5, 'Miss.', 'Anas', 'raza', 'rao@gmail.com', 'Sri Lankan', 'Pakistan', '03208868760', 'Deluxe Room', 'Double', '3', 'Half Board', '2023-11-16', '2024-01-06', 'Not Conform', 51);

-- ----------------------------
-- Table structure for rooms
-- ----------------------------
DROP TABLE IF EXISTS `rooms`;
CREATE TABLE `rooms`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `room` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `category_id` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = Available , 1= Unvailables',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rooms
-- ----------------------------
INSERT INTO `rooms` VALUES (1, 'Room-101', 3, 1);
INSERT INTO `rooms` VALUES (3, 'Room-102', 2, 0);

-- ----------------------------
-- Table structure for system_settings
-- ----------------------------
DROP TABLE IF EXISTS `system_settings`;
CREATE TABLE `system_settings`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `hotel_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contact` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cover_img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `about_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_settings
-- ----------------------------
INSERT INTO `system_settings` VALUES (1, 'Hotel Management System', 'info@sample.com', '+6948 8542 623', '1600478940_hotel-cover.jpg', '&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;ABOUT US&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;background: transparent; position: relative; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;&lt;b style=&quot;margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; text-align: justify;&quot;&gt;Lorem Ipsum&lt;/b&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-weight: 400; text-align: justify;&quot;&gt;&amp;nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&amp;#x2019;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/span&gt;&lt;br&gt;&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;background: transparent; position: relative; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-weight: 400; text-align: justify;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;background: transparent; position: relative; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;&lt;h2 style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;Where does it come from?&lt;/h2&gt;&lt;p style=&quot;text-align: center; margin-bottom: 15px; padding: 0px; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-weight: 400;&quot;&gt;Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.&lt;/p&gt;&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/p&gt;');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=admin , 2 = staff',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (0, '', '', '', 2);
INSERT INTO `users` VALUES (1, 'Administrator', 'admin', 'admin123', 1);

-- ----------------------------
-- Table structure for users_reg
-- ----------------------------
DROP TABLE IF EXISTS `users_reg`;
CREATE TABLE `users_reg`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NULL DEFAULT current_timestamp,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `zip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_reg
-- ----------------------------
INSERT INTO `users_reg` VALUES (11, 'anas123', '$2y$10$IMhsZ17F/o9uJ7LwLyoc2O2.mdbvVnIjNOHmhprg9sJpgkdwcB5Ei', '2023-11-24 04:05:08', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
