require(['Pingan'],function (Pingan){

    getCurrentUser();

    $( document ).ajaxComplete(function( event, xhr, settings ) {
        var responseText =$.parseJSON(xhr.responseText);
        if(responseText.statusCode==5){
            Pingan.mconfirm("登录过期，请重新登录！",function (){
                location.href=Pingan.basePath+"/gov/toLogin"
            });
        }
    });
});

function getCurrentUser(){
    $.ajax({
        url:Pingan.basePath+"/gov/current/user?currentDate="+ new Date().toTimeString(),
        success:function(data){
            if(data.statusCode==1){
                if(data.data){
                    var user = data.data;
                    $(".gov_mLogin").find("p").append("欢迎：<span id='userNameLabel'>"+user.userDigestedName+"</span>");
                    $("#userCenterDiv").find("a").each(function(){
                        if($(this).attr("usertype").indexOf(user.userType)<0){
                            $(this).remove();
                        }
                    });
                    new Pingan.SlideButton($("#userNameLabel,#userCenterDiv"),$("#userCenterDiv"));
                }
            }
        }
    })
}