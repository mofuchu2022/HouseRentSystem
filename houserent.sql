/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : houserent

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 20/03/2022 17:03:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_feedback
-- ----------------------------
DROP TABLE IF EXISTS `t_feedback`;
CREATE TABLE `t_feedback`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '反馈标题',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '反馈内容',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `status` int(1) NULL DEFAULT NULL COMMENT '处理状态:0待处理，1已处理',
  `reply` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复内容',
  `contact_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `contact_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '反馈表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for t_house
-- ----------------------------
DROP TABLE IF EXISTS `t_house`;
CREATE TABLE `t_house`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '房东用户id',
  `rent_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出租类型:整租whole/合租share',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋名称',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详细描述内容',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市名称',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址、具体到门牌号',
  `thumbnail_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图Url',
  `slide_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '轮播图URL',
  `month_rent` int(11) NULL DEFAULT NULL COMMENT '月租金额',
  `status` int(1) NULL DEFAULT NULL COMMENT '状态：0未租出，1已租出，-1已下架 -2待审核 -3审核不通过',
  `certificate_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房产证号',
  `toliet_num` int(2) NULL DEFAULT NULL COMMENT '卫生间数量',
  `kitchen_num` int(2) NULL DEFAULT NULL COMMENT '厨房数量',
  `living_room_num` int(2) NULL DEFAULT NULL COMMENT '客厅数量',
  `bedroom_num` int(2) NULL DEFAULT NULL COMMENT '卧室数量',
  `has_air_conditioner` int(2) NULL DEFAULT NULL COMMENT '是否有空调，1有，0无',
  `area` decimal(10, 2) NULL DEFAULT NULL COMMENT '面积',
  `floor` int(3) NULL DEFAULT NULL COMMENT '当前所在楼层数',
  `max_floor` int(3) NULL DEFAULT NULL COMMENT '房子最大楼层数',
  `has_elevator` int(1) NULL DEFAULT NULL COMMENT '是否有电梯，1有 0无',
  `build_year` int(4) NULL DEFAULT NULL COMMENT '建成年份',
  `direction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '朝向',
  `last_order_start_time` datetime NULL DEFAULT NULL COMMENT '上次入住时间',
  `last_order_end_time` datetime NULL DEFAULT NULL COMMENT '上次结束入住时间',
  `longitude_latitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经纬度',
  `contact_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `contact_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人手机',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '房屋表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_house
-- ----------------------------

-- ----------------------------
-- Table structure for t_mark
-- ----------------------------
DROP TABLE IF EXISTS `t_mark`;
CREATE TABLE `t_mark`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `create_time` datetime NULL DEFAULT NULL COMMENT '收藏时间',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `house_id` bigint(20) NULL DEFAULT NULL COMMENT '房子id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_mark
-- ----------------------------

-- ----------------------------
-- Table structure for t_news
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `summary` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '摘要',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新闻表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_news
-- ----------------------------

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` int(11) NOT NULL COMMENT '主键',
  `create-time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `customer_id` bigint(20) NULL DEFAULT NULL COMMENT '租客用户id',
  `owner_user_id` bigint(20) NULL DEFAULT NULL COMMENT '房东用户id',
  `house_id` bigint(20) NULL DEFAULT NULL COMMENT '房子id',
  `status` int(1) NULL DEFAULT NULL COMMENT '订单状态:-3租客已取消。-2待签合同，-1待付款，0生效中，1已到期',
  `month_rent` int(11) NULL DEFAULT NULL COMMENT '月租金',
  `day_num` int(11) NULL DEFAULT NULL COMMENT '租住天数',
  `total_amount` int(11) NULL DEFAULT NULL COMMENT '总金额',
  `start_date` datetime NULL DEFAULT NULL COMMENT '开始日期',
  `end_date` datetime NULL DEFAULT NULL COMMENT '结束日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` datetime NULL DEFAULT NULL COMMENT '注册时间',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名/账号',
  `user_display_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `user_pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `id_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `user_avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `user_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人描述',
  `status` int(1) NULL DEFAULT NULL COMMENT '1正常 0禁用',
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色，管理员admin、房东owner、租客customer',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `hobby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业余爱好',
  `job` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
