define('tacaLeft', ['Pingan'], function (Pingan){
    //判断Pingan模块是否加载
    Pingan = Pingan ? Pingan : require("common/common");
    Pingan.Base = (function ()
    {
        var init_radio_func = function ()
        {
            $('input[type=radio]').on('click', function(){
                $(this).parent().addClass("jqChecked").siblings().removeClass("jqChecked");
            });
        };

        var init_left_nav = function ()
        {
            new Pingan.NavHandler($("#taca_nav_id").find("[data-nav]"));
        };
        var upPage = function () {
            $(".bt2").click(function () {
                window.location.href =$("#taca_nav_id").find(".current").prev().attr("href");
            });
        };



        var init = function () {
            init_left_nav();
            upPage();
        };


        return {
            init: init
        };
    })();


    //事件
    Pingan.Event = (function ()
    {
        var init = function ()
        {
        };

        return {
            init: init
        };
    })();

    (function ()
    {
        Pingan.Base.init();
        Pingan.Event.init();
    })();

    var locationNextPage = function () {
        window.location.href = $("#taca_nav_id").find(".current").next().attr("href");
    };
    TacaLeft = {locationNextPage:locationNextPage};
    return TacaLeft;
});