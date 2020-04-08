<%@ page import="xyz.jfshare.car.system.entity.Permission" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@ page import="xyz.jfshare.car.system.entity.User" %>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<%@taglib uri="http://com.web.output.tag" prefix="mytag"%>

<%
    String activeUri = request.getParameter("activeUri");
%>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="<shiro:principal property="icon"/>" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p><shiro:principal property="nickname"/></p>
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu" data-widget="tree">
            <mytag:menu/>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>

<script type="text/javascript">
    var js = document.getElementById('/<%=activeUri%>');
    js.className='active';
</script>
