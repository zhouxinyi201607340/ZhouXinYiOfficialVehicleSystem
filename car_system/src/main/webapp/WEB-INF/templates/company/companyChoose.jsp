<%@page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../common/head.jsp"%>
<%@include file="../common/topbar.jsp"%>
<%@include file="../common/sidebar.jsp"%>
<div class="content-wrapper">
    <section class="content-header">
        <h1>
            个人主页(请先完善信息)
        </h1>
    </section>

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

    <!-- Main content -->
    <section class="content">

        <div class="row">
            <div class="col-md-3">

                <!-- Profile Image -->
                <div class="box box-primary">
                    <div class="box-body box-profile">
                        <img class="profile-user-img img-responsive img-circle" src="<shiro:principal property="icon"/>" alt="User profile picture">

                        <h3 class="profile-username text-center"><shiro:principal property="nickname"/></h3>

                        <p class="text-muted text-center"><shiro:principal property="roleName"/></p>

                        <ul class="list-group list-group-unbordered">
                            <li class="list-group-item" style="height: 38px">
                                <b class="pull-left" style="width: 100px;text-align: right">用户名:&nbsp;&nbsp;</b> <div class="pull-left"><shiro:principal property="username"/></div>
                            </li>
                        </ul>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->

            </div>
            <!-- /.col -->
            <div class="col-md-9">
                <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#choose" data-toggle="tab">选择已有公司信息</a></li>
                        <li><a href="#add" data-toggle="tab">新建公司信息</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="active tab-pane" id="choose">
                            <table class="table table-bordered">
                                <tr>
                                    <th style="width: 80px;text-align:center">序号</th>
                                    <th style="text-align:center">公司名</th>
                                    <th style="text-align:center">邮箱</th>
                                    <th style="text-align:center">状态</th>
                                    <th style="text-align:center">负责人</th>
                                </tr>

                                <c:forEach items="${companyList}" var="company" varStatus="itemStatus">
                                    <tr style="text-align:center">
                                        <td><c:out value="${itemStatus.count}"/> </td>
                                        <td><c:out value="${company.name}"/> </td>
                                        <td><c:out value="${company.email}"/> </td>
                                        <td>
                                            <c:if test="${company.status == 1}">
                                                可选
                                            </c:if>
                                            <c:if test="${company.status == 2}">
                                                已选
                                            </c:if>
                                            <c:if test="${company.status == 3}">
                                                已注销
                                            </c:if>
                                        </td>
                                        <td><c:out value="${company.leader}"/> </td>
                                        <c:if test="${company.status == 1}">
                                        <td><a href="/company/addUser?id=${company.id}&userId=<shiro:principal property="id"/>">选择</a></td>
                                        </c:if>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <!-- /.tab-pane -->
                        <div class="tab-pane" id="add">
                            <div class="col-sm-6">
                                <img class="img-responsive" src="<shiro:principal property="icon"/>" alt="Photo">
                            </div>
                            <form class="form-horizontal" action="/company/selfAdd" method="post">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="box box-primary">
                                            <div class="box-body">
                                                <div class="form-group">
                                                    <div style="display: none">
                                                        <input name="userId" value="<shiro:principal property="id"/>" type="text" id="inputUserId">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputName" class="col-sm-2 control-label">公司名:</label>
                                                    <div class="col-sm-10">
                                                        <input name="name" type="text" class="form-control" id="inputName" placeholder="输入公司名">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputEmail" class="col-sm-2 control-label">邮箱:</label>
                                                    <div class="col-sm-10">
                                                        <input name="email" type="text" class="form-control" id="inputEmail" placeholder="输入邮箱">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputLeader" class="col-sm-2 control-label">负责人:</label>
                                                    <div class="col-sm-10">
                                                        <input name="email" type="text" class="form-control" id="inputLeader" placeholder="输入负责人">
                                                    </div>
                                                </div>
                                                <button type="reset" class="btn btn-default">重置</button>
                                                <button type="submit" class="btn btn-info pull-right">提交</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.box-body -->
                            </form>
                        </div>
                        <!-- /.tab-pane -->
                    </div>
                    <!-- /.tab-content -->
                </div>
                <!-- /.nav-tabs-custom -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->

    </section>
    <!-- /.content -->

</div>
<script>

    function sendGender(gender){
        document.getElementById("inputGender").value=gender
    }
</script>
<%@include file="../common/bottom.jsp"%>
