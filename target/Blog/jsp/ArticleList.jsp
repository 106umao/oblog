<%--
  Created by IntelliJ IDEA.
  User: 哒哒哒大橘猫
  Date: 2019/12/12
  Time: 11:04
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
    <div  class="list-group " style="box-shadow: 15px 10px 30px rgb(0, 60, 100); float:left ;width: 60%;" >
        <c:forEach var="article" items="${articleList}">
            <a href="article/articleDetails?articleId=${article.articleId}" class="list-group-item">
                <h3 class="list-group-item-heading">${article.title}</h3>
                <p class="content">${article.introduction}</p>
                <ul class="clearfix list_userbar">
                    <li style="float: left;"><img style="width: 30px;height: 30px;" src="image/${article.avatar}" class="avatar img-circle" alt="头像"/></li>
                    <li style="float: left;"><p>${article.username}</p></li>
                    <li style="float: right;"><span class="glyphicon glyphicon-thumbs-up">${article.star}</span></li>
                    <li style="float: right;"><span class="glyphicon glyphicon-comment">${article.msgCount}</span></li>
                </ul>
            </a>
        </c:forEach>
    </div>
    <div style="float: right;width: 30%;position:sticky;top:  30px;">
        <div style="float:right;width: 100%;" class="">
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><h3 class="text-center text-info"><span class="glyphicon glyphicon-tag"></span>分类</h3></li>
                <c:forEach items="${categories}" var="category">
                    <li><a href="article/articleList?categoryId=${category.categoryId}">${category.categoryName}<span class="badge">${category.articleCount}</span></a></li>
                </c:forEach>
            </ul>
        </div>
        <div style="float: right;" class="tags btn-group-xs">
            <h3 class="text-center text-info"><span class="glyphicon glyphicon-tags">标签</span></h3>
            <button type="button" class="btn btn-primary">Cras justo odio <span class="badge">14</span></button>
            <button type="button" class="btn btn-default">Dapibus ac facilisis in <span class="badge">33</span></button>
            <button type="button" class="btn btn-default">Morbi leo risus</button>
            <button type="button" class="btn btn-default">Porta ac consectetur ac</button>
            <button type="button" class="btn btn-default">Vestibulum at eros</button>
        </div>
    </div>
</div>

</body>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
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
