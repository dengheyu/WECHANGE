<%--
  Created by IntelliJ IDEA.
  User: dengsen
  Date: 2018/11/30
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.io.*" %>
<html>
<head>
    <title>Title</title>
    <%-- Bootstrap --%>
    <link href="/views/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <%-- Custom styles for this template --%>
    <link href="/views/css/navbar-fixed-top.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">WECHANGE</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/views/homelist.jsp">WECHANGE</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="/views/admin/a_homelist.jsp" class="dropdown-toggle" role="button" aria-haspopup="true"
                       aria-expanded="false">闲置物品库</a>
                </li>
                <li class="dropdown">
                    <a href="/views/admin/a_delete.jsp" class="dropdown-toggle" role="button" aria-haspopup="true"
                       aria-expanded="false">违规处理</a>
                </li>
                <%--<li class="dropdown">--%>
                <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"--%>
                <%--aria-expanded="false">Dropdown <span class="caret"></span></a>--%>
                <%--<ul class="dropdown-menu">--%>
                <%--<li><a href="#">Action</a></li>--%>
                <%--<li><a href="#">Another action</a></li>--%>
                <%--<li><a href="#">Something else here</a></li>--%>
                <%--<li role="separator" class="divider"></li>--%>
                <%--<li class="dropdown-header">Nav header</li>--%>
                <%--<li><a href="#">Separated link</a></li>--%>
                <%--<li><a href="#">One more separated link</a></li>--%>
                <%--</ul>--%>
                <%--</li>--%>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="active"><a>违规确认<span class="sr-only">(current)</span></a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
















<%
    String id = request.getParameter("id");


    try {
        Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException classnotfoundexception) {
        classnotfoundexception.printStackTrace();
    }
    try {
        //连接数据库
        String URL = "jdbc:mysql://localhost:3306/test";
        String USER = "ylx";
        String PASSWORD = "ylx";
        Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
        //out.print("Successfully connect to the databass!<br>");
        Statement stmt = conn.createStatement();
        //修改SQL语句
        ResultSet rs = stmt.executeQuery("SELECT * FROM goods WHERE id='" + id+"'");
        while (rs.next()){
%>
<div class="container">
    <div class="jumbotron">
        <form class="form-inline text-center" action="delete_ok.jsp">
            <div class="form-group">
                <%--<label class="sr-only" for="exampleInputAmount">Amount (in dollars)</label>--%>
                <div class="input-group">

                    <div class="input-group-addon">物品编号</div>
                    <input type="text" class="form-control" name="id" value="<%=rs.getString("id")%>">
                </div>
                <div class="input-group">

                    <div class="input-group-addon">名称</div>
                    <input type="text" class="form-control" name="name" value="<%=rs.getString("name")%>">
                </div>

                <div class="input-group">

                    <div class="input-group-addon">型号</div>
                    <input type="text" class="form-control" name="models" value="<%=rs.getString("models")%>">
                </div>

                <div class="input-group">
                    <div class="input-group-addon">描述</div>
                    <input type="text" class="form-control" name="description" value="<%=rs.getString("description")%>">
                </div>
                <div class="input-group">
                    <div class="input-group-addon">类别</div>
                    <input type="text" class="form-control" name="kind" value="<%=rs.getString("kind")%>">
                </div>
                <div class="input-group">
                    <div class="input-group-addon">预约人</div>
                    <input type="text" class="form-control" name="user_name" value="<%=request.getParameter("user_name")%>">
                </div>





                <button type="submit" class="btn btn-primary">确认删除</button>
            </div>
        </form>
    </div>
</div>
<%--<table align="center" width="800" border="1">--%>
<%--<tr align="center">--%>
<%--<td>--%>
<%--<form name="changeForm" action="/views/change_ok.jsp" method="post">--%>
<%--<input type="hidden" name="id" value="<%=rs.getInt("id")%>">--%>
<%--用户名--%>
<%--<input type="text" name="device_id" value="<%=rs.getString("device_id")%>">--%>
<%--密码--%>
<%--<input type="text" name="device_name" value="<%=rs.getString("device_name")%>">--%>
<%--部门--%>
<%--<input type="text" name="checker" value="<%=rs.getString("checker")%>">--%>
<%--<input type="submit" name="sub" value="提交">--%>
<%--</form>--%>
<%--</td>--%>
<%--</tr>--%>
<%--<tr align="center">--%>
<%--<td>--%>
<%--<input type="button" value="返回列表" onclick="re()">--%>
<%--</td>--%>
<%--</tr>--%>
<%--</table>--%>
<%
        }
        stmt.close();
        conn.close();
    } catch (SQLException sqlexception) {
        sqlexception.printStackTrace();
    }
%>


















<script src="/views/js/temp.js"></script>
<%-- Bootstrap --%>
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="/views/js/bootstrap.min.js"></script>
</body>
</html>
