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
	        url : basePath + "/user/current",
	        success:function(data){
	            if(data.statusCode==1){
	                if(data.data){
	                    var user = data.data;
	                    $(".header-login").html("<li> <span id='userNameLabel' style='cursor: pointer;'>欢迎："+user.userDigestedName+"</span> <a href='javascript:void(0)'><img src='"+ Pingan.basePath+"/images/down-icon.png' /></a> </li>");
	                    $("#userCenterDiv").find("a").each(function(){
	                        if($(this).attr("usertype").indexOf(user.userType)<0){
	                            $(this).remove();
	                        }
	                    });
	                }
	            	//用户中心下拉菜单
	            	new Pingan.SlideButton($(".header-login"), $("#userCenterDiv"));
	            }
	        }
	    })
	};
    getCurrentUser();
    return {
    	topNav : topNav
    };
});