<%--
  Created by IntelliJ IDEA.
  User: dengsen
  Date: 2018/11/26
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%-- Bootstrap --%>
    <link href="/views/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <%-- Custom styles for this template --%>
    <link href="/views/css/cover.css" rel="stylesheet">
    <link href="/views/css/signin.css" rel="stylesheet" media="screen">

    <link href="/views/css/bootstrap-datetimepicker.min.css" rel="stylesheet">


</head>
<body>
<div class="site-wrapper">
    <div class="site-wrapper-inner">
        <div class="cover-container">

            <div class="masthead clearfix">
                <div class="inner">
                    <h3 class="masthead-brand">WECHANGE-闲置物品交换平台</h3>

                </div>
            </div>

            <div id="1" class="inner cover">
                <form class="form-signin" action="query_ok.jsp" method="post">
                    <h2 class="form-signin-heading">请输入查询类别</h2>
                    <input type="text" name="kind" class="form-control" placeholder="类别" required autofocus>









                    <div class="span12"><br></div>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">开始查询</button>

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
<script type="text/javascript" src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js" charset="UTF-8"></script>
<script src="/views/js/temp.js?ver=1"></script>
<%-- Bootstrap --%>
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
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