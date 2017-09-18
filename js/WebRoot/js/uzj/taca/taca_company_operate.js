require.config({
    waitSeconds: 0,
    baseUrl: basePath,
    paths: {
        Pingan: 'js/common/common',
        upload: 'js/lib/webUpload/upload',
        tacaLeft:'js/uzj/taca/taca_left',
        top: 'js/uzj/new_top'
    },
    shim: {
        upload:{
            deps:['Pingan']
        },
        top: {
            deps: ['Pingan']
        },
        tacaLeft:{
            deps:['Pingan']
        }
    },
    deps: ['top','tacaLeft']
});

require(['Pingan','upload','tacaLeft'], function (Pingan, upload,tacaLeft)
{
    WebUploader = upload.WebUploader;
    Pingan.Base = (function ()
    {

        var to_step_two = function ()
        {
            var taca_step_one_form = new Pingan.MForm($("#taca_step_one"));
            taca_step_one_form.isAjax = true;
            taca_step_one_form.afterSubmit = function (result) {
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

        var init_step_one_page = function ()
        {
            var top_three_tpe = $("#select_v").val();

            $('#check_box_id input[type=radio]').filter(function (n)
            {
                if($(this).val() === top_three_tpe)
                {
                    $(this).click();
                }
            });

            var tacaDatums = JSON.parse(company_operate_cfg.tacaDatums);
            var dt1 = 0;
            var dt2 = 0;
            tacaDatums.forEach(function (value, index, array)
            {
                var id0 = value.id;
                var datum_link0 = value.datumLink;
                if(parseInt(value.datumType) === 1)
                {
                    $("[data-attr=upload]").eq(dt1).find('input').eq(0).val(id0);
                    $("[data-attr=upload]").eq(dt1).find('input').eq(1).val(datum_link0);
                    dt1++;
                }else
                {
                    $("[data-attr=upload2]").eq(dt2).find('input').eq(0).val(id0);
                    $("[data-attr=upload2]").eq(dt2).find('input').eq(1).val(datum_link0);
                    dt2++;
                }

            });
        };
        var init = function () {
            to_step_two();
            init_radio_func();
            init_step_one_page();

            searchImg("#datumLink0","datumLink0Div","#filePicker1");
            searchImg("#datumLink1","datumLink1Div","#filePicker2");
            searchImg("#datumLink2","datumLink2Div","#filePicker3");
            searchImg("#datumLink3","datumLink3Div","#filePicker4");
            searchImg("#datumLink4","datumLink4Div","#filePicker5");
            searchImg("#datumLink5","datumLink5Div","#filePicker6");
            searchImg("#datumLink6","datumLink6Div","#filePicker7");
            searchImg("#datumLink7","datumLink7Div","#filePicker8");
            searchImg("#datumLink8","datumLink8Div","#filePicker9");
            searchImg("#datumLink9","datumLink9Div","#filePicker10");
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

var imgUpload = function(filePicker,reportAttachDiv,reportAttach){
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
        duplicate:true
    });
    try{
        var options = {
            afterQueued:function(){
                $("#"+reportAttachDiv).attr('style','margin-top: 0px;');
                $("#"+reportAttachDiv).addClass("datumLinkdiv");
                $("#"+reportAttachDiv).find("img").addClass("img01");
                $("#"+reportAttachDiv).find("img").attr('style','padding-top: 0px;');
            },
            afterSuccess:function(file, url){
                if(url){
                    $(reportAttach).val(url);
                }
                $("#"+reportAttachDiv + " .success").unbind().bind("click",function(){
                    $(filePicker).find("input[type=file]").trigger("click");
                });
                $("#"+reportAttachDiv).find("div .success").addClass("uploadSuccess");
            }
        };
        autoUpload(uploader2, reportAttachDiv,135,135,options);
    }catch(e){
        Pingan.malertInfo('服务器异常，上传失败!','infoMessage warning',{});
    }

};


var searchImg = function(datumLinkId,datumLinkDivId,filePicker){
    var datumLink = $(datumLinkId).val();
    var item = "<div class='img-wrap' style='position: relative;'><img />" +
        "<div class='success' ><a href='javascript:void(0)' style='color:white;'>重新上传</a></div>" +
        "</div>";
    if(datumLink != ""){
    	 imgUpload(filePicker,datumLinkDivId,datumLinkId);
        $("#"+datumLinkDivId).addClass("file-item").html(item);
        $("#"+datumLinkDivId +" img").attr("src",basePath+"/"+datumLink);
        $("#"+datumLinkDivId).find("img").addClass("img01");
        $("#"+datumLinkDivId).find("img").attr('style','padding-top: 0px;');
        $("#"+datumLinkDivId).addClass("datumLinkdiv");
        $("#"+datumLinkDivId).find("div .success").addClass("imgSuccess");
        //强制删除,防止重复弹出上传
        var length = $(filePicker).find("input[type=file]").length;
        $(filePicker).find("input[type=file]").each(function(index,element){
            if((index+1)<length){
                $(element).remove();
            }
        });

        $("#"+datumLinkDivId).find(".success").unbind().bind("click",function(e){
            e.preventDefault();
            $(filePicker).find("input[type=file]").trigger("click");
        });
    } else {
        var html = '<input type="button"/>'+
            '<img src="'+basePath+'/images/base-upload.png"/>';
        $(filePicker).html(html);
        $(filePicker).find("img").last().after('<div id="'+datumLinkDivId+'" class="uploader-list"></div>');
        imgUpload(filePicker,datumLinkDivId,datumLinkId);
    }
};
