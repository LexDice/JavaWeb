<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>权限管理</title>
	<script
  		src="https://code.jquery.com/jquery-3.2.1.min.js"
  		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  		crossorigin="anonymous">
	</script>
    <script src="javascripts/userAction.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/signin.css"/>
</head>

<body>
<!-- Fixed navbar  -->
<div class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand">首页</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">管理事项<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#editBlock" role="button"data-toggle="modal" id="menu_add">添加事项</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">用户信息<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a id="signout" href="">退出</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>

<!-- /container -->
<div class="container col-md-offset-2 col-md-8" >

    <form class="form-signin" role="form" id="signInBlock">
        <h2 class="form-signin-heading">登录/注册</h2>

        <input id="signInUsername" type="text" class="form-control" name="username" placeholder="用户名"/>
        <input id="signInPassword" type="password" class="form-control" name="password" placeholder="密码"/>

        <input type="button" id="btnSignIn" class="btn btn-lg btn-primary btn-block" value="登录"/>
        <a href="#registerBlock" id="aRegister" role="button" class="btn btn-lg btn-success btn-block" data-toggle="modal">注册</a>
    </form>

    <!--登录后的界面-->
    <ul class="nav nav-tabs" role="tablist" id="mytab" style="display:none">
        <li role="presentation" class="active"><a id="tabDoing" href="#doingList" role="tab" data-toggle="tab" aria-controls="doingList" aria-expanded="true">待办事项</a></li>
        <li role="presentation"><a id="tabDone" href="#doneList" role="tab" data-toggle="tab" aria-controls="doneList" aria-expanded="false">已完成</a></li>
        <li role="presentation"><a id="tabOutDate" href="#outDate" role="tab" data-toggle="tab" aria-controls="outDate" aria-expanded="false">已过期</a></li>
    </ul>

</div>

<!--注册遮罩层-->
<div class="modal fade" id="registerBlock" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">
                    注册
                </h4>
            </div>

            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户名：</label>
                        <div class="col-sm-6">
                            <input id="registerUsername" type="text" class="form-control" name="username" placeholder="用户名"/>
                        </div>
                        <label id="exist" class="col-sm-4 control-label" style="color:red; display: none; text-align: left">此用户名已经被占用!</label>
                        <label id="notExist" class="col-sm-4 control-label" style="color:green; display: none; text-align: left">此用户名可以注册!</label>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">密 码：</label>
                        <div class="col-sm-6">
                            <input id="registerPassword" type="password" class="form-control" name="password" placeholder="密码"/>
                        </div>
                    </div>

                    <div id="modalRegisterBlock" class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <input type="button" id="btnRegister"  style="width:15%" class="btn btn-default" data-dismiss="modal" value="注册"/>
                        </div>
                    </div>
                </form>

            </div>

        </div>
    </div>
</div>

</body>
</html>