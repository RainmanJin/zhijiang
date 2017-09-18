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
        var to_step_eight = function ()
        {
            var taca_step_seven_form = new Pingan.MForm($("#taca_step_seven"));
            taca_step_seven_form.isAjax = true;

            taca_step_seven_form.afterSubmit = function (result) {
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

        var init_step_seven_page = function ()
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
            to_step_eight();
            init_radio_func();
            init_step_seven_page();
            add_repeat_block_new('#repeat_div','[data-attr="repeat_div"]', 6, ".bR-green", ".bR-red");
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
var add_repeat_block_new = function (repeat_model,repeat_obj, repeat_max_count, add_btn, del_btn)
{
    $(add_btn).unbind('click').on('click', function ()
    {
        var block_num = $(repeat_obj).length;
        var repeat_d = $(repeat_model).clone().removeAttr('style').removeAttr('id').attr('data-attr','repeat_div')[0].outerHTML;
        repeat_d = repeat_d.replace(/\[.*]/g, "[" + block_num + "]");
        $(this).parent().before(repeat_d);
        init_add_del_btn();
    });

    $(del_btn).unbind('click').on('click', function ()
    {
       $(this).parent().prev().remove();
        init_add_del_btn();
    });

    var init_add_del_btn = function ()
    {
        var block_num = $(repeat_obj).length;
        if(block_num === 1)
        {
            $(del_btn).hide();
            $(add_btn).show();
        }else if(block_num === repeat_max_count){
            $(add_btn).hide();
            $(del_btn).show();
        }else
        {
            $(add_btn).show();
            $(del_btn).show();
        }
    };

    init_add_del_btn();
};