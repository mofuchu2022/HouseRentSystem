/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : demo1025

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 14/04/2022 10:29:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for z_account
-- ----------------------------
DROP TABLE IF EXISTS `z_account`;
CREATE TABLE `z_account`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `balance` decimal(19, 2) NULL DEFAULT NULL,
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `head_pic` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pw_pwd` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `username` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `credit_score` int(2) NOT NULL,
  `address` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_aihhboidd3kwbhu1k1v5nli8b`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of z_account
-- ----------------------------
INSERT INTO `z_account` VALUES (1, '2021-10-21 18:12:51', '2021-10-26 18:10:45', 956414.00, '1095319991@qq.com', '', '18337556034', '1234', NULL, 1, 1, '1234', 75, 'm15');
INSERT INTO `z_account` VALUES (4, '2021-10-21 16:51:10', '2021-10-24 11:34:04', 0.00, '123456787@qq.com', NULL, '13076367994', '7890', NULL, 0, 1, '1021', 85, '1234');
INSERT INTO `z_account` VALUES (5, '2021-10-21 19:01:46', '2021-10-31 21:35:17', 123456.00, '2724868707@qq.com', '20211029/1635515530145.jpg', '13476367992', '1234', '123456', 0, 1, '4567', 100, NULL);
INSERT INTO `z_account` VALUES (6, '2021-10-22 15:00:16', '2021-10-22 15:11:16', 9000.00, '2226868707@qq.com', NULL, '13076367996', '1234', NULL, 1, 1, '1022', 100, '1234');
INSERT INTO `z_account` VALUES (7, '2021-10-22 22:04:16', '2021-10-22 22:04:16', 0.00, '2766868707@qq.com', NULL, '13076367990', '1230', NULL, 0, 1, '1230', 100, NULL);
INSERT INTO `z_account` VALUES (8, '2021-10-22 22:07:58', '2021-10-22 22:07:58', 0.00, '27226868707@qq.com', NULL, '13046367992', '7896', NULL, 0, 1, '7896', 100, NULL);
INSERT INTO `z_account` VALUES (9, '2021-10-26 19:21:22', '2021-10-26 19:21:22', 0.00, '3726868707@qq.com', NULL, '13576367942', '1026', NULL, 0, 1, '1026', 95, NULL);
INSERT INTO `z_account` VALUES (10, '2021-10-27 18:31:06', '2021-10-27 18:32:10', 0.00, '2726868707@qq.com', '', '13076367992', '1027', '1324', 0, 0, '1027', 100, NULL);
INSERT INTO `z_account` VALUES (11, '2021-10-29 22:37:11', '2021-10-29 22:41:33', 3730.00, '2726868707@qq.com', NULL, '13076367992', '1029', NULL, 1, 1, '1029', 95, '');
INSERT INTO `z_account` VALUES (12, '2021-11-23 22:22:19', '2021-11-30 11:31:58', 0.00, '2020859604@qq.com', NULL, '18337556035', '1123', NULL, 1, 1, '1123', 100, '平院666扛把子宿舍');
INSERT INTO `z_account` VALUES (14, '2021-11-24 22:33:16', '2021-11-24 22:33:16', 45646.00, '5641', '', '54', '1156', NULL, 1, 1, '4564', 100, NULL);
INSERT INTO `z_account` VALUES (15, '2021-12-05 15:50:45', '2021-12-05 15:50:45', 0.00, '2726868707@qq.com', '', '13076367992', '1234', NULL, 1, 1, '6666', 100, NULL);
INSERT INTO `z_account` VALUES (16, '2022-03-24 21:57:53', '2022-03-24 21:57:53', 0.00, '2861343328@qq.com', NULL, '13076367569', '1234', NULL, 0, 1, '5464', 100, NULL);
INSERT INTO `z_account` VALUES (17, '2022-03-24 21:58:49', '2022-03-24 22:00:07', 0.00, '2761343528@qq.com', '', '13076537992', '1234', NULL, 0, 1, '张三四五', 100, NULL);

-- ----------------------------
-- Table structure for z_bidd_project
-- ----------------------------
DROP TABLE IF EXISTS `z_bidd_project`;
CREATE TABLE `z_bidd_project`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `address` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applicants_number` int(11) NULL DEFAULT NULL,
  `auction_times` int(11) NULL DEFAULT NULL,
  `bidding_end_time` datetime NULL DEFAULT NULL,
  `biddind_start_time` datetime NULL DEFAULT NULL,
  `credit` int(5) NULL DEFAULT NULL,
  `describes` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `end_time` datetime NULL DEFAULT NULL,
  `name` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `payment_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `picture` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `project_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `project_status` int(11) NOT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `start_price` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `transaction_price` int(11) NULL DEFAULT NULL,
  `home_account_id` bigint(20) NULL DEFAULT NULL,
  `organization` bigint(20) NULL DEFAULT NULL,
  `home_project_category` bigint(20) NULL DEFAULT NULL,
  `reason` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rate` double(3, 1) NULL DEFAULT NULL,
  `views_number` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKskoukp93c447w04x2fx52enyg`(`home_account_id`) USING BTREE,
  INDEX `FK5l0imkehnbgnbhgiir2hnmh97`(`organization`) USING BTREE,
  INDEX `FK3jqrd0uu1una55o7vl84r98n2`(`home_project_category`) USING BTREE,
  CONSTRAINT `FK3jqrd0uu1una55o7vl84r98n2` FOREIGN KEY (`home_project_category`) REFERENCES `z_project_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK5l0imkehnbgnbhgiir2hnmh97` FOREIGN KEY (`organization`) REFERENCES `z_organization` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKskoukp93c447w04x2fx52enyg` FOREIGN KEY (`home_account_id`) REFERENCES `z_account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of z_bidd_project
-- ----------------------------
INSERT INTO `z_bidd_project` VALUES (9, '2021-10-22 10:33:07', '2021-10-22 10:34:34', '1234', 1, 0, '2021-10-22 11:36:00', '2021-10-22 11:33:00', 100, '123333333333333333333333333333546546545646546<img src=\"http://localhost:8081/admin/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" class=\"gif-photo\" alt=\"\" /><img src=\"/photo/view?filename=/20211022/1634869976950.jpg\" alt=\"\" /><img src=\"/photo/view?filename=/20211022/1634869984615.jpg\" alt=\"\" />', '2021-10-22 10:50:00', '1234', '1234', '20211022/1634869913788.jpg', 'xmF233CE32464B4922', 6, 1234, 1234, '2021-10-22 10:36:00', 0, NULL, 1, 1, '1234', 0.0, 20);
INSERT INTO `z_bidd_project` VALUES (10, '2021-10-22 15:03:20', '2021-10-22 15:03:55', '1234', 1, 3, '2021-10-22 15:08:00', '2021-10-22 15:07:00', 100, '5121654566666666666666666666666666666666666666<img src=\"http://localhost:8081/admin/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" class=\"gif-photo\" alt=\"\" /><img src=\"http://localhost:8081/admin/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" class=\"gif-photo\" alt=\"\" /><img src=\"/photo/view?filename=/20211022/1634886196838.jpg\" alt=\"\" />', '2021-10-22 15:06:00', '测试拍卖功能', '1234', '20211022/1634886137831.jpg', 'xm299A71064F4945A4', 6, 0, 66, '2021-10-22 15:05:00', 0, NULL, 3, 1, '可以发布', 5.0, 36);
INSERT INTO `z_bidd_project` VALUES (11, '2021-10-24 11:03:57', '2021-10-24 11:04:35', '1234', 1, 6, '2021-10-24 11:09:00', '2021-10-24 11:08:00', 100, '156415641564165165165165456465262<img src=\"/photo/view?filename=/20211024/1635044633954.jpg\" alt=\"\" />', '2021-10-24 11:07:00', '再次测试', '412', '20211024/1635044588334.jpg', 'xm7B488B7148954BB7', 6, 0, 123, '2021-10-24 11:06:00', 0, NULL, 1, 1, '1234', 10.0, 52);
INSERT INTO `z_bidd_project` VALUES (12, '2021-10-24 11:15:45', '2021-11-23 16:18:10', '156465', 2, 4, '2021-11-30 21:25:00', '2021-11-29 22:22:00', 100, '<p>\r\n	12456415641654165165165165415646546523\r\n</p>\r\n<p>\r\n	大西北海景房一套6565\r\n</p>', '2021-11-26 19:24:00', '12345646', '1234', '20211024/1635045302762.jpg', 'xm8C613A6A46FA45AB', 5, 10, 1236, '2021-11-25 15:26:00', 0, NULL, 1, 2, '564', 3.0, 47);
INSERT INTO `z_bidd_project` VALUES (13, '2021-10-24 11:22:59', '2021-10-24 11:23:19', '1234', 1, 0, '2021-10-24 11:27:00', '2021-10-24 11:26:00', 100, '1564456555555555555555555555555555555555555555555555555555555555555555', '2021-10-24 11:25:00', '1234', '124', '20211024/1635045738813.jpg', 'xm1B5F10A4757C4066', 6, 1, 12131, '2021-10-24 11:24:00', 0, NULL, 2, 1, '21324', 0.0, 24);
INSERT INTO `z_bidd_project` VALUES (14, '2021-10-24 11:29:00', '2021-10-24 11:29:23', '121', 1, 3, '2021-10-24 11:33:00', '2021-10-24 11:32:00', 100, '516455555555555555555555555555555555555555555555555555555555555555555555555555555555555555', '2021-10-24 11:31:00', '1234', '23232', '20211024/1635046106847.jpg', 'xm8B8BD9F345F845B7', 5, 121, 1231, '2021-10-24 11:30:00', 0, NULL, 2, 1, '545456', 0.0, 18);
INSERT INTO `z_bidd_project` VALUES (15, '2021-10-26 16:56:17', '2021-11-22 21:14:24', '平院666超市门口', 3, 7, '2022-02-22 17:14:00', '2022-01-01 00:22:00', 100, '1080p 24寸小米显示器 毕业不方便携带 使用时间为一年 箱说全 交易成功后面交&nbsp;&nbsp;&nbsp;', '2021-11-22 23:26:00', '小米显示器', '线下交易', '20211029/1635513467322.jpg', 'xm24C61B5ED6934399', 5, 1, 350, '2021-11-22 23:15:00', 0, NULL, 2, 2, '可以通过', 10.0, 86);
INSERT INTO `z_bidd_project` VALUES (17, '2021-11-21 16:58:02', '2021-11-21 17:25:38', '6666', 0, 0, '2021-11-23 17:17:00', '2021-11-23 13:13:00', 80, '<p>\r\n	<span><span style=\"font-size:15px;background-color:#FFFFFF;\">假如生活欺骗了你<span style=\"color:#333333;font-family:Arial, sans-serif;font-size:15px;background-color:#FFFFFF;\">假如生活欺骗了你</span><span style=\"color:#333333;font-family:Arial, sans-serif;font-size:15px;background-color:#FFFFFF;\">假如生活欺骗了你</span><span style=\"color:#333333;font-family:Arial, sans-serif;font-size:15px;background-color:#FFFFFF;\">假如生活欺骗了你</span><span style=\"color:#333333;font-family:Arial, sans-serif;font-size:15px;background-color:#FFFFFF;\">假如生活欺骗了你</span><span style=\"color:#333333;font-family:Arial, sans-serif;font-size:15px;background-color:#FFFFFF;\">假如生活欺骗了你</span><span style=\"color:#333333;font-family:Arial, sans-serif;font-size:15px;background-color:#FFFFFF;\">假如生活欺骗了你</span><span style=\"color:#333333;font-family:Arial, sans-serif;font-size:15px;background-color:#FFFFFF;\">假如生活欺骗了你</span><span style=\"color:#333333;font-family:Arial, sans-serif;font-size:15px;background-color:#FFFFFF;\">假如生活欺骗了你</span><span style=\"color:#333333;font-family:Arial, sans-serif;font-size:15px;background-color:#FFFFFF;\">假如生活欺骗了你</span><span style=\"color:#333333;font-family:Arial, sans-serif;font-size:15px;background-color:#FFFFFF;\">假如生活欺骗了你</span><span style=\"color:#333333;font-family:Arial, sans-serif;font-size:15px;background-color:#FFFFFF;\">假如生活欺</span></span></span> \r\n</p>\r\n<p>\r\n	<span><span style=\"font-size:15px;background-color:#FFFFFF;\"><span style=\"color:#333333;font-family:Arial, sans-serif;font-size:15px;background-color:#FFFFFF;\"><img src=\"/photo/view?filename=/20211121/1637486667931.PNG\" alt=\"\" /><br />\r\n</span></span></span> \r\n</p>\r\n<p>\r\n	<span><span style=\"font-size:15px;background-color:#FFFFFF;\"><span style=\"color:#333333;font-family:Arial, sans-serif;font-size:15px;background-color:#FFFFFF;\"><img src=\"/photo/view?filename=/20211121/1637486719083.PNG\" alt=\"\" /><br />\r\n</span></span></span>\r\n</p>', '2021-11-22 14:14:00', '测试分页', '面交', '20211121/1637485035176.PNG', 'xmAB91607342E6414B', 6, 1, 1, '2021-11-22 14:09:00', 0, NULL, 9, 5, '156416516516', 0.0, 20);
INSERT INTO `z_bidd_project` VALUES (18, '2021-11-22 21:03:10', '2021-11-28 11:41:21', '平院888栋楼', 2, 16, '2021-12-28 22:30:00', '2021-11-28 11:45:00', 90, '九成新外星人笔记本 i9 11980hk 3080显卡 32g内存 仅支持面交 谢谢&nbsp;<img src=\"http://localhost:8081/admin/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" class=\"gif-photo\" alt=\"\" /><img src=\"http://localhost:8081/admin/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" class=\"gif-photo\" alt=\"\" /><img src=\"http://localhost:8081/admin/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" class=\"gif-photo\" alt=\"\" /><img src=\"http://localhost:8081/admin/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" class=\"gif-photo\" alt=\"\" /><img src=\"http://localhost:8081/admin/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" class=\"gif-photo\" alt=\"\" /><img src=\"http://localhost:8081/admin/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" class=\"gif-photo\" alt=\"\" /><img src=\"http://localhost:8081/admin/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" class=\"gif-photo\" alt=\"\" /><img src=\"http://localhost:8081/admin/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" class=\"gif-photo\" alt=\"\" /><img src=\"http://localhost:8081/admin/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" class=\"gif-photo\" alt=\"\" /><img src=\"http://localhost:8081/admin/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" class=\"gif-photo\" alt=\"\" /><img src=\"http://localhost:8081/admin/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" class=\"gif-photo\" alt=\"\" /><img src=\"http://localhost:8081/admin/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" class=\"gif-photo\" alt=\"\" /><img src=\"http://localhost:8081/admin/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" class=\"gif-photo\" alt=\"\" /><img src=\"http://localhost:8081/admin/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" class=\"gif-photo\" alt=\"\" /><img src=\"http://localhost:8081/admin/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" class=\"gif-photo\" alt=\"\" /><img src=\"http://localhost:8081/admin/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" class=\"gif-photo\" alt=\"\" />', '2021-11-28 11:44:00', '外星人笔记本', '面交', '20211122/1637585973557.jpeg', 'xm0FDB8FAFD8DC4BA9', 5, 1, 19999, '2021-11-28 11:43:00', 32156, NULL, 9, 1, '541651321', 0.0, 59);
INSERT INTO `z_bidd_project` VALUES (19, '2021-11-22 21:17:35', '2021-11-22 21:17:58', '平院101010宿舍楼', 2, 2, '2021-11-22 21:22:00', '2021-11-22 21:21:00', 80, '保温壶保温壶<span>保温壶保温壶</span><span>保温壶保温壶</span><span>保温壶保温壶</span><span>保温壶保温壶</span><span>保温壶保温壶</span><span>保温壶保温壶</span><span>保温壶保温壶</span><span>保温壶保温壶</span><span>保温壶保温壶便宜出了</span>', '2021-11-22 21:20:00', '保温壶', '面交', '20211122/1637586988535.jpg', 'xm3F75E7346EAE4580', 6, 0, 3, '2021-11-22 21:19:00', 0, NULL, 2, 4, '可以通过', 5.0, 16);
INSERT INTO `z_bidd_project` VALUES (20, '2021-11-23 16:21:22', '2021-11-27 17:36:47', '平院12345宿舍', 4, 0, '2022-01-31 18:18:00', '2022-01-01 21:14:00', 96, '<p>\r\n	崭新的笔记本\r\n</p>\r\n<p>\r\n	2021最新款\r\n</p>\r\n<p>\r\n	性能强劲\r\n</p>\r\n<p>\r\n	商务风格\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '2021-12-31 18:18:00', 'R9000P2021', '面交', '20211123/1637655597533.jpg', 'xm8DCB5A407742494B', 6, 1, 6999, '2021-11-27 17:38:00', 0, NULL, 1, 1, '可以通过', 0.0, 28);
INSERT INTO `z_bidd_project` VALUES (21, '2021-11-30 14:25:25', '2021-12-05 14:38:02', '平院操作篮球场处', 0, 0, '2022-01-06 22:18:00', '2021-12-22 19:14:00', 80, '<p>\r\n	换了新的，这个不再使用了，低价拍给有需要的同学。。。。。。。。。。。。。。。。。。。。。。。。。。\r\n</p>\r\n<p>\r\n	非诚勿扰\r\n</p>', '2021-12-16 22:18:00', '行李箱', '面交', '20211130/1638253345172.jpeg', 'xm0D760871CB6A4B3B', 6, 1, 50, '2021-12-09 14:10:00', 0, NULL, 9, 4, '审核通过后，即可出现在前台', 0.0, 13);
INSERT INTO `z_bidd_project` VALUES (23, '2022-03-08 14:22:33', '2022-03-14 14:37:39', '211', 4, 0, '2022-04-08 18:17:00', '2022-03-31 18:30:00', 100, '<p>\r\n	153216541\r\n</p>\r\n<p>\r\n	用于测试商品编辑功能\r\n</p>\r\n<p>\r\n	编辑后保存，商品需要重新修改\r\n</p>', '2022-03-25 23:23:00', '1234', '521', '20220308/1646720522622.jpg', 'xm51C44C1DEC67496B', 6, 12, 12, '2022-03-14 14:39:00', 0, NULL, 1, 5, '', 0.0, 26);
INSERT INTO `z_bidd_project` VALUES (24, '2022-03-08 14:36:41', '2022-03-09 11:29:41', '451541', 1, 27, '2022-06-07 09:09:00', '2022-03-09 11:35:00', 56, '<p>\r\n	654564654\r\n</p>\r\n<p>\r\n	45654165165\r\n</p>\r\n<p>\r\n	6456313516\r\n</p>', '2022-03-09 11:34:00', '口罩4545', '551', '20220308/1646721296349.jpg', 'xm241931D47A424CFA', 4, 4545, 1, '2022-03-09 11:32:00', 520, NULL, 1, 4, '21635156', 0.0, 76);
INSERT INTO `z_bidd_project` VALUES (25, '2022-03-24 22:04:57', '2022-03-24 22:05:21', '平院999号楼', 2, 2, '2022-03-24 22:22:00', '2022-03-24 22:13:00', 60, '<p>\r\n	用于再次测试竞拍功能的实现\r\n</p>\r\n<p>\r\n	测试内容描述\r\n</p>\r\n<p>\r\n	20220324\r\n</p>', '2022-03-24 22:12:00', '口罩3', '面交', '20220324/1648130550323.jpg', 'xmB46D43BE435346CD', 5, 10, 2, '2022-03-24 22:06:00', 11, NULL, 15, 5, '可以通过', 0.0, 10);
INSERT INTO `z_bidd_project` VALUES (26, '2022-04-13 21:04:01', '2022-04-13 21:04:01', '平院999号楼', 0, 0, '2022-05-18 22:21:00', '2022-04-30 22:26:00', 80, '<p>\r\n	大牛助力车\r\n</p>\r\n<p>\r\n	考研自用一年\r\n</p>\r\n<p>\r\n	每天去图书馆省力省时神奇，节省爬坡体力\r\n</p>\r\n<p>\r\n	现在超低价出了 希望大家能给个良心价\r\n</p>', '2022-04-29 18:26:00', '大牛助力车', '线下交易', '20220413/1649854862029.jpeg', 'xm52022C2033094D65', 8, 1, 300, '2022-04-13 21:26:00', 0, NULL, 1, 4, NULL, 0.0, 0);

-- ----------------------------
-- Table structure for z_bidd_record
-- ----------------------------
DROP TABLE IF EXISTS `z_bidd_record`;
CREATE TABLE `z_bidd_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `bid` int(11) NULL DEFAULT NULL,
  `bidding_status` int(11) NULL DEFAULT NULL,
  `pay_status` int(11) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `account_id` bigint(20) NULL DEFAULT NULL,
  `bidding_project_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKtk5rdmwx9onbmy5vkp2xd2isu`(`account_id`) USING BTREE,
  INDEX `FK8vm9j86knj9jbons4e8qk2t2g`(`bidding_project_id`) USING BTREE,
  CONSTRAINT `FK8vm9j86knj9jbons4e8qk2t2g` FOREIGN KEY (`bidding_project_id`) REFERENCES `z_bidd_project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKtk5rdmwx9onbmy5vkp2xd2isu` FOREIGN KEY (`account_id`) REFERENCES `z_account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of z_bidd_record
-- ----------------------------
INSERT INTO `z_bidd_record` VALUES (9, '2021-10-22 15:07:08', '2021-10-22 15:07:08', 66, 0, 2, 1, 6, 10);
INSERT INTO `z_bidd_record` VALUES (10, '2021-10-22 15:07:36', '2021-10-22 15:07:36', 128, 0, 2, 1, 6, 10);
INSERT INTO `z_bidd_record` VALUES (11, '2021-10-22 15:07:41', '2021-10-22 15:07:41', 999, 3, 1, 1, 6, 10);
INSERT INTO `z_bidd_record` VALUES (12, '2021-10-24 11:08:10', '2021-10-24 11:08:10', 123, 0, 2, 1, 1, 11);
INSERT INTO `z_bidd_record` VALUES (13, '2021-10-24 11:08:13', '2021-10-24 11:08:13', 123, 0, 2, 1, 1, 11);
INSERT INTO `z_bidd_record` VALUES (14, '2021-10-24 11:08:15', '2021-10-24 11:08:15', 123, 0, 2, 1, 1, 11);
INSERT INTO `z_bidd_record` VALUES (15, '2021-10-24 11:09:07', '2021-10-24 11:09:07', 123, 0, 2, 2, 1, 11);
INSERT INTO `z_bidd_record` VALUES (16, '2021-10-24 11:09:09', '2021-10-24 11:09:09', 123, 3, 2, 1, 1, 11);
INSERT INTO `z_bidd_record` VALUES (17, '2021-10-24 11:19:03', '2021-10-24 11:19:03', 1236, 0, 2, 1, 1, 12);
INSERT INTO `z_bidd_record` VALUES (18, '2021-10-24 11:19:25', '2021-10-24 11:19:25', 1242, 0, 0, 1, 1, 12);
INSERT INTO `z_bidd_record` VALUES (19, '2021-10-24 11:32:12', '2021-10-24 11:32:12', 1231, 0, 2, 1, 4, 14);
INSERT INTO `z_bidd_record` VALUES (20, '2021-10-24 11:32:36', '2021-10-24 11:32:36', 1231, 0, 2, 1, 4, 14);
INSERT INTO `z_bidd_record` VALUES (21, '2021-10-24 11:32:44', '2021-10-24 11:32:44', 1236, 0, 0, 1, 4, 14);
INSERT INTO `z_bidd_record` VALUES (22, '2021-10-26 17:04:03', '2021-10-26 17:04:03', 1234, 0, 2, 1, 1, 15);
INSERT INTO `z_bidd_record` VALUES (23, '2021-10-26 17:04:26', '2021-10-26 17:04:26', 1534, 0, 2, 1, 5, 15);
INSERT INTO `z_bidd_record` VALUES (24, '2021-10-26 17:04:36', '2021-10-26 17:04:36', 2234, 0, 2, 1, 1, 15);
INSERT INTO `z_bidd_record` VALUES (25, '2021-10-26 17:04:58', '2021-10-26 17:04:58', 3234, 0, 2, 1, 5, 15);
INSERT INTO `z_bidd_record` VALUES (26, '2021-10-26 17:05:21', '2021-10-26 17:05:21', 4567, 0, 2, 1, 1, 15);
INSERT INTO `z_bidd_record` VALUES (27, '2021-10-26 17:05:49', '2021-10-26 17:05:49', 10000, 0, 2, 1, 5, 15);
INSERT INTO `z_bidd_record` VALUES (28, '2021-10-26 17:06:36', '2021-10-26 17:06:36', 99999, 3, 1, 1, 1, 15);
INSERT INTO `z_bidd_record` VALUES (31, '2021-10-29 22:40:09', '2021-10-29 22:40:09', 1236, 0, 2, 1, 11, 12);
INSERT INTO `z_bidd_record` VALUES (32, '2021-10-29 22:40:22', '2021-10-29 22:40:22', 1270, 3, 2, 1, 11, 12);
INSERT INTO `z_bidd_record` VALUES (33, '2021-11-22 21:08:17', '2021-11-22 21:08:17', 20000, 0, 0, 1, 11, 18);
INSERT INTO `z_bidd_record` VALUES (34, '2021-11-22 21:09:03', '2021-11-22 21:09:03', 20005, 0, 0, 1, 1, 18);
INSERT INTO `z_bidd_record` VALUES (35, '2021-11-22 21:21:22', '2021-11-22 21:21:22', 3, 0, 2, 1, 11, 19);
INSERT INTO `z_bidd_record` VALUES (36, '2021-11-22 21:21:46', '2021-11-22 21:21:46', 4, 3, 1, 1, 1, 19);
INSERT INTO `z_bidd_record` VALUES (37, '2021-11-22 22:50:48', '2021-11-22 22:50:48', 123, 3, 1, 1, 1, 11);
INSERT INTO `z_bidd_record` VALUES (38, '2021-11-27 21:09:17', '2021-11-27 21:09:17', 21324, 0, 0, 1, 1, 18);
INSERT INTO `z_bidd_record` VALUES (39, '2021-11-27 21:09:41', '2021-11-27 21:09:41', 22000, 0, 0, 1, 1, 18);
INSERT INTO `z_bidd_record` VALUES (40, '2021-11-27 21:31:38', '2021-11-27 21:31:38', 32156, 0, 0, 1, 1, 18);
INSERT INTO `z_bidd_record` VALUES (41, '2021-11-27 21:31:46', '2021-11-27 21:31:46', 19999, 0, 0, 1, 1, 18);
INSERT INTO `z_bidd_record` VALUES (42, '2021-11-27 21:32:38', '2021-11-27 21:32:38', 19999, 0, 0, 1, 1, 18);
INSERT INTO `z_bidd_record` VALUES (43, '2021-11-27 21:34:47', '2021-11-27 21:34:47', 20202, 0, 0, 1, 1, 18);
INSERT INTO `z_bidd_record` VALUES (44, '2021-11-27 21:42:10', '2021-11-27 21:42:10', 19999, 0, 0, 1, 11, 18);
INSERT INTO `z_bidd_record` VALUES (45, '2021-11-27 21:42:45', '2021-11-27 21:42:45', 20003, 0, 0, 1, 11, 18);
INSERT INTO `z_bidd_record` VALUES (46, '2021-11-27 21:43:17', '2021-11-27 21:43:17', 20007, 0, 0, 1, 11, 18);
INSERT INTO `z_bidd_record` VALUES (47, '2021-11-29 22:45:22', '2021-11-29 22:45:22', 19999, 0, 0, 1, 1, 18);
INSERT INTO `z_bidd_record` VALUES (48, '2021-11-30 10:34:43', '2021-11-30 10:34:43', 19999, 0, 0, 1, 1, 18);
INSERT INTO `z_bidd_record` VALUES (49, '2021-11-30 10:34:49', '2021-11-30 10:34:49', 19999, 0, 0, 1, 1, 18);
INSERT INTO `z_bidd_record` VALUES (50, '2021-11-30 10:53:50', '2021-11-30 10:53:50', 19999, 0, 0, 1, 1, 18);
INSERT INTO `z_bidd_record` VALUES (51, '2021-11-30 10:55:20', '2021-11-30 10:55:20', 23456, 0, 0, 1, 1, 18);
INSERT INTO `z_bidd_record` VALUES (52, '2022-03-09 11:36:58', '2022-03-09 11:36:58', 1, 0, 0, 1, 1, 24);
INSERT INTO `z_bidd_record` VALUES (53, '2022-03-09 11:37:00', '2022-03-09 11:37:00', 1, 0, 0, 1, 1, 24);
INSERT INTO `z_bidd_record` VALUES (54, '2022-03-09 11:37:02', '2022-03-09 11:37:02', 1, 0, 0, 1, 1, 24);
INSERT INTO `z_bidd_record` VALUES (55, '2022-03-09 11:37:03', '2022-03-09 11:37:03', 1, 0, 0, 1, 1, 24);
INSERT INTO `z_bidd_record` VALUES (56, '2022-03-09 11:37:07', '2022-03-09 11:37:07', 1, 0, 0, 1, 1, 24);
INSERT INTO `z_bidd_record` VALUES (57, '2022-03-09 11:37:08', '2022-03-09 11:37:08', 1, 0, 0, 1, 1, 24);
INSERT INTO `z_bidd_record` VALUES (58, '2022-03-09 11:37:10', '2022-03-09 11:37:10', 1, 0, 0, 1, 1, 24);
INSERT INTO `z_bidd_record` VALUES (59, '2022-03-09 11:37:12', '2022-03-09 11:37:12', 1, 0, 0, 1, 1, 24);
INSERT INTO `z_bidd_record` VALUES (60, '2022-03-09 11:37:15', '2022-03-09 11:37:15', 4, 0, 0, 1, 1, 24);
INSERT INTO `z_bidd_record` VALUES (61, '2022-03-09 11:37:22', '2022-03-09 11:37:22', 4, 0, 0, 6, 1, 24);
INSERT INTO `z_bidd_record` VALUES (62, '2022-03-09 11:37:25', '2022-03-09 11:37:25', 4, 0, 0, 6, 1, 24);
INSERT INTO `z_bidd_record` VALUES (63, '2022-03-09 11:37:27', '2022-03-09 11:37:27', 4, 0, 0, 6, 1, 24);
INSERT INTO `z_bidd_record` VALUES (64, '2022-03-09 11:37:29', '2022-03-09 11:37:29', 4, 0, 0, 6, 1, 24);
INSERT INTO `z_bidd_record` VALUES (65, '2022-03-09 11:37:30', '2022-03-09 11:37:30', 4, 0, 0, 6, 1, 24);
INSERT INTO `z_bidd_record` VALUES (66, '2022-03-09 11:37:31', '2022-03-09 11:37:31', 4, 0, 0, 6, 1, 24);
INSERT INTO `z_bidd_record` VALUES (67, '2022-03-09 11:37:37', '2022-03-09 11:37:37', 4, 0, 0, 6, 1, 24);
INSERT INTO `z_bidd_record` VALUES (68, '2022-03-09 11:37:39', '2022-03-09 11:37:39', 4, 0, 0, 6, 1, 24);
INSERT INTO `z_bidd_record` VALUES (69, '2022-03-09 11:37:41', '2022-03-09 11:37:41', 4, 0, 0, 6, 1, 24);
INSERT INTO `z_bidd_record` VALUES (70, '2022-03-09 11:37:43', '2022-03-09 11:37:43', 4, 0, 0, 6, 1, 24);
INSERT INTO `z_bidd_record` VALUES (71, '2022-03-09 11:37:46', '2022-03-09 11:37:46', 4, 0, 0, 6, 1, 24);
INSERT INTO `z_bidd_record` VALUES (72, '2022-03-09 11:37:48', '2022-03-09 11:37:48', 4, 0, 0, 6, 1, 24);
INSERT INTO `z_bidd_record` VALUES (73, '2022-03-09 11:37:51', '2022-03-09 11:37:51', 4, 0, 0, 6, 1, 24);
INSERT INTO `z_bidd_record` VALUES (74, '2022-03-09 11:37:55', '2022-03-09 11:37:55', 5, 0, 0, 6, 1, 24);
INSERT INTO `z_bidd_record` VALUES (75, '2022-03-09 16:52:46', '2022-03-09 16:52:46', 1, 0, 0, 5, 1, 24);
INSERT INTO `z_bidd_record` VALUES (76, '2022-03-09 16:52:52', '2022-03-09 16:52:52', 5, 0, 0, 5, 1, 24);
INSERT INTO `z_bidd_record` VALUES (77, '2022-03-14 15:34:52', '2022-03-14 15:34:52', 500, 0, 0, 1000, 1, 24);
INSERT INTO `z_bidd_record` VALUES (78, '2022-03-14 15:35:12', '2022-03-14 15:35:12', 520, 0, 0, 1234, 1, 24);
INSERT INTO `z_bidd_record` VALUES (79, '2022-03-24 22:15:41', '2022-03-24 22:15:41', 10, 0, 0, 5, 1, 25);
INSERT INTO `z_bidd_record` VALUES (80, '2022-03-24 22:16:27', '2022-03-24 22:16:27', 11, 0, 0, 5, 17, 25);

-- ----------------------------
-- Table structure for z_bidding_apply
-- ----------------------------
DROP TABLE IF EXISTS `z_bidding_apply`;
CREATE TABLE `z_bidding_apply`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `account_id` bigint(20) NULL DEFAULT NULL,
  `bidding_project_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKsiuowytk73u2mot7ph5sci5ri`(`account_id`) USING BTREE,
  INDEX `FKim5s61kd19a2hbj4clm4l75eo`(`bidding_project_id`) USING BTREE,
  CONSTRAINT `FKim5s61kd19a2hbj4clm4l75eo` FOREIGN KEY (`bidding_project_id`) REFERENCES `z_bidd_project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKsiuowytk73u2mot7ph5sci5ri` FOREIGN KEY (`account_id`) REFERENCES `z_account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of z_bidding_apply
-- ----------------------------
INSERT INTO `z_bidding_apply` VALUES (5, '2021-10-22 10:48:41', '2021-10-22 10:48:41', 1, 9);
INSERT INTO `z_bidding_apply` VALUES (6, '2021-10-22 15:05:07', '2021-10-22 15:05:07', 6, 10);
INSERT INTO `z_bidding_apply` VALUES (7, '2021-10-24 11:06:03', '2021-10-24 11:06:03', 1, 11);
INSERT INTO `z_bidding_apply` VALUES (8, '2021-10-24 11:17:29', '2021-10-24 11:17:29', 1, 12);
INSERT INTO `z_bidding_apply` VALUES (9, '2021-10-24 11:24:07', '2021-10-24 11:24:07', 4, 13);
INSERT INTO `z_bidding_apply` VALUES (10, '2021-10-24 11:30:16', '2021-10-24 11:30:16', 4, 14);
INSERT INTO `z_bidding_apply` VALUES (11, '2021-10-26 16:59:06', '2021-10-26 16:59:06', 1, 15);
INSERT INTO `z_bidding_apply` VALUES (12, '2021-10-26 17:01:01', '2021-10-26 17:01:01', 5, 15);
INSERT INTO `z_bidding_apply` VALUES (14, '2021-10-29 22:38:06', '2021-10-29 22:38:06', 11, 12);
INSERT INTO `z_bidding_apply` VALUES (15, '2021-11-22 11:25:29', '2021-11-22 11:25:29', 11, 15);
INSERT INTO `z_bidding_apply` VALUES (16, '2021-11-22 21:05:11', '2021-11-22 21:05:11', 1, 18);
INSERT INTO `z_bidding_apply` VALUES (17, '2021-11-22 21:05:29', '2021-11-22 21:05:29', 11, 18);
INSERT INTO `z_bidding_apply` VALUES (18, '2021-11-22 21:19:07', '2021-11-22 21:19:07', 1, 19);
INSERT INTO `z_bidding_apply` VALUES (19, '2021-11-22 21:19:31', '2021-11-22 21:19:31', 11, 19);
INSERT INTO `z_bidding_apply` VALUES (20, '2021-11-29 22:27:03', '2021-11-29 22:27:03', 5, 20);
INSERT INTO `z_bidding_apply` VALUES (21, '2021-11-29 22:31:53', '2021-11-29 22:31:53', 7, 20);
INSERT INTO `z_bidding_apply` VALUES (22, '2021-11-29 22:32:44', '2021-11-29 22:32:44', 14, 20);
INSERT INTO `z_bidding_apply` VALUES (23, '2021-11-29 22:40:42', '2021-11-29 22:40:42', 12, 20);
INSERT INTO `z_bidding_apply` VALUES (24, '2022-03-09 11:32:16', '2022-03-09 11:32:16', 1, 24);
INSERT INTO `z_bidding_apply` VALUES (25, '2022-03-09 11:36:19', '2022-03-09 11:36:19', 1, 23);
INSERT INTO `z_bidding_apply` VALUES (26, '2022-03-14 14:40:31', '2022-03-14 14:40:31', 15, 23);
INSERT INTO `z_bidding_apply` VALUES (27, '2022-03-14 14:48:37', '2022-03-14 14:48:37', 14, 23);
INSERT INTO `z_bidding_apply` VALUES (28, '2022-03-14 14:51:11', '2022-03-14 14:51:11', 12, 23);
INSERT INTO `z_bidding_apply` VALUES (29, '2022-03-24 22:06:09', '2022-03-24 22:06:09', 17, 25);
INSERT INTO `z_bidding_apply` VALUES (30, '2022-03-24 22:06:21', '2022-03-24 22:06:21', 1, 25);

-- ----------------------------
-- Table structure for z_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `z_evaluate`;
CREATE TABLE `z_evaluate`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `rate` int(11) NULL DEFAULT NULL,
  `reply` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `account_id` bigint(20) NULL DEFAULT NULL,
  `bidding_project_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKe7x5xn8mai360j2wwqmvg1ihc`(`account_id`) USING BTREE,
  INDEX `FK8qsis5kr39n7mt5qei3ki4p9w`(`bidding_project_id`) USING BTREE,
  CONSTRAINT `FK8qsis5kr39n7mt5qei3ki4p9w` FOREIGN KEY (`bidding_project_id`) REFERENCES `z_bidd_project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKe7x5xn8mai360j2wwqmvg1ihc` FOREIGN KEY (`account_id`) REFERENCES `z_account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of z_evaluate
-- ----------------------------
INSERT INTO `z_evaluate` VALUES (4, '2021-10-22 15:17:24', '2021-10-22 15:17:24', '1234', 5, NULL, 6, 10);
INSERT INTO `z_evaluate` VALUES (5, '2021-10-26 17:11:21', '2021-10-26 17:11:21', '1324', 5, '1234', 1, 15);
INSERT INTO `z_evaluate` VALUES (6, '2021-10-26 18:03:01', '2021-10-26 18:03:01', '1231', 5, '1256456', 1, 11);
INSERT INTO `z_evaluate` VALUES (8, '2021-10-29 22:41:55', '2021-10-29 22:41:55', '测试', 3, '', 11, 12);
INSERT INTO `z_evaluate` VALUES (9, '2021-11-30 12:11:44', '2021-11-30 12:11:44', '笔记本很好用外观朴实无华性能强劲', 5, NULL, 1, 11);
INSERT INTO `z_evaluate` VALUES (10, '2021-12-05 15:02:52', '2021-12-05 15:02:52', '', 5, NULL, 1, 15);
INSERT INTO `z_evaluate` VALUES (11, '2022-03-15 17:27:01', '2022-03-15 17:27:01', '用于商品评价功能测试20220315', 5, NULL, 1, 19);

-- ----------------------------
-- Table structure for z_menu
-- ----------------------------
DROP TABLE IF EXISTS `z_menu`;
CREATE TABLE `z_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  `is_bitton` bit(1) NOT NULL,
  `is_show` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKsbtnjocfrq29e8taxdwo21gic`(`parent_id`) USING BTREE,
  CONSTRAINT `FKsbtnjocfrq29e8taxdwo21gic` FOREIGN KEY (`parent_id`) REFERENCES `z_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of z_menu
-- ----------------------------
INSERT INTO `z_menu` VALUES (2, '2021-10-14 14:26:03', '2021-10-27 18:42:18', '管理员管理', '', 'mdi-settings', 0, NULL, b'0', b'1');
INSERT INTO `z_menu` VALUES (3, '2021-10-14 16:58:55', '2021-10-26 10:33:52', '菜单管理', '/admin/menu/list', 'mdi-view-list', 1, 2, b'0', b'1');
INSERT INTO `z_menu` VALUES (5, '2021-10-14 17:04:44', '2021-10-26 10:33:27', '新增', '/admin/menu/add', 'mdi-plus', 2, 3, b'0', b'1');
INSERT INTO `z_menu` VALUES (7, '2021-10-14 17:07:43', '2021-10-26 10:34:15', '角色管理', '/admin/role/list', 'mdi-account-settings-variant', 5, 2, b'0', b'1');
INSERT INTO `z_menu` VALUES (8, '2021-10-14 18:28:48', '2021-10-26 10:33:59', '编辑', 'edit(\'/admin/menu/edit\')', 'mdi-grease-pencil', 3, 3, b'1', b'1');
INSERT INTO `z_menu` VALUES (9, '2021-10-14 18:30:00', '2021-10-26 10:34:07', '删除', 'del(\'/admin/menu/delete\')', 'mdi-close', 4, 3, b'1', b'1');
INSERT INTO `z_menu` VALUES (10, '2021-10-14 12:12:00', '2021-10-26 10:34:25', '添加', '/admin/role/add', 'mdi-account-plus', 6, 7, b'0', b'1');
INSERT INTO `z_menu` VALUES (11, '2021-10-14 12:12:36', '2021-10-26 10:34:35', '编辑', 'edit(\'/admin/role/edit\')', 'mdi-account-edit', 7, 7, b'1', b'1');
INSERT INTO `z_menu` VALUES (12, '2021-10-14 12:13:19', '2021-10-26 10:34:45', '删除', 'del(\'/admin/role/delete\')', 'mdi-account-remove', 8, 7, b'1', b'1');
INSERT INTO `z_menu` VALUES (13, '2021-10-14 12:14:52', '2021-10-26 10:34:54', '用户管理', '/admin/user/list', 'mdi-account-multiple', 9, 2, b'0', b'1');
INSERT INTO `z_menu` VALUES (14, '2021-10-14 12:15:22', '2021-10-26 10:35:01', '添加', '/admin/user/add', 'mdi-account-plus', 10, 13, b'0', b'1');
INSERT INTO `z_menu` VALUES (15, '2021-10-14 17:18:14', '2021-10-26 10:35:10', '编辑', 'edit(\'/admin/user/edit\')', 'mdi-account-edit', 11, 13, b'1', b'1');
INSERT INTO `z_menu` VALUES (16, '2021-10-14 17:19:01', '2021-10-26 10:35:19', '删除', 'del(\'/admin/user/delete\')', 'mdi-account-remove', 12, 13, b'1', b'1');
INSERT INTO `z_menu` VALUES (19, '2021-10-14 11:24:36', '2021-10-26 11:26:00', '上传图片', '/upload/upload_photo', 'mdi-arrow-up-bold-circle', 0, 13, b'0', b'0');
INSERT INTO `z_menu` VALUES (20, '2021-10-14 14:09:35', '2021-10-20 14:09:47', '操作管理', '/system/operator_log_list', 'mdi-tag-multiple', 13, 2, b'0', b'1');
INSERT INTO `z_menu` VALUES (21, '2021-10-14 14:11:39', '2021-10-20 14:11:39', '删除', 'del(\'/system/delete_operator_log\')', 'mdi-tag-remove', 14, 20, b'1', b'1');
INSERT INTO `z_menu` VALUES (22, '2021-10-21 14:12:57', '2021-10-20 14:46:55', '清空操作', 'delAll(\'/system/delete_all_operator_log\')', 'mdi-delete-circle', 15, 20, b'1', b'1');
INSERT INTO `z_menu` VALUES (23, '2021-10-15 14:46:40', '2021-10-20 14:47:09', '数据备份', '/admin/database_bak/list', 'mdi-database', 16, 2, b'0', b'1');
INSERT INTO `z_menu` VALUES (24, '2021-10-15 14:48:07', '2021-10-19 15:13:41', '备份', 'add(\'/admin/database_bak/add\')', 'mdi-database-plus', 17, 23, b'1', b'1');
INSERT INTO `z_menu` VALUES (25, '2021-10-15 14:49:03', '2021-10-20 14:49:03', '删除', 'del(\'/admin/database_bak/delete\')', 'mdi-database-minus', 18, 23, b'1', b'1');
INSERT INTO `z_menu` VALUES (26, '2021-10-15 19:36:20', '2021-10-21 19:36:20', '还原', 'restore(\'/admin/database_bak/restore\')', 'mdi-database-minus', 19, 23, b'1', b'1');
INSERT INTO `z_menu` VALUES (27, '2021-10-15 09:21:24', '2021-10-20 09:21:32', '竞拍管理', '', 'mdi-blender', 20, NULL, b'0', b'1');
INSERT INTO `z_menu` VALUES (28, '2021-10-15 09:22:48', '2021-10-20 09:38:35', '前台用户管理', '/admin/account/list', 'mdi-account', 21, 27, b'0', b'1');
INSERT INTO `z_menu` VALUES (29, '2021-10-15 09:23:55', '2021-10-21 09:38:43', '添加', '/admin/account/add', 'mdi-plus', 22, 28, b'0', b'1');
INSERT INTO `z_menu` VALUES (30, '2021-10-15 09:24:55', '2021-10-21 09:38:51', '编辑', 'edit(\'/admin/account/edit\')', 'mdi-minus', 23, 28, b'1', b'1');
INSERT INTO `z_menu` VALUES (31, '2021-10-15 09:26:57', '2021-10-21 09:38:58', '删除', 'del(\'/admin/account/delete\')', 'mdi-close', 24, 28, b'1', b'1');
INSERT INTO `z_menu` VALUES (32, '2021-10-15 16:21:58', '2021-10-21 10:26:54', '商品列表', '/admin/project/list', 'mdi-lightbulb', 25, 27, b'0', b'1');
INSERT INTO `z_menu` VALUES (33, '2021-10-15 16:22:19', '2021-10-21 10:27:01', '添加', '/admin/project/add', 'mdi-plus', 26, 32, b'0', b'1');
INSERT INTO `z_menu` VALUES (34, '2021-10-15 16:22:54', '2021-10-21 10:27:09', '编辑', 'edit(\'/admin/project/edit\')', 'mdi-minus', 27, 32, b'1', b'1');
INSERT INTO `z_menu` VALUES (35, '2021-10-16 16:23:47', '2021-10-21 10:27:18', '删除', 'del(\'/admin/project/delete\')', 'mdi-close', 28, 32, b'1', b'1');
INSERT INTO `z_menu` VALUES (36, '2021-10-16 18:46:57', '2021-03-30 10:25:35', '商品分类', '/admin/project_category/list', 'mdi-credit-card-multiple', 29, 27, b'0', b'1');
INSERT INTO `z_menu` VALUES (37, '2021-10-16 18:48:01', '2021-10-21 18:48:10', '添加', '/admin/project_category/add', 'mdi-plus', 30, 36, b'0', b'1');
INSERT INTO `z_menu` VALUES (38, '2021-10-16 18:48:45', '2021-10-21 18:48:45', '编辑', 'edit(\'/admin/project_category/edit\')', 'mdi-minus', 31, 36, b'1', b'1');
INSERT INTO `z_menu` VALUES (39, '2021-10-16 18:49:22', '2021-10-21 18:49:29', '删除', 'del(\'/admin/project_category/delete\')', 'mdi-close', 32, 36, b'1', b'1');
INSERT INTO `z_menu` VALUES (40, '2021-10-16 16:45:29', '2021-10-21 17:08:00', '拍卖者列表', '/admin/organization/list', 'mdi-human-greeting', 33, 27, b'0', b'1');
INSERT INTO `z_menu` VALUES (41, '2021-10-16 16:47:24', '2021-10-22 17:20:25', '更改状态', '/admin/organization/examine', 'mdi-clock-out', 34, 40, b'0', b'0');
INSERT INTO `z_menu` VALUES (42, '2021-10-16 09:45:51', '2021-10-22 09:45:51', '个人信息', '/admin/organization/info', 'mdi-account-box-outline', 36, 27, b'0', b'0');
INSERT INTO `z_menu` VALUES (43, '2021-10-16 11:36:04', '2021-10-22 11:36:19', '查看详情', 'viewProject(\'/admin/project/project_detail\')', 'mdi-message-text', 37, 32, b'1', b'1');
INSERT INTO `z_menu` VALUES (44, '2021-10-16 14:38:46', '2021-10-23 14:38:57', '通过', 'approved(\'/admin/project/examine?type=true\')', 'mdi-check', 38, 32, b'1', b'1');
INSERT INTO `z_menu` VALUES (45, '2021-10-16 14:39:48', '2021-10-22 14:39:48', '拒绝', 'approved(\'/admin/project/examine?type=false\')', 'mdi-window-close', 39, 32, b'1', b'1');
INSERT INTO `z_menu` VALUES (46, '2021-10-16 15:44:37', '2021-10-23 15:44:45', '上下架', '/admin/project/load_and_unload', 'mdi-cursor-pointer', 40, 32, b'0', b'0');
INSERT INTO `z_menu` VALUES (47, '2021-10-16 16:18:00', '2021-10-23 16:18:13', '忘记密码', '/admin/organization/forget_password', 'mdi-exclamation', 41, 40, b'0', b'0');
INSERT INTO `z_menu` VALUES (48, '2021-10-16 11:43:57', '2021-10-23 11:44:10', '商品竞价列表', '/admin/bidding_record/list', 'mdi-grid', 42, 27, b'0', b'1');
INSERT INTO `z_menu` VALUES (49, '2021-10-16 14:17:49', '2021-10-22 14:19:42', '商品竞价记录列表', '/admin/bidding_record/record_list', 'mdi-tab', 43, 48, b'1', b'0');
INSERT INTO `z_menu` VALUES (50, '2021-10-16 14:55:41', '2021-10-22 14:55:41', '确认交易', '/admin/bidding_record/transaction', 'mdi-check', 44, 48, b'0', b'0');
INSERT INTO `z_menu` VALUES (51, '2021-10-16 18:48:06', '2021-10-22 18:48:06', '确认逾期', '/admin/bidding_record/overdue', 'mdi-eraser-variant', 46, 48, b'0', b'0');
INSERT INTO `z_menu` VALUES (52, '2021-10-16 18:36:25', '2021-10-20 18:49:53', '查看评论', 'viewRaty(\'/admin/project/view_raty\')', 'mdi-gesture-tap', 47, 32, b'1', b'1');

-- ----------------------------
-- Table structure for z_organization
-- ----------------------------
DROP TABLE IF EXISTS `z_organization`;
CREATE TABLE `z_organization`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `audit_status` int(11) NULL DEFAULT NULL,
  `balance` decimal(19, 2) NULL DEFAULT NULL,
  `card_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `head_pic` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `legal_person` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `not_pass_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` int(11) NULL DEFAULT NULL,
  `trading_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_id` bigint(20) NULL DEFAULT NULL,
  `address` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rate` double(3, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_qsd18kti2br1mln4am3bhml92`(`name`) USING BTREE,
  INDEX `FK4jtwnf0ays4f3vu5a10t56ndb`(`role_id`) USING BTREE,
  CONSTRAINT `FK4jtwnf0ays4f3vu5a10t56ndb` FOREIGN KEY (`role_id`) REFERENCES `z_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of z_organization
-- ----------------------------
INSERT INTO `z_organization` VALUES (1, '2021-10-19 16:20:41', '2021-11-30 12:11:44', 3, 0.00, '20211021/1634816175041.jpg;20211021/1634816177252.jpg', '115432031@qq.com', '20211021/1634824920006.jpg', 'demo1021', '13076367992', '123456987', '', '1234', 1, '20211021/1634816170619.jpg', 5, '比邻星', 5);
INSERT INTO `z_organization` VALUES (2, '2021-10-19 19:36:40', '2021-12-05 15:02:52', 3, 0.00, '20211021/1634816175041.jpg;20211021/1634816177252.jpg', '2726868707@qq.com', '20211021/1634824920006.jpg', '1234', '13076367993', '181530453', NULL, '1234', 2, '20211021/1634816170619.jpg', 5, '123465', 5);
INSERT INTO `z_organization` VALUES (3, '2021-10-19 15:01:33', '2021-10-22 15:17:24', 3, 0.00, '20211021/1634816175041.jpg;20211021/1634816177252.jpg', '2726878707@qq.com', '20211021/1634824920006.jpg', '1234', '13076367999', '181530454', '', '1234', 0, '20211021/1634816170619.jpg', 5, '1234', 100);
INSERT INTO `z_organization` VALUES (4, '2021-10-19 10:42:57', '2021-10-25 09:55:02', 3, 0.00, '20211021/1634816175041.jpg;20211021/1634816177252.jpg', '2716868707@qq.com', '20211021/1634824920006.jpg', '123456', '13076367995', '181530455', '', '1234', 0, '20211021/1634816170619.jpg', 5, '123456', 100);
INSERT INTO `z_organization` VALUES (5, '2021-10-26 19:22:27', '2021-11-18 20:53:10', 3, 0.00, '20211021/1634816175041.jpg;20211021/1634816177252.jpg', '2526868707@qq.com', '20211021/1634824920006.jpg', 'zhangsan', '13076367966', '181530456', '', '1234', 1, '20211021/1634816170619.jpg', 5, 'pdsu栋10', 100);
INSERT INTO `z_organization` VALUES (6, '2021-10-28 18:41:29', '2021-10-29 22:07:34', 3, 0.00, '20211021/1634816175041.jpg;20211021/1634816177252.jpg', '2226868707@qq.com', '20211021/1634824920006.jpg', '123156', '13076567992', '181530457', '', '1234', 0, '20211021/1634816170619.jpg', 5, '1234564', 100);
INSERT INTO `z_organization` VALUES (7, '2021-10-28 18:46:18', '2021-10-29 22:21:36', 3, 0.00, '20211021/1634816175041.jpg;20211021/1634816177252.jpg', '1457568944@qq.com', '20211021/1634824920006.jpg', '215156416', '14876367992', '181530458', '', '1234', 0, '20211021/1634816170619.jpg', 5, '655465', 100);
INSERT INTO `z_organization` VALUES (8, '2021-10-28 18:59:22', '2021-10-29 22:21:40', 3, 0.00, '20211021/1634816175041.jpg;20211021/1634816177252.jpg', '2626868707@qq.com', '20211021/1634824920006.jpg', '张三', '15076367992', '181530459', '', '1234', 0, '20211021/1634816170619.jpg', 5, '平院东区操场入口处', 100);
INSERT INTO `z_organization` VALUES (9, '2021-10-28 22:27:28', '2021-10-29 22:21:37', 3, 0.00, '20211021/1634816175041.jpg;20211021/1634816177252.jpg', '2861343528@qq.com', '20211021/1634824920006.jpg', '1565156', '18337556034', '181530451', '', '1234', 0, '20211021/1634816170619.jpg', 5, '165165156', 100);
INSERT INTO `z_organization` VALUES (10, '2021-10-29 21:51:41', '2021-10-29 22:05:40', 3, 0.00, '20211029/1635515432928.jpg;20211029/1635515437429.jpg', '2726888707@qq.com', NULL, '张三', '13476367992', '181520451', '', '1234', 0, '20211029/1635515398320.jpg', 5, '平院东区', NULL);
INSERT INTO `z_organization` VALUES (11, '2021-10-29 22:44:16', '2021-11-25 22:04:35', 3, 0.00, '20211029/1635518618904.jpg;20211029/1635518621616.jpg', '3726868707@qq.com', NULL, '张思', '14076367992', '181530351', '', '1234', 0, '20211029/1635518615263.jpg', 5, '平院测试地址', NULL);
INSERT INTO `z_organization` VALUES (12, '2021-11-23 16:24:24', '2021-11-30 17:37:08', 3, 0.00, '20211123/1637656095622.jpg;20211123/1637656101500.jpg', '4726868707@qq.com', '', '张三', '13076367990', '181530101', '', '1234', 1, '20211123/1637655805753.jpeg', 5, '平院操场', NULL);
INSERT INTO `z_organization` VALUES (13, '2021-12-04 21:58:27', '2021-12-04 22:04:33', 3, 0.00, '20211204/1638626266634.jpg;20211204/1638626271379.jpg', '1526868707@qq.com', NULL, '李四', '17076367992', '191530451', '', '1234', 0, '20211204/1638626261453.jpeg', 5, '平顶山学院', NULL);
INSERT INTO `z_organization` VALUES (14, '2021-12-05 14:27:47', '2022-03-14 09:15:29', 2, 0.00, '20211205/1638685623707.jpg;20211205/1638685626100.jpeg', '2661343528@qq.com', '', '王五', '13075367996', '987654321', '用于拒绝审核测试', '1234', 0, '20211205/1638685618047.jpeg', 5, '平顶山学院', NULL);
INSERT INTO `z_organization` VALUES (15, '2022-03-24 22:01:22', '2022-03-24 22:01:50', 3, 0.00, '20220324/1648130434954.jpg;20220324/1648130437277.jpg', '4726868507@qq.com', NULL, '张三四五', '13176367992', '123456789', '', '1234', 0, '20220324/1648130431325.jpg', 5, '平顶山学院999号楼', NULL);

-- ----------------------------
-- Table structure for z_project_category
-- ----------------------------
DROP TABLE IF EXISTS `z_project_category`;
CREATE TABLE `z_project_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of z_project_category
-- ----------------------------
INSERT INTO `z_project_category` VALUES (1, '2021-10-17 11:28:34', '2021-11-25 21:00:21', '笔记本', 0);
INSERT INTO `z_project_category` VALUES (2, '2021-10-17 11:30:24', '2021-10-22 10:35:01', '显示器', 0);
INSERT INTO `z_project_category` VALUES (3, '2021-10-17 11:30:34', '2021-11-30 17:33:45', '显卡分类', 0);
INSERT INTO `z_project_category` VALUES (4, '2021-10-17 11:30:46', '2021-10-19 11:30:46', '日用品', 0);
INSERT INTO `z_project_category` VALUES (5, '2021-10-24 21:13:56', '2021-10-24 21:13:56', '其他', 0);
INSERT INTO `z_project_category` VALUES (6, '2022-03-14 09:53:01', '2022-03-14 09:53:01', '用于添加测试的分类名称', 0);

-- ----------------------------
-- Table structure for z_recharge_record
-- ----------------------------
DROP TABLE IF EXISTS `z_recharge_record`;
CREATE TABLE `z_recharge_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `money` int(11) NULL DEFAULT NULL,
  `account_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKo495iix2cwreutrbfctkgvja4`(`account_id`) USING BTREE,
  CONSTRAINT `FKo495iix2cwreutrbfctkgvja4` FOREIGN KEY (`account_id`) REFERENCES `z_account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of z_recharge_record
-- ----------------------------
INSERT INTO `z_recharge_record` VALUES (9, '2021-10-20 11:07:06', '2021-10-20 11:07:06', 100, 1);
INSERT INTO `z_recharge_record` VALUES (10, '2021-10-22 10:28:41', '2021-10-22 10:28:41', 100, 1);
INSERT INTO `z_recharge_record` VALUES (11, '2021-10-22 10:28:43', '2021-10-22 10:28:43', 100, 1);
INSERT INTO `z_recharge_record` VALUES (12, '2021-10-22 10:28:44', '2021-10-22 10:28:44', 100, 1);
INSERT INTO `z_recharge_record` VALUES (13, '2021-10-22 10:28:47', '2021-10-22 10:28:47', 100, 1);
INSERT INTO `z_recharge_record` VALUES (14, '2021-10-22 10:28:50', '2021-10-22 10:28:50', 100, 1);
INSERT INTO `z_recharge_record` VALUES (15, '2021-10-22 10:28:52', '2021-10-22 10:28:52', 100, 1);
INSERT INTO `z_recharge_record` VALUES (16, '2021-10-22 10:28:55', '2021-10-22 10:28:55', 100, 1);
INSERT INTO `z_recharge_record` VALUES (17, '2021-10-22 10:29:01', '2021-10-22 10:29:01', 100, 1);
INSERT INTO `z_recharge_record` VALUES (18, '2021-10-22 10:29:03', '2021-10-22 10:29:03', 100, 1);
INSERT INTO `z_recharge_record` VALUES (19, '2021-10-22 10:29:04', '2021-10-22 10:29:04', 100, 1);
INSERT INTO `z_recharge_record` VALUES (20, '2021-10-22 10:29:05', '2021-10-22 10:29:05', 100, 1);
INSERT INTO `z_recharge_record` VALUES (21, '2021-10-22 10:29:07', '2021-10-22 10:29:07', 100, 1);
INSERT INTO `z_recharge_record` VALUES (22, '2021-10-22 10:29:08', '2021-10-22 10:29:08', 100, 1);
INSERT INTO `z_recharge_record` VALUES (23, '2021-10-22 10:29:20', '2021-10-22 10:29:20', 100, 1);
INSERT INTO `z_recharge_record` VALUES (24, '2021-10-22 15:11:24', '2021-10-22 15:11:24', 9999, 6);
INSERT INTO `z_recharge_record` VALUES (25, '2021-10-24 10:41:59', '2021-10-24 10:41:59', 100, 1);
INSERT INTO `z_recharge_record` VALUES (26, '2021-10-26 17:10:57', '2021-10-26 17:10:57', 999999, 1);
INSERT INTO `z_recharge_record` VALUES (27, '2021-10-27 11:29:21', '2021-10-27 11:29:21', 100, 1);
INSERT INTO `z_recharge_record` VALUES (28, '2021-10-27 11:29:24', '2021-10-27 11:29:24', 100, 1);
INSERT INTO `z_recharge_record` VALUES (29, '2021-10-27 11:29:50', '2021-10-27 11:29:50', 100, 1);
INSERT INTO `z_recharge_record` VALUES (30, '2021-10-27 11:29:54', '2021-10-27 11:29:54', 15316, 1);
INSERT INTO `z_recharge_record` VALUES (31, '2021-10-29 11:20:23', '2021-10-29 11:20:23', 2232, 9);
INSERT INTO `z_recharge_record` VALUES (32, '2021-10-29 22:41:44', '2021-10-29 22:41:44', 5000, 11);
INSERT INTO `z_recharge_record` VALUES (33, '2021-10-30 11:01:14', '2021-10-30 11:01:14', 10020, 1);
INSERT INTO `z_recharge_record` VALUES (34, '2021-10-30 11:01:23', '2021-10-30 11:01:23', 100, 1);
INSERT INTO `z_recharge_record` VALUES (35, '2021-10-30 11:01:25', '2021-10-30 11:01:25', 100, 1);
INSERT INTO `z_recharge_record` VALUES (36, '2021-10-30 11:01:35', '2021-10-30 11:01:35', 100, 1);
INSERT INTO `z_recharge_record` VALUES (37, '2021-10-30 11:01:36', '2021-10-30 11:01:36', 100, 1);
INSERT INTO `z_recharge_record` VALUES (38, '2021-10-30 11:01:38', '2021-10-30 11:01:38', 100, 1);
INSERT INTO `z_recharge_record` VALUES (39, '2021-10-30 11:04:53', '2021-10-30 11:04:53', 100, 1);
INSERT INTO `z_recharge_record` VALUES (40, '2021-10-30 11:04:59', '2021-10-30 11:04:59', 986, 1);
INSERT INTO `z_recharge_record` VALUES (41, '2021-10-30 11:05:05', '2021-10-30 11:05:05', 100032, 1);
INSERT INTO `z_recharge_record` VALUES (42, '2021-10-30 11:05:10', '2021-10-30 11:05:10', 15123, 1);
INSERT INTO `z_recharge_record` VALUES (43, '2021-10-30 11:05:17', '2021-10-30 11:05:17', 1551, 1);
INSERT INTO `z_recharge_record` VALUES (44, '2021-11-23 11:13:53', '2021-11-23 11:13:53', 935, 1);

-- ----------------------------
-- Table structure for z_role
-- ----------------------------
DROP TABLE IF EXISTS `z_role`;
CREATE TABLE `z_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of z_role
-- ----------------------------
INSERT INTO `z_role` VALUES (1, '2020-10-15 13:16:38', '2021-10-27 18:43:33', '超级管理员', '超级管理员主要进行账号审核管理。', 1);
INSERT INTO `z_role` VALUES (4, '2021-10-15 20:11:00', '2021-10-26 18:52:40', '测试功能', '用于测试功能', 0);
INSERT INTO `z_role` VALUES (5, '2021-10-15 15:58:43', '2021-10-26 18:52:23', '拍卖者', '拍卖者可发布物品信息以及确认交易对象', 1);

-- ----------------------------
-- Table structure for z_role_authorities
-- ----------------------------
DROP TABLE IF EXISTS `z_role_authorities`;
CREATE TABLE `z_role_authorities`  (
  `role_id` bigint(20) NOT NULL,
  `authorities_id` bigint(20) NOT NULL,
  INDEX `FKhj7ap1o1cjrl7enr9arf5f2qp`(`authorities_id`) USING BTREE,
  INDEX `FKg3xdaexmr0x1qx8omhvjtk46d`(`role_id`) USING BTREE,
  CONSTRAINT `FKg3xdaexmr0x1qx8omhvjtk46d` FOREIGN KEY (`role_id`) REFERENCES `z_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKhj7ap1o1cjrl7enr9arf5f2qp` FOREIGN KEY (`authorities_id`) REFERENCES `z_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of z_role_authorities
-- ----------------------------
INSERT INTO `z_role_authorities` VALUES (5, 27);
INSERT INTO `z_role_authorities` VALUES (5, 32);
INSERT INTO `z_role_authorities` VALUES (5, 33);
INSERT INTO `z_role_authorities` VALUES (5, 34);
INSERT INTO `z_role_authorities` VALUES (5, 35);
INSERT INTO `z_role_authorities` VALUES (5, 46);
INSERT INTO `z_role_authorities` VALUES (5, 52);
INSERT INTO `z_role_authorities` VALUES (5, 42);
INSERT INTO `z_role_authorities` VALUES (5, 48);
INSERT INTO `z_role_authorities` VALUES (5, 49);
INSERT INTO `z_role_authorities` VALUES (5, 50);
INSERT INTO `z_role_authorities` VALUES (5, 51);
INSERT INTO `z_role_authorities` VALUES (4, 2);
INSERT INTO `z_role_authorities` VALUES (4, 13);
INSERT INTO `z_role_authorities` VALUES (4, 15);
INSERT INTO `z_role_authorities` VALUES (1, 2);
INSERT INTO `z_role_authorities` VALUES (1, 13);
INSERT INTO `z_role_authorities` VALUES (1, 14);
INSERT INTO `z_role_authorities` VALUES (1, 15);
INSERT INTO `z_role_authorities` VALUES (1, 16);
INSERT INTO `z_role_authorities` VALUES (1, 19);
INSERT INTO `z_role_authorities` VALUES (1, 27);
INSERT INTO `z_role_authorities` VALUES (1, 28);
INSERT INTO `z_role_authorities` VALUES (1, 29);
INSERT INTO `z_role_authorities` VALUES (1, 30);
INSERT INTO `z_role_authorities` VALUES (1, 31);
INSERT INTO `z_role_authorities` VALUES (1, 32);
INSERT INTO `z_role_authorities` VALUES (1, 43);
INSERT INTO `z_role_authorities` VALUES (1, 44);
INSERT INTO `z_role_authorities` VALUES (1, 45);
INSERT INTO `z_role_authorities` VALUES (1, 46);
INSERT INTO `z_role_authorities` VALUES (1, 36);
INSERT INTO `z_role_authorities` VALUES (1, 37);
INSERT INTO `z_role_authorities` VALUES (1, 38);
INSERT INTO `z_role_authorities` VALUES (1, 39);
INSERT INTO `z_role_authorities` VALUES (1, 40);
INSERT INTO `z_role_authorities` VALUES (1, 41);
INSERT INTO `z_role_authorities` VALUES (1, 47);

-- ----------------------------
-- Table structure for z_user
-- ----------------------------
DROP TABLE IF EXISTS `z_user`;
CREATE TABLE `z_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `head_pic` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `username` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_btsosjytrl4hu7fnm1intcpo8`(`username`) USING BTREE,
  INDEX `FKg09b8o67eu61st68rv6nk8npj`(`role_id`) USING BTREE,
  CONSTRAINT `FKg09b8o67eu61st68rv6nk8npj` FOREIGN KEY (`role_id`) REFERENCES `z_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of z_user
-- ----------------------------
INSERT INTO `z_user` VALUES (6, '2021-10-15 10:45:28', '2021-12-05 13:47:36', '2820859603@qq.com', '', '18337556099', '1523', 2, 1, 'root', 1);
INSERT INTO `z_user` VALUES (7, '2021-10-15 17:34:00', '2021-10-29 21:59:09', '2720868707@qq.com', '20211029/1635515946516.jpg', '13076367996', '1234', 1, 1, '1234', 1);
INSERT INTO `z_user` VALUES (8, '2021-10-27 21:14:48', '2021-10-27 21:14:59', '2726868707@qq.com', '', '13076367992', '1027', 1, 0, '1027', 1);
INSERT INTO `z_user` VALUES (9, '2021-10-27 21:15:32', '2021-10-29 21:53:14', '2726868707@qq.com', '20211029/1635515591564.jpg', '13076367992', '1028', 2, 1, '1028', 1);
INSERT INTO `z_user` VALUES (11, '2021-10-27 21:21:10', '2021-10-27 21:21:10', '123456787@qq.com', '', '13076367942', '1029', 1, 1, '1029', 1);
INSERT INTO `z_user` VALUES (12, '2021-11-24 21:19:04', '2021-11-24 21:19:04', '', '', '', '15616', 1, 1, '416546', 1);
INSERT INTO `z_user` VALUES (13, '2021-11-30 16:35:15', '2021-11-30 16:35:15', '1012627875@qq.com', '', '18765367942', '1234', 1, 1, '管理员添加测试用户', 1);

SET FOREIGN_KEY_CHECKS = 1;
