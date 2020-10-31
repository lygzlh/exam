/**
	更新
 * 
 */
function update(e,c){
	var data = [e];
	$('#mt').removeClass('hide-m');
	$('#mmt').removeClass('hide-mm');
	$("#"+e).children().each(function(){
		if($(this).attr("n")=="c"){
			var content = $(this).text();
			data.push(content);
		}
	})
	$('#mt-cate').val(c);
	$('#title').val(data[2]);
	$('#answerA').val(data[3]);
	$('#answerB').val(data[4]);
	$('#answerC').val(data[5]);
	$('#answerD').val(data[6]);
	$('#rightAnswer').val(data[7]);
	$('#solution').val(data[8]);
	$('#sub').attr('onclick','submitData('+e+')')
}

/*
 * 获取数据，转成question类的格式，发送给服务器
 */
function submitData(e){
	var cate = $('#mt-cate').val();
	var title = $('#title').val();
	var answerA = $('#answerA').val();
	var answerB = $('#answerB').val();
	var answerC = $('#answerC').val();
	var answerD = $('#answerD').val();
	var rightAnswer = $('#rightAnswer').val();
	var solution = $('#solution').val();
	$.ajax({
		type:"post",
		url:"update_question",
		data:{
			'id':e,
			"title":title,
			"answerA":answerA,
			"answerB":answerB,
			"answerC":answerC,
			"answerD":answerD,
			"rightAnswer":rightAnswer,
			"solution":solution,
			"cid":cate
		},
		dataType:"json",
		success:function(arg){
			if(arg.success){
				$('#mt-cate').val('1');
				$('#title').val('');
				$('#answerA').val('');
				$('#answerB').val('');
				$('#answerC').val('');
				$('#answerD').val('');
				$('#rightAnswer').val('');
				$('#solution').val('');
				location.reload();
			}else{
				alert("修改失败，请重试");
			}
		}
	})
}

/*
 * 模态对话框
 */
function insert(){
	
	$('#mt').removeClass('hide-m');
	$('#mmt').removeClass('hide-mm');
	
}
/*
 * 新增题目
 */
function insertSub(){
	var cate = $('#mt-cate').val();
	var title = $('#title').val();
	var answerA = $('#answerA').val();
	var answerB = $('#answerB').val();
	var answerC = $('#answerC').val();
	var answerD = $('#answerD').val();
	var rightAnswer = $('#rightAnswer').val();
	var solution = $('#solution').val();
	if(cate==null){
		$(".toast").toast("show");
		$(".toast-body").text("请先新增类别！");
	}else{
	$.ajax({
	type:"post",
	url:"add_question",
	data:{
		
	"title":title,
	"answerA":answerA,
	"answerB":answerB,
	"answerC":answerC,
	"answerD":answerD,
	"rightAnswer":rightAnswer,
	"solution":solution,
	"cid":cate
	},
	dataType:"json",
	success:function(arg){
		if(arg){
			location.reload();
		}else{
			alert("新增失败");
		}
	}
})}
}

/*
 * 取消新增
 */
function cancelInsert(){
	$('#mt-cate').val('1');
	$('#title').val('');
	$('#answerA').val('');
	$('#answerB').val('');
	$('#answerC').val('');
	$('#answerD').val('');
	$('#rightAnswer').val('A');
	$('#solution').val('');
	$('#sub').attr('onclick','insertSub()');
	rCheck();
}
/*
 * 获得删除题目id
 */
function deleteGetId(e){
	$('#sure-delete').attr('onclick','deleteQuestion('+e+')');
}

/*
 * 删除题目
 */
function deleteQuestion(e){
	var id = e;
	$.ajax({
		url:"delete_question",
		type:'post',
		data:{'nid':id},
		dataType:'json',
		success:function(arg){
			if(arg.success){
				location.reload();
			}else{
				alert("删除失败");
			}
		}
	})
}

/*
 * 查询
 */
function searchTitle(page){
	var title = $('#findTitle').val();
	var cate = $('#cate').val();
	if(cate!='0'){
		$('#deletecate').css('display','inline-block');
		$('#changecate').css('display','inline-block');
	}else{
		$('#deletecate').css('display','none');
		$('#changecate').css('display','none');
	}
	$.ajax({
		url:"find_question",
		type:"get",
		data:{
			'title':title,
			'category':cate,
			'page':page,
		},
		dataType:'json',
		success:function(arg){
			console.log(arg.start,arg.pgcount);
			var body = $('#tbody');
			body.empty();
			for (var i=0;i<arg.questionList.length;i++){
				body.append("<tr id="+arg.questionList[i].id+">" +
						"<td n='c'>"+arg.questionList[i].cname+"</td>"+
						"<td n='c'>"+arg.questionList[i].title+"</td>"+
						"<td n='c'>"+arg.questionList[i].answerA+"</td>"+				
						"<td n='c'>"+arg.questionList[i].answerB+"</td>"+
						"<td n='c'>"+arg.questionList[i].answerC+"</td>"+
						"<td n='c'>"+arg.questionList[i].answerD+"</td>"+
						"<td n='c'>"+arg.questionList[i].rightAnswer+"</td>"+
						"<td n='c'>"+arg.questionList[i].solution+"</td>"+
						"<td n='b'><input class='btn btn-success btnss' type='button' onclick='check("+arg.questionList[i].id+",\""+arg.questionList[i].cname+"\")' value='查看'/>&nbsp" +
						"<input class='btn btn-primary btnss' type='button' onclick='update("+arg.questionList[i].id+","+arg.questionList[i].cid+")' value='修改'/>&nbsp" +
						"<button type='button' class='btn btn-danger btnss' data-toggle='modal' data-target='#exampleModal' onclick='deleteGetId("+arg.questionList[i].id+")'>删除</button>" +
						
						"</td>"+
						"</tr>")
			};
			var d = "";
			if(arg.cpage>1){
				d=d+"<li class='page-item'><a href='javascript:;' class='page-link' onclick='searchTitle("+(arg.cpage-1)+")'>上一页</a></li>"
			}else{
				d=d+"<li class='page-item disabled'><a href='javascript:;' class='page-link' onclick='searchTitle("+(arg.cpage-1)+")'>上一页</a></li>"
			}
			for(var i=arg.start;i<=arg.pgcount;i++){
				if(i-arg.start<9){
					if(arg.cpage==i){
						d=d+"<li class='page-item active'><a href='javascript:;' class='page-link' onclick='searchTitle("+i+")'>"+i+"</a></li>";
					}else{
						d=d+"<li class='page-item'><a href='javascript:;' class='page-link' onclick='searchTitle("+i+")'>"+i+"</a></li>";
					}
				}
			}
			if(arg.cpage<arg.pgcount){
				d=d+"<li class='page-item'><a href='javascript:;' class='page-link' onclick='searchTitle("+(arg.cpage+1)+")'>下一页</a></li>"
			}else{
				d=d+"<li class='page-item disabled'><a href='javascript:;' class='page-link' onclick='searchTitle("+(arg.cpage+1)+")'>下一页</a></li>"
			}
			d=d+"&nbsp共 <span>"+arg.pgcount+"</span> 页 &nbsp<span>"+arg.recordCount+"</span>条记录";
			$("#fy").empty();
			$('#fy').append(d);
		}
	})
}
/*
 * 新增类别，添加标签
 */
function newcate(){
	if($('#in-cate').children().length==0){
		$('#in-cate').append("<input id='nc' class='form-control m-left' type='text' placeholder='请输入新增类别'/>" +
				"<input class='btn btn-primary btnss m-left' type='button' value='确定' onclick='subCate()'/>" +
				"<input class='btn btn-primary btnss m-left' type='button' value='取消' onclick='cancleCate()'/>")
	}
}
/*
 * 修改类别
 */
function changecate(){
	var a = $("#cate option:checked").text();
	$("#nc123").val(a);
	var e = $('#cate').val();
	console.log(e)
	if(e!=0){
		$('#exampleModal2').modal('show');
	}else{
		$(".toast").toast("show");
		$(".toast-body").text("不能对全部进行修改！");
	}

}


/*
 * 提交修改类别
 */
function subChangeCate(){
	var nc = $('#nc123').val();
	var cate = $('#cate').val();
	if(nc==""){
		$(".toast").toast("show");
		$(".toast-body").text("类别名不能为空！");
	}else{
		$.ajax({
			url:'change_cate',
			type:'post',
			data:{
				'cid':cate,
				'cate':nc
			},
			dataType:'json',
			success:function(arg){
				if(arg.success){
					$(".toast").toast("show");
					$(".toast-body").text("修改成功！");
					location.reload();
				}else{
					alert('修改失败，请重试');
				}
			}
		
		})
	}
	
}
/*
 * 新增类别，发送到后台
 */
function subCate(){
	
	var nc = $('#nc').val();
	if(nc==""){
		$(".toast").toast("show");
		$(".toast-body").text("类别名不能为空！");
	}else{
		$.ajax({
			url:'new_cate',
			type:'post',
			data:{
				'cate':nc,
			},
			dataType:'json',
			success:function(arg){
				if(arg.success){
					$(".toast").toast("show");
					$(".toast-body").text("新增成功！");
					location.reload();
				}else{
					alert('添加失败，请重试');
				}
			}
		
		})
	}
}
/*
 * 取消新增类别
 */
function cancleCate(){
		$('#in-cate').text('');
}

/*
 * 题目详情
 */
function check(e,c){
	var data = [e];
	$("#"+e).children().each(function(){
		if($(this).attr("n")=="c"){
			var content = $(this).text();
			data.push(content);
		}
	})
	$('#cate-text').text(c);
	$('#title-text').text(data[2]);
	$('#A-text').text(data[3]);
	$('#B-text').text(data[4]);
	$('#C-text').text(data[5]);
	$('#D-text').text(data[6]);
	$('#right-text').text(data[7]);
	$('#solution-text').text(data[8]);
	$('#mt').removeClass('hide-m');
	$('#ck').removeClass('hide-check');
}

function rCheck(){
	$('#mt').addClass('hide-m');
	$('#mmt').addClass('hide-mm');
	$('#ck').addClass('hide-check');
}

/*
 * 分页
 */
function page(arg){
	getPage('question?page='+arg,null,false);
	$('#current-page').text('');
	$('#current-page').text(arg);
}
/*
 * 上下页
 */
function preNextPage(e){
	var page = parseInt($('#current-page').text());
	if(e==0){
		getPage('question?page='+(page-1),null,false);
		$('#current-page').text(page-1);
	}else{
		getPage('question?page='+(page+1),null,false);
		$('#current-page').text(page+1);
	}
}

//删除类别

function delcate(){
	var e = $('#cate').val();
	console.log(e)
	if(e!=0){
		$('#exampleModal1').modal('show');
		$('#sure-delete1').attr('onclick','deleteCate('+e+')');
	}else{
		$(".toast").toast("show");
		$(".toast-body").text("不能对全部进行删除！");
	}

}

function deleteCate(e){
	$.ajax({
		url:'delete_cate',
		type:'post',
		data:{
			'cate':e,
		},
		dataType:'json',
		success:function(arg){
			if(arg.success){
				location.reload();
			}else{
				alert('删除失败，请重试');
			}
		}
	})
}