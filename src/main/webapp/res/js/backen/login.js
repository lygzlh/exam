/**
 * 登录
 */

$(function(){
	$("#loginSubmit").click(function(event){
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
					event.preventDefault();
					$('form').fadeOut(500);
					$('.wrapper').addClass('form-success');				
					location.href="home";
				}else{
					alert("账号密码错误");
					$("#username").val('');
					$("#password").val('');
				}
			}
		})
		
	})
})