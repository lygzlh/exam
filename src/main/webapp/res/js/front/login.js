/**
 * 登录
 */

$(function(){
	$("#loginSubmit").click(function(){
		var username = $("#username").val();
		var password = $("#password").val();
		$.ajax({
			type:"post",
			url:"login",
			data:{
				"username":username,
				"password":password
			},
			dataType:"json",
			success:function(args){
				if(args.success){
					location.href="/exam/";
				}else{
					$(".toast").toast("show");
					$(".toast-body").text("账号密码错误！");
					setTimeout(function () {
					location.reload();
					 }, 500);
				}
			}
		})
		
	})
})