<%@page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../common/head.jsp"%>
<%@include file="../common/topbar.jsp"%>
<jsp:include page="../common/sidebar.jsp">
    <jsp:param name="activeUri" value="user"/>
</jsp:include>

<div class="content-wrapper">
    <section class="content-header">
        <h1>账号信息列表</h1>
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

    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header with-border">
                        <div style="overflow: hidden">
                            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#add-modal-info" style="width: 100px; float:left">
                                新建
                            </button>
                        </div>

                        <div class="modal modal-info fade" id="add-modal-info">
                            <form class="form-horizontal" method="post" action="/user/add">

                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title">新增账号</h4>
                                        </div>
                                        <div class="modal-body">

                                            <div class="box-body">
                                                <div class="form-group">
                                                    <label for="inputNickname" class="col-sm-2 control-label">昵称</label>

                                                    <div class="col-sm-10">
                                                        <input name="nickname" type="text" class="form-control" id="inputNickname" placeholder="请输入昵称">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputUsername" class="col-sm-2 control-label">用户名</label>

                                                    <div class="col-sm-10">
                                                        <input name="username" type="text" class="form-control" id="inputUsername" placeholder="请输入用户名">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputPassword" class="col-sm-2 control-label">密码</label>

                                                    <div class="col-sm-10">
                                                        <input name="password" type="password" class="form-control" id="inputPassword" placeholder="请输入新密码">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputRole" class="col-sm-2 control-label">角色</label>

                                                    <div class="col-sm-10">
                                                        <select name="roleId" class="form-control" id="inputRole">
                                                            <c:forEach items="${roleList}" var="role" varStatus="itemStatus">
                                                                <option value="${role.id}">${role.description}</option>
                                                            </c:forEach>
                                                        </select>
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
                        <!-- /.modal -->

                        <div class="modal fade" id="delete-modal-default">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title">确定删除?</h4>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">取消</button>
                                        <a id="deleteA">
                                            <button type="button" class="btn btn-primary">确定</button>
                                        </a>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <!-- /.modal -->

                        <div class="modal modal-info fade" id="update-modal-info">
                            <form class="form-horizontal" method="post" action="/user/update">

                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title">修改账号</h4>
                                        </div>
                                        <div class="box-body">
                                            <input name="id" type="text" id="inputId" style="display: none">
                                            <div class="form-group">
                                                <label for="inputNickname2" class="col-sm-2 control-label">昵称</label>

                                                <div class="col-sm-10">
                                                    <input name="nickname" type="text" class="form-control" id="inputNickname2" placeholder="请输入昵称">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputUsername2" class="col-sm-2 control-label">用户名</label>

                                                <div class="col-sm-10">
                                                    <input name="username" type="text" class="form-control" id="inputUsername2" placeholder="请输入用户名">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputPassword2" class="col-sm-2 control-label">密码</label>

                                                <div class="col-sm-10">
                                                    <input name="password" type="password" class="form-control" id="inputPassword2" placeholder="请输入新密码">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputRole2" class="col-sm-2 control-label">角色</label>

                                                <div class="col-sm-10">
                                                    <select name="roleId" class="form-control" id="inputRole2">
                                                        <c:forEach items="${roleList}" var="role" varStatus="itemStatus">
                                                            <option value="${role.id}">${role.description}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>

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
                        <!-- /.modal -->

                        <div class="box-tools">
                            <form action="/user/list" method="get" class="input-group input-group-sm" style="width: 150px;">
                                <input type="text" name="nickname" class="form-control pull-right" placeholder="输入昵称">

                                <div class="input-group-btn">
                                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                                </div>
                            </form>
                        </div>

                        <div class="box-body">
                            <table class="table table-bordered">
                                <tr>
                                    <th style="width: 160px;text-align:center"><span>序号</span></th>
                                    <th style="text-align:center">昵称</th>
                                    <th style="text-align:center">用户名</th>
                                    <th style="text-align:center">头像</th>
                                    <th style="text-align:center">角色</th>
                                    <th style="text-align:center">操作</th>
                                </tr>
                                <c:forEach items="${dataList}" var="user" varStatus="termStatus">
                                    <tr style="text-align:center">
                                        <td><span style="line-height: 50px">${(termStatus.index%10) + 1}</span></td>
                                        <td><span style="line-height: 50px">${user.nickname}</span></td>
                                        <td><span style="line-height: 50px">${user.username}</span></td>
                                        <td><img src="${user.icon}" height="50px" width="50px"/> </td>
                                        <td><span style="line-height: 50px">${user.roleName}</span></td>
                                        <c:if test="${user.id != 1}">
                                        <td>
                                            <div class="btn-group" style="overflow: hidden">
                                                <button onclick="sendValue('${user.id}','${user.nickname}','${user.username}','${user.roleId}')" type="button" class="btn btn-info" data-toggle="modal" data-target="#update-modal-info">编辑</button>
                                                <button type="button" onclick="sendDeleteId(${user.id})" class="btn btn-default" data-toggle="modal" data-target="#delete-modal-default">删除</button>
                                            </div>
                                        </td>
                                        </c:if>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>

                        <div class="box-footer clearfix">
                            <ul class="pagination pagination-sm no-margin pull-right">
                                <c:set var="page" value="${param.page==null?1:param.page}"/>
                                <li><a href="/user/list?page=${page - (page == 1?0:1)}&nickname=${param.nickname}">&laquo;</a></li>
                                <c:forEach var="item" varStatus="status" begin="1" end="${pages}">
                                    <li>
                                        <a href="/user/list?page=${status.index}&nickname=${param.nickname}">${status.index}</a>
                                    </li>
                                </c:forEach>
                                <li><a href="/user/list?page=${page + (page == pages?0:1)}&nickname=${param.nickname}">&raquo;</a></li>
                                <li><span>&nbsp;共有${total}条数据&nbsp;</span> </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<script>
    function sendValue(id,nickname,username,roleId) {
        document.getElementById("inputId").value = id;
        document.getElementById("inputNickname2").value = nickname;
        document.getElementById("inputUsername2").value = username;
        document.getElementById("inputRole2").value = roleId
    }

    function sendDeleteId(id) {
        document.getElementById("deleteA").href="/user/delete?id="+id
    }
</script>
<%@include file="../common/bottom.jsp"%>
