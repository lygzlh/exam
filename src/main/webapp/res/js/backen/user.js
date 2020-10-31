/**
 * 
 */

/*
 * 分页
 */
function page(arg){
	getPage('get_user?page='+arg,null,false);
	$('#current-page').text('');
	$('#current-page').text(arg);
}
/*
 * 上下页
 */
function preNextPage(e){
	var page = parseInt($('#current-page').text());
	if(e==0){
		getPage('get_user?page='+(page-1),null,false);
		$('#current-page').text(page-1);
	}else{
		getPage('get_user?page='+(page+1),null,false);
		$('#current-page').text(page+1);
	}
}
/*
 * 查询
 */
function searchName(page){
	var name = $('#findName').val();
	$.ajax({
		url:"searchUser",
		type:"get",
		data:{
			'name':name,
			'page':page,
		},
		dataType:'json',
		success:function(arg){
			console.log(arg.start,arg.pgcount);
			var body = $('#tbody');
			body.empty();
			for (var i=0;i<arg.userList.length;i++){
				body.append("<tr id="+arg.userList[i].id+">" +
						"<td n='c'>"+arg.userList[i].id+"</td>"+
						"<td n='c'>"+arg.userList[i].username+"</td>"+
						"<td n='c'>"+arg.userList[i].password+"</td>"+
						"<td n='c'>"+arg.userList[i].nickname+"</td>"+
						"<td n='c'>"+arg.userList[i].gender+"</td>"+
						"<td n='c'>"+arg.userList[i].phone+"</td>"+
						"<td n='b'><input class='btn btn-success btnss' type='button' onclick='showDetail("+arg.userList[i].id+")' value='查看'/>&nbsp" +
						"<input class='btn btn-primary btnss' type='button' onclick='update("+arg.userList[i].id+")' value='修改'/>&nbsp" +
						"<button type='button' class='btn btn-danger btnss' data-toggle='modal' data-target='#exampleModal' onclick='deleteGetUserId("+arg.userList[i].id+")'>删除</button>" +
						
						"</td>"+
						"</tr>")
			};
			var d = "";
			if(arg.cpage>1){
				d=d+"<li class='page-item'><a href='javascript:;' class='page-link' onclick='searchName("+(arg.cpage-1)+")'>上一页</a></li>"
			}else{
				d=d+"<li class='page-item disabled'><a href='javascript:;' class='page-link' onclick='searchName("+(arg.cpage-1)+")'>上一页</a></li>"
			}
			for(var i=arg.start;i<=arg.pgcount;i++){
				if(i-arg.start<9){
					if(arg.cpage==i){
						d=d+"<li class='page-item active'><a href='javascript:;' class='page-link' onclick='searchName("+i+")'>"+i+"</a></li>";
					}else{
						d=d+"<li class='page-item'><a href='javascript:;' class='page-link' onclick='searchName("+i+")'>"+i+"</a></li>";
					}
				}
			}
			if(arg.cpage<arg.pgcount){
				d=d+"<li class='page-item'><a href='javascript:;' class='page-link' onclick='searchName("+(arg.cpage+1)+")'>下一页</a></li>"
			}else{
				d=d+"<li class='page-item disabled'><a href='javascript:;' class='page-link' onclick='searchName("+(arg.cpage+1)+")'>下一页</a></li>"
			}
			d=d+"&nbsp共 <span>"+arg.pgcount+"</span> 页 &nbsp<span>"+arg.recordCount+"</span>条记录";
			$("#fy").empty();
			$('#fy').append(d);
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

function rCheck(){
	$('#mt').addClass('hide-m');
	$('#mmt').addClass('hide-mm');
	$('#ck').addClass('hide-check');
}

/*
 * 新增用户
 */
function insertSub(){
	var username = $('#username').val();
	var password = $('#password').val();
	var gender = $('#gender').val();
	var phone = $('#phone').val();
	var nickname = $('#nickname').val();
	var usernameStatus = $("#usernameStatus").attr("t");
	var pswStatus = $("#pswStatus").attr("t");
	var nicknameStatus = $("#nicknameStatus").attr("t");
	var phoneStatus = $("#phoneStatus").attr("t");
	if(username && password && phone && nickname && gender && usernameStatus!='0'  && pswStatus!='0' && nicknameStatus!='0' && phoneStatus!='0'){
			$.ajax({
			type:"post",
			url:"newUser",
			data:{
			"username":username,
			"password":password,
			"gender":gender,
			"phone":phone,
			"nickname":nickname,
			},
			dataType:"json",
			success:function(arg){
				if(arg.success){
					alert("新增成功");
					getPage('get_user?page=1',null,false);
				}else{
					alert("新增失败");
				}
			}
		})
	}else{
		$(".toast").toast("show");
		$(".toast-body").text("请正确填写再提交！");
	}
}



/*
 * 获得删除用户id
 */
function deleteGetUserId(e){

	$('#sure-delete').attr('onclick','deluser('+e+')');
}

/*
 * 删除
 */
function deluser(e){
	$("#exampleModal").modal('hide');
    $('.modal-backdrop').remove();
    $('.modal-open').css("overflow-y","scroll");
	$.ajax({
		url:"delete-user",
		type:'post',
		data:{'cid':e},
		dataType:'json',
		success:function(arg){
			if(arg.success){
				$('#exampleModal').css('display','none');
				getPage('get_user?page=1',null,false);

			}else{
				alert("删除失败");
			}
		}
	})
}
/*
 * 修改
 */
function update(e){
	var data = [e];
	$('#mt').removeClass('hide-m');
	$('#mmt').removeClass('hide-mm');
	$("#"+e).children().each(function(){
		if($(this).attr("n")=="c"){
			var content = $(this).text();
			data.push(content);
		}
	})

	$('#username').val(data[1]);
	$('#username').attr('disabled','disabled');
	$('#password').val(data[2]);
	$('#phone').val(data[5]);
	if(data[4]=='男'){
		$('#gender').val('1');
	}else{
		$('#gender').val('2');
		}
	$('#nickname').val(data[3]);
	$("#usernameStatus").attr("t",'1');
	$("#pswStatus").attr("t",'1');
	$("#nicknameStatus").attr("t",'1');
	$("#phoneStatus").attr("t",'1');
	$('#sub').attr('onclick','submitData('+e+')')
}

function cancleUpdate(){
	$('#username').val('');
	$('#password').val('');
	$('#phone').val('');
	$('#gender').val('1');
	$('#nickname').val('');
	$("#usernameStatus").attr("t",'0');
	$("#pswStatus").attr("t",'0');
	$("#nicknameStatus").attr("t",'0');
	$("#phoneStatus").attr("t",'0');
	$('#sub').attr('onclick','insertSub()');
	$('#phoneStatus').text("");
	$('#usernameStatus').text("");
	$('#pswStatus').text("");
	$('#nicknameStatus').text("");
	$('#username').removeAttr('disabled')
	rCheck();
}

/*
* 获取数据，转成question类的格式，发送给服务器
*/
function submitData(e){
	var username = $('#username').val();
	var password = $('#password').val();
	var gender = $('#gender').val();
	var phone = $('#phone').val();
	var nickname = $('#nickname').val();
	var usernameStatus = $("#usernameStatus").attr("t");
	var pswStatus = $("#pswStatus").attr("t");
	var nicknameStatus = $("#nicknameStatus").attr("t");
	var phoneStatus = $("#phoneStatus").attr("t");
	if(username && password && phone && nickname && gender && usernameStatus!='0'  && pswStatus!='0' && nicknameStatus!='0' && phoneStatus!='0'){
		$.ajax({
			type:"post",
			url:"update-user",
			data:{
				'id':e,
				"username":username,
				"password":password,
				"gender":gender,
				"phone":phone,
				"nickname":nickname,
			},
			dataType:"json",
			success:function(arg){
				if(arg.success){
					$('#username').val('');
					$('#password').val('');
					$('#phone').val('');
					$('#man').attr("checked",true);
					$('#nickname').val('');
					$("#usernameStatus").attr("t",'0');
					$("#pswStatus").attr("t",'0');
					$("#nicknameStatus").attr("t",'0');
					$("#phoneStatus").attr("t",'0');
					getPage('get_user?page=1',null,false);
				}else{
					alert("修改失败，请重试");
				}
			}
		})
	}
}

/*
 * 查看
 */
function showDetail(e){
	$.ajax({
		url:"detail-user",
		type:'post',
		data:{'uid':e},
		dataType:'json',
		success:function(arg){
			$('#showQ').empty();
			var data ="";
			for(var i=0;i< arg.progressList.length;i++){
				
				var detail = "<table  class='table table-striped text-center shadow'>" +
				"<thead>" +
				"<tr>" +
				"<th scope='col' colspan='2'>"+arg.progressList[i].cate.cname+"</th>" +
				"</tr>" +
				"</thead>" +
				"<tbody>" +
				"<tr>" +
				"<td>总题数</td>" +
				"<td>"+arg.progressList[i].qnum+"</td>" +
				"</tr>" +
				"<tr>" +
				"<td>完成题数</td>" +
				"<td>"+(arg.progressList[i].wnum+arg.progressList[i].rnum)+"</td>" +
				"</tr>" +
				"<tr>" +
				"<td>完成率</td>" +
				"<td>"+(arg.progressList[i].wnum+arg.progressList[i].rnum)/arg.progressList[i].qnum*100+"%</td>" +
				"</tr>" +
				"<tr>" +
				"<td>正确题数</td>" +
				"<td>"+arg.progressList[i].rnum+"</td>" +
				"</tr>" +
				"<tr>" +
				"<td>错误题数</td>" +
				"<td>"+arg.progressList[i].wnum+"</td>" +
				"</tr>" 
				if((arg.progressList[i].wnum+arg.progressList[i].rnum)!=0){
					detail += "<tr>" +
					"<td>正确率</td>" +
					"<td>"+arg.progressList[i].rnum/(arg.progressList[i].wnum+arg.progressList[i].rnum)*100+"%</td>" +
					"</tr>"
				}
				
				detail +="</tbody>" +
				"</table>"
				data += detail;
			}
			$('#showQ').append(data);
			$('#mt').removeClass('hide-m');
			$('#ck').removeClass('hide-check');
		}
	})
	
}

$(function(){
	var vm = new Vue({
		el:'#userManagerInfo',
		data:{
			username:'',
			password:'',
			nickname:'',
			phone:''
		},
		beforeUpdate:function(){
			this.username=$('#username').val();
			this.password=$('#password').val();
			this.phone=$('#phone').val();
			this.nickname=$('#nickname').val();
		},
		methods:{
			phoneLimit:function(){
				var s = document.getElementById('phoneStatus');
				 if(!(/^1[3456789]\d{9}$/.test(this.phone))){ 
				        s.innerText="手机号格式错误"
				        s.style.display='inline-block'
				        	s.setAttribute('t','0')
				    } else{
				    	s.style.display='none'
				    	s.setAttribute('t','1')
				    }
			},
			userLimit:function(){
				var s = document.getElementById('usernameStatus');
				if(this.username.length>16 || this.username.length<6){
					s.innerText="账号长度不能小于6或超过16"
				    s.style.display='inline-block'
				    	s.setAttribute('t','0')
				}else if(!(/^[A-Za-z0-9]*$/).test(this.username)){
					s.innerText="账号只能使用数字，字母"
					s.style.display='inline-block'
					s.setAttribute('t','0')
				}else{
					$.ajax({
						type:"post",
						url:"/exam/isExists",
						data:{
							"username":this.username
						},
						dataType:"json",
						success:function(args){
							if(args.success){
								s.innerText="账号已被注册"
								s.style.display='inline-block'
								s.setAttribute('t','0')
							}else{
								s.style.display='none'
								s.setAttribute('t','1')
							}
						}
					})
				}
			},
			pswLimit:function(){
				var s = document.getElementById('pswStatus');
				if(this.password.length>16 || this.password.length<6){
					s.innerText="密码长度不能小于6或超过16"
				    s.style.display='inline-block'
				    	s.setAttribute('t','0')
				}else if(!(/^[A-Za-z0-9]*$/).test(this.password)){
					s.innerText="密码只能使用数字，字母"
					s.style.display='inline-block'
						s.setAttribute('t','0')
				}else{
					s.style.display='none'
						s.setAttribute('t','1')
				}
			},
			nicknameLimit:function(){
				var s = document.getElementById('nicknameStatus');
				if(this.nickname.length>16 || this.nickname.length<2){
					s.innerText="用户名长度不能小于2或超过16"
				    s.style.display='inline-block'
				    	s.setAttribute('t','0')
				}else{
					s.style.display='none'
						s.setAttribute('t','1')
				}
			}
			
		}
	})
})