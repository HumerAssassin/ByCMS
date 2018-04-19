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
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html class="no-js" lang="zh-CN">
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>管理员登录</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Administrator logins the system through this page." />
    <meta name="keywords" content="Administrator,Login" />

    <link rel="shortcut icon" href='favicon.ico">
    <link href="https://fonts.googleapis.com/
    css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/animate.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">

    <script type="text/javascript" src="WEB-INF/js/modernizr-2.6.2.min.js"></script>

    <script type="text/javascript">
        function login() {
            var th=document.form1;
            if(th.username.value==""){
                alert("请输入用户名！");
                th.username.focus();
                return;
            }
            if(th.pswd.value==""){
                alert("请输入密码！");
                th.pswd.focus();
                return;
            }

            th.action="<%=path%>/servlet/LoginAction";
            this.submit();
        }
    </script>
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <ul class="menu">
                    <li>
                        <a href="userlogin.jsp">会员登录</a>
                    </li>
                    <li class="active">
                        <a href="adminlogin.jsp">管理员登录</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <form name="form1" action="#" class="fh5co-form animate-box" data-animate-effect="fadeIn" method="post">
                <h2>管理员登录</h2>
                <div class="form-group">
                    <label for="username" class="sr-only">Username</label>
                    <input name="username" type="text" class="form-control" id="username" placeholder="管理员账号" autocomplete="off">
                </div>
                <div class="form-group">
                    <label for="password" class="sr-only">Password</label>
                    <input name="pswd" type="password" class="form-control" id="password" placeholder="管理员密码" autocomplete="off">
                </div>
                <div class="form-group">
                    <button type="button" name="" value="" class="btn btn-primary" onclick="login()">登录</button>
                </div>
            </form>
        </div>
    </div>

    <div class="row" style="padding-top: 60px;clear: both;">
        <div class="col-md-12 text-center">
            <p>
                <small>&copy; 永远相信美好的事情即将发生</small>
            </p>
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
