require.config({
    waitSeconds: 0,
    baseUrl: basePath,
    paths: {
        Pingan: 'js/common/common',
        upload: 'js/lib/webUpload/upload',
        tacaLeft:'js/uzj/taca/taca_left',
        top: 'js/uzj/new_top',
    },
    shim: {
        upload: {
            deps: ['Pingan']
        },
        top: {
            deps: ['Pingan']
        }
    },
    deps: ['top','tacaLeft']
});

require(['Pingan', 'upload','tacaLeft'], function (Pingan, upload,tacaLeft)
{
    WebUploader = upload.WebUploader;
    Pingan.Base = (function ()
    {
        var to_step_six = function ()
        {
            var taca_step_five_form = new Pingan.MForm($("#taca_step_five"));
            taca_step_five_form.isAjax = true;
            taca_step_five_form.afterSubmit = function (result)
            {
                if (result.statusCode === 1)
                {
                    Pingan.malertInfo('保存成功!', 'datum-tip-cls', {callback:function () {
                        tacaLeft.locationNextPage();
                    }});
                }else if (result.statusCode === 5) {
                    Pingan.malertInfo('请重新登陆！', 'datum-tip-cls', {});
                    return false;
                }else if (result === "") {
                    return false;
                }else
                {
                    Pingan.malertInfo('保存失败，请稍后重试！', 'm-alert-info-failed', {});
                    return false;
                }
            };
        };


        var init_radio_func = function ()
        {
            $('input[type=radio]').on('click', function ()
            {
                $(this).parent().addClass("jqChecked").siblings().removeClass("jqChecked");
            });
        };

        var init_step_five_page = function ()
        {
            $('input[type=radio]').filter(function (n)
            {
                if ($(this).val() === $("#" + $(this).attr('data-attr')).val())
                {
                    $(this).click();
                }
            });

            $("select").each(function ()
            {
                var checked_name = $(this).attr('data-attr');
                var checked_val = $('#' + checked_name).val();
                $(this).find('option[value="' + checked_val + '"]').attr('selected', 'selected');
            });

            var tacaDatums = JSON.parse(industry_status_cfg.tacaDatums);
            var dt1 = 0;
            tacaDatums.forEach(function (value, index, array)
            {
                $("[data-attr=upload]").eq(dt1).find('input').eq(0).val(value.id);
                $("[data-attr=upload]").eq(dt1).find('input').eq(1).val(value.datumLink);
                dt1++;
            });
        };

        var init = function ()
        {
            to_step_six();
            init_radio_func();
            init_step_five_page();
            add_repeat_block_new('#repeat_table', '[data-attr="repeat_table"]', 5, ".bR-green", ".bR-red");

            searchImg("#datumLink0", "datumLink0Div", "#filePicker1");
            searchImg("#datumLink1", "datumLink1Div", "#filePicker2");
            searchImg("#datumLink2", "datumLink2Div", "#filePicker3");
            searchImg("#datumLink3", "datumLink3Div", "#filePicker4");
            searchImg("#datumLink4", "datumLink4Div", "#filePicker5");
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
var add_repeat_block_new = function (repeat_model, repeat_obj, repeat_max_count, add_btn, del_btn)
{
    $(add_btn).unbind('click').on('click', function ()
    {
        var block_num = $(repeat_obj).length;
        if (block_num === repeat_max_count)
        {
            Pingan.malertInfo("最多只能添加" + repeat_max_count + "个", 'infoMessage warning', {});
            return;
        }
        var repeat_d = $(repeat_model).clone().removeAttr('style').removeAttr('id')
            .attr('data-attr', 'repeat_table')[0].outerHTML;
        repeat_d = repeat_d.replace(/\[.*]/g, "[" + block_num++ + "]");
        $(this).parent().prev().append(repeat_d);
        init_add_del_btn();
    });

    $(del_btn).unbind('click').on('click', function ()
    {
        var block_num = $(repeat_obj).length;
        if (block_num > 1)
        {
            $(this).parent().prev().find('table').last().remove();
        }
        else
        {
            Pingan.malertInfo("亲，给我留一个吧", 'infoMessage warning', {});
        }
        init_add_del_btn();
    });

    var init_add_del_btn = function ()
    {
        var block_num = $(repeat_obj).length;
        if (block_num === 1)
        {
            $(del_btn).hide();
            $(add_btn).show();
        }
        else if (block_num === repeat_max_count)
        {
            $(add_btn).hide();
            $(del_btn).show();
        }
        else
        {
            $(add_btn).show();
            $(del_btn).show();
        }
    };

    init_add_del_btn();
};


var imgUpload = function (filePicker, reportAttachDiv, reportAttach)
{
    uploader2 = WebUploader.create({
        auto: true,
        resize: false,
        swf: basePath + '/js/lib/webUpload/Uploader.swf',
        server: basePath + "/user/datum/uploaddatum",
        pick: filePicker,
        fileSingleSizeLimit: 1024 * 512 * 4,
        accept: {
            title: 'Images',
            extensions: 'jpg,jpeg,png',
            mimeTypes: 'image/jpg,image/jpeg,image/png'
        },
        duplicate: true
    });
    try
    {
        var options = {
            afterQueued: function ()
            {
                //$("#"+reportAttachDiv).attr('style','margin-top: 0px;margin-left: -15px;position: absolute;bottom: 0;top:0;');
                $("#" + reportAttachDiv).attr('style', 'margin-top: 0px;');
                $("#" + reportAttachDiv).addClass("datumLinkdiv");
                $("#" + reportAttachDiv).find("img").addClass("img01");
                $("#" + reportAttachDiv).find("img").attr('style', 'padding-top: 0px;');
            },
            afterSuccess: function (file, url)
            {
                if (url)
                {
                    $(reportAttach).val(url);
                }
                $("#" + reportAttachDiv + " .success").unbind().bind("click", function ()
                {
                    $(filePicker).find("input[type=file]").trigger("click");
                });
                //$("#"+reportAttachDiv).find("div .success").attr('style','position: absolute;bottom: 0;z-index: 999;width: 100%;background-color: #00bb9c;');
                $("#" + reportAttachDiv).find("div .success").addClass("uploadSuccess");
            }
        }
        autoUpload(uploader2, reportAttachDiv, 135, 135, options);
    } catch (e)
    {
        Pingan.malertInfo('服务器异常，上传失败!', 'infoMessage warning', {});
    }

};


var searchImg = function (datumLinkId, datumLinkDivId, filePicker)
{
    var datumLink = $(datumLinkId).val();
    var item = "<div class='img-wrap' style='position: relative;'><img />" +
        "<div class='success' ><a href='javascript:void(0)' style='color:white;'>重新上传</a></div>" +
        "</div>";
    if (datumLink != "")
    {
        imgUpload(filePicker, datumLinkDivId, datumLinkId);
        $("#" + datumLinkDivId).addClass("file-item").html(item);
        $("#" + datumLinkDivId + " img").attr("src", basePath + "/" + datumLink);
        $("#" + datumLinkDivId).find("img").addClass("img01");
        $("#" + datumLinkDivId).find("img").attr('style', 'padding-top: 0px;');
        //$("#"+datumLinkDivId).find("img").attr('style','padding-top: 0px;max-width:108px;max-height:108px;min-width:108px;min-height:108px;');
        $("#" + datumLinkDivId).addClass("datumLinkdiv");
        //$("#"+datumLinkDivId).attr("style","margin-top: 0px;margin-left: -15px;position: absolute;bottom: 0;top:0;");
        //$("#"+datumLinkDivId).find("div .success").attr('style','position: absolute;bottom: 0;z-index: 999;width: 100%;background-color: #00bb9c;top:85px;');
        $("#" + datumLinkDivId).find("div .success").addClass("imgSuccess");
        //强制删除,防止重复弹出上传
        var length = $(filePicker).find("input[type=file]").length;
        $(filePicker).find("input[type=file]").each(function (index, element)
        {
            if ((index + 1) < length)
            {
                $(element).remove();
            }
        });

        $("#" + datumLinkDivId).find(".success").unbind().bind("click", function (e)
        {
            e.preventDefault();
            $(filePicker).find("input[type=file]").trigger("click");
        });
    }
    else
    {
        var html = '<input type="button"/>' +
            '<img src="' + basePath + '/images/base-upload.png"/>';
        $(filePicker).html(html);

        if (datumLinkDivId == "datumLink0Div")
        {
            $(filePicker).find("img").last().after('<div id="datumLink0Div" class="uploader-list"></div>');
        }

        if (datumLinkDivId == "datumLink1Div")
        {
            $(filePicker).find("img").last().after('<div id="datumLink1Div" class="uploader-list"></div>');
        }

        if (datumLinkDivId == "datumLink2Div")
        {
            $(filePicker).find("img").last().after('<div id="datumLink2Div" class="uploader-list"></div>');
        }

        if (datumLinkDivId == "datumLink3Div")
        {
            $(filePicker).find("img").last().after('<div id="datumLink3Div" class="uploader-list"></div>');
        }

        if (datumLinkDivId == "datumLink4Div")
        {
            $(filePicker).find("img").last().after('<div id="datumLink4Div" class="uploader-list"></div>');
        }
        if (datumLinkDivId == "datumLink5Div")
        {
            $(filePicker).find("img").last().after('<div id="datumLink5Div" class="uploader-list"></div>');
        }
        if (datumLinkDivId == "datumLink6Div")
        {
            $(filePicker).find("img").last().after('<div id="datumLink6Div" class="uploader-list"></div>');
        }
        if (datumLinkDivId == "datumLink7Div")
        {
            $(filePicker).find("img").last().after('<div id="datumLink7Div" class="uploader-list"></div>');
        }
        if (datumLinkDivId == "datumLink8Div")
        {
            $(filePicker).find("img").last().after('<div id="datumLink8Div" class="uploader-list"></div>');
        }
        if (datumLinkDivId == "datumLink9Div")
        {
            $(filePicker).find("img").last().after('<div id="datumLink9Div" class="uploader-list"></div>');
        }
        imgUpload(filePicker, datumLinkDivId, datumLinkId);
    }
};
