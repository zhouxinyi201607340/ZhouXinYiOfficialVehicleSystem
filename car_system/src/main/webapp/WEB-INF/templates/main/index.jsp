<%@page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../common/head.jsp"%>
<%@include file="../common/topbar.jsp"%>
<%@include file="../common/sidebar.jsp"%>
<div class="content-wrapper">
  <section class="content">
    <div style="text-align: center;line-height: 200px;">
      <h1 style="margin-top: 20%">欢迎来到公务车辆租赁管理系统<img src="../../../static/favicon.ico"></h1>
    </div>
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
</div>

<%@include file="../common/bottom.jsp"%>
