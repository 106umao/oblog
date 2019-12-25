<%--
  Created by IntelliJ IDEA.
  User: 哒哒哒大橘猫
  Date: 2019/12/11
  Time: 20:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("basePath",basePath);
%>

<html>
<head>
    <base href="${basePath}">
    <title>往事随风 轻舞飞扬</title>
    <link rel="stylesheet" href="css/customer.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="editormd/css/editormd.preview.css">
</head>
<body>
<nav class="navbar navbar-default" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#"><img src="image/下载.png"/></a>
        </div>
        <div>
            <ul class="nav navbar-nav navbar-left">
                <li><a href="">首页</a></li>
                <li><a href="article/articleList">文章</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <c:if test="${loginUser!=null}">
                    <li><img src="image/${loginUser.avatar}" class="avatar img-circle" alt="头像"/></li>
                    <li><a href="#">我的消息 <span class="badge">14</span></a></li>
                    <li><a style="cursor:pointer;" onclick="logout()"><span class="glyphicon glyphicon-off">退出登录</span></a></li>
                </c:if>
                <c:if test="${loginUser==null}">
                    <li>
                        <button id="loginDownBtn" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                            登录
                        </button>
                    </li>
                    <!-- Modal -->
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="text-center modal-title" id="myModalLabel">欢迎登录</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="form-horizontal">
                                        <div class="form-group">

                                            <label for="username" class="col-sm-offset-3 col-sm-2 control-label">Username:</label>
                                            <div class="col-sm-4 input-group">
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                                <input type="text" name="username" class="form-control" id="username" placeholder="username">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputPassword" class="col-sm-offset-3 col-sm-2 control-label">Password:</label>
                                            <div class="col-sm-4 input-group">
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-ice-lolly"></span></span>
                                                <input type="password" name="password" class="form-control" id="inputPassword" placeholder="password">
                                            </div>
                                            <p id="loginmsg"></p>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-5 col-sm-6">
                                                <button id="loginBtn" onclick="login()" class="btn btn-primary">Sign in</button>
                                                <label>
                                                    <a href="jsp/Register.jsp">Register Count</a>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </c:if>
            </ul>
            <ul>
                <form action="article/articleList" class="navbar-form navbar-left " role="search">
                    <div class="form-group input-group input-group-sm">
                                      <span style="background: white;border-top-left-radius: 15px;border-bottom-left-radius: 15px;border-right: 0px;" class="input-group-addon">
                                          <span style="background: white;" class="glyphicon glyphicon-search"></span>
                                      </span>
                        <input style="border-top-right-radius: 15px;border-bottom-right-radius: 15px;border-left: 0px;" name="keyWord" type="text" class="form-control" placeholder="search article for key">
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
            <h3>${article.title}</h3>
            <ul class="btn-group btn-group-xs" style="list-style-type: none;">
                <li class="text-info" style="margin:0 10px;float: left;">发布时间：${article.releaseTime}</li>
                <li style="float: left;margin:0 10px;">作者：<a href="#">${author.username}</a></li>
                <li style="float: left;margin:0 10px;"><a href="article/starArticle?articleId=${article.articleId}"><span class="glyphicon glyphicon-thumbs-up"></span></a> ${article.star}</li>
                <li style="float: left;margin:0 12px;">文章标签：</li>
                <button style="margin-right: 5px;" type="button" class="btn btn-default">编程</button>
                <button style="margin-right: 5px;" type="button" class="btn btn-default">Web</button>
                <li style="float: left;margin:0 3px;"><a href="#">更多</a></li>
            </ul>
        </div>
        <div id="doc-content">
                        <textarea style="display:none;">${article.content}</textarea>
        </div>
        <div class="comment">
            <div class="panel panel-default">
                <div class="panel-body">
                    <ul class="clearfix">
                        <textarea id="commentFrame" onload="commentBlur()" class="form-control" onblur="commentBlur()" onfocus="commentFocus()" rows="4" placeholder="想对作者说点什么"></textarea>
                        <c:if test="${loginUser!=null}">
                            <button class="btn btn-danger pull-right" style=" margin-top:10px;display: none" id="submitComment" onclick="submitComment()">发表评论</button>
                        </c:if>
                        <c:if test="${loginUser==null}">
                            <button disabled class="btn btn-danger pull-right" style=" margin-top:10px;display: none" id="submitComment" onclick="submitComment()">登陆后评论</button>
                        </c:if>
                    </ul>
                </div>
                <c:forEach var="comment" items="${commentList}" varStatus="c">
                    <div class="panel-body">
                        <ul class="clearfix">
                            <li style="float: left;margin:0 5px;"><a href="#"><img style="width: 30px;height: 30px;" src="image/${comment.commentUser.avatar}" class="avatar img-circle" alt="头像"/></a></li>
                            <li style="float: left;position: relative;top: 6px;"><a href="#">${comment.commentUser.username}</a></li>
                            <li style="float: left;position: relative;top: 6px;">${comment.createDate}</li>
                            <li style="float: left;position: relative;top: 6px;">#${c.count}楼</li>
                            <li style="float: right;position: relative;top: 6px;"><a href="comment/starComment?commentId=${comment.commentId}&articleId=${article.articleId}"><span class="glyphicon glyphicon-star"></span></a> ${comment.zanCount}</li>
                            <c:if test="${loginUser!=null}">
                                <li style="float: right;position: relative;top: 6px;"><p onclick="alert('sadfadddddddddddd')" id="loginDownBtn" data-toggle="modal" data-target="#myModal">回复</p></li>
                            </c:if>
                            <li style="float: right;position: relative;top: 6px;"><a href="#">举报</a></li>
                            <c:if test="${loginUser.userId==author.userId}">
                                <li style="float: right;;position: relative;top: 6px;"><a href="comment/delete?commentId=${comment.commentId}&articleId=${article.articleId}">删除</a></li>
                            </c:if>
                        </ul>
                        <div class="clearfix"><p style="margin: 5px 12px 5px 80px;" class=" pull-left">${comment.replyMsg}</p></div>
                        <p id="downBtn${c.index}" onclick="function downComment() {
                            $('#replyCommentList${c.index}').slideDown('fast');
                            $('#downBtn${c.index}').css('display','none');
                            $('#upBtn${c.index}').css('display','block');
                        }
                        downComment()" style="cursor: hand;" class="text-info text-center">展开回复<span class="glyphicon glyphicon-menu-down"></span></p>
                        <p id="upBtn${c.index}" onclick="function upComment() {
                            $('#replyCommentList${c.index}').slideUp('fast');
                             $('#upBtn${c.index}').css('display','none');
                            $('#downBtn${c.index}').css('display','block');
                        }
                        upComment()" style="display:none;cursor: hand;" class="text-info text-center">收起回复<span class="glyphicon glyphicon-menu-up"></span></p>
                        <div class="list-group" id="replyCommentList${c.index}" style="display: none">
                            <a href="#" class="list-group-item ">
                                Cras justo odio
                            </a>
                            <a href="#" class="list-group-item">张三  回复  李四：Dapibus ac facilisis in</a>
                            <a href="#" class="list-group-item">张三  回复  李四：Morbi leo risus</a>
                            <a href="#" class="list-group-item">张三  回复  李四：Porta ac consectetur ac</a>
                            <a href="#" class="list-group-item">张三  回复  李四：Vestibulum at eros</a>
                        </div>

                    </div>
                </c:forEach>
            </div>

        </div>
    </div>
    <div class="sideright" style="float: right;width: 20%;position:sticky;top:  30px;">
        <div class="authorinfo" style="float: left;">
            <ul class=" list_userbar">
                <li style="float: left;"><a href="#"><img style="width: 30px;height: 30px;" src="image/${author.avatar}" class="avatar img-circle" alt="头像"/></a></li>
                <li class="clearfix" style="float: left;position: relative;top: 6px;"><a href="#">${author.username}</a></li>
                <p style="margin-top: 10px;clear: left;" class="text-lef text-info">关于作者：</p>
            <li style="float: left;">
                <p>
                    ${author.about}
                </p>
            </li>
            </ul>
        </div>
        <div class="newarticle" style="float: left;">
            <ul class="nav nav-pills nav-stacked">
                <li class=""><h4 class="text-center text-info">最新文章</h4></li>
                <c:forEach items="${latestArticles}" var="larticle">
                    <li><a href="article/articleDetails?articleId=${larticle.articleId}">${larticle.title}<span class="glyphicon glyphicon-thumbs-up"> ${larticle.star} </span></a></li>
                </c:forEach>
            </ul>
        </div>
        <div class="newcomment" style="float: left;">

        </div>
    </div>
</div>
</body>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="editormd/lib/marked.min.js"></script>
<script src="editormd/lib/prettify.min.js"></script>
<script src="editormd/lib/raphael.min.js"></script>
<script src="editormd/lib/underscore.min.js"></script>
<script src="editormd/lib/sequence-diagram.min.js"></script>
<script src="editormd/lib/flowchart.min.js"></script>
<script src="editormd/lib/jquery.flowchart.min.js"></script>
<script src="editormd/editormd.min.js"></script>
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
<script>
    function submitComment() {
        $("#submitComment").css("display","block");
        $.post(
            "${basePath}comment/submitComment",
            {
                articleId:${article.articleId},
                replyMsg: $("#commentFrame").val()
            },
            function (json) {
                if (json.status == 200) {
                    location.reload();
                }else if (json.status == 400) {
                    $("#loginDownBtn").trigger("click");
                }else{
                    alert("服务器繁忙");
                }
            }
            )

    }
    function commentFocus() {
        $("#submitComment").slideDown("fast");
    }
    function commentBlur(flag) {
        $("#submitComment").slideUp("fast");
    }
    function login() {
        var url = "${basePath}user/login";
        var data = {
            username : $("#username").val(),
            password : $("#inputPassword").val()
        };
        var callBack = function(json){
            if (json.status == 200) {
                location.reload();
            }
            else{
                $("#loginmsg").text(json.msg);
            }
        }
        $.post(url,data,callBack)
    }

    function logout() {
        $.get("${basePath}/user/logout",function (json) {
            if (json.status == 200) {
                location.reload();
            }
        });
    }
</script>
</html>
