<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 2018/4/11
  Time: 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" import="java.util.*" language="java" %>
<%
    String path=request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"
            +request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>用户注册</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Users register through this page" />
    <meta name="keywords" content="User,Sign In" />

    <link rel="shortcut icon" href='favicon.ico">
    <link href="https://fonts.googleapis.com/
    css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/animate.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">

    <script type="text/javascript" src="WEB-INF/js/modernizr-2.6.2.min.js"></script>

    <script type="text/javascript">
        function dosubmit(){

            var th = document.form1;
            if(th.username.value==""){
                alert("用户名不能为空！");
                th.username.focus();
                return;
            }
            if(th.pswd.value==""){
                alert("密码不能为空！");
                th.pswd.focus();
                return;
            }
            if(th.pswd.value!=th.repswd.value){
                alert("两次密码不一致！");
                th.pswd.focus();
                th.repswd.focus();
                return;
            }
            th.action="<%=path%>/servlet/SignupAction";
            th.submit();

        }
    </script>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <!-- Start Sign In Form -->
                <form action="" name="form1" class="fh5co-form animate-box" data-animate-effect="fadeIn" method="post">
                    <h2>会员注册</h2>
                    <div class="form-group">
                        <label for="name" class="sr-only">Username</label>
                        <input type="text" name="username" class="form-control" id="name" placeholder="用户名" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="password" class="sr-only">Password</label>
                        <input type="password" name="pswd" class="form-control" id="password" placeholder="密码" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="re-password" class="sr-only">RePassword</label>
                        <input type="password" name="repswd" class="form-control" id="re-password" placeholder="确认密码" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <p>已有账户？<a href="userlogin.jsp">直接登录</a></p>
                    </div>
                    <div class="form-group">
                        <button type="button" name="" onclick="dosubmit()" class="btn btn-primary">注册</button>
                        <input type="submit" value="注册" class="btn btn-primary">
                    </div>
                </form>
                <!-- END Sign In Form -->

            </div>
        </div>

        <div class="row" style="padding-top: 60px;clear: both;">
            <div class="col-md-12 text-center">
                <p>
                    <small>&copy; 永远相信美好的事情即将发生</small>
                </p>
            </div>
        </div>

    </div>

    <!-- jQuery -->
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <!-- Placeholder -->
    <script type="text/javascript" src="js/jquery.placeholder.min.js"></script>
    <!-- Waypoints -->
    <script type="text/javascript" src="js/jquery.waypoints.min.js"></script>
    <!-- Main JS -->
    <script type="text/javascript" src="js/main.js"></script>
</body>
</html>
