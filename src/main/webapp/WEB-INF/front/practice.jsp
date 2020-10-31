<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>练习</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/front/practice.css"/>
		<script src="${pageContext.request.contextPath}/res/js/jquery-3.3.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/res/js/front/handleQuestion.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/bootstrap.min.css" />
		<script src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script>

	</head>
	<script type="text/javascript">
		$('#myModal').modal({
			keyboard: false
		})
	</script>

	<body class="text-muted">

		<nav class="navbar navbar-light bg-light fixed-top">

			<a class="navbar-brand" href='' onclick='exitPractice()'>结束练习</a>

			<form id='subButton' class="form-inline">
				<button id='answerSubmit' type="button" class="btn btn-outline-primary" val='${requestScope.isWrong }'>确定</button>
			</form>
		</nav>

		<div class="card" style="margin: 4.5rem 1.5rem 2rem 1.5rem;">
			<nav class="navbar navbar-light bg-light text-muted">

				<h5>单选题</h5>
				<c:if test="${requestScope.isWrong==0 }">
					<h5>${requestScope.finishCount}/${requestScope.questionCount}</h5>
				</c:if>
				<c:if test="${requestScope.isWrong==1 }">
					<h5>还剩${requestScope.questionCount}道</h5>
				</c:if>

			</nav>

			<div class="card-body ">
	<c:forEach  items="${requestScope.questionList}" var="question">
				<p class="card-text text-left text-muted" style="font-weight: bold;">${question.title}</p>
				<div value='A' class="card text-center answer-click" style="margin-bottom: 0.8rem;">
					<div class="card-body text-muted ">
						<p class="card-text text-left">${question.answerA }</p>
					</div>
				</div>
				<div value='B' class="card text-center  answer-click" style="margin-bottom: 0.8rem;">
					<div class="card-body text-muted">
						<p class="card-text text-left">${question.answerB }</p>
					</div>
				</div>
				<div value='C' class="card text-center  answer-click" style="margin-bottom: 0.8rem;">
					<div class="card-body text-muted">
						<p class="card-text text-left">${question.answerC }</p>
					</div>
				</div>
				<div value='D' class="card text-center  answer-click" style="margin-bottom: 0.8rem;">
					<div class="card-body text-muted ">
						<p class="card-text text-left">${question.answerD }</p>
					</div>
				</div>
		
</c:forEach>

			</div>
			<div class="card-body text-right" style="padding-top: 0;">
				<span class="text-success hide-a" data-toggle="modal" data-target="#exampleModalCenter">查看解析</span>
			</div>
		</div>


<!-- 模态框 -->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h6 class="modal-title" id="exampleModalCenterTitle">题目解析：</h6>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
					</div>
	<c:forEach  items="${requestScope.questionList}" var="question">					
					<div class="modal-body text-left text-muted">
						${question.solution}
					</div>
</c:forEach>
				</div>
			</div>
		</div>
		
	</body>

</html>

<!-- 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/front/practice.css"/>
<script src="${pageContext.request.contextPath}/res/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/res/js/front/handleQuestion.js"></script>
<title>Insert title here</title>
</head>
<body>
<form>
<c:forEach items="${questionList}" var="question">
	<p>
		<div>
			<span>${question.title}</span> <span id="rightAnswer" nid="${question.id}"></span>
		</div>
		<div>
			<input type="radio" name="${question.id}" value="A"/> ${question.answerA}
		</div>
		<div>
			<input type="radio" name="${question.id}" value="B"/> ${question.answerB}
		</div>
		<div>
			<input type="radio" name="${question.id}" value="C"/> ${question.answerC}
		</div>
		<div>
			<input type="radio" name="${question.id}" value="D"/> ${question.answerD}
		</div>
	</p>
	<div class="rightAnswer">
		<a  onclick="solution();">查看解析</a>
		<p id='slt' style='display:none'>${question.solution}</p>
	</div>
</c:forEach>
<input id="answerSubmit" type="button" value="提交"/>
<input id="next" class="rightAnswer" type="button" value="下一题"/>
</form>
</body>
</html> -->