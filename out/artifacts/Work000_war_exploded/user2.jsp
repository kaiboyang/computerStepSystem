<%--
  Created by IntelliJ IDEA.
  User: QBY
  Date: 2020/6/22
  Time: 1:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="rotationChart.css"/>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
    <style>
        #datetime{
            line-height: 50px;
        }
    </style>
    <script>
        $.get("addServlet");

    </script>
    <title>Title</title>
</head>
<body>
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
                    <a class="navbar-brand" href="#">计算机考试系统</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a href="admin.jsp">考场分配 <span class="sr-only"></span></a></li>
                        <li><a href="grade.jsp" id="btn">录入成绩</a></li>

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
    <div>
        <table class="table table-hover" align="center" width="900px" >
        <tr align="center">
            <td>学号</td>
            <td>姓名</td>
            <td>密码</td>
            <td>性别</td>
            <td>电话</td>
            <td>考试代码</td>
            <td>考试名称</td>
            <td>准考证号</td>
            <td>考场号</td>
            <td>监考老师</td>
            <td>成绩</td>
        </tr>
            <c:forEach items="${s}" var="stu">
                <tr align="center">
                <td id="ssid">${stu.getSid()}</td>
                <td>${stu.getSname()}</td>
                <td>${stu.getSpwd()}</td>
                <td>${stu.getSsex()}</td>
                <td>${stu.getSphone()}</td>
                <td>${stu.getEid()}</td>
                <td>${stu.getEname()}</td>
                <td>${stu.getAid()}</td>
                <td>${stu.getRid()}</td>
                <td>${stu.getTname()}</td>
                <td>${stu.getGrade()}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
