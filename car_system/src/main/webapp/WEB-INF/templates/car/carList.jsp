<%@page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://com.web.output.tag1" prefix="customShiro"%>
<%@include file="../common/head.jsp"%>
<%@include file="../common/topbar.jsp"%>
<jsp:include page="../common/sidebar.jsp">
    <jsp:param name="activeUri" value="car"/>
</jsp:include>

<div class="content-wrapper">
    <section class="content-header">
        <h1>车辆列表</h1>
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
                        <div style="overflow: hidden">

                        <customShiro:hasAnyPermission name="/car/add">
                                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#add-modal-info" style="width: 100px; float:left">
                                    新建
                                </button>
                        </customShiro:hasAnyPermission>
                        </div>

                        <div class="modal modal-info fade" id="add-modal-info">
                            <form class="form-horizontal" method="post" action="/car/add">

                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title">新增车辆</h4>
                                        </div>
                                        <div class="modal-body">

                                            <div class="box-body">
                                                <div class="form-group">
                                                    <label for="inputNumber" class="col-sm-2 control-label">车牌</label>

                                                    <div class="col-sm-10">
                                                        <input name="number" type="text" class="form-control" id="inputNumber" placeholder="请输入车牌">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputColor" class="col-sm-2 control-label">颜色</label>

                                                    <div class="col-sm-10">
                                                        <input name="color" type="text" class="form-control" id="inputColor" placeholder="请输入颜色">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputBands" class="col-sm-2 control-label">品牌</label>

                                                    <div class="col-sm-10">
                                                        <input name="bands" type="text" class="form-control" id="inputBands" placeholder="请输入品牌">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputType" class="col-sm-2 control-label">车型</label>

                                                    <div class="col-sm-10">
                                                        <select name="type" class="form-control" id="inputType">
                                                            <option value="1">4座</option>
                                                            <option value="2">7座</option>
                                                            <option value="3">其他</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputClassify" class="col-sm-2 control-label">类型</label>

                                                    <div class="col-sm-10">
                                                        <select name="classifyId" class="form-control" id="inputClassify">
                                                            <option value="0">请选择</option>
                                                            <c:forEach items="${classifyList}" var="classify" varStatus="itemStatus">
                                                                <option value="${classify.id}">${classify.name}</option>
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
                            <form class="form-horizontal" method="post" action="/car/update">

                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title">修改车辆</h4>
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
                                                    <label for="inputNumber2" class="col-sm-2 control-label">车牌</label>

                                                    <div class="col-sm-10">
                                                        <input name="number" type="text" class="form-control" id="inputNumber2" placeholder="请输入车牌">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputColor2" class="col-sm-2 control-label">颜色</label>

                                                    <div class="col-sm-10">
                                                        <input name="color" type="text" class="form-control" id="inputColor2" placeholder="请输入颜色">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputBands2" class="col-sm-2 control-label">品牌</label>

                                                    <div class="col-sm-10">
                                                        <input name="bands" type="text" class="form-control" id="inputBands2" placeholder="请输入品牌">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputType2" class="col-sm-2 control-label">车型</label>

                                                    <div class="col-sm-10">
                                                        <select name="type" class="form-control" id="inputType2">
                                                            <option value="1">4座</option>
                                                            <option value="2">7座</option>
                                                            <option value="3">其他</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputClassify2" class="col-sm-2 control-label">类型</label>

                                                    <div class="col-sm-10">
                                                        <select name="classifyId" class="form-control" id="inputClassify2">
                                                            <option value="0">请选择</option>
                                                            <c:forEach items="${classifyList}" var="classify" varStatus="itemStatus">
                                                                <option value="${classify.id}">${classify.name}</option>
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

                        <div class="box-tools">
                            <form action="/car/list" method="get" class="input-group input-group-sm" style="width: 1000px ;overflow: hidden">
                                <label style="float: right;margin-bottom: 0">
                                    <%--                                    <span style="float: left; width: 50px;height: 30px;text-align: center;line-height:30px;">名称:</span>--%>
                                    <input type="text" name="color" class="form-control pull-right" placeholder="输入颜色">
                                </label>
                                <label style="float: right;margin-bottom: 0; margin-right: 30px">
                                    <%--                                    <span style="float: left; width: 50px;height: 30px;text-align: center;line-height:30px;">负责人:</span>--%>
                                    <input type="text" name="bands" class="form-control pull-right" placeholder="输入品牌">
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
                                <th style="text-align:center">车牌号</th>
                                <th style="text-align:center">颜色</th>
                                <th style="text-align:center">品牌</th>
                                <th style="text-align:center">车型</th>
                                <th style="text-align:center">类型</th>
                                <th style="text-align:center">状态</th>
                                <customShiro:hasAnyPermission name="/car/delete,/car/update,/chooseCar/list">
                                    <th style="text-align:center">操作</th>
                                </customShiro:hasAnyPermission>

                            </tr>

                            <c:forEach items="${dataList}" var="car" varStatus="carStatus">
                                <tr style="text-align:center">
                                    <td><c:out value="${(carStatus.index%10) + 1}"/> </td>
                                    <td><c:out value="${car.number}"/> </td>
                                    <td><c:out value="${car.color}"/> </td>
                                    <td><c:out value="${car.bands}"/> </td>
                                    <td><c:if test="${car.type == 1}">4座</c:if>
                                        <c:if test="${car.type == 2}">7座</c:if>
                                        <c:if test="${car.type == 3}">其他</c:if>
                                    </td>
                                    <td><c:out value="${car.classify}"/> </td>
                                    <td><c:out value="${car.status == 0?'空闲':'已选'}"/> </td>
                                    <td>
                                        <div class="btn-group" style="overflow: hidden">
                                            <customShiro:hasAnyPermission name="/car/update">
                                                <button onclick="sendValue('${car.id}','${car.number}','${car.color}','${car.bands}','${car.type}','${car.classifyId}')" type="button" class="btn btn-info" data-toggle="modal" data-target="#update-modal-info">编辑</button>
                                            </customShiro:hasAnyPermission>
                                            <customShiro:hasAnyPermission name="/chooseCar/list">
                                                <c:if test="${car.status == 0}">
                                                    <a href="/driver/chooseCar?carId=${car.id}">选择</a>
                                                </c:if>
                                            </customShiro:hasAnyPermission>
                                            <customShiro:hasAnyPermission name="/car/delete">
                                                <button type="button" onclick="sendDeleteId(${car.id})" class="btn btn-default" data-toggle="modal" data-target="#delete-modal-default">删除</button>
                                            </customShiro:hasAnyPermission>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>

                    <div class="box-footer clearfix">
                        <ul class="pagination pagination-sm no-margin pull-right">
                            <c:set var="page" value="${param.page==null?1:param.page}"/>
                            <li><a href="/car/list?page=${page - (page == 1?0:1)}&color=${param.color}&bands=${param.bands}">&laquo;</a></li>
                            <c:forEach var="item" varStatus="status" begin="1" end="${pages}">
                                <li>
                                    <a href="/car/list?page=${status.index}&color=${param.color}&bands=${param.bands}">${status.index}</a>
                                </li>
                            </c:forEach>
                            <li><a href="/car/list?page=${page + (page == pages?0:1)}&color=${param.color}&bands=${param.bands}">&raquo;</a></li>
                            <li><span>&nbsp;共有${total}条数据&nbsp;</span> </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>


<script>
    function sendValue(id,number,color,bands,type,classifyId) {
        document.getElementById("inputId").value = id;
        document.getElementById("inputNumber2").value = number;
        document.getElementById("inputColor2").value = color
        document.getElementById("inputBands2").value = bands
        document.getElementById("inputType2").value = type
        document.getElementById("inputClassify2").value = classifyId
    }

    function sendDeleteId(id) {
        document.getElementById("deleteA").href="/car/delete?id="+id
    }
</script>
<%@include file="../common/bottom.jsp"%>
