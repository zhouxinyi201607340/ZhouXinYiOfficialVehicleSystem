<%@page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>公务车辆租赁系统 | 注册</title>
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


            background: url('../../../static/bg2.jpg') no-repeat fixed center 0;
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
<body class="hold-transition register-page bg">

<div class="register-box">
    <div class="register-logo">
        <a href="#" style="color: #3c8dbc"><b>系统</b>注册</a>
    </div>

    <div class="register-box-body rBox">
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
        <p class="login-box-msg">欢迎注册车辆租赁管理系统</p>

        <form action="/auth/register" method="post">
            <div class="form-group has-feedback">
                <input name="nickname" type="text" class="form-control inp" placeholder="请输入昵称">
                <span class="glyphicon glyphicon-text-color form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <select name="roleId" class="form-control" id="inputGender">
                    <option value="2">用车公司</option>
                    <option value="3">司机</option>
                </select>
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input name="username" type="text" class="form-control inp" placeholder="请输入用户名">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input name="password" type="password" class="form-control inp" placeholder="请输入密码">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input name="rePassword" type="password" class="form-control inp" placeholder="请再次输入密码">
                <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
            </div>
            <div class="row">

                <div class="col-xs-3"></div>
                <div class="col-xs-6">
                    <button type="submit" class="btn btn-primary btn-block btn-flat inp" style="float: right">注册</button>

                </div>
                <div class="col-xs-3"></div>
            </div>
        </form>

        <a href="login.jsp" class="text-center">已有账号?</a>
    </div>
    <!-- /.form-box -->
</div>

<!-- jQuery 3 -->
<script src="../../../static/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="../../../static/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="../../../static/plugins/iCheck/icheck.min.js"></script>
<script>
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

