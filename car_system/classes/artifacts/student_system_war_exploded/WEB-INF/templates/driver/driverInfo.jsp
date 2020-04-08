<%@page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../common/head.jsp"%>
<%@include file="../common/topbar.jsp"%>
<%@include file="../common/sidebar.jsp"%>

<style>
    .text-muted{
        margin: 10px 10px 5px;
    }
</style>

<div class="content-wrapper">
    <section class="content-header">
        <h1>
            个人主页
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
                            <li class="list-group-item" style="height: 38px">
                                <b class="pull-left" style="width: 100px;text-align: right">姓名:&nbsp;&nbsp;</b> <div class="pull-left">${sessionScope.get("driver").name}</div>
                            </li>
                            <li class="list-group-item" style="height: 38px">
                                <b class="pull-left" style="width: 100px;text-align: right">性别:&nbsp;&nbsp;</b> <div class="pull-left">${sessionScope.driver.gender==0?'男':'女'}</div>
                            </li>
                            <li class="list-group-item" style="height: 38px">
                                <b class="pull-left" style="width: 100px;text-align: right">年龄:&nbsp;&nbsp;</b> <div class="pull-left">${sessionScope.driver.age}</div>
                            </li>
                            <li class="list-group-item" style="height: 38px">
                                <b class="pull-left" style="width: 100px;text-align: right">电话:&nbsp;&nbsp;</b> <div class="pull-left">${sessionScope.driver.phone}</div>
                            </li>
                            <li class="list-group-item" style="height: 38px">
                                <b class="pull-left" style="width: 100px;text-align: right">邮箱:&nbsp;&nbsp;</b> <div class="pull-left">${sessionScope.driver.email}</div>
                            </li>
                        </ul>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->

                <!-- About Me Box -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <c:if test="${sessionScope.driver.status == 2}">
                            <h3 class="box-title">车辆信息(待审核)</h3>
                        </c:if>
                        <c:if test="${sessionScope.driver.status == 3}">
                            <h3 class="box-title">车辆信息</h3>
                        </c:if>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <c:if test="${sessionScope.car == null}">
                            暂无车辆
                        </c:if>
                        <c:if test="${sessionScope.car != null}">
                            <strong><i class="fa fa-book margin-r-5"></i> 车牌</strong>

                            <p class="text-muted">${sessionScope.car.number}</p>

                            <hr>

                            <strong><i class="fa fa-map-marker margin-r-5"></i> 颜色</strong>

                            <p class="text-muted">${sessionScope.car.color}</p>

                            <hr>

                            <strong><i class="fa fa-pencil margin-r-5"></i> 品牌</strong>

                            <p class="text-muted">${sessionScope.car.bands}</p>

                            <hr>

                            <strong><i class="fa fa-file-text-o margin-r-5"></i> 车型</strong>
                            <p class="text-muted">
                                    <c:if test="${sessionScope.car.type == 1}">
                                        四座
                                    </c:if>
                                    <c:if test="${sessionScope.car.type == 2}">
                                        七座
                                    </c:if>
                                    <c:if test="${sessionScope.car.type == 3}">
                                        其他
                                    </c:if>
                                    </p>
                        </c:if>
                    </div>
                    <!-- /.box-body -->
                </div>

            </div>
            <!-- /.col -->
            <div class="col-md-9">
                <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#order" data-toggle="tab">我的订单</a></li>
                        <li><a href="#update" onclick="sendGender(${sessionScope.driver.gender})" data-toggle="tab">修改信息</a></li>
                        <li><a href="#complain" data-toggle="tab">投诉我的</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="active tab-pane" id="order">
                            <table class="table table-bordered">
                                <tr>
                                    <th style="width: 60px;text-align:center"><span>序号</span></th>
                                    <th style="text-align:center">公司名称</th>
                                    <th style="text-align:center">订单编号</th>
                                    <th style="text-align:center">下单时间</th>
                                    <th style="text-align:center">开始时间</th>
                                    <th style="text-align:center">员工电话</th>
                                    <th style="text-align:center">地点</th>
                                    <th style="text-align:center">价格(元)</th>
                                    <th style="text-align:center">状态</th>
                                    <th style="text-align:center">操作</th>

                                </tr>

                                <c:forEach items="${orderList}" var="order" varStatus="orderStatus">
                                    <tr style="text-align:center">
                                        <td><c:out value="${(orderStatus.index%10) + 1}"/> </td>
                                        <td><c:out value="${order.companyName}"/> </td>
                                        <td><c:out value="${order.ono}"/> </td>
                                        <td><c:out value="${order.startTime}"/> </td>
                                        <td><c:out value="${order.reviewTime == null?'暂未上车':order.reviewTime}"/> </td>
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
                                        <td>
                                            <c:if test="${order.status == 2}">
                                                <a href="/driver/meet?orderId=${order.id}">接到客人</a>
                                            </c:if>

                                            <c:if test="${order.status == 3}">
                                                <a href="/driver/arrive?orderId=${order.id}">送达客人</a>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>

                        <div class="tab-pane" id="complain">
                            <table class="table table-bordered">
                                <tr>
                                    <th style="width: 60px;text-align:center"><span>序号</span></th>
                                    <th style="text-align:center">订单编号</th>
                                    <th style="text-align:center">投诉公司</th>
                                    <th style="text-align:center">类型</th>
                                    <th style="text-align:center">描述</th>
                                    <th style="text-align:center">状态</th>
                                    <th style="text-align:center">执行结果</th>
                                </tr>

                                <c:forEach items="${complainList}" var="complain" varStatus="complainStatus">
                                    <tr style="text-align:center">
                                        <td><c:out value="${(complainStatus.index%10) + 1}"/> </td>
                                        <td><c:out value="${complain.ono}"/> </td>
                                        <td><c:out value="${complain.companyName}"/> </td>
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
                                        <td><c:out value="${complain.status == 0 ?'未处理':'已处理'}"/> </td>
                                        <td>
                                            <c:if test="${complain.status == 0}">
                                                暂未处理
                                            </c:if>
                                            <c:if test="${complain.status == 1}">
                                                <c:out value="扣${complain.score}分"/>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <!-- /.tab-pane -->
                        <div class="tab-pane" id="update">
                            <div class="col-sm-6">
                                <img class="img-responsive" src="<shiro:principal property="icon"/>" alt="Photo">
                            </div>
                            <form class="form-horizontal" action="/user/updateDriverInfo" method="post">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="box box-primary">
                                            <div class="box-body">
                                                <div class="form-group">
                                                    <label for="inputNickname" class="col-sm-2 control-label">昵称:</label>
                                                    <div class="col-sm-10">
                                                        <input name="nickname" value="<shiro:principal property="nickname"/>" type="text" class="form-control" id="inputNickname" placeholder="请输入昵称">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputIcon" class="col-sm-2 control-label">头像:</label>
                                                    <div class="col-sm-10">
                                                        <input name="icon" value="<shiro:principal property="icon"/>" type="text" class="form-control" id="inputIcon" placeholder="请输入头像链接(外网链接)">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputName" class="col-sm-2 control-label">姓名:</label>
                                                    <div class="col-sm-10">
                                                        <input value="${sessionScope.driver.name}" name="name" type="text" class="form-control" id="inputName" placeholder="输入姓名">
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
                                                        <input value="${sessionScope.driver.age}" name="age" type="text" class="form-control" id="inputAge" placeholder="输入年龄">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputPhone" class="col-sm-2 control-label">电话:</label>
                                                    <div class="col-sm-10">
                                                        <input value="${sessionScope.driver.phone}" name="phone" type="text" class="form-control" id="inputPhone" placeholder="输入电话">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputEmail" class="col-sm-2 control-label">邮箱:</label>
                                                    <div class="col-sm-10">
                                                        <input value="${sessionScope.driver.email}" name="email" type="text" class="form-control" id="inputEmail" placeholder="输入邮箱">
                                                    </div>
                                                </div>
                                                <button type="reset" class="btn btn-default">取消</button>
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
