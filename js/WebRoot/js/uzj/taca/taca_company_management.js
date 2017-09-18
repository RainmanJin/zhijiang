require.config({
    waitSeconds: 0,
    baseUrl: basePath,
    paths: {
        Pingan: 'js/common/common',
        tacaLeft:'js/uzj/taca/taca_left',
        top: 'js/uzj/new_top',
    },
    shim: {
        top: {
            deps: ['Pingan']
        }
        },
    deps: ['top','tacaLeft']
});

require(['Pingan','tacaLeft'], function (Pingan,tacaLeft)
{
    Pingan.Base = (function ()
    {
        var to_step_four = function ()
        {
            var taca_step_three_form = new Pingan.MForm($("#taca_step_three"));
            taca_step_three_form.isAjax = true;
            taca_step_three_form.beforeSubmit = function () {
                var result = true;
                $("span[name='requiredChoose']").parent().next().each(function () {
                       if($(this).find(".jqChecked").length===0){
                           Pingan.malertInfo('请选择必选项!', 'datum-tip-cls', {});
                           result = false;
                       }
                    });
                return result;
            };

            taca_step_three_form.afterSubmit = function (result) {
                if (result.statusCode === 1) {
                    Pingan.malertInfo('保存成功!', 'datum-tip-cls', {callback:function () {
                        tacaLeft.locationNextPage();
                    }});
                }else if (result.statusCode === 5) {
                    Pingan.malertInfo('请重新登陆！', 'datum-tip-cls', {});
                    return false;
                }else if (result === "") {
                    return false;
                }else {
                    Pingan.malertInfo('保存失败，请稍后重试！', 'm-alert-info-failed', {});
                    return false;
                }
            };
        };


        var init_radio_func = function ()
        {
            $('input[type=radio]').on('click', function(){
                $(this).parent().addClass("jqChecked").siblings().removeClass("jqChecked");
            });
        };

        var init_step_three_page = function ()
        {
            $('input[type=radio]').filter(function (n)
            {
                if($(this).val() === $("#"+$(this).attr('name')).val())
                {
                    $(this).click();
                }
            });

        };


        var init = function () {
            to_step_four();
            init_radio_func();
            init_step_three_page();
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