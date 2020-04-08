<%@page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../common/topbar.jsp"%>
<%@include file="../common/head.jsp"%>
<jsp:include page="../common/sidebar.jsp" >
    <jsp:param name="activeUri" value="goods"/>
</jsp:include>

<div class="content-wrapper">
    <section class="content-header">
        <h1>提交订单</h1>
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
                            <a href="/goods/list">
                                <button type="button" class="btn btn-default" style="width: 100px; float:left">
                                    返回
                                </button>
                            </a>

                            <h3 class="box-title" style="float: left;margin: 7px auto 0 20%">当前选择的司机是：${driver.name}  | 车辆品牌： ${car.bands}  |  车牌：${car.number}</h3>
                        </div>

                    </div>

                    <div class="box-body">
                        <div class="col-md-3">
                        </div>
                        <div class="col-md-6">
                            <div class="box box-warning">
                                <div class="box-header with-border">
                                    <h3 class="box-title">订单提交</h3>
                                </div>

                                    <form role="form" action="/order/buy">
                                        <div class="box-body">
                                            <div class="form-group" style="display: none">
                                                <input type="text" name="driverId" class="form-control" value="${driver.id}">
                                            </div>

                                            <div class="form-group">
                                                <label>上车地点</label>
                                                <input type="text" name="place" class="form-control" placeholder="输入上车地点">
                                            </div>

                                            <div class="form-group">
                                                <label>员工电话</label>
                                                <input type="text" name="phone" class="form-control" placeholder="输入联系电话">
                                            </div>
                                        </div>
                                        <div class="box-footer">
                                            <span style="font-size:18px;font-weight:500;line-height:1">现在下单，司机马上就来！！</span>
                                            <button type="submit" class="btn btn-info pull-right" style="width: 100px;">提交</button>
                                        </div>
                                    </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<%@include file="../common/bottom.jsp"%>
