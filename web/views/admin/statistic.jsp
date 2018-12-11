<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.io.*" %>
<html>
<head>
    <title>Title</title>
    <%-- Bootstrap --%>
    <link href="/views/css/bootstrap.min.css" rel="stylesheet">
    <%-- Custom styles for this template --%>
    <link href="/views/css/navbar-fixed-top.css" rel="stylesheet">
    <link href="/views/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
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
                    <a href="/views/admin/a_homelist.jsp" class="dropdown-toggle"  role="button"
                       aria-haspopup="true"
                       aria-expanded="false">闲置物品库</a>
                </li>

                <li class="dropdown">
                    <a href="/views/admin/statistic.jsp" class="dropdown-toggle"  role="button"
                       aria-haspopup="true"
                       aria-expanded="false">统计</a>
                </li>
                <%--<li class="dropdown">--%>
                <%--<a href="#" class="dropdown-toggle"  role="button" aria-haspopup="true"--%>
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
                <li class="active"><a>闲置物品库<span class="sr-only">(current)</span></a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
<div class="container">
    <div class="jumbotron">
        <form class="form-horizontal text-center" action="/admin_action?action=statistic" method="post">
            <div class="input-group form-inline">

                <div class="input-group date form_date">
                    <div class="input-group-addon">请选择挖掘时间</div>
                    <input id="timefrom" name="timefrom" class="form-control" size="40" type="text" value="" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                </div>


                <div class="input-group date form_date">
                    <div class="input-group-addon">到</div>
                    <input id="timeto" name="timeto" class="form-control" size="40" type="text" value="" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                </div>

            </div>

            <button type="submit" class="btn btn-primary btn-block">开始统计</button>
        </form>
    </div>
</div>
<%-- Bootstrap --%>
<script type="text/javascript" src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js" charset="UTF-8"></script>
<script src="/views/js/bootstrap.min.js"></script>
<script src="/views/js/bootstrap-datetimepicker.js"></script>
<script src="/views/js/locales/bootstrap-datetimepicker.fr.js"></script>
<script type="text/javascript">
    $('.form_date').datetimepicker({
        minView: "month",
        language:  'zh-CN',
        format: 'yyyy-mm-dd',
        todayBtn:  1,
        autoclose: 1
    });
</script>
</body>
</html>
