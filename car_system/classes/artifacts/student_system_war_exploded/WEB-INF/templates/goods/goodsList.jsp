<%@page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://com.web.output.tag1" prefix="customShiro"%>
<%@include file="../common/head.jsp"%>
<%@include file="../common/topbar.jsp"%>
<jsp:include page="../common/sidebar.jsp">
    <jsp:param name="activeUri" value="goods"/>
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
                    <div class="box-header with-border" style="height: 50px;">

                        <div class="box-tools">
                            <form action="/goods/list" method="get" class="input-group input-group-sm" style="width: 1000px ;overflow: hidden">

                                <label style="float: right;margin-bottom: 0">
                                    <%--                                    <span style="float: left; width: 50px;height: 30px;text-align: center;line-height:30px;">名称:</span>--%>
                                    <input type="text" name="name" class="form-control pull-right" placeholder="输入姓名">
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
                                <th style="text-align:center">型号</th>
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
                                <th style="text-align:center;">操作</th>
                            </tr>

                            <c:forEach items="${dataList}" var="driver" varStatus="companyStatus">
                                <tr style="text-align:center">
                                    <td><c:out value="${(companyStatus.index%10) + 1}"/> </td>
                                    <td><c:out value="${driver.name}"/> </td>
                                    <td><c:out value="${driver.bands}"/> </td>
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
                                    <td>
                                        <c:if test="${driver.status == 3}">
                                            <a href="/goods/submit?driverId=${driver.id}">选择</a>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>

                    <div class="box-footer clearfix">
                        <ul class="pagination pagination-sm no-margin pull-right">
                            <c:set var="page" value="${param.page==null?1:param.page}"/>
                            <li><a href="/goods/list?page=${page - (page == 1?0:1)}&name=${param.name}&nickname=${param.nickname}">&laquo;</a></li>
                            <c:forEach var="item" varStatus="status" begin="1" end="${pages}">
                                <li>
                                    <a href="/goods/list?page=${status.index}&name=${param.name}&nickname=${param.nickname}">${status.index}</a>
                                </li>
                            </c:forEach>
                            <li><a href="/goods/list?page=${page + (page == pages?0:1)}&name=${param.name}&nickname=${param.nickname}">&raquo;</a></li>
                            <li><span>&nbsp;共有${total}条数据&nbsp;</span> </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<%@include file="../common/bottom.jsp"%>
