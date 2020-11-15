<%@ page import="nuc.java.entity.apply" %>
<%@ page import="nuc.java.entity.Attendence" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/6/18
  Time: 13:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
      integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css"
      integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="rotationChart.css"/>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" type="text/javascript" charset="utf-8"></script>

<style>
    table,
    tr,
    td {
        border: 1px solid gray;
        /*合并相邻边框*/
        /*border-collapse:collapse;*/
        font-size: 18px;
        text-align: center;
        /*border-style: ;*/
    }

    .aaa {

    }

    #datetime {
        line-height: 50px;
    }
</style>
<body>
<%!
    String eId;
    String rId;
    String sId;
    String sName;
    String sSex;
%>
<%
    String se = String.valueOf(session.getAttribute("attendance"));
    System.out.println(se.length());
    if (se.length() == 4) {
        // 获取id
        apply app = (apply) session.getAttribute("applyId");
        String id = app.getSid();

        request.setAttribute("id", id);
        request.getRequestDispatcher("zhunkaozhengServlet").forward(request, response);

        System.out.println("发送请求成功");
    } else {
        Attendence att = (Attendence) session.getAttribute("attendance");
        System.out.println("att是" + att);
        eId = att.getEid();
        rId = att.getRid();
        sId = att.getSid();
        sName = att.getSname();
        sSex = att.getSsex();
    }
%>
<div>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="welcome.jsp">计算机考试系统</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="apply.jsp">报名 <span class="sr-only"></span></a></li>
                    <li><a href="zhunkaozhen.jsp" id="btn" onclick="dianji()">准考证</a></li>
                    <li><a href="gradeShow.jsp">成绩单</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li id="datetime">
                        <script>
                            setInterval("document.getElementById('datetime').innerHTML=new Date().toLocaleString();", 1000)
                        </script>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                           aria-haspopup="true" aria-expanded="false">账户管理 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">查看个人信息</a></li>
                            <li><a href="login.jsp">退出账号</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div>
<div class="aaa">
    <div style="margin: auto;text-align: center;color: gray"><h2>计算机等级考试</h2></div>
    <div style="margin: auto;text-align: center;color: gray"><h2>准&nbsp考&nbsp证</h2></div>
    <%--<div style="border: 1px solid pink;width: 600px;height: 420px; margin: auto;margin-top: 2%">--%>

    <table style="width: 600px;height: 420px;margin: auto;margin-top: 50px;margin-bottom: 50px">
        <tr>
            <td colspan="2">学号</td>
            <td colspan="3" id="sid"><%=sId%></td>
            <td colspan="2"><span class="glyphicon glyphicon-star" aria-hidden="true"></span></td>
        </tr>
        <tr>
            <td colspan="2">姓名</td>
            <td colspan="3"><%=sName%></td>
            <td colspan="2"><span class="glyphicon glyphicon-star" aria-hidden="true"></span></td>
        </tr>
        <tr>
            <td colspan="2">性别</td>
            <td colspan="3"><%=sSex%></td>
            <td colspan="2"><span class="glyphicon glyphicon-text-background" aria-hidden="true"></span></td>
        </tr>
        <tr>
            <td colspan="2">报考类型</td>
            <td colspan="3"><%=eId%></td>
            <td colspan="2"><span class="glyphicon glyphicon-modal-window" aria-hidden="true"></span></td>
        </tr>
        <tr>
            <td colspan="2">考场号</td>
            <td colspan="3" id="rid"><%=rId%></td>
            <td colspan="2"><span class="glyphicon glyphicon-object-align-bottom" aria-hidden="true"></span></td>
        </tr>

    </table>
</div>
<%--</div>--%>
<%--<div class="bbb">--%>

<%--    <nav class="navbar navbar-default navbar-fixed-bottom">--%>
<%--        <div class="container" style="background-color:lightcyan;width: 100%;height: 60px;">--%>
<%--            <span style="display: inline-block"><h4>联系我们</h4></span>--%>
<%--            <span><h4>邮箱：1652448240@qq.com</h4></span>--%>
<%--        </div>--%>
<%--    </nav>--%>
<%--</div>--%>
<script>
    var aaa = document.querySelector('.aaa');
    var btn = document.getElementById('btn');
    var sid = document.getElementById('sid');
    var names = document.getElementById('names');


    //2.注册事件 处理程序
    btn.onclick = function () {
        $.get("AttendanceServlet", {username: sid.innerHTML}, function (data) {
            console.log(data)
            if (data == "false") {
                aaa.style.display = 'none';
            } else {
                aaa.style.dispaly = 'block';
            }
        }, "text");
        // aaa.style.display='none';
        return false
    };
</script>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" type="text/javascript" charset="utf-8"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
</html>