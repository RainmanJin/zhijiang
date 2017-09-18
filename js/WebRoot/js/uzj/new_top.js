define('top', ['Pingan'], function (Pingan){
	//判断Pingan模块是否加载
	Pingan = Pingan ? Pingan : require("common/common");
	
	//导航
	var topNav = new Pingan.NavHandler($("#topNav").find("[data-nav]"));
	
	//添加收藏、设置主页
	Pingan.addFavorite($("#addFavorite"), document.title, location.href);
	Pingan.setHome($("#setHome"), location.href);
	
	//请求用户状态（后期会优化掉）
	var getCurrentUser = function(){
	    $.ajax({
	        url : basePath + "/user/current?currentDate="+new Date().toTimeString(),
	        async:true,
	        success:function(data){
	            if(data.statusCode==1){
	                if(data.data){
	                    var user = data.data;
	                    $(".n-n1").html("欢迎："+user.userDigestedName+"<img style='margin-left: 5px;' src='"+ Pingan.basePath+"/images/down-icon.png' />");
	        /*            $("#userCenterDiv").find("a").each(function(){
	                        if($(this).attr("usertype").indexOf(user.userType)<0){
	                            $(this).remove();
	                        }
	                    });*/
	                    if(window.location.href.indexOf("toLogin")!= -1){
	                    	window.location.href = basePath;
	                    }
                        $("#isLogin").val(1);
	                }
	                // console.log(data)
	            	//用户中心下拉菜单
	            	new Pingan.SlideButton($(".n-n1"), $("#userCenterDiv"));
	            }
	        }
	    });
	    
	    $.ajax({
	    	 url : basePath + "/user/message?currentDate="+new Date().toTimeString(),
			 success:function(data){
				 if(data.statusCode==1){
				    $("#messageSpan").show();  
				    //用户中心下拉菜单
	            	new Pingan.SlideButton($(".n-n3"), $("#messageCenterDiv"));
	            	if(data.data){
	            		$("#authorizationCount").html(data.data.authorizationCount);
	            		$("#commentCount").html(data.data.commentCount);
	            		if(data.data.count != 0){
	            			$("#messageCount").html(data.data.count);
	            			return;
	            		} 
	            		$("#messageCount").hide();
	            		
	            	}
				 }
			 }
	    });
	};
	
	//获取消息数量
	/*var getMessage =  function(){
		 $.ajax({
			 url : basePath + "/user/message?currentDate="+new Date().toTimeString(),
			 success:function(data){
				// console.info(data);
			 }
		 });
	}*/

	var index_component_toggle_show = function (on_dom,sub_dom) {
            $("#"+on_dom).hover(function () {
                $("#"+sub_dom).css("display","block");
            },function () {
                $("#"+sub_dom).css("display","none");
            });

    };

    var returnTop = function(){
       /* $("#returnTop").hover(function () {
            $("#return_top_toggle_show").css("display","block");
        },function () {
            $("#return_top_toggle_show").css("display","none");
        });*/

        $("#returnTop").click(function () {
            var speed=200;//滑动的速度
            $('body,html').animate({ scrollTop: 0 }, speed);
            return false;
        }


        );
    };
    index_component_toggle_show("tips_toggle_button","tips_toggle_show");
    index_component_toggle_show("qq_toggle_button","qq_toggle_show");
    index_component_toggle_show("qrcode_toggle_button","qr_code_toggle_show");
    index_component_toggle_show("returnTop","return_top_toggle_show");
    returnTop();
    getCurrentUser();
  //  getMessage();
    // qrcode_toggle();
    return {
    	topNav : topNav
    };
});