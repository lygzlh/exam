/**
 * 
 */

/*
 * 继续练习
 */
function continuePractice(){
	event.preventDefault();
    event.stopPropagation();
	 var vars = window.location.search.substring(1);
     var pair = vars.split("=");
     location.href="practice?category="+pair[1];
}

/*
 * 重置问题
 */
function resetQuestion(){
	var vars = window.location.search.substring(1);
    var pair = vars.split("=");
    $.ajax({
		type:'post',
		url:'reset_question',
		data:{'category':pair[1]},
		dataType:'json',
		success:function(args){
			if(args.success){
				$(".toast").toast("show");
				$(".toast-body").text("重置成功");
				setTimeout(function () {
				location.reload();
				 }, 500);
			}else{
				$(".toast").toast("show");
				$(".toast-body").text("重置失败，请重试！");
				setTimeout(function () {
				location.reload();
				 }, 500);
			}
		}
	})
}
