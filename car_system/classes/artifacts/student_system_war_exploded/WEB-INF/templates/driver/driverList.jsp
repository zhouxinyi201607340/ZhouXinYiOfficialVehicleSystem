<%@page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://com.web.output.tag1" prefix="customShiro"%>
<%@include file="../common/head.jsp"%>
<%@include file="../common/topbar.jsp"%>
<jsp:include page="../common/sidebar.jsp">
    <jsp:param name="activeUri" value="driver"/>
</jsp:include>


<div class="content-wrapper">
    <section class="content-header">
        <h1>司机列表</h1>
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
                            <form class="form-horizontal" method="post" action="/driver/add">

                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title">新增司机</h4>
                                        </div>
                                        <div class="modal-body">

                                            <div class="box-body">
                                                <div class="form-group">
                                                    <label for="inputName" class="col-sm-2 control-label">姓名</label>

                                                    <div class="col-sm-10">
                                                        <input name="name" type="text" class="form-control" id="inputName" placeholder="请输入姓名">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="inputGender" class="col-sm-2 control-label">性别</label>
                                                    <div class="col-sm-10">
                                                        <select name="gender" class="form-control" id="inputGender">
                                                            <option value="0">男</option>
                                                            <option value="1">女</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="inputEmail" class="col-sm-2 control-label">邮箱</label>

                                                    <div class="col-sm-10">
                                                        <input name="email" type="text" class="form-control" id="inputEmail" placeholder="请输入邮箱">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="inputPhone" class="col-sm-2 control-label">电话</label>

                                                    <div class="col-sm-10">
                                                        <input name="phone" type="text" class="form-control" id="inputPhone" placeholder="请输入电话">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="inputAge" class="col-sm-2 control-label">年龄</label>

                                                    <div class="col-sm-10">
                                                        <input name="age" type="text" class="form-control" id="inputAge" placeholder="请输入年龄">
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
                            <form class="form-horizontal" method="post" action="/driver/update">

                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title">修改司机</h4>
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
                                                    <label for="inputName2" class="col-sm-2 control-label">姓名</label>

                                                    <div class="col-sm-10">
                                                        <input name="name" type="text" class="form-control" id="inputName2" placeholder="请输入姓名">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="inputGender2" class="col-sm-2 control-label">性别</label>
                                                    <div class="col-sm-10">
                                                        <select name="gender" class="form-control" id="inputGender2">
                                                            <option value="0">男</option>
                                                            <option value="1">女</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="inputEmail2" class="col-sm-2 control-label">邮箱</label>

                                                    <div class="col-sm-10">
                                                        <input name="email" type="text" class="form-control" id="inputEmail2" placeholder="请输入邮箱">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="inputPhone2" class="col-sm-2 control-label">电话</label>

                                                    <div class="col-sm-10">
                                                        <input name="phone" type="text" class="form-control" id="inputPhone2" placeholder="请输入电话">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="inputAge2" class="col-sm-2 control-label">年龄</label>

                                                    <div class="col-sm-10">
                                                        <input name="age" type="text" class="form-control" id="inputAge2" placeholder="请输入年龄">
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

                        <div class="modal modal-info fade" id="review-modal-info">
                            <form class="form-horizontal" method="post" action="/driver/review">

                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title">审核司机</h4>
                                        </div>
                                        <div class="modal-body">

                                            <div class="box-body">
                                                <div class="form-group" style="display: none">
                                                    <label for="inputId3" class="col-sm-2 control-label">id</label>

                                                    <div class="col-sm-10">
                                                        <input name="id" type="text" class="form-control" id="inputId3">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="inputStatus3" class="col-sm-2 control-label">状态</label>
                                                    <div class="col-sm-10">
                                                        <select name="status" class="form-control" id="inputStatus3">
                                                            <option value="2">待审核</option>
                                                            <option value="3">通过</option>
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

                        <div class="box-tools">
                            <form action="/driver/list" method="get" class="input-group input-group-sm" style="width: 1000px ;overflow: hidden">

                                <label style="float: right;margin-bottom: 0">
                                    <%--                                    <span style="float: left; width: 50px;height: 30px;text-align: center;line-height:30px;">名称:</span>--%>
                                    <input type="text" name="name" class="form-control pull-right" placeholder="输入名称">
                                </label>
                                <label style="float: right;margin-bottom: 0; margin-right: 30px">
                                    <%--                                    <span style="float: left; width: 50px;height: 30px;text-align: center;line-height:30px;">负责人:</span>--%>
                                    <input type="text" name="nickname" class="form-control pull-right" placeholder="输入昵称">
                                </label>
                                <div class="input-group-btn">
                                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="box-body">
                        <table class="table table-bordered table-hover">
                            <tr>
                                <th style="width: 65px;text-align:center"><span>序号</span></th>
                                <th style="text-align:center">姓名</th>
                                <th style="text-align:center">车牌号</th>
                                <th style="text-align:center">昵称</th>
                                <th style="text-align:center">性别</th>
                                <th style="text-align:center">邮箱</th>
                                <th style="text-align:center">电话</th>
                                <th style="text-align:center">信用积分</th>
                                <th style="text-align:center">价格</th>
                                <th style="text-align:center">年龄</th>
                                <th style="text-align:center">状态</th>
                                <th style="text-align:center">编号</th>
                                <customShiro:hasAnyPermission name="/driver/update,/driver/delete,/chooseCar/list">
                                    <th style="text-align:center;width: 200px">操作</th>
                                </customShiro:hasAnyPermission>
                            </tr>

                            <c:forEach items="${dataList}" var="driver" varStatus="companyStatus">
                                <tr style="text-align:center">
                                    <td><c:out value="${(companyStatus.index%10) + 1}"/> </td>
                                    <td><c:out value="${driver.name}"/> </td>
                                    <td><c:out value="${driver.carNumber == null? '暂未选车' : driver.carNumber}"/> </td>
                                    <td><c:out value="${driver.nickname == null? '暂未注册' : driver.nickname}"/> </td>
                                    <td><c:out value="${driver.gender == 0 ? '男' : '女'}"/> </td>
                                    <td><c:out value="${driver.email}"/> </td>
                                    <td><c:out value="${driver.phone}"/> </td>
                                    <td><c:out value="${driver.credit}"/> </td>
                                    <td><c:out value="${driver.price}元/分钟"/> </td>
                                    <td><c:out value="${driver.age}"/> </td>
                                    <td>
                                        <c:if test="${driver.status == 0}">待注册</c:if>
                                        <c:if test="${driver.status == 1}">待选车</c:if>
                                        <c:if test="${driver.status == 2}">待审核</c:if>
                                        <c:if test="${driver.status == 3}">可用</c:if>
                                        <c:if test="${driver.status == 4}">进行中</c:if>
                                        <c:if test="${driver.status == 5}">禁用</c:if>
                                    </td>
                                    <td><c:out value="${driver.dno}"/> </td>
                                    <customShiro:hasAnyPermission name="/driver/update,/driver/delete,/driver/review,/chooseCar/list">
                                        <td>
                                            <div class="btn-group" style="overflow: hidden">
                                                <customShiro:hasAnyPermission name="/driver/update">
                                                    <button onclick="sendValue('${driver.id}','${driver.name}','${driver.gender}','${driver.email}','${driver.phone}','${driver.age}','${driver.status}')" type="button" class="btn btn-info" data-toggle="modal" data-target="#update-modal-info">编辑</button>
                                                </customShiro:hasAnyPermission>
                                                <customShiro:hasAnyPermission name="/driver/review">
                                                    <c:if test="${driver.status == 2}">
                                                        <button onclick="sendStatus('${driver.id}','${driver.status}')" type="button" class="btn btn-success" data-toggle="modal" data-target="#review-modal-info">审核</button>
                                                    </c:if>
                                                </customShiro:hasAnyPermission>
                                                <customShiro:hasAnyPermission name="/driver/delete">
                                                    <button type="button" onclick="sendDeleteId(${driver.id})" class="btn btn-default" data-toggle="modal" data-target="#delete-modal-default">删除</button>
                                                </customShiro:hasAnyPermission>
                                            </div>
                                        </td>
                                    </customShiro:hasAnyPermission>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>

                    <div class="box-footer clearfix">
                        <ul class="pagination pagination-sm no-margin pull-right">
                            <c:set var="page" value="${param.page==null?1:param.page}"/>
                            <li><a href="/driver/list?page=${page - (page == 1?0:1)}&name=${param.name}&nickname=${param.nickname}">&laquo;</a></li>
                            <c:forEach var="item" varStatus="status" begin="1" end="${pages}">
                                <li>
                                    <a href="/driver/list?page=${status.index}&name=${param.name}&nickname=${param.nickname}">${status.index}</a>
                                </li>
                            </c:forEach>
                            <li><a href="/driver/list?page=${page + (page == pages?0:1)}&name=${param.name}&nickname=${param.nickname}">&raquo;</a></li>
                            <li><span>&nbsp;共有${total}条数据&nbsp;</span> </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>


<script>
    function sendValue(id,name,gender,email,phone,age,status) {
        document.getElementById("inputId").value = id;
        document.getElementById("inputName2").value = name;
        document.getElementById("inputGender2").value = gender
        document.getElementById("inputEmail2").value = email
        document.getElementById("inputPhone2").value = phone
        document.getElementById("inputAge2").value = age
        document.getElementById("inputStatus2").value = status
    }

    function sendStatus(id,status) {
        document.getElementById("inputId3").value = id;
        document.getElementById("inputStatus3").value = status
    }

    function sendDeleteId(id) {
        document.getElementById("deleteA").href="/driver/delete?id="+id
    }
</script>
<%@include file="../common/bottom.jsp"%>
