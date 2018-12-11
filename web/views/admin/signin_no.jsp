
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%-- Bootstrap --%>
    <link href="/views/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <%-- Custom styles for this template --%>
    <link href="/views/css/cover.css" rel="stylesheet">
    <link href="/views/css/signin.css" rel="stylesheet" media="screen">
</head>
<body>
<div class="site-wrapper">
    <div class="site-wrapper-inner">
        <div class="cover-container">

            <div class="masthead clearfix">
                <div class="inner">
                    <h3 class="masthead-brand">Ophiocordyceps sinensis</h3>
                    <nav>
                        <ul class="nav masthead-nav">
                            <li><a href="/views/admin/title.jsp">Home</a></li>
                            <li class="active"><a href="/views/admin/signin.jsp">Sign in</a></li>
                        </ul>
                    </nav>
                </div>
            </div>

            <div id="1" class="inner cover">
                <div class="alert alert-danger" role="alert">
                    <p>
                        对不起！
                        您输入的用户名不存在或者密码错误！
                    </p>
                </div>
            </div>
            <a href="/views/admin/signin.jsp" class="btn btn-lg btn-default">返回</a>

            <div class="mastfoot">
                <div class="inner">
                    <p>Cover template for <a href="http://getbootstrap.com">Bootstrap</a>, by <a
                            href="https://twitter.com/mdo">@mdo</a>.</p>
                </div>
            </div>

        </div>
    </div>
</div>
<script src="/views/js/temp.js?ver=1"></script>
<%-- Bootstrap --%>
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="/views/js/bootstrap.min.js"></script>
</body>
</html>
