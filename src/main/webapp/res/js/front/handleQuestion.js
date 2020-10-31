/**
 * 处理问题答案，把结果传到后台
 */




$(function(){
	$("#answerSubmit").click(function(){
		var answer = $('.border-primary.bg-light').attr('value');
		var isWrong = $('#answerSubmit').attr('val');
		if(answer==null){
			return 
		}
		if(isWrong==0){
			$.ajax({
				type:'post',
				url:'handle_question',
				data:{'answer':answer},
				dataType:'json',
				success:function(args){
					$('.answer-click').removeClass('answer-click');
					$('.hide-a').removeClass('hide-a');
					var f = $('.border-primary.bg-light');
					f.removeClass('border-primary');
					if(!args.success){
						f.addClass('border-danger');
						f.children().first().addClass('text-danger');
						f.children().first().removeClass('text-primary');
					}
					var r = $('div[value="'+args.right+'"]');
					r.addClass('border-success bg-light');
					r.children().first().removeClass('text-muted');
					r.children().first().addClass('text-success');
					$("#subButton").text('');
					$("#subButton").append('<button onclick="nextT()" type="button" class="btn btn-outline-primary">下一题</button>');
				}
			})
		}else{
			$.ajax({
				type:'post',
				url:'handle_wrong_question',
				data:{'answer':answer},
				dataType:'json',
				success:function(args){
					$('.answer-click').removeClass('answer-click');
					$('.hide-a').removeClass('hide-a');
					var f = $('.border-primary.bg-light');
					f.removeClass('border-primary');
					if(!args.success){
						f.addClass('border-danger');
						f.children().first().addClass('text-danger');
						f.children().first().removeClass('text-primary');
					}
					var r = $('div[value="'+args.right+'"]');
					r.addClass('border-success bg-light');
					r.children().first().removeClass('text-muted');
					r.children().first().addClass('text-success');
					$("#subButton").text('');
					$("#subButton").append('<button onclick="nextT()" type="button" class="btn btn-outline-primary">下一题</button>');
				}
			})
		}
		
	}),
	/*
	 * 点击答案
	 */
	$('.answer-click').click(function(){
		if($(this).hasClass('answer-click')){
			$('.text-primary').addClass('text-muted');
			$('.text-primary').removeClass('text-primary');
			$('.border-primary.bg-light').removeClass('border-primary bg-light');
			$(this).children().first().addClass('text-primary');
			$(this).children().first().removeClass('text-muted');
			$(this).addClass('border-primary bg-light');
		}
	})
	
})
/*
 * 下一题
 */
function nextT(){
	location.reload();
}
/*
 * 退出练题
 */
function exitPractice(){
	event.preventDefault();
    event.stopPropagation();
	 var vars = window.location.search.substring(1);
     var pair = vars.split("=");
     location.href="progress_detail?category="+pair[1];
    
}
