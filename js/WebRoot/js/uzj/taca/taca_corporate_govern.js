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
        var to_step_three = function ()
        {
            var taca_step_two_form = new Pingan.MForm($("#taca_step_two"));
            taca_step_two_form.isAjax = true;
            taca_step_two_form.afterSubmit = function (result) {
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

        var init_step_two_page = function ()
        {
            $('input[type=radio]').filter(function (n)
            {
                if($(this).val() === $("#"+$(this).attr('name')).val())
                {
                    $(this).click();
                }
            });

            $("select").each(function ()
            {
                var checked_name = $(this).attr('data-attr');
                var checked_val = $('#'+checked_name).val();
               $(this).find('option[value="'+checked_val+'"]').attr('selected', 'selected');
            });

            $("#container_id").on('keyup',"input[data-attr='age']",function () {
                var tmptxt=$(this).val();
                var t_age = tmptxt.replace(/\D|^0/g,'');
                if(t_age >999){
                    t_age =999;
                }else if(!t_age||t_age<0){
                    t_age='';
                }
                $(this).val(t_age);
            });


        };

        var owner_func = function () {};
        var init = function () {
            to_step_three();
            add_repeat_block_new('#repeat_model','[data-attr="repeat_div"]', 12, ".bR-green", ".bR-red", $(".bR-green")[0].outerHTML, $(".bR-red")[0].outerHTML, $("#container_id"), owner_func);
            init_radio_func();
            init_step_two_page();
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
/**
 * @author michael
 * @param repeat_obj    需要重复的内容选择器，eg:".add-test"
 * @param repeat_max_count  需要重复的最大次数，eg:6
 * @param add_btn       添加按钮选择器：eg：".add_btn"
 * @param del_btn       删除按钮选择器：eg：".del_btn"
 * @param add_dom       添加按钮dom：eg:$(".add_btn")[0].outerHTML
 * @param del_dom       删除按钮dom：eg:$(".del_btn")[0].outerHTML  //可以在js中声明删除按钮html变量 var del_dom
 * @param container     重复内容最外部容器对象， eg:$("#content_id")
 * @param deal_func     处理函数deal_func
 */
var add_repeat_block_new = function (repeat_model,repeat_obj, repeat_max_count, add_btn, del_btn)
{

    $(add_btn).unbind('click').on('click', function ()
    {
        var block_num = $(repeat_obj).length;
        if (block_num === repeat_max_count)
        {
            Pingan.malertInfo("最多只能添加" + repeat_max_count + "个", 'infoMessage warning', {});
            return;
        }
        var repeat_d = $(repeat_model).clone().removeAttr('style').removeAttr('id').attr('data-attr','repeat_div')[0].outerHTML;
        repeat_d = repeat_d.replace(/\[.*]/g, "[" + block_num++ + "]");
        $(this).parent().before(repeat_d);
        init_add_del_btn();
    });

    $(del_btn).unbind('click').on('click', function ()
    {
        var block_num = $(repeat_obj).length;
        if (block_num > 1)
        {
            $(this).parent().prev().remove();
        }else {
            Pingan.malertInfo("亲，给我留一个吧", 'infoMessage warning', {});
        }
        init_add_del_btn();
    });
    
    var init_add_del_btn = function ()
    {
        var block_num = $(repeat_obj).length;
        if(block_num===1)
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