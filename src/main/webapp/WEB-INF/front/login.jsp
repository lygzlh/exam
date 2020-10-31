<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ><head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录</title>
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
    <link href="${pageContext.request.contextPath}/res/css/front/signin.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/res/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/res/js/front/login.js"></script>
  </head>
  <body class="text-center">
    <form class="form-signin">

  <h1 class="h3 mb-3 font-weight-normal">用户登录</h1>
  <div class="mb-3">
		
  <label class="sr-only" for="username">用户名</label>
  <input class="form-control" id="username" autofocus="" required="" type="text" placeholder="用户名">
	</div>
	 <div class="mb-3">
  <label class="sr-only" for="password">密码</label>
  <input class="form-control" id="password" required="" type="password" placeholder="密码">
  </div>
  <div class="mb-3">
		
  </div>
  <input class="btn btn-lg btn-primary btn-block" type='button' id='loginSubmit' value="登录"></input>
  <div class="checkbox mb-3 text-right" style="margin: 0.5rem 0;">
  	 <a class="text-muted" href='register'><u>&nbsp;注册&nbsp;</u></p>
  </div>
</form>

<!-- 小黑提示 -->
 <div style='position:fixed;z-index:9999;left: 50%;top: 50%; transform: translate(-50%,-50%);'>
  <div class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-delay="500">

    <div class="toast-body text-light bg-dark">

    </div>
  </div>
</div>	
</body></html>