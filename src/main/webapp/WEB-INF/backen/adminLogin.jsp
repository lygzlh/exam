<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
<link rel="stylesheet"  href="${pageContext.request.contextPath}/res/css/backen/login.css">
<script src="${pageContext.request.contextPath}/res/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/res/js/backen/login.js"></script>
</head>
<body>
<div class="htmleaf-container">
	<div class="wrapper">
		<div class="container">
			<h1>练习系统后台</h1>
			
			<form class="form">
				<input id="username" type="text" placeholder="账号">
				<input id="password" type="password" placeholder="密码">
				<input type="button" id="loginSubmit" value="管理员登录"></input>
			</form>
		</div>
		
		<ul class="bg-bubbles">
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>
</div>

</body>
</html>

<!-- <p>
	用户名：<input id="username" type="text" />
</p>
<p>
	密码：<input id="password" type="password" />
</p>
<p>
	<input id="loginSubmit" type="button" value="登录"/>
</p> -->