/**
 * 
 */
/*
 * 获取信息
 */

/*
 * 修改信息
 */
function sureChange(){
	var phone= $("#phone").val();
	var nickname= $("#nickname").val();
	var gender= $("#gender").val();
	var nicknameStatus = $("#nicknameStatus").attr("t");
	var phoneStatus = $("#phoneStatus").attr("t");
	console.log(nicknameStatus+nicknameStatus)
	if(phone && nickname && gender && nicknameStatus!='0' && phoneStatus!='0'){
		$.ajax({
			type:"post",
			url:"changeInfo",
			data:{
				'gender':gender,
				'phone':phone,
				'nickname':nickname
			},
			dataType:"json",
			success:function(args){
				if(args.success){
					$(".toast").toast("show");
					$(".toast-body").text("修改成功！");
					setTimeout(function () {
						location.href="/exam/";
						 }, 500);
					
				}else{
					$(".toast").toast("show");
					$(".toast-body").text("修改失败！");
					setTimeout(function () {
						location.reload();
						 }, 500);
				}
			}

		})
	}else{
		 $('.needs-validation').addClass('was-validated');
	}
}
/*
 * 改密码
 */
function changepsw(){
	var password = $("#password").val();
	var new_password = $("#new_password").val();
	var pswStatus = $("#pswStatus").attr("t");
	var newpswStatus = $("#newpswStatus").attr("t");
	var newpsw2Status = $("#newpsw2Status").attr("t");
	if(pswStatus!='0' && newpswStatus!='0' && newpsw2Status!='0'){
		
		$.ajax({
			type:"post",
			url:"changePassword",
			data:{
				'password':password,
				'new_password':new_password
			},
			dataType:"json",
			success:function(args){
				if(args.success){
					$(".toast").toast("show");
					$(".toast-body").text("修改成功！");
					setTimeout(function () {
						location.reload();
						 }, 500);
				}else{
					$(".toast").toast("show");
					$(".toast-body").text("原密码错误！");
					setTimeout(function () {
						location.reload();
						 }, 500);
				}
			}

		})
	}else{
		$(".toast").toast("show");
		$(".toast-body").text("请填写完全！");
	}
}

$(function(){
	var vm = new Vue({
		el:'#changeUserInfo',
		data:{
			nickname:"",
			phone:"",
			new_password_again:"",
			password:"",
			new_password:""
		},
		
		created:function(){
			$.ajax({
				type:"post",
				url:"get_info",
				data:{},
				dataType:"json",
				success:function(args){
					
					$("#phone").val(args.user.phone);
					$("#nickname").val(args.user.nickname);
					$("#gender").val(args.user.gender);
				}
			})
		},
		beforeUpdate:function(){
			this.nickname=$("#nickname").val()
			this.phone=$("#phone").val()
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
			pswLimit:function(){
				console.log(123)
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
			newpswLimit:function(){
				var s = document.getElementById('newpswStatus');
				if(this.new_password.length>16 || this.new_password.length<6){
					s.innerText="密码长度不能小于6或超过16"
				    s.style.display='inline-block'
				    	s.setAttribute('t','0')
				}else if(!(/^[A-Za-z0-9]*$/).test(this.new_password)){
					s.innerText="密码只能使用数字，字母"
					s.style.display='inline-block'
						s.setAttribute('t','0')
				}else{
					s.style.display='none'
						s.setAttribute('t','1')
				}
			},
			newpsw2Limit:function(){
				var s = document.getElementById('newpsw2Status');
				if(this.new_password_again!=this.new_password){
					s.innerText="两次输入密码不一致"
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

