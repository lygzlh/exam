<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>修改资料</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/bootstrap.min.css" />
		<script src="${pageContext.request.contextPath}/res/js/jquery-3.3.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script>
				<script src="${pageContext.request.contextPath}/res/js/vue.js"></script>
		<script src="${pageContext.request.contextPath}/res/js/front/changeInfo.js"></script>
	<script type="text/javascript">
		$('#myModal').modal({
			keyboard: false
		})
	</script>
	</head>



	<body class="bg-light" style="padding: 1rem 0;color: #4E555B;">
		<div class="container" id='changeUserInfo'>
			<div class="py-5 text-center">
				<h2>修改资料</h2>
				<p class="lead">您可以修改以下信息</p>
			</div>

			<div class="" style="margin: 0 auto;">

				<form class="needs-validation" novalidate >

					<div class="mb-3">
						<label for="nickname">用户名</label>
						<input type="text" class="form-control" id="nickname" v-model='nickname' @keyup='nicknameLimit()' name="nickname" placeholder="" required>
						<div class="invalid-feedback" id='nicknameStatus' t='1'>

						</div>
					</div>

					<div class="mb-3">
						<label for="gender">性别</label>
						<select class="custom-select d-block w-100" id="gender" name="gender" required>
							<option value="1">男</option>
							<option value="2">女</option>
						</select>
						<div class="invalid-feedback">

						</div>
					</div>

					<div class="mb-3">
						<label for="phone number">手机号码</label>
						<input type="tel" class="form-control" id="phone" v-model='phone' @keyup='phoneLimit()' name="phone" placeholder="" required>
						<div class="invalid-feedback" id='phoneStatus' t='1'>

						</div>
					</div>

					<hr class="mb-4">
					<div class="mb-3">
						<button onclick="sureChange()" class=" btn btn-primary btn-lg btn-block" type="button">确认修改</button>
					</div>
				</form>
				<div class="card-body text-right" style="padding-top: 0;">
					<span class="text-danger" data-toggle="modal" data-target="#exampleModalCenter">修改密码</span>
				</div>
			</div>
			
			<!-- Modal -->
			<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalCenterTitle">修改密码</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          					<span aria-hidden="true">&times;</span>
        				</button>
					</div>
					<div class="modal-body">
					<form class="needs-validation" novalidate>
						<div class="container">
							<div class="mb-3">
								<label for="Password">原密码</label>
								<input type="password" class="form-control" id="password" v-model="password"  @keyup='pswLimit()' placeholder="" required>
								<div class="invalid-feedback" id="pswStatus" t='0'>

								</div>
							</div>
							<div class="mb-3">
								<label for="Password">新密码</label>
								<input type="password" class="form-control" id="new_password" v-model="new_password" @keyup="newpswLimit()" placeholder="" required>
								<div class="invalid-feedback" id="newpswStatus" t='0'>

								</div>
							</div>
							<div class="mb-3">
								<label for="Password">再次输入新密码</label>
								<input type="password" class="form-control" id="new_password_again" v-model="new_password_again" @keyup="newpsw2Limit()" placeholder="" required>
								<div class="invalid-feedback" id="newpsw2Status" t='0'>

								</div>
							</div>
						</div>
					</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
						<button type="button" class="btn btn-primary" onclick="changepsw()">确定</button>
					</div>
				</div>
			</div>
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