<%--
  Created by IntelliJ IDEA.
  User: 哒哒哒大橘猫
  Date: 2019/12/11
  Time: 20:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>往事随风 轻舞飞扬</title>
    <link rel="stylesheet" href="../css/customer.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../editormd/css/editormd.preview.css">
</head>
<body>
<nav class="navbar navbar-default" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#"><img src="../image/下载.png"/></a>
        </div>
        <div>
            <ul class="nav navbar-nav navbar-left">
                <li><a href="#">首页</a></li>
                <li><a href="#">文章</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><img src="../image//30a09f391c274bfd8cc6091ae0fc5058!400x400.jpeg" class="avatar img-circle" alt="头像"/></li>
                <li><a href="#">我的消息 <span class="badge">14</span></a></li>
                <li><a href="#"><span class="glyphicon glyphicon-off"></span>退出登录</a></li>
            </ul>
            <ul>
                <form class="navbar-form navbar-left " role="search">
                    <div class="form-group input-group input-group-sm">
                                  <span style="background: white;border-top-left-radius: 15px;border-bottom-left-radius: 15px;border-right: 0px;" class="input-group-addon">
                                      <span style="background: white;" class="glyphicon glyphicon-search"></span>
                                  </span>
                        <input style="border-top-right-radius: 15px;border-bottom-right-radius: 15px;border-left: 0px;" type="text" class="form-control" placeholder="search article for key">
                        <!-- <span class="input-group-btn">
                            <button type="submit" class="btn btn-default" value="Submit"></button>
                        </span> -->
                    </div>
                </form>
            </ul>
        </div>
    </div>
</nav>
<div  class="container">
    <div class="article">
        <div class="page-header">
            <h3><c:forEach var="article" items="${articleList}">
                ${article.title}
            </c:forEach></h3>
            <ul class="btn-group btn-group-xs" style="list-style-type: none;">
                <li class="text-info" style="margin:0 10px;float: left;">发布时间：<c:forEach var="article" items="${articleList}">
                    ${article.releaseTime}
                </c:forEach></li>
                <li style="float: left;margin:0 10px;">作者：<a href="#">猹与少年</a></li>
                <li style="float: left;margin:0 10px;"><span class="glyphicon glyphicon-thumbs-up"> 0</span></li>
                <li style="float: left;margin:0 12px;">文章标签：</li>

                <button style="margin-right: 5px;" type="button" class="btn btn-default">Cras justo odio</button>
                <button style="margin-right: 5px;" type="button" class="btn btn-default">Dapibus ac facilisis in </button>
                <li style="float: left;margin:0 3px;"><a href="#">更多</a></li>
            </ul>
        </div>
        <div id="doc-content">
                        <textarea style="display:none;"><c:forEach var="article" items="${articleList}">${article.content}</c:forEach></textarea>
        </div>
        <div class="comment">
            <div class="panel panel-default">
                <div class="panel-body">
                    <ul class="clearfix">
                        <li style="float: left;margin:0 5px;"><a href="#"><img style="width: 30px;height: 30px;" src="../image//30a09f391c274bfd8cc6091ae0fc5058!400x400.jpeg" class="avatar img-circle" alt="头像"/></a></li>
                        <li style="float: left;position: relative;top: 6px;"><a href="#">Vestibulum at eros</a></li>
                        <li style="float: left;position: relative;top: 6px;">1秒前</li>
                        <li style="float: left;position: relative;top: 6px;">#1楼</li>
                        <li style="float: right;position: relative;top: 6px;"><a href="#"><span class="glyphicon glyphicon-star"> 0</span></a></li>
                        <li style="float: right;position: relative;top: 6px;"><a href="#">回复</a></li>
                        <li style="float: right;position: relative;top: 6px;"><a href="#">举报</a></li>
                        <li style="float: right;;position: relative;top: 6px;"><a href="#">删除</a></li>
                    </ul>
                    <p style="margin: 5px 12px 5px 80px;" class="pull-left">如果你使用图标是为了表达某些含义（不仅仅是为了装饰用），请确保你所要表达的意思能够通过被辅助设备识别，例如，包含额外的内容并通过 .sr-only 类让你应当提供其他的内容来表示这个控件的意图，这样就能让使用辅助设备的用户知道其作用了。这种情况下，你可以为控件添加 aria-label 属性。</p>
                </div>
                <div class="panel-body">
                    <ul class="clearfix">
                        <li style="float: left;margin:0 5px;"><a href="#"><img style="width: 30px;height: 30px;" src="../image//30a09f391c274bfd8cc6091ae0fc5058!400x400.jpeg" class="avatar img-circle" alt="头像"/></a></li>
                        <li style="float: left;position: relative;top: 6px;"><a href="#">Vestibulum at eros</a></li>
                        <li style="float: left;position: relative;top: 6px;">1秒前</li>
                        <li style="float: left;position: relative;top: 6px;">#1楼</li>
                        <li style="float: right;position: relative;top: 6px;"><a href="#"><span class="glyphicon glyphicon-star"> 0</span></a></li>
                        <li style="float: right;position: relative;top: 6px;"><a href="#">回复</a></li>
                        <li style="float: right;position: relative;top: 6px;"><a href="#">举报</a></li>
                        <li style="float: right;;position: relative;top: 6px;"><a href="#">删除</a></li>
                    </ul>
                    <p style="margin: 5px 12px 5px 80px" class="pull-left ">过 .</p>
                </div>
                <div class="panel-body">
                    <ul class="clearfix">
                        <li style="float: left;margin:0 5px;"><a href="#"><img style="width: 30px;height: 30px;" src="../image//30a09f391c274bfd8cc6091ae0fc5058!400x400.jpeg" class="avatar img-circle" alt="头像"/></a></li>
                        <li style="float: left;position: relative;top: 6px;"><a href="#">Vestibulum at eros</a></li>
                        <li style="float: left;position: relative;top: 6px;">1秒前</li>
                        <li style="float: left;position: relative;top: 6px;">#1楼</li>
                        <li style="float: right;position: relative;top: 6px;"><a href="#"><span class="glyphicon glyphicon-star"> 0</span></a></li>
                        <li style="float: right;position: relative;top: 6px;"><a href="#">回复</a></li>
                        <li style="float: right;position: relative;top: 6px;"><a href="#">举报</a></li>
                        <li style="float: right;;position: relative;top: 6px;"><a href="#">删除</a></li>
                    </ul>
                    <p style="margin: 5px 12px 5px 80px;" class="pull-left">如果你使用图标是为了表达某些含义（不仅仅是为了装饰用），请确保你所要表达的意思能够通过被辅助设备识别，例如，包含额外的内容并通过 .sr-only 类让你应当提供其他的内容来表示这个控件的意图，这样就能让使用辅助设备的用户知道其作用了。这种情况下，你可以为控件添加 aria-label 属性。</p>
                </div>
            </div>

        </div>
    </div>
    <div class="sideright" style="float: right;width: 20%;position:sticky;top:  30px;">
        <div class="authorinfo" style="float: left;">
            <ul class=" list_userbar">
                <li style="float: left;"><a href="#"><img style="width: 30px;height: 30px;" src="../image//30a09f391c274bfd8cc6091ae0fc5058!400x400.jpeg" class="avatar img-circle" alt="头像"/></a></li>
                <li class="clearfix" style="float: left;position: relative;top: 6px;"><a href="#">Vestibulum at eros</a></li>
                <p style="margin-top: 10px;clear: left;" class="text-lef text-info">关于作者：</p>
            <li style="float: left;"><p>作者详细信息只要给 .btn-group 加上 .btn-group-* 类，就省去为按钮组中的每个按钮都赋予尺寸类了，如果包含了多个按钮组时也适用。
        </p></li>
            </ul>
        </div>
        <div class="newarticle" style="float: left;">
            <ul class="nav nav-pills nav-stacked">
                <li class=""><h4 class="text-center text-info">最新文章</h4></li>
                <li><a href="#">Tutorials <span class="glyphicon glyphicon-thumbs-up"> 0 </span></a></li>
                <li><a href="#">Practice Editor<span class="glyphicon glyphicon-thumbs-up"> 0 </span></a></li>
                <li><a href="#">Gallery <span class="glyphicon glyphicon-thumbs-up"> 0 </span></a></li>
                <li><a href="#">Contact <span class="glyphicon glyphicon-thumbs-up"> 0 </span></a></li>
            </ul>
        </div>
        <div class="newcomment" style="float: left;">

        </div>
    </div>
</div>
</body>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../editormd/lib/marked.min.js"></script>
<script src="../editormd/lib/prettify.min.js"></script>
<script src="../editormd/lib/raphael.min.js"></script>
<script src="../editormd/lib/underscore.min.js"></script>
<script src="../editormd/lib/sequence-diagram.min.js"></script>
<script src="../editormd/lib/flowchart.min.js"></script>
<script src="../editormd/lib/jquery.flowchart.min.js"></script>
<script src="../editormd/editormd.min.js"></script>
<script type="text/javascript">
    var testEditor;
    $(function () {
        testEditor = editormd.markdownToHTML("doc-content", {//注意：这里是上面DIV的id
            htmlDecode: "style,script,iframe",
            emoji: true,
            tocm:true,
            taskList: true,
            tex: true, // 默认不解析
            flowChart: true, // 默认不解析
            sequenceDiagram: true, // 默认不解析
            codeFold: true,
        })})
</script>
</html>
