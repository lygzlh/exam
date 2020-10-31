/**
 * 改密码
 */

function changeSub(){
	var newPwd = $('#newPwd').val();
	var newPwd2 = $('#newPwd2').val();
	var pwd = $("#pwd").val();
	if(newPwd == newPwd2){
		$.ajax({
			url:'change_password',
			type:'post',
			data:{
				'newPwd':newPwd,
				'pwd':pwd
			},
			dataType:'json',
			success:function(arg){
				if(arg.success=='1'){
					alert("修改成功");
					location.reload();
				}else if(arg.success=='2'){
					alert("修改失败，请重试");
					$('#newPwd').val('');
					$('#newPwd2').val('');
					$("#pwd").val('');
				}else{
					alert("修改失败，原密码错误");
				}
			}
		})
	}else{
		alert("两次密码不一致");
		$('#newPwd').val('');
		$('#newPwd2').val('');
		$("#pwd").val('');
	}
	
}