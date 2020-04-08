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
                        <li class="active"><a href="#choose" data-toggle="tab">选择已有司机信息</a></li>
                        <li><a href="#add" data-toggle="tab">新建个人信息</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="active tab-pane" id="choose">
                            <table class="table table-bordered">
                                <tr>
                                    <th style="width: 80px;text-align:center">序号</th>
                                    <th style="text-align:center">姓名</th>
                                    <th style="text-align:center">性别</th>
                                    <th style="text-align:center">年龄</th>
                                    <th style="text-align:center">电话</th>
                                    <th style="text-align:center">邮箱</th>
                                    <th style="text-align:center">状态</th>
                                    <th style="text-align:center">操作</th>
                                </tr>

                                <c:forEach items="${driverList}" var="driver" varStatus="itemStatus">
                                    <tr style="text-align:center">
                                        <td><c:out value="${itemStatus.count}"/> </td>
                                        <td><c:out value="${driver.name}"/> </td>
                                        <td><c:out value="${driver.gender==0?'男':'女'}"/> </td>
                                        <td><c:out value="${driver.age}"/> </td>
                                        <td><c:out value="${driver.phone}"/> </td>
                                        <td><c:out value="${driver.email}"/> </td>
                                        <td><c:out value="${driver.status == 0?'可选':'已选'}"/> </td>
                                        <c:if test="${driver.status == 0}">
                                            <td><a href="/driver/addUser?id=${driver.id}&userId=<shiro:principal property="id"/>">选择</a></td>
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
                            <form class="form-horizontal" action="/driver/selfAdd" method="post">
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
                                                    <label for="inputName" class="col-sm-2 control-label">姓名:</label>
                                                    <div class="col-sm-10">
                                                        <input name="name" type="text" class="form-control" id="inputName" placeholder="输入姓名">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputName" class="col-sm-2 control-label">性别:</label>
                                                    <div class="col-sm-10">
                                                        <select name="gender" class="form-control" id="inputGender">
                                                            <option value="0">男</option>
                                                            <option value="1">女</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputAge" class="col-sm-2 control-label">年龄:</label>
                                                    <div class="col-sm-10">
                                                        <input name="age" type="text" class="form-control" id="inputAge" placeholder="输入年龄">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputPhone" class="col-sm-2 control-label">电话:</label>
                                                    <div class="col-sm-10">
                                                        <input name="phone" type="text" class="form-control" id="inputPhone" placeholder="输入电话">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputEmail" class="col-sm-2 control-label">邮箱:</label>
                                                    <div class="col-sm-10">
                                                        <input name="email" type="text" class="form-control" id="inputEmail" placeholder="输入邮箱">
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
