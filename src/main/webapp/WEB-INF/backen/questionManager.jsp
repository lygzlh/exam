<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="${pageContext.request.contextPath}/res/css/backen/question.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/res/js/backen/questionManager.js"></script>
<script src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script>
<script type="text/javascript">

	</script>
</head>
<body>
<p class='form-inline'>
<select class="form-control" id='cate'>
<option value="0">全部</option>
<c:forEach  items="${requestScope.categoryList}" var="category">
	<option value="${category.id}">${category.cname}</option>
</c:forEach>
</select>
<input class="btn btn-primary btnss m-left" type="button" style='display:none' id="changecate" onclick="changecate()" value="修改类别"/>
<button type="button" class="btn btn-danger btnss m-left" style='display:none' id="deletecate"  onclick="delcate(this)">删除类别</button>
<input class="form-control" id='findTitle' type='text' placeholder="输入查询的题目" />
<input class="btn btn-primary btnss m-left" type='button' onclick="searchTitle(1)" value="查询"/>
<input class="btn btn-primary btnss m-left" type="button" onclick="newcate()" value="新增类别"/><span id='in-cate'></span>
<input class="btn btn-primary btnss m-left" type="button" onclick="insert()" value="新增题目"/>
</p>

<!-- 模态对话框 -->
<div style="position:relative" id='mt' class='hide-m'>
	<div class="motai" onclick='cancelInsert()'>
	</div>
	<div id='mmt' class="mt-insert form-horizontal hide-mm">
	<div class='x-btn d-to-hand' onclick='cancelInsert()' >X</div>
	<div style="margin:40px">
		<div>
		<label>类别：</label>
		<select class="form-control fcont" id='mt-cate'>
		<c:forEach  items="${requestScope.categoryList}" var="category">
			<option value="${category.id}">${category.cname}</option>
		</c:forEach>
	</select>
	</div>
	<div>
		<label>题目：</label>
		<input class="form-control fcont" id='title' type='text' name='title'/>
	</div>
	<div>
		<label>A：</label>
		<input class="form-control fcont" id='answerA' type='text' name='answerA'/>
	</div>
	<div>
		<label>B：</label>
			<input class="form-control fcont" id='answerB' type='text' name='answerB'/>
		</div>
		<div>
		<label>C：</label>
			<input class="form-control fcont" id='answerC' type='text' name='answerC'/>
		</div>
		<div>
		<label>D：</label>
			<input class="form-control fcont" id='answerD' type='text' name='answerD'/>
		</div>
		<div>
		<label>正确答案：</label>
			<select class="form-control fcont" id='rightAnswer'>
					<option value="A">A</option>
					<option value="B">B</option>
					<option value="C">C</option>
					<option value="D">D</option>
			</select>
		</div>
		<div>
		<label>解析：</label>
			<input class="form-control fcont" id='solution' type="text" />
		</div>
		<div style='margin-top:15px'>
			<input  class="btn btn-danger btnss" style='margin-left:150px;width:100px' id='sub' type="button" onclick='insertSub()' value="确定"/>
		</div>
	</div>
	</div>
	<!-- 查看题目 -->
	<div id='ck' class="mt-check form-horizontal hide-check">
	<div class='x-btn d-to-hand' onclick='rCheck()' >X</div>
		<div style='margin:40px'>
			<p>
				<h5>题目</h5>
				<div id='title-text'></div>
			</p>
			<p>
				<h5>分类</h5>
				<div id='cate-text'></div>
			</p>
			<p>
				<h5>A：</h5>
				<div id='A-text'></div>
			</p>
			<p>
				<h5>B：</h5>
				<div id='B-text'></div>
			</p>
			<p>
				<h5>C：</h5>
				<div id='C-text'></div>
			</p>
			<p>
				<h5>D：</h5>
				<div id='D-text'></div>
			</p>
			<p>
				<h5>正确答案：</h5>
				<div id='right-text'></div>
			</p>
			<p>
				<h5>解析：</h5>
				<div id='solution-text'></div>
			</p>
		</div>
	</div>
</div>

<div style='height:637px'>
<table style='table-layout: fixed' class='table table-striped table-hover table-condensed'>
<thead>
<tr>
	<th style='width:70px'>分类</th>
	<th style='width:170px'>题目</th>
	<th style='width:100px'>选项A</th>
	<th style='width:100px'>选项B</th>
	<th style='width:100px'>选项C</th>
	<th style='width:100px'>选项D</th>
	<th style='width:100px'>正确答案</th>
	<th style='width:100px'>解析</th>
	<th style='width:150px'>操作</th>
</tr>
</thead>
<tbody id="tbody">
<c:forEach  items="${requestScope.questionList}" var="question" varStatus="status">
<tr id="${question.id}">
	<td n="c">${question.cname}</td>
	<td n="c">${question.title}</td>
	<td n="c">${question.answerA}</td>
	<td n="c">${question.answerB}</td>
	<td n="c">${question.answerC}</td>
	<td n="c">${question.answerD}</td>
	<td n="c">${question.rightAnswer}</td>
	<td n="c">${question.solution}</td>
	<td n="b">
	<input class="btn btn-success btnss" type="button" onclick="check(${question.id},'${question.cname}')" value="查看"/>
	<input class="btn btn-primary btnss" type="button" onclick="update(${question.id},${question.cid})" value="修改"/>
	<button type="button" class="btn btn-danger btnss" data-toggle="modal" data-target="#exampleModal" onclick="deleteGetId(${question.id})">删除</button>
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
        	你确定要删除吗？
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">不了</button>

        <button id='sure-delete' type="button" class="btn btn-primary">确定</button>

      </div>
    </div>
  </div>
</div>

<!--删除类别 Modal -->
<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">警告</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        	您确定要删除此类别吗？（此操作将连同类别内题目一同删除）
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">不了</button>

        <button id='sure-delete1' type="button" class="btn btn-primary">确定</button>

      </div>
    </div>
  </div>
</div>
<!--修改类别 Modal -->
<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
      <h5 class="modal-title" id="exampleModalLabel">请修改</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
                 <input id="nc123" class="form-control m-left" type="text"/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">不了</button>

        <button id='' type="button" class="btn btn-primary " onclick="subChangeCate()">确定</button>

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