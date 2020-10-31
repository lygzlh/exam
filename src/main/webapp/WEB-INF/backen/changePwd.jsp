<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/res/css/backen/changePwd.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/res/js/backen/changePwd.js"></script>
</head>
<body>
<div id='mmt' class="form-horizontal">
<div style='width:500px;display:inline-block'>
	<div class="form-group">
    <label class="control-label w100">原密码</label>
    <div class="col-sm-10">
      <input id='pwd' type="text" class="form-control" placeholder="原密码">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label w100">新密码</label>
    <div class="col-sm-10">
      <input id='newPwd' type="password" class="form-control" placeholder="新密码">
    </div>
  </div>
    <div class="form-group">
    <label class="control-label w100">确认密码</label>
    <div class="col-sm-10">
      <input id='newPwd2' type="password" class="form-control" placeholder="确认密码">
    </div>
  </div>
   <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <input class="btn btn-primary btnss" type='button' onclick="changeSub()" value="确定"/>
    </div>
  </div>
</div>
</div>
</body>
</html>