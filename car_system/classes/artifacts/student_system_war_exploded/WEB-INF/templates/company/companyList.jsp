<%@page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../common/head.jsp"%>
<%@include file="../common/topbar.jsp"%>
<jsp:include page="../common/sidebar.jsp">
    <jsp:param name="activeUri" value="company"/>
</jsp:include>


<div class="content-wrapper">
    <section class="content-header">
        <h1>用车公司列表</h1>
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
                            <form class="form-horizontal" method="post" action="/company/add">

                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title">新增公司</h4>
                                        </div>
                                        <div class="modal-body">

                                            <div class="box-body">
                                                <div class="form-group">
                                                    <label for="inputName" class="col-sm-2 control-label">名称</label>

                                                    <div class="col-sm-10">
                                                        <input name="name" type="text" class="form-control" id="inputName" placeholder="请输入名称">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="inputLeader" class="col-sm-2 control-label">负责人</label>

                                                    <div class="col-sm-10">
                                                        <input name="leader" type="text" class="form-control" id="inputLeader" placeholder="请输入负责人">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="inputEmail" class="col-sm-2 control-label">邮箱</label>

                                                    <div class="col-sm-10">
                                                        <input name="email" type="text" class="form-control" id="inputEmail" placeholder="请输入邮箱">
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
                            <form class="form-horizontal" method="post" action="/company/update">

                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title">修改公司</h4>
                                        </div>
                                        <div class="modal-body">

                                            <div class="box-body">
                                                <div class="form-group" style="display: none">
                                                    <label for="inputId" class="col-sm-2 control-label">id</label>

                                                    <div class="col-sm-10">
                                                        <input name="id" type="text" class="form-control" id="inputId">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputName2" class="col-sm-2 control-label">名称</label>

                                                    <div class="col-sm-10">
                                                        <input name="name" type="text" class="form-control" id="inputName2">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputLeader2" class="col-sm-2 control-label">负责人</label>

                                                    <div class="col-sm-10">
                                                        <input name="leader" type="text" class="form-control" id="inputLeader2">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputEmail2" class="col-sm-2 control-label">邮箱</label>

                                                    <div class="col-sm-10">
                                                        <input name="email" type="text" class="form-control" id="inputEmail2">
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

                        <div class="box-tools">
                            <form action="/company/list" method="get" class="input-group input-group-sm" style="width: 1000px ;overflow: hidden">

                                <label style="float: right;margin-bottom: 0">
<%--                                    <span style="float: left; width: 50px;height: 30px;text-align: center;line-height:30px;">名称:</span>--%>
                                    <input type="text" name="name" class="form-control pull-right" placeholder="输入名称">
                                </label>
                                <label style="float: right;margin-bottom: 0; margin-right: 30px">
<%--                                    <span style="float: left; width: 50px;height: 30px;text-align: center;line-height:30px;">负责人:</span>--%>
                                    <input type="text" name="leader" class="form-control pull-right" placeholder="输入负责人">
                                </label>
                                <div class="input-group-btn">
                                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="box-body">
                        <table class="table table-bordered">
                            <tr>
                                <th style="width: 160px;text-align:center"><span>序号</span></th>
                                <th style="text-align:center">名称</th>
                                <th style="text-align:center">负责人</th>
                                <th style="text-align:center">邮箱</th>
                                <th style="text-align:center">状态</th>
                                <th style="text-align:center">操作</th>
                            </tr>

                            <c:forEach items="${dataList}" var="company" varStatus="companyStatus">
                                <tr style="text-align:center">
                                    <td><c:out value="${(companyStatus.index%10) + 1}"/> </td>
                                    <td><c:out value="${company.name}"/> </td>
                                    <td><c:out value="${company.leader}"/> </td>
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
                                    <td>
                                        <div class="btn-group" style="overflow: hidden">
                                            <button onclick="sendValue('${company.id}','${company.name}','${company.leader}','${company.email}')" type="button" class="btn btn-info" data-toggle="modal" data-target="#update-modal-info">编辑</button>
                                            <button type="button" onclick="sendDeleteId(${company.id})" class="btn btn-default" data-toggle="modal" data-target="#delete-modal-default">删除</button>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>

                    <div class="box-footer clearfix">
                        <ul class="pagination pagination-sm no-margin pull-right">
                            <c:set var="page" value="${param.page==null?1:param.page}"/>
                            <li><a href="/company/list?page=${page - (page == 1?0:1)}&name=${param.name}&leader=${param.leader}">&laquo;</a></li>
                            <c:forEach var="item" varStatus="status" begin="1" end="${pages}">
                                <li>
                                    <a href="/company/list?page=${status.index}&name=${param.name}&leader=${param.leader}">${status.index}</a>
                                </li>
                            </c:forEach>
                            <li><a href="/company/list?page=${page + (page == pages?0:1)}&name=${param.name}&leader=${param.leader}">&raquo;</a></li>
                            <li><span>&nbsp;共有${total}条数据&nbsp;</span> </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>


<script>
    function sendValue(id,name,leader,email) {
        document.getElementById("inputId").value = id;
        document.getElementById("inputName2").value = name;
        document.getElementById("inputLeader2").value = leader
        document.getElementById("inputEmail2").value = email
    }

    function sendDeleteId(id) {
        document.getElementById("deleteA").href="/company/delete?id="+id
    }
</script>
<%@include file="../common/bottom.jsp"%>
