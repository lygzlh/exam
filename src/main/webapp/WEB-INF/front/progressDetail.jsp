<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>答题情况</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/bootstrap.min.css" />
		
		<script src="${pageContext.request.contextPath}/res/js/jquery-3.3.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/res/js/front/progressDetail.js"></script>
	</head>
	
	<style type="text/css">

	</style>

	<body class="bg-light text-muted">

		<nav class="navbar navbar-light bg-light fixed-top shadow-sm ">
			<a class="navbar-brand text-primary" href="/exam/">继续练习</a>

			<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModalCenter">
			  重置进度
			</button>

		</nav>
		<div class="text-center" style="margin:5rem 0 2rem 0;">
		<c:choose>
			<c:when test="${requestScope.qnum-requestScope.fnum==0 }">
				<h4 class="text-success">您已完成所以题目</h4>
			</c:when>
			<c:otherwise>
				<h4 class="text-danger">您还有${requestScope.qnum-requestScope.fnum }题未完成</h4>
			</c:otherwise>
		</c:choose>
		</div>

		<div style="width: 92%;margin: auto;">
			<table class="table table-striped text-center shadow">
				<thead>
					<tr>
						<th scope="col" colspan="2">${requestScope.cname}</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="align-middle" scope="row">题目数量</td>
							<td class="align-middle">${requestScope.qnum }</td>
					</tr>

					<tr>
						<td class="align-middle" scope="row">完成题数</td>
							<td class="align-middle">${requestScope.fnum }</td>
					</tr>
					

					<tr>
						<td class="align-middle" scope="row">完成率</td>
							<td class="align-middle">
								<div class="progress" style="background: #E2E3E5;">
									<div class="progress-bar progress-bar-striped progress-bar-animated bg-success" role="progressbar" style="width: ${requestScope.fnum*1.0/requestScope.qnum*100 }%"><fmt:formatNumber value="${requestScope.fnum*1.0/requestScope.qnum*100 }" type="number" pattern="#.00" />%</div>
								</div>
							</td>
					</tr>

					<tr>
						<td class="align-middle" scope="row">正确题数</td>
							<td class="align-middle">${requestScope.rnum }</td>
					</tr>
					<tr>
						<td class="align-middle" scope="row">错误题数</td>
						<td class="align-middle">${requestScope.wnum }</td>
						</tr>
					<c:if test='${requestScope.fnum!=0}'>
						<tr>
							<td class="align-middle" scope="row">正确率</td>
								<td class="align-middle">
									<div class="progress" style="background: #E2E3E5;">
										<div class="progress-bar progress-bar-striped progress-bar-animated bg-success" role="progressbar" style="width: ${requestScope.rnum*1.0/requestScope.fnum*100 }%"><fmt:formatNumber value="${requestScope.rnum*1.0/requestScope.fnum*100 }"  pattern="#.00" type="number"/>%</div>
									</div>
								</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalCenterTitle">警告</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        确定要重置？
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">不了</button>
		        <button type="button" class="btn btn-primary" onclick="resetQuestion()">确定</button>
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