<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.io.*" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="java.util.List" %>
<%@ page import="org.json.JSONArray" %>
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
            <a class="navbar-brand" href="/views/business/b_homelist.jsp">WECHANGE་</a>
        </div>
    </div>
</nav>
<div class="container">
    <div class="jumbotron">
        <ul id="myTab" class="nav nav-tabs">
            <li class="active">
                <a href="#biao" data-toggle="tab">
                    统计表
                </a>
            </li>
            <li><a href="#tu" data-toggle="tab">统计图</a></li>
        </ul>
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade in active" id="biao">
                <table class="table table-bordered" align="center" width="800" border="1">
                    <th align="center" colspan="6">
                        <h2 class="text-center">统计信息</h2>
                    </th>
                    <tr align="center">
                        <td>
                            <p>
                                <strong>
                                    时间
                                </strong>
                            </p>
                        </td>
                        <td>
                            <p>
                                <strong>
                                    数量
                                </strong>
                            </p>
                        </td>
                    </tr>
                    <%
                        JSONObject jsonObj = (JSONObject) session.getAttribute("chongcao_statistic_record_result");
                        JSONArray list= jsonObj.getJSONArray("aaData");
                        String img = jsonObj.getString("result_image");
                        for(int i=0;i<list.length();i++){
                            List li= (List) list.get(i);
                    %>
                    <tr align="center">
                        <td>
                            <p>
                                <%=(String) li.get(0)%>
                            </p>
                        </td>
                        <td>
                            <p>
                                <%=(String) li.get(1)%>
                            </p>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>
            <div id="tu" class="tab-pane fade">
                <img id="result_image" name="result_image" src="<%=img%>" alt="统计结果图" style="width: 960px; height: 596px;" />
            </div>
        </div>
        <div class="btn-group">
            <button type="button" class="btn btn-lg btn-primary" onclick="window.location.href='/views/admin/a_homelist.jsp'">返回</button>
        </div>
    </div>
</div>>
<%-- Bootstrap --%>
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js" charset="UTF-8"></script>
<script src="/views/js/bootstrap.min.js"></script>
</body>
</html>