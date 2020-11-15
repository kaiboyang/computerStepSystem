<%@ page import="nuc.java.entity.apply" %>
<%@ page import="nuc.java.entity.GradeShow" %><%--
  Created by IntelliJ IDEA.
  User: 16524
  Date: 2020/6/23
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    #datetime {
        line-height: 50px;
    }
</style>
<body>
    <%!
    String sId;
    String sName;
    String sEname;
    String grade;
%>
    <%
    String gradeGroup = String.valueOf(session.getAttribute("s"));
    System.out.println("gradeGroup is"+gradeGroup);
    if (gradeGroup.length() == 4) {
        // 获取id
        apply app = (apply) session.getAttribute("applyId");
        String id = app.getSid();
        request.setAttribute("id", id);
        request.getRequestDispatcher("GradeShowServlet").forward(request, response);

        System.out.println("发送请求成功");
    } else {
        GradeShow s = (GradeShow) session.getAttribute("s");
        sId = s.getSid();
        sName = s.getSname();
        sEname = s.getsEname();
        grade = s.getGrade();

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

<div style="margin: auto;text-align: center;color: gray"><h2>计算机等级考试</h2></div>
<div style="margin: auto;text-align: center;color: gray"><h2>成&nbsp绩&nbsp单</h2></div>

<div style="margin-top: 50px">
    <table class="table table-hover">
        <tr>
            <th>学号</th>
            <th>姓名</th>
            <th>报考科目</th>
            <th>成绩</th>
        </tr>
        <tr>
            <td><%=sId%></td>
            <td><%=sName%></td>
            <td><%=sEname%></td>
            <td><%=grade%></td>
        </tr>
    </table>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" type="text/javascript" charset="utf-8"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
</html>