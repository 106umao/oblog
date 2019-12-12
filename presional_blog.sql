/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : presional_blog

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 13/12/2019 03:55:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog_article
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article`  (
  `article_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `star` int(11) NOT NULL COMMENT '点赞',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `release_time` datetime(0) NOT NULL COMMENT '发布时间',
  `last_modified` datetime(0) NOT NULL COMMENT '最后修改时间',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '封面',
  `is_delete` int(11) NOT NULL COMMENT '是否被删除。1为删除 0为未删除 默认为未删除',
  PRIMARY KEY (`article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_article
-- ----------------------------
INSERT INTO `blog_article` VALUES (1, 1, 1, 0, '搭建个人博客过程记录', '#### Example\r\n```javascript\r\n{\r\n    onscroll : function(event) {\r\n        console.clear();\r\n        console.log(\"onscroll =>\", this, this.id, this.settings, event);\r\n    },\r\n\r\n    onpreviewscroll : function(event) {\r\n        console.clear();\r\n        console.log(\"onpreviewscroll =>\", this, this.id, this.settings, event);\r\n    },\r\n\r\n    onload : function() {\r\n        this.off(\"previewscroll\"); // unbind before handle\r\n\r\n        // Override settings.onpreviewscroll\r\n        this.on(\"previewscroll\", function(){\r\n            console.clear();\r\n            console.log(\"on() => Override settings.onpreviewscroll =>\", this, this.id, event, (new Date).getTime());\r\n        });\r\n\r\n        // defined event bind\r\n        this.on(\"resize\", function(){\r\n            console.clear();\r\n            console.log(\"onresize =>\", this, this.id, event, (new Date).getTime());\r\n        });\r\n    }\r\n}\r\n\r\n// Or\r\neditor.on(\"resize\", function(){\r\n    // ...\r\n});\r\n\r\neditor.off(\"resize\");\r\n```\r\n###jsp 作业', '2019-12-11 19:30:44', '2019-12-11 19:30:51', 'default.jpg', 0);

-- ----------------------------
-- Table structure for blog_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category`  (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章类别id',
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类别名称',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_category
-- ----------------------------
INSERT INTO `blog_category` VALUES (1, '编程');

-- ----------------------------
-- Table structure for blog_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment`;
CREATE TABLE `blog_comment`  (
  `comment_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `article_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章id',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复人',
  `reply_msg` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复内容',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `zan_count` int(11) NOT NULL COMMENT '赞数',
  `is_delete` int(11) NOT NULL COMMENT '是否被删除',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blog_reply
-- ----------------------------
DROP TABLE IF EXISTS `blog_reply`;
CREATE TABLE `blog_reply`  (
  `reply_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comment_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论Id',
  `from_user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复人',
  `to_user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复对象',
  `reply_msg` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复内容',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `is_delete` int(255) NOT NULL COMMENT '是否被删除',
  PRIMARY KEY (`reply_id`) USING BTREE,
  INDEX `reply_fk1`(`comment_id`) USING BTREE,
  CONSTRAINT `reply_fk1` FOREIGN KEY (`comment_id`) REFERENCES `blog_comment` (`comment_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '回复表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blog_user
-- ----------------------------
DROP TABLE IF EXISTS `blog_user`;
CREATE TABLE `blog_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `role` int(11) NOT NULL COMMENT '用户权限1管理员 0是用户',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像',
  `about` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '个人描述',
  `emai` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `is_delete` int(11) NOT NULL COMMENT '是否删除',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_user
-- ----------------------------
INSERT INTO `blog_user` VALUES (1, 'ckx', '123', 1, 'default.jpeg', '博主，大二软件工程学生', '578961953@qq.com', 0);

SET FOREIGN_KEY_CHECKS = 1;
