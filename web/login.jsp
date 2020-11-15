<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/6/9
  Time: 8:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <script src="layui/layui.all.js"></script>
    <script src="layui/layui.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>


    <style>
        body {
            background-image: url("photo/login-bg.jpg");
            background-repeat: no-repeat;
            background-size: 100% 120%;
            background-attachment: fixed;
        }
    </style>
</head>
<body>
<%
    String statue = "0";
    String id = String.valueOf(request.getAttribute("id"));
    statue = String.valueOf(request.getAttribute("statue"));
    if (statue == "1") {
%>
<script src="layer.js"></script>
<script>
    layer.open({
        title: '注册成功，您的用户名为'
        , content: <%=id%>
    });
</script>
<%
} else {
%>
<script src="layer.js"></script>
<script>
    layer.msg('请选择登录或注册');
</script>
<%
    }
%>


<h1 style="float: left;width: 100%;text-align: center;color: white ">计算机等级考试</h1>
<br>

<form action="LoginServlet" method="post" class="form-horizontal" style="margin-top: 17%;color: white;font-size: 15px ">
    <div class="form-group" style="margin-right: 10%;margin-left: 6%;">
        <label  class="col-sm-2 control-label">账号</label>
        <div class="col-sm-10">
            <input style="width: 90%" type="text" class="form-control" id="inputEmail3" placeholder="Id" name="id">
        </div>
    </div>
    <div class="form-group" style="margin-right: 10%;margin-left: 6%;">
        <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
        <div class="col-sm-10">
            <input style="width: 90%" type="password" class="form-control" id="inputPassword3" placeholder="Password" name="pwd">
        </div>
    </div>
    <br><br>

    <%--    <div class="checkbox">--%>
    <%--        <label>--%>
    <%--            <input type="checkbox"> Remember me--%>
    <%--        </label>--%>
    <%--    </div>--%>
    <%--        </div>--%>
    <%--    </div>--%>
    <div class="form-group" style="margin-left: -3%">


        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default" onclick="loginError()">Sign in</button>
            <a href="register.jsp">
                <button type="button" class="btn btn-default">register</button>
            </a>
        </div>
    </div>
</form>

<button type="button" class="btn btn-primary " data-toggle="modal" data-target="#myModal" value=""
        style="float: right;margin-right: 15%">
    管理员登陆
</button>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document" style="color: black">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">管理员登录</h4>
            </div>
            <div class="modal-body">
                <form action="AdminServlet" method="post">
                    账号：<input type="text"  name="aid"><br><br>
                    密码：<input type="password" name="apwd">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <%--点击确定之后，将数据添加到数据库，添加js点击事件，新建一个servlet，用Ajax发请求--%>
                        <input type="submit" class="btn btn-primary" id="aaa" value="登录">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>


</body>
</html>
