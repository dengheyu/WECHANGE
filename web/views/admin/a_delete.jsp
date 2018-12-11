<%--
  Created by IntelliJ IDEA.
  User: dengsen
  Date: 2018/11/30
  Time: 15:11
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
            <a class="navbar-brand" href="/views/admin/a_homelist.jsp">WECHANGE</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="/views/admin/a_homelist.jsp" class="dropdown-toggle" role="button" aria-haspopup="true"
                       aria-expanded="false">闲置物品库</a>
                </li>
                <li class="dropdown">
                    <a href="/views/admin/a_delete.jsp" class="dropdown-toggle" role="button" aria-haspopup="true"
                       aria-expanded="false">违规商品</a>
                </li>
                <%--<li class="dropdown">--%>
                <%--<a href="#" class="dropdown-toggle" role="button" aria-haspopup="true"--%>
                <%--aria-expanded="false">Dropdown </a>--%>
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
                <li class="active"><a>我的预约<span class="sr-only">(current)</span></a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
<div class="container">
    <div class="jumbotron">
        <%
            //连接数据库，用jdbc驱动加载mysql
            String user_name = request.getParameter("user_name");
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
                //执行SQL查询语句，返回结果集
                ResultSet rs = stmt.executeQuery("SELECT * FROM inform,goods WHERE inform.id=goods.id ");
                //成功则循环输出信息
        %>
        <table class="table table-bordered" align="center" width="800" border="1">
            <th align="center" colspan="6">
                <h2 class="text-center">我的预约</h2>
            </th>
            <tr align="center">
                <td>
                    <p>
                        <strong>
                            名称
                        </strong>
                    </p>
                </td>
                <td>
                    <p>
                        <strong>
                            型号
                        </strong>
                    </p>
                </td>
                <td>
                    <p>
                        <strong>
                            描述
                        </strong>
                    </p>
                </td>




                <td>
                    <p>
                        <strong>
                            类别
                        </strong>
                    </p>
                </td>
                <td>
                    <p>
                        <strong>
                            联系信息
                        </strong>
                    </p>
                </td>
                <td>
                    <p>
                        <strong>
                            操作
                        </strong>
                    </p>
                </td>


            </tr>
            <%
                while (rs.next()) {
            %>
            <tr align="center">

                <td>
                    <p>
                        <%=rs.getString("name")%>
                    </p>
                </td>
                <td>
                    <p>
                        <%=rs.getString("models")%>
                    </p>
                </td>
                <td>
                    <p>
                        <%=rs.getString("description")%>
                    </p>
                </td>


                <td>
                    <p>
                        <%=rs.getString("kind")%>
                    </p>
                </td>




                <td>
                    <p>
                        <%=rs.getString("information")%>
                    </p>
                </td>




                <td>
                    <a class="btn btn-mini btn-success" href="/views/admin/delete.jsp?id=<%=rs.getString("id")%>">删除</a>
                </td>
            </tr>
            <%
                }
            %>
            <th colspan="6">
                <div class="btn-group btn-group-justified" role="group" aria-label="...">
                    <div class="btn-group" role="group">
                        <button id="1" type="button" class="btn btn-info">大学生闲置物品交换平台</button>
                    </div>
                </div>
            </th>
        </table>
        <%
                //关闭数据库
                stmt.close();
                conn.close();
                //out.print("Successfully close the databass!");
            } catch (SQLException sqlexception) {
                sqlexception.printStackTrace();
            }
        %>
    </div>
</div>
<script src="/views/js/temp.js"></script>
<%-- Bootstrap --%>
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="/views/js/bootstrap.min.js"></script>
</body>
</html>