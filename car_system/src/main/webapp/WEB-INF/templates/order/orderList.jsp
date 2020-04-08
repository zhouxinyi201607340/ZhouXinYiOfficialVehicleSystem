<%@page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://com.web.output.tag1" prefix="customShiro"%>
<%@include file="../common/head.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../common/topbar.jsp"%>
<jsp:include page="../common/sidebar.jsp">
    <jsp:param name="activeUri" value="order"/>
</jsp:include>

<div class="content-wrapper">
    <section class="content-header">
        <h1>订单列表</h1>
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

                        <div class="modal fade" id="review-modal-default">
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


                        <div class="box-tools">
                            <form action="/order/list" method="get" class="input-group input-group-sm" style="width: 1000px ;overflow: hidden">
                                <label style="float: right;margin-bottom: 0">
                                    <input type="text" name="companyName" class="form-control pull-right" placeholder="输入公司名称">
                                </label>
                                <label style="float: right;margin-bottom: 0; margin-right: 30px">
                                    <input type="text" name="driverName" class="form-control pull-right" placeholder="输入司机姓名">
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
                                <th style="text-align:center">公司名</th>
                                <th style="text-align:center">订单编号</th>
                                <th style="text-align:center">下单时间</th>
                                <th style="text-align:center">开始时间</th>
                                <th style="text-align:center">司机姓名</th>
                                <th style="text-align:center">员工电话</th>
                                <th style="text-align:center">地点</th>
                                <th style="text-align:center">价格(元)</th>
                                <th style="text-align:center">状态</th>

                            </tr>

                            <c:forEach items="${dataList}" var="order" varStatus="orderStatus">
                                <tr style="text-align:center">
                                    <td><c:out value="${(orderStatus.index%10) + 1}"/> </td>
                                    <td><c:out value="${order.companyName}"/> </td>
                                    <td><c:out value="${order.ono}"/> </td>
                                    <td><c:out value="${order.startTime}"/> </td>
                                    <td><c:out value="${order.reviewTime == null?'暂未上车':order.reviewTime}"/> </td>
                                    <td><c:out value="${order.driverName}"/> </td>
                                    <td><c:out value="${order.phone}"/> </td>
                                    <td><c:out value="${order.place}"/> </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${order.status == 1 || order.status == 6 || order.status == 7}">
                                                <fmt:formatNumber type="number" value="${order.money}" pattern="#.0"/>
                                            </c:when>
                                            <c:otherwise>
                                                暂无价格
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:if test="${order.status == 1}"><span style="color: #39CCCC">待付款</span></c:if>
                                        <c:if test="${order.status == 2}"><span style="color: #f39c12">待上车</span></c:if>
                                        <c:if test="${order.status == 3}"><span style="color: #008d4c">已上车</span></c:if>
                                        <c:if test="${order.status == 4}"><span style="color: #b5bbc8">退  单</span></c:if>
                                        <c:if test="${order.status == 5}"><span style="color: #f56954">进行中</span></c:if>
                                        <c:if test="${order.status == 6}"><span style="color: #00a65a">已完成</span></c:if>
                                        <c:if test="${order.status == 7}"><span style="color: #00a65a">已完成</span></c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>

                    <div class="box-footer clearfix">
                        <ul class="pagination pagination-sm no-margin pull-right">
                            <c:set var="page" value="${param.page==null?1:param.page}"/>
                            <li><a href="/order/list?page=${page - (page == 1?0:1)}&companyName=${param.companyName}&driverName=${param.driverName}">&laquo;</a></li>
                            <c:forEach var="item" varStatus="status" begin="1" end="${pages}">
                                <li>
                                    <a href="/order/list?page=${status.index}&companyName=${param.companyName}&driverName=${param.driverName}">${status.index}</a>
                                </li>
                            </c:forEach>
                            <li><a href="/order/list?page=${page + (page == pages?0:1)}&companyName=${param.companyName}&driverName=${param.driverName}">&raquo;</a></li>
                            <li><span>&nbsp;共有${total}条数据&nbsp;</span> </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<%@include file="../common/bottom.jsp"%>
