<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>公务车辆租赁系统 | 登录</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="../../../static/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../../static/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="../../../static/bower_components/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../../static/css/AdminLTE.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="../../../static/plugins/iCheck/square/blue.css">

    <style type="text/css">
        .bg {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            background-size: cover;


            background: url('../../../static/bg1.jpg') no-repeat fixed center 0;
            -webkit-background-size: cover;
            -o-background-size: cover;
            -moz-background-size: cover;
            -ms-background-size: cover;
            overflow: hidden;
        }

        .rBox{
            background:#111111;
            opacity:0.8;
            border-radius:30px;
        }

        .inp{
            border-radius: 3px;
        }
    </style>
</head>
<body class="hold-transition login-page bg" >
<div >
    <div class="login-box">

        <div class="login-logo">
            <a href="#"><b>系统</b>登录</a>
        </div>

        <div class="login-box-body rBox">
            <c:if test="${param.msg != null}">
                <c:choose>
                    <c:when test="${param.msg.contains(\"成功\")}">
                        <div class="alert alert-success alert-dismissible" style="overflow: auto">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <h4><i class="icon fa fa-check"></i> 成功</h4>
                                ${param.msg}
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="alert alert-warning alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                            <h4><i class="icon fa fa-warning"></i> 失败</h4>
                                ${param.msg}
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:if>
            <p class="login-box-msg">欢迎登录车辆租赁管理系统</p>
            <form action="${pageContext.request.contextPath}/auth/login" method="post">
                <div class="form-group has-feedback">
                    <input type="text" class="form-control inp" placeholder="请输入用户名" name="username">
                    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" class="form-control inp" placeholder="请输入密码" name="password">
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>
                <div class="row">
                    <!-- /.col -->
                    <div class="col-xs-3"></div>
                    <div class="col-xs-6">
                        <button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
                    </div>
                    <div class="col-xs-3"></div>
                    <!-- /.col -->
                </div>
            </form>
            <a href="/register" class="text-center" style="float: right">没有账号?</a>
        </div>
    </div>
</div>
    <!-- jQuery 3 -->
    <script src="../../../static/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="../../../static/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- iCheck -->
    <script src="../../../static/plugins/iCheck/icheck.min.js"></script>

    <script type="text/javascript">
        $(function () {
            $('input').iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%' /* optional */
            });
        });
    </script>
</body>
</html>
