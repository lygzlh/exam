/**
 * 
 */
$(function(){
	$('.menu_li').click(function(){

	var url = $(this).attr('data-toggle');
//	if($(this).hasClass('menu_li_select')){
//		return;
//	}else{
		$('.active').removeClass('active');
		$(this).addClass('active');
		var title = $(this).text();
		$('.h2').text(title);
		getPage(url,null,false);
	//}
});
}
)

$(	function(){
	getPage('question?page=1',null,false);
})





/**
 * 页面切换
 * @param url
 * @param data
 * @param isChild
 * @returns
 */
function getPage(url,data,isChild) {
    if(url !== null && url !== ""){
        $.ajax({
            url: "/exam/admin/"+url,
            type: "get",
            data: data,
            contentType: "text/html;charset=UTF-8",
            success : function (data) {
                $(".div_home_context_main").html(data);
                window.scrollTo(0, 0);
            },

            error: function () {

            }
        });
    }
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
