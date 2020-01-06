
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
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 3 | Dashboard</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="admin/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bbootstrap 4 -->
  <link rel="stylesheet" href="admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="admin/plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="admin/dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="admin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="admin/plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="admin/plugins/summernote/summernote-bs4.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <link rel="stylesheet" href="editormd/css/editormd.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

    <!-- /.navbar -->
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <!-- Left navbar links -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="admin/#"><i class="fas fa-bars"></i></a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="index.jsp" class="nav-link">Home</a>
            </li>
        </ul>
        <!-- Right navbar links -->
    </nav>
    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <!-- Brand Logo -->
        <a href="admin/index3.html" class="brand-link">
            <img src="admin/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
                 style="opacity: .8">
            <span class="brand-text font-weight-light">Blog后台管理</span>
        </a>

        <!-- Sidebar -->
        <div class="sidebar">
            <!-- Sidebar user panel (optional) -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">
                    <img src="image/${loginUser.avatar}" class="img-circle elevation-2" alt="User Image">
                </div>
                <div class="info">
                    <a href="#" class="d-block">${loginUser.username}</a>
                </div>
            </div>


            <!-- Sidebar Menu -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                    <!-- Add icons to the links using the .nav-icon class
                         with font-awesome or any other icon font library -->
                    <li class="nav-item has-treeview menu-open">
                        <a href="admin/#" class="nav-link">
                            <i class="nav-icon fa fa-book"></i>
                            <p>文章管理
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="adminC/articleList" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>文章列表</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="adminC/AddArticle" class="nav-link active">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>发布文章</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item has-treeview">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-user"></i>
                            <p>用户管理
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="adminC/userList" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>用户列表</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="admin/AddUser.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>添加用户</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item has-treeview">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-tags"></i>
                            <p>类别管理
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="adminC/categoryList" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>类别列表</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="admin/AddCategory.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>添加类别</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item has-treeview">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas  fa-comments"></i>
                            <p>用户言论
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="adminC/commentList" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>评论管理</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="adminC/replyList" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>回复管理</p>
                                </a>
                            </li>
                        </ul>
                    </li>

                </ul>

            </nav>
            <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
    </aside>


  <!-- Content Wrapper. Contains page content -->
  <div class="container" style="position: relative;left: 50px;">
    <form action="showtext" method="post">
      <div style="margin: 0 25%;" class="col-lg-6">

          <div class="input-group">


          </div>
      </div>
      <div style="margin: 0 25%;" class="col-lg-6">
        <div class="input-group ">

          <input type="text" id="title" class="form-control" name="title" placeholder="输入文章标题">
          <span class="input-group-btn">
            <select  id="category" class="selectpicker btn btn-default" data-style="btn-primary">
                <option>类别</option>
              <c:forEach var="category" items="${categoryList}">
                <option>${category.categoryName}</option>
              </c:forEach>
            </select>
          </span>
          <span class="input-group-btn">
                                <input class="btn btn-default" type="button" onclick="release()" value="发表文章">
                          </span>
        </div><!-- /input-group -->
      </div><!-- /.col-lg-6 -->
      <div id="my-editormd">
        <textarea id="my-editormd-markdown-doc" name="my-editormd-markdown-doc" style="display:none;"></textarea>
      </div>
    </form>
  </div>
  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="admin/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="admin/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="admin/plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="admin/plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="admin/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="admin/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="admin/plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="admin/plugins/moment/moment.min.js"></script>
<script src="admin/plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="admin/plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="admin/dist/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="admin/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="admin/dist/js/demo.js"></script>

<script src="editormd/editormd.min.js"></script>

<script type="text/javascript">
  let editor
  $(function() {
      editor = editormd("my-editormd", {//注意1：这里的就是上面的DIV的id属性值
      width   : "100%",
      height  : 750,
      syncScrolling : "single",
      path    : "${basePath}editormd/lib/",//注意2：你的路径
      saveHTMLToTextarea : true,//注意3：这个配置，方便post提交表单
      tocm:true,
      /**上传图片相关配置如下*/
      imageUpload : true,
      imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
      imageUploadURL : "[[../uploadimg}]]",//注意你后端的上传图片服务地址
    });
  });
</script>
<script>
  function release() {
    $.post(
            '${basePath}adminC/addArticle',
            {
              userId:'${loginUser.userId}',
              title:$('#title').val(),
              content:editor.getMarkdown(),
              categoryName: $('#category').val()
            },
            function (json) {
              if (json.status === 200) {
                alert("发布成功");
                location.href = '${basePath}adminC/articleList';
              }else {
                alert("服务器繁忙")
              }
            });
  }
</script>
</body>
</html>
