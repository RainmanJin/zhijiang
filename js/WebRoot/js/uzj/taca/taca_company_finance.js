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

require(['Pingan','upload','tacaLeft'], function (Pingan, upload,tacaLeft)
{
    WebUploader = upload.WebUploader;
    Pingan.Base = (function ()
    {
        var to_step_seven = function ()
        {
            var taca_step_six_form = new Pingan.MForm($("#taca_step_six"));
            taca_step_six_form.isAjax = true;

            taca_step_six_form.afterSubmit = function (result) {
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


        var locationDispute = function () {
            window.location.href =$("#taca_nav_id").find(".current").next().next().attr("href");
        }
        var init_step_six = function ()
        {
            var tacaDatums = JSON.parse(company_finance_cfg.tacaDatums);
            var dt1 = 0;
            tacaDatums.forEach(function (value, index, array)
            {
                $("[data-attr=upload]").eq(dt1).find('input').eq(0).val(value.id);
                $("[data-attr=upload]").eq(dt1).find('input').eq(1).val(value.datumLink);
                $("[data-attr=upload]").eq(dt1).find('input').eq(2).val(value.datumOriginalName);
                dt1++;
            });
        };

        var init_number_input = function () {
            $("#container_id").on('blur',"input[data-attr='number']",function () {
                var tmptxt=$(this).val();

                var patt1=new RegExp("^[-+]?[0-9]+(\\.[0-9]+)?$");
                if (!patt1.test(tmptxt)) {
                    $(this).val('');
                }

            });
        };

        var init = function () {
            to_step_seven();
            init_step_six();
           // imgUpload("#filePicker1","datumLink0Div","#datumLink0");
           // imgUpload("#filePicker2","datumLink1Div","#datumLink1");
            searchImg("#datumLink0","datumLink0Div","#filePicker1");
            searchImg("#datumLink1","datumLink1Div","#filePicker2");
            init_number_input();
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
        fileSingleSizeLimit: 1024 * 1024 * 5,
        accept: {
            title: 'Images',
            extensions: 'doc,docx,pdf',
            mimeTypes: '.doc,.docx,.pdf'
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
                    $(reportAttach).next().val(file.name);
                    }
                $("#"+reportAttachDiv + " .success").unbind().bind("click",function(e){
                    e.preventDefault();
                    $(filePicker).find("input[type=file]").trigger("click");
                });

                var pic_name = file.ext ==='pdf'?'pdf_icon.png':'doc_icon.png';
                var success_original_file = '<div class="success uploadSuccess" style=" width: 108px; margin-bottom: -1px; height: 23px;top:0;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;"><a href="javascript:void(0)" style="color:white;" title="'+file.name+'">'+file.name+'</a></div>';
                $("#"+reportAttachDiv).find("div .success").addClass("uploadSuccess");
                $("#"+reportAttachDiv+" div .success.uploadSuccess").css('width', '108px').css('margin-bottom','-1px').css('height','20px');
                $("#"+reportAttachDiv+" .uploadSuccess").siblings('span').after('<img src='+basePath+'/images/'+pic_name+ ' style="max-width: 87px;margin-top: 13px;padding-left: 30px;max-height: 35px;min-width: 56px;min-height: 56px;">').remove();
                $("#"+reportAttachDiv+" .uploadSuccess").before(success_original_file);
            }
        };
        autoUpload(uploader2, reportAttachDiv,135,135,options);
    }catch(e){
        Pingan.malertInfo('服务器异常，上传失败!','infoMessage warning',{});
    }

};


var searchImg = function(datumLinkId,datumLinkDivId,filePicker){
    var datumLink = $(datumLinkId).val();
    var datumOriginalName = $(datumLinkId).next().val();
    var pic_name = datumOriginalName ===""?'':datumOriginalName.split('.')[1]==='pdf'?'pdf_icon.png':'doc_icon.png';
    var item = "<div class='img-wrap' style='position: relative;'><img />" +
        "<div class='success' ><a href='javascript:void(0)' style='color:white;'>重新上传</a></div>" +
        "</div>";
    var itemOriginalName = '<div class="success imgSuccess" style="width: 108px;top: 0px;height: 23px;bottom: -42px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;"><a href="javascript:void(0)" style="color:white;" title='+datumOriginalName+' >'+datumOriginalName+'</a></div>';
    if(datumLink != ""){
    	imgUpload(filePicker,datumLinkDivId,datumLinkId);
        var default_pic_url = 'images/'+pic_name;
        $("#"+datumLinkDivId).addClass("file-item").html(item);
        $("#"+datumLinkDivId +" img").attr("src",basePath+"/"+default_pic_url);
        $("#"+datumLinkDivId).find("img").addClass("img01");
        $("#"+datumLinkDivId).find("img").attr('style','max-width: 87px;margin-top:12px;padding-left: 30px;max-height: 35px;min-width: 56px;min-height: 56px;');
        $("#"+datumLinkDivId).addClass("datumLinkdiv");
        $("#"+datumLinkDivId).find("div .success").attr('style','width: 108px;position: absolute;z-index: 999;background-color: #00bb9c;top: 79px;');
        $("#"+datumLinkDivId).find("div .success").before(itemOriginalName);
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

        if(datumLinkDivId == "datumLink0Div"){
            $(filePicker).find("img").last().after('<div id="datumLink0Div" class="uploader-list"></div>');
        }

        if(datumLinkDivId == "datumLink1Div"){
            $(filePicker).find("img").last().after('<div id="datumLink1Div" class="uploader-list"></div>');
        }
        imgUpload(filePicker,datumLinkDivId,datumLinkId);
    }
};
