<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html><head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>首页</title>

    <!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/res/css/bootstrap.min.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/res/css/front/pricing.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/res/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/res/js/front/home.js"></script>
    		<script src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script>
  </head>
  
  

	<body class="text-muted">

		<header>

			<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top shadow">
				<a class="navbar-brand" href="">练题系统</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
     				 <span class="navbar-toggler-icon"></span>
    			</button>
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
						<li class="nav-item active">
						</li>

					</ul>
					<form class="form-inline mt-2 mt-md-0">
						<a class="btn btn-outline-success my-2 my-sm-0" href="changeInfo">修改个人资料</a>&nbsp;
					</form>
					<form class="form-inline mt-2 mt-md-0">
						<button class="btn btn-outline-danger my-2 my-sm-0" onclick='logout()'>退出</button>
					</form>
				</div>
			</nav>
		</header>

		<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center" style="margin-top: 3rem;">
			<h1 class="display-4"></h1>
			<p class="lead"></p>
		</div>

		<div class="container">
			<div class="card-deck text-center">
				<div class="card mb-4 shadow">
					<div class="card-header">
						<h5 class="my-0 ">练习题库</h5>
					</div>
					<div class="card-body">

						<ul class="list-unstyled mt-3 mb-4">
							<li>请选择分类:</li>
						</ul>

						<div class="input-group mb-3">
							<select id='pcate' class="custom-select">
								<!-- <option value='0' selected>全部</option> -->
								<c:forEach items='${requestScope.categoryList}' var='category'>
									<option value="${category.id}">${category.cname }</option>
								</c:forEach>
							</select>
						</div>
						<button class="btn btn-lg btn-block btn-outline-primary" onclick='catePractice()')>开始练习</button>
					</div>
				</div>
				<div class="card mb-4 shadow">
					<div class="card-header">
						<h5 class="my-0 ">错题练习</h5>
					</div>
					<div class="card-body">

						<ul class="list-unstyled mt-3 mb-4">
							<li>请选择分类:</li>
						</ul>

						<div class="input-group mb-3">
							<select id='wrongCate' class="custom-select" >
								<c:forEach items='${requestScope.categoryList}' var='category'>
									<option value="${category.id}">${category.cname }</option>
								</c:forEach>
							</select>
						</div>
						<button class="btn btn-lg btn-block btn-outline-primary" onclick="wrongPractice()">开始练习</button>
					</div>
				</div>

				<div class="card mb-4 shadow">
					<div class="card-header">
						<h5 class="my-0 ">练习进度</h5>
					</div>
					<div class="card-body">
					
						<ul class="list-unstyled mt-3 mb-4">
							<li>请选择分类:</li>
						</ul>

						<div class="input-group mb-3">
							<select id='progressCate' class="custom-select">
								<c:forEach items='${requestScope.categoryList}' var='category'>
									<option value="${category.id}">${category.cname }</option>
								</c:forEach>
							</select>
							</div>
						<button class="btn btn-lg btn-block btn-outline-primary" onclick="progress()">点击查看</button>
					</div>
				</div>

			</div>

		</div>

	</body></html>






<!--<html>
<head>
<meta charset="UTF-8">
<title>首页</title>
</head>
<body>
<h1>你好</h1>
<a href="register">注册</a>|
<a href="login">登录</a>
<form method='post' action='practice'>
	<div>选择题型</div>
	<input type="submit" value="提交"/>
</form>

</body>
</html>
-->