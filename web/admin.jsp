<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="rotationChart.css"/>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
    <script>
        window.onload = function () {
            $.get("queryallServlet");
        }

    </script>
    <style>
        #datetime {
            line-height: 50px;
        }
    </style>

    <title>$Title$</title>
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
    <table class="table table-hover" align="center" width="900px">
        <tr align="center">
            <td>学号</td>
            <td>姓名</td>
            <td>密码</td>
            <td>性别</td>
            <td>电话</td>
            <td>考试状态</td>
            <td>考试代码</td>
            <td>考试名称</td>
            <td>准考证号</td>
            <td>考场号</td>
            <td>监考老师</td>
            <td>成绩</td>
            <td>管理</td>
        </tr>
        <c:forEach items="${s}" var="stu">
            <tr align="center" id="trr">
                <td id="ssid">${stu.getSid()}</td>
                <td>${stu.getSname()}</td>
                <td>${stu.getSpwd()}</td>
                <td>${stu.getSsex()}</td>
                <td>${stu.getSphone()}</td>
                <td>${stu.getSstatus()}</td>
                <td>${stu.getEid()}</td>
                <td>${stu.getEname()}</td>
                <td>${stu.getAid()}</td>
                <td>${stu.getRid()}</td>
                <td>${stu.getTname()}</td>
                <td>${stu.getGrade()}</td>
                <td>
                        <%-- 根据删除id 写script事件，将这一行删除，且将此学生的报考状态变为0--%>
                    <button type="button" class="${stu.getSid()}" name="delete" onclick="changer(${stu.getSid()})">
                        删除
                    </button>
                    <button type="button"  data-toggle="modal" data-target="#myModal"
                            id="btn_manage" onclick="geter(${stu.getSid()})">
                        管理
                    </button>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<%--弹窗--%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">请为考生添加考场号和监考老师</h4>
            </div>
            <div class="modal-body">
                <form action="addServlet" method="post">
                    学生ID：
                    <br>
                    <%--                    <div id="aaas" style="display: inline-block"></div>--%>
                    <input type="text" id="aaas" name="Sid">
                    <br><br>
                    考场号：<input type="text" id="rid" style="display: block" name="Rid"><br>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <%--点击确定之后，将数据添加到数据库，添加js点击事件，新建一个servlet，用Ajax发请求--%>
                        <button type="submit" class="btn btn-primary" id="aaa"
                                onclick="submiter(document.getElementById('aaas').textContent)">确定
                        </button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<script>
    // var rid = document.getElementById('rid').value;
    var btn_manage = document.getElementById('btn_manage')
    var ename = document.getElementById('ename');
    var aaa = document.getElementById('aaa');
    var rid = document.getElementById('rid');
    var tname = document.getElementById('tname');

    function submiter(id) {
        console.log(id)
        // 设置tr隐藏
        var btn = document.getElementsByClassName(id);
        var par = btn[0].parentNode;
        var parpar = par.parentNode;

        parpar.style.display = 'none';

        // 获取input中的值
        $.get("AddServlet", {rrid: rid.value, ttname: tname.value});
    }

    function changer(id) {
        // 原始代码
        var ssid = document.getElementById('ssid');
        var aaas = document.getElementById('aaas');
        var sssid = ssid.innerHTML;
        aaas.value = id;

        // 新增
        var btn = document.getElementsByClassName(id);
        var par = btn[0].parentNode;
        var parpar = par.parentNode;
        parpar.style.display = 'none';
    }

    function geter(id) {
        var ssid = document.getElementById('ssid');
        var aaas = document.getElementById('aaas');
        var sssid = ssid.innerHTML;
        aaas.value = id;
    }

    // aaa.onclick = function () {
    //     var rid = document.myform.Rider.value;
    //     var tname = document.myform.Tnamer.value;
    //
    //     $.get("managerServlet", {Rider: rid, Tnamer: tname});
    // }
</script>
</body>
</html>
