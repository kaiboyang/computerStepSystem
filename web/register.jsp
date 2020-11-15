<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/6/9
  Time: 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>register</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script>
        function check(){

        }
    </script>
</head>
<body>
<script src="layui/layui.all.js"></script>
<form method="post" style="margin-top: 5%" class="layui-form" action="RegisterServlet">
    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-inline">
            <input type="text" name="Sname" required  lay-verify="required" placeholder="姓名" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">电话</label>
        <div class="layui-input-inline">
            <input type="text" name="Sphone" required  lay-verify="required" placeholder="电话" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-inline">
            <input type="password" name="Spwd" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
        </div>
    </div>
<%--    <div class="layui-form-item">--%>
<%--        <label class="layui-form-label">确认密码</label>--%>
<%--        <div class="layui-input-inline">--%>
<%--            <input type="password" name="twice-pwd" required lay-verify="required" placeholder="请再次确认密码" autocomplete="off" class="layui-input">--%>
<%--        </div>--%>
<%--    </div>--%>

    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="radio" name="Ssex" value="男" title="男">
            <input type="radio" name="Ssex" value="女" title="女" checked>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">补充</label>
        <div class="layui-input-block">
            <textarea style="width: 80%" name="adder" placeholder="请输入内容" class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

<script src="layui/layui.js"></script>
<script>
    //一般直接写在一个js文件中
    layui.use(['layer', 'form'], function(){
        var layer = layui.layer
            ,form = layui.form;

        // layer.msg('Hello World');
    });
</script>
</body>
</html>
