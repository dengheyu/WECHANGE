<%--
  Created by IntelliJ IDEA.
  User: dengsen
  Date: 2018/11/26
  Time: 11:28
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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            <a class="navbar-brand" href="/views/admin/a_homelist.jsp">WECAHNGE་</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="/views/admin/a_homelist.jsp" class="dropdown-toggle" role="button" aria-haspopup="true"
                       aria-expanded="false">闲置物品库</a>
                </li>
                <li class="dropdown">
                    <a href="/views/admin/a_upload.jsp" class="dropdown-toggle" role="button" aria-haspopup="true"
                       aria-expanded="false">我的上传</a>
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
                <li class="active"><a>取消上传!<span class="sr-only">(current)</span></a></li>
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
        //执行SQL删除语句
        stmt.executeUpdate("DELETE FROM goods WHERE id='" + id+"'");
%>
<div class="container">
    <div class="jumbotron">
        <div class="alert alert-success">
            <h2 class="text-center">
                恭喜你！成功取消上传！
            </h2>
        </div>
    </div>
</div>
<%
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