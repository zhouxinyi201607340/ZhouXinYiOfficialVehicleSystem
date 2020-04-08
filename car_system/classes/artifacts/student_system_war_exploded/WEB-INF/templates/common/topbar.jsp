<%@page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<%@page import="java.util.*, java.text.SimpleDateFormat"%>
<header class="main-header">
        <!-- Logo -->
        <a href="#" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><i class="fa fa-fw fa-genderless"></i></span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>车辆</b>管理系统</span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>

            <span style="font-size: 26px;line-height: 50px;margin: auto 30%">欢迎<shiro:principal property="nickname"/>登录 </span>

            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="<shiro:principal property="icon"/>" class="user-image" alt="User Image">
                            <span class="hidden-xs"><shiro:principal property="nickname"/></span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- User image -->
                            <li class="user-header">
                                <img src="<shiro:principal property="icon"/>" class="img-circle" alt="User Image">

                                <p>
                                    <shiro:principal property="nickname"/>
                                    <small>
                                        <%
                                            Date dat = new Date();
                                            SimpleDateFormat sdf = new SimpleDateFormat("yyyy年 MM月 dd日 HH:mm:ss");
                                            String date = sdf.format(dat);
                                        %>
                                        <%=date%>
                                </p>
                            </li>
                            <!-- Menu Footer-->
                            <li class="user-footer">
<%--                                <div class="pull-left">--%>
<%--                                    <a href="/user/info" class="btn btn-default btn-flat">个人信息</a>--%>
<%--                                </div>--%>
<%--&lt;%&ndash;                                <div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--                                <div class="pull-right">--%>
<%--                                    <button type="button" class="btn btn-default btn-flat" data-toggle="modal" data-target="#update-password" style="width: 100px; float:left">--%>
<%--                                        修改密码--%>
<%--                                    </button>--%>
<%--                                    <a href="/auth/logout" class="btn btn-default btn-flat">退出</a>--%>
<%--                                </div>--%>
                                <div class="btn-group" style="width: 100%">
                                    <a href="/user/info" class="btn btn-default" style="width: 40%">
                                        个人信息
                                    </a>
                                    <a class="btn btn-default" style="width: 40%" data-toggle="modal" data-target="#update-password">
                                        修改密码
                                    </a>
                                    <a href="/auth/logout" class="btn btn-default" style="width: 20%">
                                        退出
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>

<div class="modal modal-info fade" id="update-password">
    <form class="form-horizontal" method="post" action="/user/updatePassword">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">修改密码</h4>
                </div>
                <div class="modal-body">

                    <div class="box-body">
                        <div class="form-group">
                            <label for="inputOld" class="col-sm-2 control-label">旧密码</label>

                            <div class="col-sm-10">
                                <input name="oldPwd" type="password" class="form-control" id="inputOld" placeholder="请输入旧密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputNew" class="col-sm-2 control-label">新密码</label>

                            <div class="col-sm-10">
                                <input name="newPwd" type="password" class="form-control" id="inputNew" placeholder="请输入新密码">
                            </div>
                        </div>
                    </div>
                    <!-- /.box-footer -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-outline">提交</button>
                </div>

            </div>
            <!-- /.modal-content -->
        </div>
    </form>

    <!-- /.modal-dialog -->
</div>
