/**
 * 
 */
/*
 * 选题开始练习
 */
function catePractice(){
	var cate = $('#pcate').val();
	location.href='practice?category='+cate;
}
/*
 * 错题练习
 */
function wrongPractice(){
	var cate = $('#wrongCate').val();
	location.href='wrong_practice?category='+cate;
}
/*
 * 进度查询
 */
function progress(){
	var cate = $('#progressCate').val();
	location.href='progress_detail?category='+cate;
}

/*
 * 注销
 */
function logout(){
	$.ajax({
		url:'logout',
		type:'post',
		data:{},
		dataType:'json',
		success:function(){}
		
	})
}

/*
 * 修改资料
 */
function changeInfo(){
	
}