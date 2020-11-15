<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>welcome</title>
</head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
      integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css"
      integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/rotationChart.css"/>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="layui/css/layui.css">
<script src="layui/layui.all.js"></script>
<script src="layui/layui.js"></script>

<style>
    .clearfix:after {
        content: " ";
        display: block;
        clear: both;
    }

    .main {
        width: 800px;
        height: 300px;
        position: absolute;
        top: 0px;
        left: 50%;
        margin-left: -350px;
        overflow: hidden;
    }

    .item {
        list-style: none;
        width: 400px;
        height: 230px;
        position: absolute;
        left: 0px;
        top: 27px;
        transition: all 0.3s ease;
    }

    .item img {
        width: 100%;
        height: 100%;
    }

    .left img,
    .right img {
        width: 30px;
        height: 30px;
    }

    .pressMain span {
        display: inline-block;
        margin: 2px 3px;
        width: 10px;
        height: 10px;
        border-radius: 50%;
        color: #fff;
        background-color: rgba(255, 255, 255, 0.53);
        text-align: center;
        line-height: 20px;
    }

    .pressMain .active {
        background: brown;
    }

    #datetime {
        line-height: 50px;
    }
</style>

<body>
    <%
    String result = String.valueOf(request.getAttribute("result"));
    if (result=="success"){
%>
<script src="layer.js"></script>
<script>
    layer.open({
        title: '报名成功！'
        , content: '请及时查看您的准考证'
    });
</script>
    <%
    } else if (result=="fai"){
%>
<script src="layer.js"></script>
<script>
    layer.open({
        title: '报名失败！'
        , content: '您已报名，请勿重新报名'
    });
</script>
    <%
    } else{
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

<div id="app" class="main clearfix" @mouseover="btnOpen" @mouseout="btnHide" style="margin-top:100px;">
    <div class="minMain">
        <div class="item" v-for="(item,index) in list" :key="index">
            <img :src="item.imgUrl"/>
        </div>
    </div>
    <div class="btnMain" v-show="btnShow">
        <div class="left" @click="leftClick">
            <img src="image/6.png"/>
        </div>
        <div class="right" @click="rightClick">
            <img src="image/7.png"/>
        </div>
    </div>
    <div class="pressMain">
        <span v-for="(item,index) in pressList" :class="{active:item.isShow}"></span>
    </div>
</div>
<script>

    var app = new Vue({
        el: "#app",
        data() {
            return {
                list: [
                    {imgUrl: 'image/p1.jpg'},
                    {imgUrl: 'image/p2.jpg'},
                    {imgUrl: 'image/p3.jpg'},
                    {imgUrl: 'image/p4.jpg'},
                    {imgUrl: 'image/p5.jpg'}
                ],
                pressList: [{name: '1', isShow: false}, {name: '2', isShow: false}, {
                    name: '3',
                    isShow: false
                }, {name: '4', isShow: false}, {name: '5', isShow: false}],
                numList: ['p0', 'p1', 'p2', 'p3', 'p4'],
                imgIndex: 0,
                imgTimer: null,
                btnShow: false
            }
        },
        mounted: function () {
            var Item = document.getElementsByClassName('item');
            for (var i = 0; i < Item.length; i++) {
                Item[i].className = 'item ' + this.numList[i]
            }
            this.imgMove()
            this.pressList[0].isShow = true
        },
        methods: {

            imgMove() {
                var Item = document.getElementsByClassName('item');
                this.imgTimer = setInterval(() => {
                    this.numList.push(this.numList[0]);
                    this.numList.shift()
                    this.imgIndex++;
                    for (var i = 0; i < Item.length; i++) {
                        Item[i].className = 'item ' + this.numList[i];
                    }
                    for (var i in this.pressList) {
                        this.pressList[i].isShow = false
                    }
                    if (this.imgIndex > 4) {
                        this.imgIndex = 0
                        this.pressList[this.imgIndex].isShow = true;
                    } else {
                        this.pressList[this.imgIndex].isShow = true;
                    }
                }, 15000)
            },
            btnOpen() {
                this.btnShow = true;
                clearInterval(this.imgTimer)
            },
            btnHide() {
                this.btnShow = false;
                this.imgMove()
            },
            leftClick() {
                var Item = document.getElementsByClassName('item');
                this.numList.unshift(this.numList[4]);
                this.numList.pop()
                for (var i = 0; i < Item.length; i++) {
                    Item[i].className = 'item ' + this.numList[i];
                }
                for (var i in this.pressList) {
                    this.pressList[i].isShow = false
                }
                this.imgIndex--
                if (this.imgIndex < 0) {
                    this.imgIndex = 4
                    this.pressList[this.imgIndex].isShow = true;
                } else {
                    this.pressList[this.imgIndex].isShow = true;
                }
            },
            rightClick() {
                var Item = document.getElementsByClassName('item');
                this.numList.push(this.numList[0]);
                this.numList.shift()
                for (var i = 0; i < Item.length; i++) {
                    Item[i].className = 'item ' + this.numList[i];
                }
                for (var i in this.pressList) {
                    this.pressList[i].isShow = false
                }
                this.imgIndex++
                if (this.imgIndex > 4) {
                    this.imgIndex = 0
                    this.pressList[this.imgIndex].isShow = true;
                } else {
                    this.pressList[this.imgIndex].isShow = true;
                }
            }
        }
    })
</script>

<script src="https://code.jquery.com/jquery-3.5.1.min.js" type="text/javascript" charset="utf-8"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
</html>
