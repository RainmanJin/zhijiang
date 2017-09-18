/**
 * Created by wangjunling on 2016/8/18.
 */
require(['Pingan'],function (Pingan){

    //添加收藏、设置主页
    Pingan.addFavorite($("#addFavorite"), document.title, location.href);
    Pingan.setHome($("#setHome"), location.href);
    new Pingan.NavHandler($("#topNav").find("[data-nav]"));
    getCurrentUser();

});

function getCurrentUser(){
    $.ajax({
        url:Pingan.basePath+"/gov/current/user?currentDate="+ new Date().toTimeString(),
        success:function(data){
            if(data.statusCode==1){
                if(data.data){
                    var user = data.data;
                    $(".header-login").html("<li> <span id='userNameLabel' style='cursor: pointer;'>欢迎："+user.userDigestedName+"</span> <a href='javascript:void(0)'><img src='"+Pingan.basePath+"/images/down-icon.png'/></a> </li>");
            /*        $("#userCenterDiv").find("a").each(function(){
                        if($(this).attr("usertype").indexOf(user.userType)<0){
                            $(this).remove();
                        }
                    });*/
                   new Pingan.SlideButton($("#userNameLabel,#userCenterDiv"),$("#userCenterDiv"));
                }
            }
        }
    })
}
