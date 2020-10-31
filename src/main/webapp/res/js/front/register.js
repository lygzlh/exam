/**
 * 注册
 */
// Example starter JavaScript for disabling form submissions if there are invalid fields


function submitContext(){
		var username= $("#username").val();
		var password = $("#password").val();
		var phone= $("#phone").val();
		var nickname= $("#nickname").val();
		var gender= $("#gender").val();
		var usernameStatus = $("#usernameStatus").attr("t");
		var pswStatus = $("#pswStatus").attr("t");
		var nicknameStatus = $("#nicknameStatus").attr("t");
		var phoneStatus = $("#phoneStatus").attr("t");
		if(username && password && phone && nickname && gender && usernameStatus!='0'  && pswStatus!='0' && nicknameStatus!='0' && phoneStatus!='0'){
			$.ajax({
				type:"post",
				url:"/exam/register",
				data:{
					"username":username,
					"password":password,
					'gender':gender,
					'phone':phone,
					'nickname':nickname
				},
				dataType:"json",
				success:function(args){
					if(args.success){
						$(".toast").toast("show");
						$(".toast-body").text("注册成功");
						setTimeout(function () {
							location.href="login";
						 }, 500);

					}else{
						$(".toast").toast("show");
						$(".toast-body").text("注册失败，请重试！");
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


$(function(){
	var vm = new Vue({
		el:'#userInfo',
		data:{
			username:'',
			password:'',
			nickname:'',
			phone:''
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



/*
$(function () {
  'use strict'

  window.addEventListener('load', function () {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation')

    // Loop over them and prevent submission
    Array.prototype.filter.call(forms, function (form) {
      form.addEventListener('submit', function (event) {
    	if (form.checkValidity() === false) {
          event.preventDefault()
          event.stopPropagation()
        }
        form.classList.add('was-validated')
      }, false)
      
    })
  }, false)
}())
*/