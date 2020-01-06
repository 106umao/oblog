/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : persional_blog

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 06/01/2020 12:21:46
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
  `star` int(11) NOT NULL DEFAULT 0 COMMENT '点赞',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Introduction` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章简介',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `release_time` timestamp(0) NOT NULL COMMENT '发布时间',
  `last_modified` timestamp(0) NOT NULL COMMENT '最后修改时间',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'default.jpeg' COMMENT '封面',
  `is_delete` int(11) NOT NULL DEFAULT 0 COMMENT '是否被删除。1为删除 0为未删除 默认为未删除',
  PRIMARY KEY (`article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_article
-- ----------------------------
INSERT INTO `blog_article` VALUES (1, 1, 1, 13, '搭建个人博客过程记录', '123', '#### Example\r\n```javascript\r\n{\r\n    onscroll : function(event) {\r\n        console.clear();\r\n        console.log(\"onscroll =>\", this, this.id, this.settings, event);\r\n    },\r\n\r\n    onpreviewscroll : function(event) {\r\n        console.clear();\r\n        console.log(\"onpreviewscroll =>\", this, this.id, this.settings, event);\r\n    },\r\n\r\n    onload : function() {\r\n        this.off(\"previewscroll\"); // unbind before handle\r\n\r\n        // Override settings.onpreviewscroll\r\n        this.on(\"previewscroll\", function(){\r\n            console.clear();\r\n            console.log(\"on() => Override settings.onpreviewscroll =>\", this, this.id, event, (new Date).getTime());\r\n        });\r\n\r\n        // defined event bind\r\n        this.on(\"resize\", function(){\r\n            console.clear();\r\n            console.log(\"onresize =>\", this, this.id, event, (new Date).getTime());\r\n        });\r\n    }\r\n}\r\n\r\n// Or\r\neditor.on(\"resize\", function(){\r\n    // ...\r\n});\r\n\r\neditor.off(\"resize\");\r\n```\r\n###jsp 作业', '2019-12-11 19:30:44', '2019-12-11 19:30:51', 'default.jpg', 0);
INSERT INTO `blog_article` VALUES (2, 1, 2, 7, 'qwe', '123', 'qwe', '2019-12-13 14:59:25', '2019-12-13 14:59:27', 'default.jpeg', 1);
INSERT INTO `blog_article` VALUES (3, 2, 2, 7, '1', '23', '1', '2019-12-13 15:06:46', '2019-12-13 15:06:48', 'default.jpeg', 1);
INSERT INTO `blog_article` VALUES (4, 2, 5, 0, 'ff', 'fff', 'fff', '2020-01-06 00:00:00', '2020-01-06 00:00:00', 'default.jpeg', 1);
INSERT INTO `blog_article` VALUES (5, 1, 5, 0, '测试文章', 'java.util.Date和java.sql.Date转换\n博客分类： 数据库\njava.sql.', 'java.util.Date和java.sql.Date转换\n博客分类： 数据库\njava.sql.datejava.util.date转换 \n阅读更多\n文章来源：点击打开链接\n\nDate 的类型转换：首先记住java.util.Date 为 java.sql.Date的父类\n\n1.将java.util.Date 转换为 java.sql.Date\n\njava.lang.ClassCastException: java.util.Date cannot be cast to java.sql.Date\n\nDate d=new Date(); //java.util.Date\nnew java.sql.Date(d.getTime()) //将java.util.Date 转换为 java.sql.Date\n\n \n\n \n\n2.使用SimpleDateFormat 进行类型转换\n\nDateFormat df=new SimpleDateFormat(\"yyyy-MM-dd\");\ndf.format(new Date()); //将java.util.Date转换为String\ndf.parse(\"\"); //将String 转为成java.util.Date\n\n \n\n3. 将String 转换为 java.sql.Date\nString str=\"1989-11-23 12:25:20\";\njava.sql.Date date=java.sql.Date.valueof(str);\n\n \n\n关于如何向数据库中插入的时间，精确到时分秒的问题，下一篇文章中具体给出了做法\n\n文章来源：点击打开链接\n\n \n\njava.sql.Date,java.sql.Time和java.sql.Timestamp三个都是java.util.Date的子类（包装类）。\n\njava.sql.Date是java.util.Date的子类，是一个包装了毫秒值的瘦包装器，允许 JDBC 将毫秒值标识为 SQL DATE 值。毫秒值表示自 1970 年 1 月 1 日 00:00:00 GMT 以来经过的毫秒数。 为了与 SQL DATE 的定义一致，由 java.sql.Date 实例包装的毫秒值必须通过将时间、分钟、秒和毫秒设置为与该实例相关的特定时区中的零来“规范化”。\n\n说白了，java.sql.Date就是与数据库Date相对应的一个类型，而java.util.Date是纯java的Date。\n\n从类 java.util.Date 继承的方法\nafter, before, clone, compareTo, equals, getDate, getDay, getMonth, getTime, getTimezoneOffset, getYear, hashCode, parse, setDate, setMonth, setYear, toGMTString, toLocaleString, UTC\n\n \n\nsql.Date也有时间的\n如果不想用oracle的to_date函数，可以自己生成sql.Date对象\nString s = \"2012-06-21 00:10:00\";\nSimpleDateFormat sdf = new SimpleDateFormat(\"yyyy-MM-dd HH:mm:ss\");\njava.util.Date d1 = sdf.parse(s); //先把字符串转为util.Date对象\njava.sql.Date d2 = new java.sql.Date(d1.getTime()); //再转换为sql.Date对象\n \n \n\n想要将带时分秒的时间插入到数据库中，除了Oracle数据库的to_date()方法之外。我们可以用 Timestamp类来实现。java.sql.Date是规范化之后的时间，其时分秒部分被截取掉了。\n\njava.sql.Date是为了配合SQL DATE而设置的数据类型。“规范化”的java.sql.Date只包含年月日信息，时分秒毫秒都会清零。格式类似：YYYY-MM-DD。当我们调用ResultSet的getDate()方法来获得返回值时，java程序会参照\"规范\"的java.sql.Date来格式化数据库中的数值。因此，如果数据库中存在的非规范化部分的信息将会被劫取。\n在sun提供的ResultSet.java中这样对getDate进行注释的：\nRetrieves the of the designated column in the current row of this <code>ResultSet</code> object as a “java.sql.Date” object in the Java programming language.\n\n\n同理。如果我们把一个java.sql.Date值通过PrepareStatement的setDate方法存入数据库时，java程序会对传入的java.sql.Date规范化，非规范化的部分将会被劫取。然而，我们java.sql.Date一般由java.util.Date转换过来，如：java.sql.Date sqlDate=new java.sql.Date(new java.util.Date().getTime()).\n显然，这样转换过来的java.sql.Date往往不是一个规范的java.sql.Date.要保存java.util.Date的精确值，\n我们需要利用java.sql.Timestamp.\nJava代码  收藏代码\n<span style=\"font-size:18px;\">    String s=\"2012-01-02 03:12:21\";  \n        SimpleDateFormat sp = new SimpleDateFormat(\"yyyy-MM-dd hh:mm:ss\");  \n        java.util.Date du = sp.parse(s);  \n            java.sql.Timestamp st = new java.sql.Timestamp(du.getTime());</span>  \n把一个日期值写入数据库中，发现由java.util.Date转存为java.sql.Date后，只有年月日，没有了时分秒:\n\njava.util.Dateud=newjava.util.Date();\njava.sql.Datesd=newjava.sql.Date(ud.getTime());\n这个可是不行的，用户至少要精确到分。由于java.sql.Date为了能够遵守sql日期标准，把所有时分秒都归了零。只有用Timestamp来进行保存，由于Timestamp是子类，因此写好的bean里面不需要修改数据类型。\n\npstmt.setTimestamp(15,newjava.sql.Timestamp(Calendar.getInstance().getTime().getTime()));//当前时间\npstmt.setTimestamp(16,newjava.sql.Timestamp(userFile.getCreateTime().getTime()));//指定时间\n对于指定时间还可以用Calendar类的setTime()方法来设置\n\n \n\nJava代码  收藏代码\n<span style=\"font-size:18px;\">Calendar cal = Calendar.getInstance();  \n            System.out.println(cal.getTime().getTime());  \n        String string=\"2012-01-01 01:02:03\";  \n    SimpleDateFormat sp = new SimpleDateFormat(\"yyyy-MM-dd hh:mm:ss\");  \n        java.util.Date da = sp.parse(string);  \n        cal.setTime(da);  \n            System.out.println(cal.getTime().getTime());</span>  \n \n\n在数据库中插入带时分秒的时间需要用Timestamp。一般做这种操作用框架居多，我就说一下Hibernate吧。在数据库表中字段类型设置为Date数据类型，代码中映射的字段类型设置为 Timestamp类型，private Timestamp date; 在映射文件中 <property name=\"date\" type=\"timestamp\" column=\"sj\"/> Type也是时间戳类型的。在赋值取值的时候用前面的操作获取到需要的时间的时间戳对象直接赋值就行。然后就可以用Hibernate执行方法将带时分秒的时间存入到数据库里了。(不过这一点意义好像不是很大，大多都是直接varchar2存进去，取时候再to_date一下或者在代码里处理)\n\n还需要说一点的就是\n\n在使用SimpleDateFormat时格式化时间的 yyyy.MM.dd 为年月日而如果希望格式化时间为12小时制的，则使用hh:mm:ss如果希望格式化时间为24小时制的，则使用HH:mm:ss，上代码：\n\nJava代码  收藏代码\nSimpleDateFormat ss = new SimpleDateFormat(\"yyyy-MM-dd hh:mm:ss\");//12小时制     \n \n\nJava代码  收藏代码\nSimpleDateFormat sdformat = new SimpleDateFormat(\"yyyy-MM-dd HH:mm:ss\");//24小时制  \n \n\nJava代码  收藏代码\nDate d = new Date();  \n        SimpleDateFormat ss = new SimpleDateFormat(\"yyyy-MM-dd hh:mm:ss\");//12小时制  \n        System.out.println(ss.format(d));  \n  \n        Date date = new Date();  \n        SimpleDateFormat sdformat = new SimpleDateFormat(\"yyyy-MM-dd HH:mm:ss\");//24小时制  \n        String LgTime = sdformat.format(date);  \n        System.out.println(LgTime);  \n  \n  \n结果为  \n2008-05-28 01:32:54  \n2008-05-28 13:32:54  \n\nDate类，已经很少用了。更多使用的是Calendar\nCalendar date = Calendar.getInstance();\ndate.get(Calendar.HOUR_OF_DAY );//得到24小时机制的\ndate.get(Calendar.HOUR);// 得到12小时机制的\n\n \n\n \n\n \n\n \n\n分享到：  \nSpring3.1 文件上传 | eclipse解决jsp页面乱码问题\n2013-07-20 10:30浏览 7644评论(0)分类:数据库查看更多\n评论\n发表评论\n 您还没有登录,请您登录后再发表评论\n\n', '2020-01-06 00:00:00', '2020-01-06 00:00:00', 'default.jpeg', 0);
INSERT INTO `blog_article` VALUES (6, 3, 5, 0, 'Mardown语法工具', '### 主要特性\n\n- 支持“标准”Markdown / CommonMark和Github风格的语', '### 主要特性\n\n- 支持“标准”Markdown / CommonMark和Github风格的语法，也可变身为代码编辑器；\n- 支持实时预览、图片（跨域）上传、预格式文本/代码/表格插入、代码折叠、搜索替换、只读模式、自定义样式主题和多语言语法高亮等功能；\n- 支持ToC（Table of Contents）、Emoji表情、Task lists、@链接等Markdown扩展语法；\n- 支持TeX科学公式（基于KaTeX）、流程图 Flowchart 和 时序图 Sequence Diagram;\n- 支持识别和解析HTML标签，并且支持自定义过滤标签解析，具有可靠的安全性和几乎无限的扩展性；\n- 支持 AMD / CMD 模块化加载（支持 Require.js & Sea.js），并且支持自定义扩展插件；\n- 兼容主流的浏览器（IE8+）和Zepto.js，且支持iPad等平板设备；\n- 支持自定义主题样式；\n\n# Editor.md\n\n![](https://pandao.github.io/editor.md/images/logos/editormd-logo-180x180.png)\n\n![](https://img.shields.io/github/stars/pandao/editor.md.svg) ![](https://img.shields.io/github/forks/pandao/editor.md.svg) ![](https://img.shields.io/github/tag/pandao/editor.md.svg) ![](https://img.shields.io/github/release/pandao/editor.md.svg) ![](https://img.shields.io/github/issues/pandao/editor.md.svg) ![](https://img.shields.io/bower/v/editor.md.svg)\n\n**目录 (Table of Contents)**\n\n[TOCM]\n\n[TOC]\n\n# Heading 1\n## Heading 2\n### Heading 3\n#### Heading 4\n##### Heading 5\n###### Heading 6\n# Heading 1 link [Heading link](https://github.com/pandao/editor.md \"Heading link\")\n## Heading 2 link [Heading link](https://github.com/pandao/editor.md \"Heading link\")\n### Heading 3 link [Heading link](https://github.com/pandao/editor.md \"Heading link\")\n#### Heading 4 link [Heading link](https://github.com/pandao/editor.md \"Heading link\") Heading link [Heading link](https://github.com/pandao/editor.md \"Heading link\")\n##### Heading 5 link [Heading link](https://github.com/pandao/editor.md \"Heading link\")\n###### Heading 6 link [Heading link](https://github.com/pandao/editor.md \"Heading link\")\n\n#### 标题（用底线的形式）Heading (underline)\n\nThis is an H1\n=============\n\nThis is an H2\n-------------\n\n### 字符效果和横线等\n                \n----\n\n~~删除线~~ <s>删除线（开启识别HTML标签时）</s>\n*斜体字*      _斜体字_\n**粗体**  __粗体__\n***粗斜体*** ___粗斜体___\n\n上标：X<sub>2</sub>，下标：O<sup>2</sup>\n\n**缩写(同HTML的abbr标签)**\n\n> 即更长的单词或短语的缩写形式，前提是开启识别HTML标签时，已默认开启\n\nThe <abbr title=\"Hyper Text Markup Language\">HTML</abbr> specification is maintained by the <abbr title=\"World Wide Web Consortium\">W3C</abbr>.\n\n### 引用 Blockquotes\n\n> 引用文本 Blockquotes\n\n引用的行内混合 Blockquotes\n                    \n> 引用：如果想要插入空白换行`即<br />标签`，在插入处先键入两个以上的空格然后回车即可，[普通链接](http://localhost/)。\n\n### 锚点与链接 Links\n\n[普通链接](http://localhost/)\n\n[普通链接带标题](http://localhost/ \"普通链接带标题\")\n\n直接链接：<https://github.com>\n\n[锚点链接][anchor-id] \n\n[anchor-id]: http://www.this-anchor-link.com/\n\nGFM a-tail link @pandao\n\n> @pandao\n\n### 多语言代码高亮 Codes\n\n#### 行内代码 Inline code\n\n执行命令：`npm install marked`\n\n#### 缩进风格\n\n即缩进四个空格，也做为实现类似`<pre>`预格式化文本(Preformatted Text)的功能。\n\n    <?php\n        echo \"Hello world!\";\n    ?>\n    \n预格式化文本：\n\n    | First Header  | Second Header |\n    | ------------- | ------------- |\n    | Content Cell  | Content Cell  |\n    | Content Cell  | Content Cell  |\n\n#### JS代码　\n\n```javascript\nfunction test(){\n	console.log(\"Hello world!\");\n}\n \n(function(){\n    var box = function(){\n        return box.fn.init();\n    };\n\n    box.prototype = box.fn = {\n        init : function(){\n            console.log(\'box.init()\');\n\n			return this;\n        },\n\n		add : function(str){\n			alert(\"add\", str);\n\n			return this;\n		},\n\n		remove : function(str){\n			alert(\"remove\", str);\n\n			return this;\n		}\n    };\n    \n    box.fn.init.prototype = box.fn;\n    \n    window.box =box;\n})();\n\nvar testBox = box();\ntestBox.add(\"jQuery\").remove(\"jQuery\");\n```\n\n#### HTML代码 HTML codes\n\n```html\n<!DOCTYPE html>\n<html>\n    <head>\n        <mate charest=\"utf-8\" />\n        <title>Hello world!</title>\n    </head>\n    <body>\n        <h1>Hello world!</h1>\n    </body>\n</html>\n```', '2020-01-06 00:00:00', '2020-01-06 00:00:00', 'default.jpeg', 0);
INSERT INTO `blog_article` VALUES (7, 1, 5, 0, 'Mardown语法工具', '### 主要特性\n\n- 支持“标准”Markdown / CommonMark和Github风格的语', '### 主要特性\n\n- 支持“标准”Markdown / CommonMark和Github风格的语法，也可变身为代码编辑器；\n- 支持实时预览、图片（跨域）上传、预格式文本/代码/表格插入、代码折叠、搜索替换、只读模式、自定义样式主题和多语言语法高亮等功能；\n- 支持ToC（Table of Contents）、Emoji表情、Task lists、@链接等Markdown扩展语法；\n- 支持TeX科学公式（基于KaTeX）、流程图 Flowchart 和 时序图 Sequence Diagram;\n- 支持识别和解析HTML标签，并且支持自定义过滤标签解析，具有可靠的安全性和几乎无限的扩展性；\n- 支持 AMD / CMD 模块化加载（支持 Require.js & Sea.js），并且支持自定义扩展插件；\n- 兼容主流的浏览器（IE8+）和Zepto.js，且支持iPad等平板设备；\n- 支持自定义主题样式；\n\n# Editor.md\n\n![](https://pandao.github.io/editor.md/images/logos/editormd-logo-180x180.png)\n\n![](https://img.shields.io/github/stars/pandao/editor.md.svg) ![](https://img.shields.io/github/forks/pandao/editor.md.svg) ![](https://img.shields.io/github/tag/pandao/editor.md.svg) ![](https://img.shields.io/github/release/pandao/editor.md.svg) ![](https://img.shields.io/github/issues/pandao/editor.md.svg) ![](https://img.shields.io/bower/v/editor.md.svg)\n\n**目录 (Table of Contents)**\n\n[TOCM]\n\n[TOC]\n\n# Heading 1\n## Heading 2\n### Heading 3\n#### Heading 4\n##### Heading 5\n###### Heading 6\n# Heading 1 link [Heading link](https://github.com/pandao/editor.md \"Heading link\")\n## Heading 2 link [Heading link](https://github.com/pandao/editor.md \"Heading link\")\n### Heading 3 link [Heading link](https://github.com/pandao/editor.md \"Heading link\")\n#### Heading 4 link [Heading link](https://github.com/pandao/editor.md \"Heading link\") Heading link [Heading link](https://github.com/pandao/editor.md \"Heading link\")\n##### Heading 5 link [Heading link](https://github.com/pandao/editor.md \"Heading link\")\n###### Heading 6 link [Heading link](https://github.com/pandao/editor.md \"Heading link\")\n\n#### 标题（用底线的形式）Heading (underline)\n\nThis is an H1\n=============\n\nThis is an H2\n-------------\n\n### 字符效果和横线等\n                \n----\n\n~~删除线~~ <s>删除线（开启识别HTML标签时）</s>\n*斜体字*      _斜体字_\n**粗体**  __粗体__\n***粗斜体*** ___粗斜体___\n\n上标：X<sub>2</sub>，下标：O<sup>2</sup>\n\n**缩写(同HTML的abbr标签)**\n\n> 即更长的单词或短语的缩写形式，前提是开启识别HTML标签时，已默认开启\n\nThe <abbr title=\"Hyper Text Markup Language\">HTML</abbr> specification is maintained by the <abbr title=\"World Wide Web Consortium\">W3C</abbr>.\n\n### 引用 Blockquotes\n\n> 引用文本 Blockquotes\n\n引用的行内混合 Blockquotes\n                    \n> 引用：如果想要插入空白换行`即<br />标签`，在插入处先键入两个以上的空格然后回车即可，[普通链接](http://localhost/)。\n\n### 锚点与链接 Links\n\n[普通链接](http://localhost/)\n\n[普通链接带标题](http://localhost/ \"普通链接带标题\")\n\n直接链接：<https://github.com>\n\n[锚点链接][anchor-id] \n\n[anchor-id]: http://www.this-anchor-link.com/\n\nGFM a-tail link @pandao\n\n> @pandao\n\n### 多语言代码高亮 Codes\n\n#### 行内代码 Inline code\n\n执行命令：`npm install marked`\n\n#### 缩进风格\n\n即缩进四个空格，也做为实现类似`<pre>`预格式化文本(Preformatted Text)的功能。\n\n    <?php\n        echo \"Hello world!\";\n    ?>\n    \n预格式化文本：\n\n    | First Header  | Second Header |\n    | ------------- | ------------- |\n    | Content Cell  | Content Cell  |\n    | Content Cell  | Content Cell  |\n\n#### JS代码　\n\n```javascript\nfunction test(){\n	console.log(\"Hello world!\");\n}\n \n(function(){\n    var box = function(){\n        return box.fn.init();\n    };\n\n    box.prototype = box.fn = {\n        init : function(){\n            console.log(\'box.init()\');\n\n			return this;\n        },\n\n		add : function(str){\n			alert(\"add\", str);\n\n			return this;\n		},\n\n		remove : function(str){\n			alert(\"remove\", str);\n\n			return this;\n		}\n    };\n    \n    box.fn.init.prototype = box.fn;\n    \n    window.box =box;\n})();\n\nvar testBox = box();\ntestBox.add(\"jQuery\").remove(\"jQuery\");\n```\n\n#### HTML代码 HTML codes\n\n```html\n<!DOCTYPE html>\n<html>\n    <head>\n        <mate charest=\"utf-8\" />\n        <title>Hello world!</title>\n    </head>\n    <body>\n        <h1>Hello world!</h1>\n    </body>\n</html>\n```\n\n### 图片 Images\n\nImage:\n\n![](https://pandao.github.io/editor.md/examples/images/4.jpg)\n\n> Follow your heart.\n\n![](https://pandao.github.io/editor.md/examples/images/8.jpg)\n\n> 图为：厦门白城沙滩\n\n图片加链接 (Image + Link)：\n\n[![](https://pandao.github.io/editor.md/examples/images/7.jpg)](https://pandao.github.io/editor.md/examples/images/7.jpg \"李健首张专辑《似水流年》封面\")\n\n> 图为：李健首张专辑《似水流年》封面\n                \n----\n\n### 列表 Lists\n\n#### 无序列表（减号）Unordered Lists (-)\n                \n- 列表一\n- 列表二\n- 列表三\n     \n#### 无序列表（星号）Unordered Lists (*)\n\n* 列表一\n* 列表二\n* 列表三\n\n#### 无序列表（加号和嵌套）Unordered Lists (+)\n                \n+ 列表一\n+ 列表二\n    + 列表二-1\n    + 列表二-2\n    + 列表二-3\n+ 列表三\n    * 列表一\n    * 列表二\n    * 列表三\n\n#### 有序列表 Ordered Lists (-)\n                \n1. 第一行\n2. 第二行\n3. 第三行\n\n#### GFM task list\n\n- [x] GFM task list 1\n- [x] GFM task list 2\n- [ ] GFM task list 3\n    - [ ] GFM task list 3-1\n    - [ ] GFM task list 3-2\n    - [ ] GFM task list 3-3\n- [ ] GFM task list 4\n    - [ ] GFM task list 4-1\n    - [ ] GFM task list 4-2\n                \n----\n                    \n### 绘制表格 Tables\n\n| 项目        | 价格   |  数量  |\n| --------   | -----:  | :----:  |\n| 计算机      | $1600   |   5     |\n| 手机        |   $12   |   12   |\n| 管线        |    $1    |  234  |\n                    \nFirst Header  | Second Header\n------------- | -------------\nContent Cell  | Content Cell\nContent Cell  | Content Cell \n\n| First Header  | Second Header |\n| ------------- | ------------- |\n| Content Cell  | Content Cell  |\n| Content Cell  | Content Cell  |\n\n| Function name | Description                    |\n| ------------- | ------------------------------ |\n| `help()`      | Display the help window.       |\n| `destroy()`   | **Destroy your computer!**     |\n\n| Left-Aligned  | Center Aligned  | Right Aligned |\n| :------------ |:---------------:| -----:|\n| col 3 is      | some wordy text | $1600 |\n| col 2 is      | centered        |   $12 |\n| zebra stripes | are neat        |    $1 |\n\n| Item      | Value |\n| --------- | -----:|\n| Computer  | $1600 |\n| Phone     |   $12 |\n| Pipe      |    $1 |\n                \n----\n\n#### 特殊符号 HTML Entities Codes\n\n&copy; &  &uml; &trade; &iexcl; &pound;\n&amp; &lt; &gt; &yen; &euro; &reg; &plusmn; &para; &sect; &brvbar; &macr; &laquo; &middot; \n\nX&sup2; Y&sup3; &frac34; &frac14;  &times;  &divide;   &raquo;\n\n18&ordm;C  &quot;  &apos;\n\n### Emoji表情 :smiley:\n\n> Blockquotes :star:\n\n#### GFM task lists & Emoji & fontAwesome icon emoji & editormd logo emoji :editormd-logo-5x:\n\n- [x] :smiley: @mentions, :smiley: #refs, [links](), **formatting**, and <del>tags</del> supported :editormd-logo:;\n- [x] list syntax required (any unordered or ordered list supported) :editormd-logo-3x:;\n- [x] [ ] :smiley: this is a complete item :smiley:;\n- [ ] []this is an incomplete item [test link](#) :fa-star: @pandao; \n- [ ] [ ]this is an incomplete item :fa-star: :fa-gear:;\n    - [ ] :smiley: this is an incomplete item [test link](#) :fa-star: :fa-gear:;\n    - [ ] :smiley: this is  :fa-star: :fa-gear: an incomplete item [test link](#);\n \n#### 反斜杠 Escape\n\n*literal asterisks*\n            \n### 科学公式 TeX(KaTeX)\n                    \n$$E=mc^2$$\n\n行内的公式$$E=mc^2$$行内的公式，行内的$$E=mc^2$$公式。\n\n$$(sqrt{3x-1}+(1+x)^2)$$\n                    \n$$sin(alpha)^{	heta}=sum_{i=0}^{n}(x^i + cos(f))$$\n\n多行公式：\n\n```math\ndisplaystyle\nleft( sum\\_{k=1}^n a\\_k b\\_k \right)^2\nleq\nleft( sum\\_{k=1}^n a\\_k^2 \right)\nleft( sum\\_{k=1}^n b\\_k^2 \right)\n```\n\n```katex\ndisplaystyle \n    frac{1}{\n        Bigl(sqrt{phi sqrt{5}}-phiBigr) e^{\n        frac25 pi}} = 1+frac{e^{-2pi}} {1+frac{e^{-4pi}} {\n        1+frac{e^{-6pi}}\n        {1+frac{e^{-8pi}}\n         {1+cdots} }\n        } \n    }\n```\n\n```latex\nf(x) = int_{-infty}^infty\n    hat f(xi),e^{2 pi i xi x}\n    ,dxi\n```\n                \n### 绘制流程图 Flowchart\n\n```flow\nst=>start: 用户登陆\nop=>operation: 登陆操作\ncond=>condition: 登陆成功 Yes or No?\ne=>end: 进入后台\n\nst->op->cond\ncond(yes)->e\ncond(no)->op\n```\n                    \n### 绘制序列图 Sequence Diagram\n                    \n```seq\nAndrew->China: Says Hello \nNote right of China: China thinks\nabout it \nChina-->Andrew: How are you? \nAndrew->>China: I am good thanks!\n```\n\n### End', '2020-01-06 00:00:00', '2020-01-06 00:00:00', 'default.jpeg', 0);
INSERT INTO `blog_article` VALUES (8, 1, 1, 6, 'sql语句插入的数据中含有单引号的处理方法', 'sql语句插入的数据中含有单引号\n转载sou3713 发布于2013-07-01 16:08:07 ', 'sql语句插入的数据中含有单引号\n转载sou3713 发布于2013-07-01 16:08:07 阅读数 876  收藏\nsql语句插入的数据中含有单引号怎么办? \n\nsql中，insert into yourTable(f1,f2) values(100,\'abc\') \n\n字符串数据是用单引号包在外面的，如果插入的数据中包含单引号，就需要处理，你可以将单引号替换成两个单引号，在sql中连续两个单引号就表示一个单引号字符，例如 \n\ninsert into yourTable(f1,f2) values(100,\'ab\'\'c\')表示插入 \n\n新记录f2字段为ab\'c \n\n使用函数replace可以实现这个功能： \nreplace(yourStr,\"\'\",\"\'\'\")\n', '2020-01-06 00:00:00', '2020-01-06 00:00:00', 'default.jpeg', 0);

-- ----------------------------
-- Table structure for blog_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category`  (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章类别id',
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类别名称',
  `is_delete` int(11) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_category
-- ----------------------------
INSERT INTO `blog_category` VALUES (1, '编程', 0);
INSERT INTO `blog_category` VALUES (2, 'web', 0);
INSERT INTO `blog_category` VALUES (3, '效率工具', 0);

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
INSERT INTO `blog_comment` VALUES (3, 1, 2, '第二条评论', '2019-12-13 17:35:03', 2, 1);
INSERT INTO `blog_comment` VALUES (9, 1, 1, '测试评论', '2019-12-15 01:28:02', 0, 1);
INSERT INTO `blog_comment` VALUES (10, 1, 1, '评论前请先登录', '2019-12-15 01:31:51', 1, 1);
INSERT INTO `blog_comment` VALUES (11, 1, 1, '评论前请先登录', '2019-12-15 01:32:11', 0, 0);
INSERT INTO `blog_comment` VALUES (12, 1, 1, '登录', '2019-12-15 01:32:32', 1, 0);
INSERT INTO `blog_comment` VALUES (13, 1, 1, '测试评论按钮', '2019-12-15 17:15:59', 0, 0);
INSERT INTO `blog_comment` VALUES (14, 1, 1, '123', '2019-12-15 17:22:10', 0, 0);
INSERT INTO `blog_comment` VALUES (15, 1, 1, '123', '2019-12-15 17:22:40', 0, 1);
INSERT INTO `blog_comment` VALUES (16, 1, 1, '456', '2019-12-15 17:24:58', 0, 1);
INSERT INTO `blog_comment` VALUES (17, 2, 1, '123', '2019-12-15 17:29:13', 0, 1);
INSERT INTO `blog_comment` VALUES (18, 2, 1, '123', '2019-12-15 17:30:56', 0, 1);
INSERT INTO `blog_comment` VALUES (19, 2, 1, '4444', '2019-12-15 17:31:00', 0, 1);
INSERT INTO `blog_comment` VALUES (20, 2, 1, '7777', '2019-12-15 17:31:02', 0, 1);
INSERT INTO `blog_comment` VALUES (21, 2, 1, '8888', '2019-12-15 17:31:06', 0, 1);
INSERT INTO `blog_comment` VALUES (22, 2, 1, '888', '2019-12-15 17:31:14', 0, 1);
INSERT INTO `blog_comment` VALUES (23, 2, 1, '111', '2019-12-15 17:36:19', 0, 1);
INSERT INTO `blog_comment` VALUES (24, 2, 1, '22', '2019-12-15 17:36:22', 0, 1);
INSERT INTO `blog_comment` VALUES (25, 2, 1, '33', '2019-12-15 17:36:25', 0, 1);
INSERT INTO `blog_comment` VALUES (26, 2, 1, '44', '2019-12-15 17:36:29', 0, 1);
INSERT INTO `blog_comment` VALUES (27, 2, 1, '一条普通的留言啊', '2019-12-15 17:36:53', 0, 1);
INSERT INTO `blog_comment` VALUES (28, 2, 1, '', '2019-12-15 17:37:03', 0, 1);
INSERT INTO `blog_comment` VALUES (29, 2, 1, 'qw', '2019-12-15 17:39:27', 0, 1);
INSERT INTO `blog_comment` VALUES (30, 2, 1, '', '2019-12-15 17:39:30', 0, 1);
INSERT INTO `blog_comment` VALUES (31, 2, 1, '', '2019-12-15 17:39:34', 0, 1);
INSERT INTO `blog_comment` VALUES (32, 2, 1, '', '2019-12-15 17:39:38', 0, 1);
INSERT INTO `blog_comment` VALUES (33, 2, 1, '', '2019-12-15 17:39:42', 0, 1);
INSERT INTO `blog_comment` VALUES (34, 2, 1, '', '2019-12-15 17:39:46', 0, 1);
INSERT INTO `blog_comment` VALUES (35, 2, 1, '', '2019-12-15 17:39:50', 0, 1);
INSERT INTO `blog_comment` VALUES (36, 2, 1, '', '2019-12-15 17:40:21', 0, 1);
INSERT INTO `blog_comment` VALUES (37, 2, 1, '', '2019-12-15 17:40:23', 0, 1);
INSERT INTO `blog_comment` VALUES (38, 2, 1, '', '2019-12-15 17:40:25', 0, 1);
INSERT INTO `blog_comment` VALUES (39, 2, 1, '', '2019-12-15 17:41:15', 0, 1);
INSERT INTO `blog_comment` VALUES (40, 2, 1, '', '2019-12-15 17:41:24', 0, 1);
INSERT INTO `blog_comment` VALUES (41, 2, 1, '', '2019-12-15 17:43:03', 0, 1);
INSERT INTO `blog_comment` VALUES (42, 2, 1, 'sdf', '2019-12-15 17:44:22', 0, 1);
INSERT INTO `blog_comment` VALUES (43, 1, 1, '评论', '2019-12-15 21:49:53', 0, 1);
INSERT INTO `blog_comment` VALUES (44, 1, 1, '评论', '2019-12-17 19:24:46', 0, 0);
INSERT INTO `blog_comment` VALUES (45, 1, 1, 'my comment', '2020-01-05 17:10:12', 0, 0);
INSERT INTO `blog_comment` VALUES (46, 1, 2, 'wojuede keyi ', '2020-01-05 19:56:53', 0, 0);
INSERT INTO `blog_comment` VALUES (47, 5, 5, '和不错', '2020-01-06 07:21:24', 0, 1);
INSERT INTO `blog_comment` VALUES (48, 7, 5, '', '2020-01-06 08:32:43', 0, 1);
INSERT INTO `blog_comment` VALUES (49, 7, 5, '很不错', '2020-01-06 08:35:02', 0, 0);
INSERT INTO `blog_comment` VALUES (50, 7, 5, '很有趣', '2020-01-06 08:35:13', 0, 0);
INSERT INTO `blog_comment` VALUES (51, 7, 5, '受益匪浅', '2020-01-06 08:35:19', 0, 0);
INSERT INTO `blog_comment` VALUES (52, 7, 3, '多来几条评论', '2020-01-06 08:39:17', 0, 0);
INSERT INTO `blog_comment` VALUES (53, 7, 3, '多来几条评论', '2020-01-06 08:39:35', 0, 0);
INSERT INTO `blog_comment` VALUES (54, 8, 1, '学到了', '2020-01-06 08:42:35', 1, 0);
INSERT INTO `blog_comment` VALUES (55, 8, 1, '有一点点用，，，', '2020-01-06 08:42:45', 1, 0);
INSERT INTO `blog_comment` VALUES (56, 8, 1, '还行', '2020-01-06 08:43:02', 0, 0);
INSERT INTO `blog_comment` VALUES (57, 8, 1, '666', '2020-01-06 08:43:08', 0, 0);
INSERT INTO `blog_comment` VALUES (58, 8, 1, '膜拜大佬', '2020-01-06 08:43:14', 0, 0);
INSERT INTO `blog_comment` VALUES (59, 8, 1, '太棒了', '2020-01-06 08:43:20', 0, 0);

-- ----------------------------
-- Table structure for blog_reply
-- ----------------------------
DROP TABLE IF EXISTS `blog_reply`;
CREATE TABLE `blog_reply`  (
  `reply_id` int(50) NOT NULL AUTO_INCREMENT,
  `comment_id` int(50) NOT NULL COMMENT '评论Id',
  `from_user_id` int(50) NOT NULL COMMENT '回复人',
  `to_user_id` int(50) NOT NULL COMMENT '回复对象',
  `reply_msg` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复内容',
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `is_delete` int(1) NOT NULL DEFAULT 0 COMMENT '是否被删除',
  PRIMARY KEY (`reply_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '回复表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_reply
-- ----------------------------
INSERT INTO `blog_reply` VALUES (1, 1, 1, 2, '1回复2', '2019-12-13 14:35:13', 1);
INSERT INTO `blog_reply` VALUES (2, 2, 1, 2, '1回复2', '2019-12-13 15:04:17', 0);
INSERT INTO `blog_reply` VALUES (3, 1, 1, 2, '1', '2019-12-13 15:29:10', 1);
INSERT INTO `blog_reply` VALUES (7, 11, 2, 1, 'wuy', '2020-01-05 21:07:42', 0);
INSERT INTO `blog_reply` VALUES (8, 11, 2, 1, '有点意思', '2020-01-05 21:10:03', 0);
INSERT INTO `blog_reply` VALUES (9, 17, 2, 1, 'woaiuni ', '2020-01-05 21:27:48', 1);
INSERT INTO `blog_reply` VALUES (10, 35, 2, 1, 'woaini', '2020-01-05 21:28:22', 1);
INSERT INTO `blog_reply` VALUES (11, 17, 2, 1, 'woaini', '2020-01-05 21:30:12', 1);
INSERT INTO `blog_reply` VALUES (12, 11, 2, 1, 'woaini', '2020-01-06 01:12:01', 0);
INSERT INTO `blog_reply` VALUES (13, 49, 5, 5, '我回复我自己', '2020-01-06 08:35:30', 0);
INSERT INTO `blog_reply` VALUES (14, 49, 5, 5, '我被自己回复了', '2020-01-06 08:35:39', 0);
INSERT INTO `blog_reply` VALUES (15, 49, 5, 5, '我被自己回复了', '2020-01-06 08:35:50', 0);
INSERT INTO `blog_reply` VALUES (16, 50, 5, 5, '我被自己回复了', '2020-01-06 08:36:04', 0);
INSERT INTO `blog_reply` VALUES (17, 49, 3, 5, '李四正在回复张三', '2020-01-06 08:36:40', 0);
INSERT INTO `blog_reply` VALUES (18, 49, 3, 5, '张三在这里回复不了李四', '2020-01-06 08:37:08', 0);
INSERT INTO `blog_reply` VALUES (19, 49, 3, 5, '现在都9102年的你还没有手机', '2020-01-06 08:37:39', 0);
INSERT INTO `blog_reply` VALUES (20, 50, 3, 5, '张三说自己才是扛把子', '2020-01-06 08:38:09', 0);
INSERT INTO `blog_reply` VALUES (21, 50, 3, 5, '我举得张三的智商可能有点问题', '2020-01-06 08:38:27', 0);
INSERT INTO `blog_reply` VALUES (22, 50, 3, 5, '没错 我就是键盘侠', '2020-01-06 08:38:40', 0);
INSERT INTO `blog_reply` VALUES (23, 51, 3, 5, '太棒了吧', '2020-01-06 08:39:04', 0);

-- ----------------------------
-- Table structure for blog_user
-- ----------------------------
DROP TABLE IF EXISTS `blog_user`;
CREATE TABLE `blog_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `role` int(11) NOT NULL COMMENT '用户权限超管2 管理员1 用户0',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'default.jpeg' COMMENT '头像',
  `about` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '这个人很懒，什么都没留下' COMMENT '个人描述',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_user
-- ----------------------------
INSERT INTO `blog_user` VALUES (1, 'ckx', '123', 2, 'default.jpeg', '博主，大二软件工程学生', '578961953@qq.com', 0);
INSERT INTO `blog_user` VALUES (2, 'zs', '123', 1, 'default.jpeg', '用户', '578961953@qq.com', 0);
INSERT INTO `blog_user` VALUES (3, 'lisi', '123', 0, 'default.jpeg', '这个人很懒，什么都没留下', '578961953@qq.com', 0);
INSERT INTO `blog_user` VALUES (5, 'zhangsan', '1', 1, 'default.jpeg', '这个人很懒，什么都没留下', NULL, 0);
INSERT INTO `blog_user` VALUES (9, 'ff', 'f', 0, 'default.jpeg', '这个人很懒，什么都没留下', NULL, 0);
INSERT INTO `blog_user` VALUES (10, 'ffww', 'f', 0, 'default.jpeg', '这个人很懒，什么都没留下', NULL, 0);

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
