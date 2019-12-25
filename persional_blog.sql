/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : persional_blog

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 26/12/2019 00:57:01
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
  `Introduction` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章简介',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `release_time` datetime(0) NOT NULL COMMENT '发布时间',
  `last_modified` datetime(0) NOT NULL COMMENT '最后修改时间',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '封面',
  `is_delete` int(11) NOT NULL COMMENT '是否被删除。1为删除 0为未删除 默认为未删除',
  PRIMARY KEY (`article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_article
-- ----------------------------
INSERT INTO `blog_article` VALUES (1, 1, 1, 8, '搭建个人博客过程记录', '123', '#### Example\r\n```javascript\r\n{\r\n    onscroll : function(event) {\r\n        console.clear();\r\n        console.log(\"onscroll =>\", this, this.id, this.settings, event);\r\n    },\r\n\r\n    onpreviewscroll : function(event) {\r\n        console.clear();\r\n        console.log(\"onpreviewscroll =>\", this, this.id, this.settings, event);\r\n    },\r\n\r\n    onload : function() {\r\n        this.off(\"previewscroll\"); // unbind before handle\r\n\r\n        // Override settings.onpreviewscroll\r\n        this.on(\"previewscroll\", function(){\r\n            console.clear();\r\n            console.log(\"on() => Override settings.onpreviewscroll =>\", this, this.id, event, (new Date).getTime());\r\n        });\r\n\r\n        // defined event bind\r\n        this.on(\"resize\", function(){\r\n            console.clear();\r\n            console.log(\"onresize =>\", this, this.id, event, (new Date).getTime());\r\n        });\r\n    }\r\n}\r\n\r\n// Or\r\neditor.on(\"resize\", function(){\r\n    // ...\r\n});\r\n\r\neditor.off(\"resize\");\r\n```\r\n###jsp 作业', '2019-12-11 19:30:44', '2019-12-11 19:30:51', 'default.jpg', 0);
INSERT INTO `blog_article` VALUES (2, 1, 2, 7, 'qwe', '123', 'qwe', '2019-12-13 14:59:25', '2019-12-13 14:59:27', 'default.jpeg', 0);
INSERT INTO `blog_article` VALUES (3, 2, 2, 7, '1', '23', '1', '2019-12-13 15:06:46', '2019-12-13 15:06:48', 'default.jpeg', 0);

-- ----------------------------
-- Table structure for blog_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category`  (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章类别id',
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类别名称',
  `is_delete` int(11) NOT NULL COMMENT '是否删除',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_category
-- ----------------------------
INSERT INTO `blog_category` VALUES (1, '编程', 0);
INSERT INTO `blog_category` VALUES (2, 'web', 0);

-- ----------------------------
-- Table structure for blog_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment`;
CREATE TABLE `blog_comment`  (
  `comment_id` int(50) NOT NULL AUTO_INCREMENT,
  `article_id` int(50) NOT NULL COMMENT '文章id',
  `user_id` int(50) NOT NULL COMMENT '回复人',
  `reply_msg` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复内容',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `zan_count` int(11) NOT NULL COMMENT '赞数',
  `is_delete` int(11) NOT NULL COMMENT '是否被删除',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_comment
-- ----------------------------
INSERT INTO `blog_comment` VALUES (1, 1, 2, '第一条评论', '2019-12-13 14:32:56', 3, 1);
INSERT INTO `blog_comment` VALUES (3, 1, 2, '第二条评论', '2019-12-13 17:35:03', 2, 0);
INSERT INTO `blog_comment` VALUES (9, 1, 1, '测试评论', '2019-12-15 01:28:02', 0, 1);
INSERT INTO `blog_comment` VALUES (10, 1, 1, '评论前请先登录', '2019-12-15 01:31:51', 1, 0);
INSERT INTO `blog_comment` VALUES (11, 1, 1, '评论前请先登录', '2019-12-15 01:32:11', 0, 0);
INSERT INTO `blog_comment` VALUES (12, 1, 1, '登录', '2019-12-15 01:32:32', 1, 0);
INSERT INTO `blog_comment` VALUES (13, 1, 1, '测试评论按钮', '2019-12-15 17:15:59', 0, 0);
INSERT INTO `blog_comment` VALUES (14, 1, 1, '123', '2019-12-15 17:22:10', 0, 0);
INSERT INTO `blog_comment` VALUES (15, 1, 1, '123', '2019-12-15 17:22:40', 0, 1);
INSERT INTO `blog_comment` VALUES (16, 1, 1, '456', '2019-12-15 17:24:58', 0, 1);
INSERT INTO `blog_comment` VALUES (17, 2, 1, '123', '2019-12-15 17:29:13', 0, 0);
INSERT INTO `blog_comment` VALUES (18, 2, 1, '123', '2019-12-15 17:30:56', 0, 0);
INSERT INTO `blog_comment` VALUES (19, 2, 1, '4444', '2019-12-15 17:31:00', 0, 0);
INSERT INTO `blog_comment` VALUES (20, 2, 1, '7777', '2019-12-15 17:31:02', 0, 0);
INSERT INTO `blog_comment` VALUES (21, 2, 1, '8888', '2019-12-15 17:31:06', 0, 0);
INSERT INTO `blog_comment` VALUES (22, 2, 1, '888', '2019-12-15 17:31:14', 0, 0);
INSERT INTO `blog_comment` VALUES (23, 2, 1, '111', '2019-12-15 17:36:19', 0, 0);
INSERT INTO `blog_comment` VALUES (24, 2, 1, '22', '2019-12-15 17:36:22', 0, 0);
INSERT INTO `blog_comment` VALUES (25, 2, 1, '33', '2019-12-15 17:36:25', 0, 0);
INSERT INTO `blog_comment` VALUES (26, 2, 1, '44', '2019-12-15 17:36:29', 0, 0);
INSERT INTO `blog_comment` VALUES (27, 2, 1, '一条普通的留言啊', '2019-12-15 17:36:53', 0, 0);
INSERT INTO `blog_comment` VALUES (28, 2, 1, '', '2019-12-15 17:37:03', 0, 0);
INSERT INTO `blog_comment` VALUES (29, 2, 1, 'qw', '2019-12-15 17:39:27', 0, 0);
INSERT INTO `blog_comment` VALUES (30, 2, 1, '', '2019-12-15 17:39:30', 0, 0);
INSERT INTO `blog_comment` VALUES (31, 2, 1, '', '2019-12-15 17:39:34', 0, 0);
INSERT INTO `blog_comment` VALUES (32, 2, 1, '', '2019-12-15 17:39:38', 0, 0);
INSERT INTO `blog_comment` VALUES (33, 2, 1, '', '2019-12-15 17:39:42', 0, 0);
INSERT INTO `blog_comment` VALUES (34, 2, 1, '', '2019-12-15 17:39:46', 0, 0);
INSERT INTO `blog_comment` VALUES (35, 2, 1, '', '2019-12-15 17:39:50', 0, 0);
INSERT INTO `blog_comment` VALUES (36, 2, 1, '', '2019-12-15 17:40:21', 0, 0);
INSERT INTO `blog_comment` VALUES (37, 2, 1, '', '2019-12-15 17:40:23', 0, 0);
INSERT INTO `blog_comment` VALUES (38, 2, 1, '', '2019-12-15 17:40:25', 0, 0);
INSERT INTO `blog_comment` VALUES (39, 2, 1, '', '2019-12-15 17:41:15', 0, 0);
INSERT INTO `blog_comment` VALUES (40, 2, 1, '', '2019-12-15 17:41:24', 0, 0);
INSERT INTO `blog_comment` VALUES (41, 2, 1, '', '2019-12-15 17:43:03', 0, 0);
INSERT INTO `blog_comment` VALUES (42, 2, 1, 'sdf', '2019-12-15 17:44:22', 0, 0);
INSERT INTO `blog_comment` VALUES (43, 1, 1, '评论', '2019-12-15 21:49:53', 0, 1);
INSERT INTO `blog_comment` VALUES (44, 1, 1, '评论', '2019-12-17 19:24:46', 0, 0);

-- ----------------------------
-- Table structure for blog_reply
-- ----------------------------
DROP TABLE IF EXISTS `blog_reply`;
CREATE TABLE `blog_reply`  (
  `reply_id` int(50) NOT NULL,
  `comment_id` int(50) NOT NULL COMMENT '评论Id',
  `from_user_id` int(50) NOT NULL COMMENT '回复人',
  `to_user_id` int(50) NOT NULL COMMENT '回复对象',
  `reply_msg` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复内容',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `is_delete` int(1) NOT NULL COMMENT '是否被删除',
  PRIMARY KEY (`reply_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '回复表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_reply
-- ----------------------------
INSERT INTO `blog_reply` VALUES (1, 1, 1, 2, '1回复2', '2019-12-13 14:35:13', 1);
INSERT INTO `blog_reply` VALUES (2, 2, 1, 2, '1回复2', '2019-12-13 15:04:17', 0);
INSERT INTO `blog_reply` VALUES (3, 1, 1, 2, '1', '2019-12-13 15:29:10', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_user
-- ----------------------------
INSERT INTO `blog_user` VALUES (1, 'ckx', '123', 1, 'default.jpeg', '博主，大二软件工程学生', '578961953@qq.com', 0);
INSERT INTO `blog_user` VALUES (2, 'zs', '123', 2, 'default.jpeg', '用户', '578961953@qq.com', 0);

-- ----------------------------
-- Procedure structure for test
-- ----------------------------
DROP PROCEDURE IF EXISTS `test`;
delimiter ;;
CREATE PROCEDURE `test`()
begin
    declare i int;                      #申明变量
    set i = 0;                          #变量赋值
    while i < 10 do                     #结束循环的条件: 当i大于10时跳出while循环
    insert into test values (i);    #往test表添加数据
    set i = i + 1;                  #循环一次,i加一
    end while;                          #结束while循环
    select * from test;                 #查看test表数据
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
