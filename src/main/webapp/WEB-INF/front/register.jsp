<%@ page   language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>注册</title>
		<link href="${pageContext.request.contextPath}/res/css/bootstrap.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/res/css/front/register.css" rel="stylesheet">
    	<script src="${pageContext.request.contextPath}/res/js/jquery-3.3.1.min.js"></script>
    			<script src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script>
    	<script src="${pageContext.request.contextPath}/res/js/vue.js"></script>
	  	<script src="${pageContext.request.contextPath}/res/js/front/register.js"></script>
	</head>

	<body class="bg-light" style="padding: 2rem 0;color: #4E555B;">
		<div class="container" id="userInfo">
			<div class="py-5 text-center">
				<h2>用户注册</h2>
				<p class="lead">请填写以下信息完成注册。</p>
			</div>

			<div class="" >
				<h4 class="mb-3">重要信息</h4>
				<form class="needs-validation" novalidate>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="username">账号</label>
							<input type="text" class="form-control" id="username" name='username' @keyup='userLimit()' v-model='username' placeholder="Username" required>
							<div class="invalid-feedback"  id='usernameStatus' t='0'>
								您的账号是必填项。
							</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="Password">密码</label>
							<input type="password" class="form-control" id="password" name='password'  @keyup='pswLimit()' v-model='password' placeholder="Password" required>
							<div class="invalid-feedback" id='pswStatus' t='0'>
								您的密码是必填项。
							</div>
						</div>
					</div>

					<small class="text-danger">请记住您填写的账号密码以便登录使用</small>
					<hr class="mb-4">

					<h4 class="mb-3">基本资料</h4>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="firstName">用户名</label>
							<input type="text" class="form-control" id="nickname" v-model='nickname'  @keyup='nicknameLimit()'  name='nickname' placeholder="" value="" required>
							<div class="invalid-feedback" id='nicknameStatus' t='0'>
								请输入您的姓名。
							</div>
						</div>

					</div>

					<div class="row">

						<div class="col-md-5 mb-3">
							<label for="gender">性别</label>
							<select class="custom-select d-block w-100" id="gender" name='gender' required>
								<option value="1">男</option>
								<option value="2">女</option>
							</select>
							<div class="invalid-feedback">
								请选择性别。
							</div>
						</div>

					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="phone number">手机号码</label>
							<input type="text" class="form-control" v-model='phone'  @keyup='phoneLimit()'  id="phone" name='phone'   placeholder="" required>
							<div class="invalid-feedback" id='phoneStatus' t='0'>
								请填写您的手机号
							</div>
						</div>

					</div>

					<hr class="mb-4">
					<input class="btn btn-primary btn-lg btn-block"  onclick='submitContext()' type='button' value='注册'/>
				</form>
			</div>
		</div>

		<!-- 小黑提示 -->
 <div style='position:fixed;z-index:9999;left: 50%;top: 50%; transform: translate(-50%,-50%);'>
  <div class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-delay="500">

    <div class="toast-body text-light bg-dark">

    </div>
  </div>
</div>	


	</body>

</html>

