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

 Date: 11/12/2019 20:50:00
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_article
-- ----------------------------
INSERT INTO `blog_article` VALUES (1, 1, 1, 0, '搭建个人博客过程记录', '#### Example\r\n```javascript\r\n{\r\n    onscroll : function(event) {\r\n        console.clear();\r\n        console.log(\"onscroll =>\", this, this.id, this.settings, event);\r\n    },\r\n\r\n    onpreviewscroll : function(event) {\r\n        console.clear();\r\n        console.log(\"onpreviewscroll =>\", this, this.id, this.settings, event);\r\n    },\r\n\r\n    onload : function() {\r\n        this.off(\"previewscroll\"); // unbind before handle\r\n\r\n        // Override settings.onpreviewscroll\r\n        this.on(\"previewscroll\", function(){\r\n            console.clear();\r\n            console.log(\"on() => Override settings.onpreviewscroll =>\", this, this.id, event, (new Date).getTime());\r\n        });\r\n\r\n        // defined event bind\r\n        this.on(\"resize\", function(){\r\n            console.clear();\r\n            console.log(\"onresize =>\", this, this.id, event, (new Date).getTime());\r\n        });\r\n    }\r\n}\r\n\r\n// Or\r\neditor.on(\"resize\", function(){\r\n    // ...\r\n});\r\n\r\neditor.off(\"resize\");\r\n```\r\n###jsp 作业', '2019-12-11 19:30:44', '2019-12-11 19:30:51', 'default.jpg', 0);

SET FOREIGN_KEY_CHECKS = 1;
