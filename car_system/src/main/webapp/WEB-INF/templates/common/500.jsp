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
            500 错误 页面
        </h1>
        <ol class="breadcrumb">
            <li><a href="/main"><i class="fa fa-dashboard"></i> 主页</a></li>
            <li class="active">500 错误</li>
        </ol>
    </section>

    <c:if test="${msg != null}">
        <div class="alert alert-warning alert-dismissible">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <h4><i class="icon fa fa-warning"></i> 失败</h4>
                ${msg}
        </div>
    </c:if>
    <c:if test="${info != null}">
        <div class="alert alert-warning alert-dismissible">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <h4><i class="icon fa fa-warning"></i> 信息</h4>
                ${info}
        </div>
    </c:if>

    <!-- Main content -->
    <section class="content">

        <div class="error-page">
            <h2 class="headline text-red">500</h2>

            <div class="error-content">
                <h3><i class="fa fa-warning text-red"></i>  哎呀！页面出错了。</h3>

                <p style="font-size: 22px;">
                    我们将立即着手修复。<br/><br/>
                    同时, 您可以 <a href="/main">返回主页</a>
                </p>

            </div>
        </div>
        <!-- /.error-page -->

    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@include file="../common/bottom.jsp"%>
