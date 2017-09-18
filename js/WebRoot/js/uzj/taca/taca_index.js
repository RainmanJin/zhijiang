require.config({
    waitSeconds: 0,
    baseUrl: basePath,
    paths: {
        Pingan: 'js/common/common',
        top: 'js/uzj/new_top'
    },
    shim: {
        top: {
            deps: ['Pingan']
        }
    },
    deps: ['top']
});

require(['Pingan'], function (Pingan)
{
    Pingan.Base = (function ()
    {
        var is_expired_func = function ()
        {
            var date = new Date();
            var deadlineDate = taca_index.deadlineDate;
            var dead_tmp = Date.parse(deadlineDate);
            return dead_tmp - date <= 0;
        };

        var init_index = function ()
        {
                if(is_expired_func())
                {
                    $(".declare").css('background-color', '#c0c0c0');
                }

            $(".declare").on('click',function ()
            {
                if(is_expired_func())
                {
                    Pingan.malertInfo('活动已过截止日期!', 'datum-tip-cls', {});
                }else
                    {
                        location.href=basePath + '/taca/immediately/declare';
                    }
            });
        };
        
        var init_step = function () {

            var step1Date = new Date();
            step1Date.setFullYear(2017,8,30);//2017-9-30
            var step2Date = new Date();
            step2Date.setFullYear(2017,9,25);//2017-10-25

            var step4Date = new Date();
            step4Date.setFullYear(2017,11,0);//2017-12-0

            var nowDate = new Date();
            if(nowDate>step1Date){
                $("#stepImg").attr("src",basePath+"/images/steps01.png");
                $("#stepUl").find("li").eq(1).removeClass("steps-gray").addClass("steps-green");
            }
            if(nowDate>step2Date){
                $("#stepImg").attr("src",basePath+"/images/steps03.png");
                $("#stepUl").find("li").eq(2).removeClass("steps-gray").addClass("steps-green");
            }
            if(nowDate>step4Date){
                $("#stepImg").attr("src",basePath+"/images/steps04.png");
                $("#stepUl").find("li").eq(3).removeClass("steps-gray").addClass("steps-green");
            }
        };

        var init = function () {
            init_index();
            init_step();
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

});
