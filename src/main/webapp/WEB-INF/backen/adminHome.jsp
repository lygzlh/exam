<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"><head>
    <meta charset="utf-8">
    <title>后台管理</title>
    <!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/res/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/res/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/res/js/backen/home.js"></script>
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
    <link href="${pageContext.request.contextPath}/res/css/backen/dashboard.css" rel="stylesheet">
    
  </head>
  <body>
       <nav class="navbar navbar-dark fixed-top flex-md-nowrap p-0 shadow" style="background-color: #004080;">
  <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="">后台管理系统</a>

  <ul class="navbar-nav px-3">
    <li class="nav-item text-nowrap">
    <form>
      <button class="nav-link btn" style='background-color:#004080' onclick="logout()">注销</button>
      </form>
    </li>
  </ul>
</nav>

<div class="container-fluid">
  <div class="row">
    <nav class="col-md-2 d-none d-md-block bg-light sidebar">
      <div class="sidebar-sticky">
        <ul class="nav flex-column">
          <li class="nav-item nav-link active menu_li d-to-hand" data-toggle='question?page=1'>
              <span data-feather="home"></span>
              	题目管理 
          </li>
          <li class="nav-item nav-link menu_li d-to-hand" data-toggle='get_user?page=1'>
              <span data-feather="layers"></span>
              	用户管理
          </li>
          <li class="nav-item nav-link menu_li d-to-hand" data-toggle='change_password'>
              <span data-feather="l"></span>
              	密码修改
          </li>
        </ul>
	</div>
    </nav>

<!-- 继承页面 -->
    <main class="col-md-9 ml-sm-auto col-lg-10 px-4" role="main">
    <div style='min-width:1497px'>
    	<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    	<h1 class="h2">题目管理</h1>
	    </div>
	    <div class="div_home_context_main">
	        
	    </div>
	</div>
    </main>
  </div>
</div>


</body></html>
