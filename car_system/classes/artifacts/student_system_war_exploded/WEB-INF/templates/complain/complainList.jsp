<%@page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://com.web.output.tag1" prefix="customShiro"%>
<%@include file="../common/head.jsp"%>
<%@include file="../common/topbar.jsp"%>
<jsp:include page="../common/sidebar.jsp">
    <jsp:param name="activeUri" value="complain"/>
</jsp:include>

<div class="content-wrapper">
    <section class="content-header">
        <h1>投诉列表</h1>
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
                    <div class="box-header with-border" style="height: 50px">
                        <%--                        <div style="overflow: hidden">--%>
                        <%--                            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#add-modal-info" style="width: 100px; float:left">--%>
                        <%--                                新建--%>
                        <%--                            </button>--%>
                        <%--                        </div>--%>


                        <div class="modal modal-info fade" id="update-modal-info">
                            <form class="form-horizontal" method="post" action="/complain/review">

                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title">处理投诉</h4>
                                        </div>
                                        <div class="modal-body">

                                            <div class="box-body">
                                                <div class="form-group" style="display: none">
                                                    <label for="inputId" class="col-sm-2 control-label">id</label>

                                                    <div class="col-sm-10">
                                                        <input name="complainId" type="text" class="form-control" id="inputId">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputScore2" class="col-sm-2 control-label">减去积分</label>

                                                    <div class="col-sm-10">
                                                        <input name="score" type="text" class="form-control" id="inputScore2" placeholder="请输入减去的信用积分">
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
                            <form action="/complain/list" method="get" class="input-group input-group-sm" style="width: 150px;">
                                <input type="text" name="name" class="form-control pull-right" placeholder="输入名称">

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
                                <th style="text-align:center">订单编号</th>
                                <th style="text-align:center">类型</th>
                                <th style="text-align:center">描述</th>
                                <th style="text-align:center">投诉公司</th>
                                <th style="text-align:center">被投诉司机</th>
                                <th style="text-align:center">状态</th>
                                <th style="text-align:center">操作</th>
                            </tr>

                            <c:forEach items="${dataList}" var="complain" varStatus="complainStatus">
                                <tr style="text-align:center">
                                    <td><c:out value="${(complainStatus.index%10) + 1}"/> </td>
                                    <td><c:out value="${complain.ono}"/> </td>
                                    <td>
                                        <c:if test="${complain.type == 1}">
                                            迟到
                                        </c:if>
                                        <c:if test="${complain.type == 2}">
                                            加价
                                        </c:if>
                                        <c:if test="${complain.type == 3}">
                                            言语不当
                                        </c:if>
                                        <c:if test="${complain.type == 4}">
                                            故意绕路
                                        </c:if>
                                        <c:if test="${complain.type == 5}">
                                            其他
                                        </c:if>
                                    </td>
                                    <td><c:out value="${complain.description}"/> </td>
                                    <td><c:out value="${complain.companyName}"/> </td>
                                    <td><c:out value="${complain.driverName}"/> </td>
                                    <td><c:out value="${complain.status == 0 ?'未处理':'已处理'}"/> </td>
                                    <td>
                                        <c:if test="${complain.status == 0}">
                                            <button onclick="sendValue('${complain.id}')" type="button" class="btn btn-block btn-info btn-xs" data-toggle="modal" data-target="#update-modal-info">处理</button>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>


                    <div class="box-footer clearfix">
                        <ul class="pagination pagination-sm no-margin pull-right">
                            <c:set var="page" value="${param.page==null?1:param.page}"/>
                            <li><a href="/complain/list?page=${page - (page == 1?0:1)}&driverName=${param.driverName}&companyName=${param.companyName}">&laquo;</a></li>
                            <c:forEach var="item" varStatus="status" begin="1" end="${pages}">
                                <li>
                                    <a href="/complain/list?page=${status.index}&driverName=${param.driverName}&companyName=${param.companyName}">${status.index}</a>
                                </li>
                            </c:forEach>
                            <li><a href="/complain/list?page=${page + (page == pages?0:1)}&driverName=${param.driverName}&companyName=${param.companyName}">&raquo;</a></li>
                            <li><span>&nbsp;共有${total}条数据&nbsp;</span> </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>


<script>
    function sendValue(id) {
        document.getElementById("inputId").value = id;
    }
</script>
<%@include file="../common/bottom.jsp"%>
