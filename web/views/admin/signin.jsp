






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
                    <h3 class="masthead-brand">WECHANGE-闲置物品交换平台</h3>
                    <nav>
                        <ul class="nav masthead-nav">
                            <li><a href="/views/admin/title.jsp">Home</a></li>
                            <li class="active"><a href="/views/admin/signin.jsp">Sign in</a></li>
                        </ul>
                    </nav>
                </div>
            </div>

            <div id="1" class="inner cover">
                <form class="form-signin" action="/do_login" method="post">
                    <h2 class="form-signin-heading">请填写信息</h2>
                    <input type="text" name="user" class="form-control" placeholder="用户名" required autofocus>
                    <input type="password" name="password" class="form-control" placeholder="密码" required autofocus>
                    <div class="span12"><br></div>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">登陆</button>
                    <button id="2" class="btn btn-lg btn-warning btn-block" type="submit">注册</button>
                </form>
            </div>

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
<script>
    $("#2").click(function () {
        var html = "";
        html += "<form class=\"form-signin\" action=\"/views/admin/user_register_ok.jsp\" method=\"post\">";
        html += "<h2 class=\"form-signin-heading\">请填写信息</h2>";
        html += "<input type=\"text\" name=\"user\" class=\"form-control\" placeholder=\"用户名\" required autofocus>";
        html += "<input type=\"text\" name=\"password\" class=\"form-control\" placeholder=\"密码\" required autofocus>";
        html += "<input type=\"text\" name=\"section\" class=\"form-control\" placeholder=\"身份\" required autofocus>";
        html += "<div class=\"span12\"><br></div>";
        html += "<button class=\"btn btn-lg btn-primary btn-block\" type=\"submit\">注册</button>";
        html += "</form>";
        document.getElementById("1").innerHTML = html;
    })
</script>
</body>
</html>
