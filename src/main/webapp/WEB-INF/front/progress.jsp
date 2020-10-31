<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>练习进度</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/bootstrap.min.css" />
		<script src="${pageContext.request.contextPath}/res/js/jquery-3.3.1.min.js"></script>
	</head>

	<body class="bg-light text-center text-muted" style="margin-top:1rem;">

			<div class="py-5 text-center ">
				<h3>练习进度</h3>
			</div>
			<div  style="width: 92%;margin: auto;" >
				<table class="table table-striped  shadow">
					<thead>
						<tr>
							<th scope="col" style="width: 35%;" >题目分类</th>
							<th scope="col">完成率</th>
							<th scope="col">正确率</th>
							<th scope="col">详细</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${requestScope.progressList}" var="progress">
						<tr>
							<td class="align-middle" scope="row" >${progress.cate.cname }</td>
							<td class="align-middle">${(progress.wnum+progress.rnum)*1.0/progress.qnum*100 }%</td>
							<td class="align-middle">${progress.rnum*1.0/progress.qnum*100 }%</td>
							<td class="align-middle"><a href="progress_detail?category=${progress.cate.id}" class="btn btn-primary btn-sm">查看</a></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>



	</body>

</html>