<%@ page import="nuc.java.entity.apply" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>apply</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="rotationChart.css"/>
    <style>
        .bd {
            width: 400px;
            height: 500px;
            margin: auto;
            color: gray;
        }

        .bd tr {
            margin-top: 20px;
        }

        .bd table {
            border: 3px solid gray;
            text-align: center;
            margin-top: 40px;
        }

        t
        .bd span {
            font-size: larger;
            font-weight: 900;
        }

        #datetime {
            line-height: 50px;
        }
    </style>
</head>
<body>
<%
    //    apply applyId = (apply)session.getAttribute("applyId");
//    String id = applyId.getSid();
//    String name = applyId.getSname();
//    String phone = applyId.getSphone();
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
<div class="bd">
    <form action="ApplyServlet">
        <table style="width: 400px;height:350px;">
            <h1>报考信息</h1>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;<span>学号</span></td>
                <td><input type="text" name="Sid" value="${applyId.getSid()}" readonly></td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;<span>姓名</span></td>
                <td><input type="text" name="Sname" placeholder="${applyId.getSname()}" readonly></td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;<span>电话</span></td>
                <td><input type="text" name="Sphone" placeholder="${applyId.getSphone()}" readonly></td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;<span>报考科目</span></td>
                <td><select name="Scourse">
                    <optgroup label="计算机一级">
                        <option name="MS">计算机基础及MS Office应用</option>
                        <option name="WS">计算机基础及WPS Office应用</option>
                        <option name="PS">计算机基础及Photoshop应用</option>
                    </optgroup>
                    <optgroup label="计算机二级">
                        <option name="C">C语言程序设计</option>
                        <option name="C+">C++语言程序设计</option>
                        <option name="Java">Java语言程序设计</option>
                    </optgroup>
                    <optgroup label="计算机三级">
                        <option name="QS">嵌入式系统开发技术</option>
                        <option name="Lx">Linux应用与开发技</option>
                        <option name="IS">信息安全技术</option>
                    </optgroup>
                    <optgroup label="计算机四级">
                        <option name="IT">网络工程师</option>
                        <option name="ST">信息安全工程师</option>
                        <option name="KT">数据库工程师</option>
                    </optgroup>
                </select>
                </td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;&nbsp;<button type="submit" class="btn btn-primary">提交</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="reset" class="btn btn-primary">重置</button>
                </td>
            </tr>
        </table>
    </form>
</div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" type="text/javascript" charset="utf-8"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
</html>

