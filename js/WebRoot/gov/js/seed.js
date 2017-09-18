/**
 * Created by wangjunling on 2016/8/19.
 */
require.config({
    waitSeconds : 0,
    baseUrl:basePath,
    paths : {
        Pingan : 'gov/js/common/common',
        seed:"gov/js/seed"
    },
    shim : {
        seed : {
            deps : [ 'Pingan']
        }
    },
    deps : ['seed' ]
});
require(['Pingan'],function (Pingan) {
    var html = "<a href='#' class='groove-hover' style=''><img src='"+basePath+"/images/kitchen/live-icon.png'/> <div class='hover-wz'> <span class='span-wz1'>评论数 256</span><span class='span-wz2'>播放量 256</span> </div> </a>";
    $(".groove-block").mouseover(function(){
        $('.groove-hover').remove();
        $(this).prepend(html);
    });
    $(".groove-block").mouseleave(function(){
        $('.groove-hover').remove();
    });


    $(".tv-show").click(function(){
        var param =  $(this).attr("param");
        $("#qihoo_player").append(param);
        Pingan.malert($(".seed-pop"),$("#malert_mask"),{opacity:0.2});
    });

    initUserName();
});
function initUserName(){

    var handler = {};
    handler.isShow = false;
    handler.turnDiv = function (action){
        if(action == "on"){
            handler.isShow = true;
        }else{
            handler.isShow = false;
        }
        setTimeout(function (){
            if(handler.isShow){
                $("#userCenterDiv").fadeIn();
            }else{
                $("#userCenterDiv").fadeOut();
            }
        }, 100);
    }
    $("#userNameLabel,#userCenterDiv").on({
        "mouseover":function (){
            handler.turnDiv("on");
        },
        "mouseleave":function (){
            handler.turnDiv("off");
        }
    });
}