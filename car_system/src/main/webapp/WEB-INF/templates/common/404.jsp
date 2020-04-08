<%@page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../common/head.jsp"%>
<%@include file="../common/topbar.jsp"%>
<%@include file="../common/sidebar.jsp"%>


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            404 错误 页面
        </h1>
        <ol class="breadcrumb">
            <li><a href="/main"><i class="fa fa-dashboard"></i> 主页</a></li>
            <li class="active">404 错误</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="error-page">
            <h2 class="headline text-yellow"> 404</h2>

            <div class="error-content">
                <h3><i class="fa fa-warning text-yellow"></i> 哎呀！找该不到页面。</h3>

                <p style="font-size: 22px;">
                    请检查您的路径是否正确！<br/><br/>
                    同时, 您可以 <a href="/main">返回主页</a>
                </p>

            </div>
            <!-- /.error-content -->
        </div>
        <!-- /.error-page -->
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@include file="../common/bottom.jsp"%>
