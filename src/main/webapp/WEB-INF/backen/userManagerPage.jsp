<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/res/css/backen/userManager.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/res/js/vue.js"></script>
<script src="${pageContext.request.contextPath}/res/js/backen/user.js"></script>

</head>
<body>
<div id='userManagerInfo'>
	<p class='form-inline'>
		<input class="form-control" id='findName' type='text' placeholder="输入查询的账号或用户名" />
		<input class="btn btn-primary btnss m-left" type='button' onclick="searchName(1)" value="查询"/>
		<input class="btn btn-primary btnss m-left" type='button' onclick="insert()" value="新增"/>
	</p>
	<div style='height:637px'>
		<table style='table-layout: fixed' class='table table-striped table-hover table-condensed'>
			<thead>
			<tr>
				<th>id</th>
				<th>账号</th>
				<th>密码</th>
				<th>用户名</th>
				<th>性别</th>
				<th>电话</th>
				<th>操作</th>
			</tr>
			</thead>
			
			<tbody id="tbody">
			<c:forEach  items="${requestScope.userList}" var="user">
			<tr id="${user.id}">
				<td>${user.id}</td>
				<td n="c">${user.username}</td>
				<td n="c">${user.password}</td>
				<td n="c">${user.nickname}</td>
				<td n="c">${user.gender}</td>
				<td n="c">${user.phone}</td>
				<td n="b">
				<input class="btn btn-success btnss" type="button" onclick="showDetail(${user.id})" value="查看"/>
				<input class="btn btn-primary btnss" type="button" onclick="update(${user.id})" value="修改"/>
				<button type='button' class='btn btn-danger btnss' data-toggle='modal' data-target='#exampleModal' onclick='deleteGetUserId(${user.id})'>删除</button>
				</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
		
	</div>
	<!-- 分页 -->
		<div>
		<nav  style='margin:0 auto;' aria-label="Page navigation example">
	<ul class="pagination justify-content-center form-inline" id='fy'>
	<c:choose>
		<c:when test="${requestScope.cpage > 1}">
		<li class="page-item"><a href="javascript:;" class="page-link" onclick="page(${requestScope.cpage-1})">上一页</a></li>
		</c:when>
		<c:otherwise>
		<li class="page-item disabled"><a href="javascript:;" class="page-link" onclick="page(${requestScope.cpage-1})">上一页</a></li>
		</c:otherwise>
	</c:choose>
		<c:forEach var="i" begin="${requestScope.start }" end="${requestScope.pgcount}" step="1">
			<c:if test="${i-requestScope.start<9}">
				<c:if test="${requestScope.cpage==i}">
					<li class="page-item active"><a href="javascript:;" class="page-link" onclick="page(${i})">${i}</a></li>
				</c:if>
				<c:if test="${requestScope.cpage!=i}">
					<li class="page-item"><a href="javascript:;" class="page-link" onclick="page(${i})">${i}</a></li>
				</c:if>
			</c:if>
		</c:forEach>
	<c:choose>
		<c:when test="${requestScope.cpage < requestScope.pgcount}">
			<li class="page-item"><a href="javascript:;" class="page-link" onclick="page(${requestScope.cpage+1})">下一页</a></li>
		</c:when>
		<c:otherwise>
			<li class="page-item disabled"><a href="javascript:;" class="page-link" onclick="page(${requestScope.cpage+1})">下一页</a></li>
		</c:otherwise>
	</c:choose>
		&nbsp共 <span>${requestScope.pgcount}</span> 页&nbsp <span>${requestScope.recordCount}</span>条记录
	</ul>
</nav>
		</div>
	<!-- 模态对话框 -->
<div style="position:relative" id='mt' class='hide-m'>
	<div class="motai" onclick='cancleUpdate()'>
	</div>
	
	<!-- 输入 -->
	<div id='mmt' class="mt-insert form-horizontal hide-mm">
	<div class='x-btn d-to-hand' onclick='cancleUpdate()' >X</div>
	<div style="margin:40px">
	<form class="needs-validation" novalidate>
	<div class="mb-3">
		<label>账号：</label>
		<input class="form-control fcont" id='username' type='text' autocomplete="off" v-model="username" @keyup='userLimit()'/>
		<div class="invalid-feedback"  id='usernameStatus' t='0'>
		
		</div>		
	</div>
	<div class="mb-3">
		<label>密码：</label>
		<input class="form-control fcont" id='password' type='text' autocomplete="off" @keyup='pswLimit()' v-model='password'/>
		<div class="invalid-feedback" id='pswStatus' t='0'>

		</div>		
	</div>
	<div class="mb-3">
		<label>用户名：</label>
		<input class="form-control fcont" id='nickname' type='text' autocomplete="off"  v-model='nickname'  @keyup='nicknameLimit()'/>
		<div class="invalid-feedback" id='nicknameStatus' t='0'>

		</div>					
		</div>
	<div class="mb-3">
		<label>性别：</label>
			<select class="form-control fcont" id='gender'>
					<option value="1" selected>男</option>
					<option value="2">女</option>
			</select>
		<div class="invalid-feedback">

		</div>			
		</div>
		<div class="mb-3">
		<label>电话：</label>
			<input class="form-control fcont" id='phone' type='text' autocomplete="off" v-model='phone'  @keyup='phoneLimit()'  />
		<div class="invalid-feedback" id='phoneStatus' t='0'>

		</div>		
		</div>
		</form>
		<div style='margin-top:15px'>
			<input  class="btn btn-danger btnss" style='margin-left:150px;width:100px' id='sub' type="button" onclick='insertSub()' value="确定"/>
		</div>
	</div>
	</div>
	<!-- 查看题目 -->
	<div id='ck' class="mt-check form-horizontal hide-check">
	<div class='x-btn d-to-hand' onclick='rCheck()' >X</div>
		<div style="width: 420px; height: 600px; overflow: hidden; position: relative;margin:40px">
			<div id="showQ" style='position: absolute;left: 0;top: 0;right: -17px;bottom: 0;overflow-x: hidden;overflow-y: scroll;'>

			</div>
		</div>
	</div>

<!--删除 Modal 
    <div id='delmt' class="modal-content hide-del" style='z-index:999;position:fixed;top:10%;left:50%;width:500px;'>
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">警告</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        	你确定要删除吗
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">不了</button>
        <button id='sure-delete' type="button" class="btn btn-primary" >确定</button>
      </div>
      </div>
-->

</div>
		<!--删除 Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">警告</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        	你确定要删除吗
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">不了</button>

        <button id='sure-delete' type="button" class="btn btn-primary">确定</button>

      </div>
    </div>
  </div>
</div>
</div>
  <!-- 小黑提示 -->
  <div style='position: fixed;z-index:9999;left: 50%;top: 50%; transform: translate(-50%,-50%);'>
  <div class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-delay="2000">

    <div class="toast-body text-light bg-dark">

    </div>
  </div>
</div>

</body>
</html>