<%@page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../common/head.jsp"%>
<%@include file="../common/topbar.jsp"%>
<%@include file="../common/sidebar.jsp"%>
<div class="content-wrapper">
    <section class="content-header">
        <h1>
            公司主页
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

                <div class="modal modal-info fade" id="complain-modal-default">
                    <form class="form-horizontal" method="post" action="/complain/add">

                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title">提交投诉</h4>
                                </div>
                                <div class="modal-body">

                                    <div class="box-body">

                                        <h4 id="Non" style="margin-left:23%"></h4>
                                        <h4 id="DriverName" style="margin-left:23%"></h4>
                                        <input name="orderId" id="inputId" style="display: none">
                                        <div class="form-group">
                                            <label for="inputType" class="col-sm-2 control-label">类型</label>

                                            <div class="col-sm-10">
                                                <select name="type" class="form-control" id="inputType">
                                                    <option value="1">迟到</option>
                                                    <option value="2">加价</option>
                                                    <option value="3">言语不当</option>
                                                    <option value="4">故意绕路</option>
                                                    <option value="5">其他</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputDesc" class="col-sm-2 control-label">描述</label>

                                            <div class="col-sm-10">
                                                <textarea name="description" id="inputDesc" class="form-control" rows="3" placeholder="请输入描述"></textarea>
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

                <div class="modal fade" id="pay-modal-default">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">

                            <h4 class="modal-title">付款</h4>
                        </div>
                            <form action="/company/pay" method="post" id="form1">
                                <div class="modal-body">
                                    <div id="qrcode" style="height: 250px;width: 250px;margin-left: 30%;margin-top: 5%"></div>
                                </div>
                                <div class="modal-footer">
                                        <input name="orderId" id="orderId" style="display: none">
                                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
                                        <button type="submit" class="btn btn-default pull-right">已完成支付</button>
                                </div>
                            </form>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->

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
                                <b class="pull-left" style="width: 100px;text-align: right">公司名:&nbsp;&nbsp;</b> <div class="pull-left">${sessionScope.company.name}</div>
                            </li>
                            <li class="list-group-item" style="height: 38px">
                                <b class="pull-left" style="width: 100px;text-align: right">邮箱:&nbsp;&nbsp;</b> <div class="pull-left">${sessionScope.company.email}</div>
                            </li>
                            <li class="list-group-item" style="height: 38px">
                                <b class="pull-left" style="width: 100px;text-align: right">负责人:&nbsp;&nbsp;</b> <div class="pull-left">${sessionScope.company.leader}</div>
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
                        <li class="active"><a href="#order" data-toggle="tab">公司订单</a></li>
                        <li><a href="#update" data-toggle="tab">修改信息</a></li>
                        <li><a href="#complain" data-toggle="tab">我的投诉</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="active tab-pane" id="order">
                            <table class="table table-bordered">
                                <tr>
                                    <th style="width: 60px;text-align:center"><span>序号</span></th>
                                    <th style="text-align:center">订单编号</th>
                                    <th style="text-align:center">下单时间</th>
                                    <th style="text-align:center">开始时间</th>
                                    <th style="text-align:center">司机姓名</th>
                                    <th style="text-align:center">员工电话</th>
                                    <th style="text-align:center">地点</th>
                                    <th style="text-align:center">价格(元)</th>
                                    <th style="text-align:center">状态</th>
                                    <th style="text-align:center">操作</th>

                                </tr>

                                <c:forEach items="${orderList}" var="order" varStatus="orderStatus">
                                    <tr style="text-align:center">
                                        <td><c:out value="${(orderStatus.index%10) + 1}"/> </td>
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
                                            <c:if test="${order.status == 7}"><span style="color: #d33724">已投诉</span></c:if>
                                        </td>
                                        <td>
                                            <c:if test="${order.status == 1}">
                                                <button type="button" class="btn btn-block btn-info btn-xs" onclick="pay('${order.id}')" data-toggle="modal" data-target="#pay-modal-default">付款</button>
                                            </c:if>

                                            <c:if test="${order.status == 6}">
                                                <button type="button" onclick="complain('${order.id}','${order.driverName}','${order.ono}')" class="btn btn-block btn-danger btn-xs" data-toggle="modal" data-target="#complain-modal-default">投诉</button>
                                            </c:if>

                                            <c:if test="${order.status == 4}">
                                                <a href="/main">
                                                    <button type="button" class="btn btn-block btn-danger btn-xs">删除</button>
                                                </a>
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
                                    <th style="text-align:center">被投诉司机</th>
                                    <th style="text-align:center">类型</th>
                                    <th style="text-align:center">描述</th>
                                    <th style="text-align:center">状态</th>
                                    <th style="text-align:center">执行结果</th>
                                </tr>

                                <c:forEach items="${complainList}" var="complain" varStatus="complainStatus">
                                    <tr style="text-align:center">
                                        <td><c:out value="${(complainStatus.index%10) + 1}"/> </td>
                                        <td><c:out value="${complain.ono}"/> </td>
                                        <td><c:out value="${complain.driverName}"/> </td>
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
                                        <td><c:out value="${complain.status == 0 ?'等待处理':'已严肃处理'}"/> </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <!-- /.tab-pane -->
                        <div class="tab-pane" id="update">
                            <div class="col-sm-6">
                                <img class="img-responsive" src="<shiro:principal property="icon"/>" alt="Photo">
                            </div>
                            <form class="form-horizontal" action="/user/updateCompanyInfo" method="post">
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
                                                        <input value="${sessionScope.company.name}" name="name" type="text" class="form-control" id="inputName" placeholder="输入姓名">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputEmail" class="col-sm-2 control-label">邮箱:</label>
                                                    <div class="col-sm-10">
                                                        <input value="${sessionScope.company.email}" name="email" type="text" class="form-control" id="inputEmail" placeholder="输入邮箱">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputLeader" class="col-sm-2 control-label">负责人:</label>
                                                    <div class="col-sm-10">
                                                        <input value="${sessionScope.company.leader}" name="leader" type="text" class="form-control" id="inputLeader" placeholder="输入负责人">
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
<script type='text/javascript' src='http://cdn.staticfile.org/jquery/2.1.1/jquery.min.js'></script>
<script type="text/javascript" src="http://cdn.staticfile.org/jquery.qrcode/1.0/jquery.qrcode.min.js"></script>
<!-- <div id="qrcode"></div> -->
<script>
    function pay(id){
        document.getElementById("orderId").value = id
    }

    function complain(orderId,driverName,ono){
        document.getElementById("inputId").value = orderId
        document.getElementById("DriverName").innerText = '司机姓名：' + driverName
        document.getElementById("Non").innerText = '您选择的订单编号为：'+ono
        console.log(orderId,driverName,ono)
    }
    jQuery('#qrcode').qrcode({width: 200,height: 200,correctLevel:0,render: "table",text: "http://www.jfshare.xyz:9090/car/pay.html"});
</script>
<%@include file="../common/bottom.jsp"%>
