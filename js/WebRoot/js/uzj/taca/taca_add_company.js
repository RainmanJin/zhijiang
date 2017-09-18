require.config({
    waitSeconds: 0,
    baseUrl: basePath,
    paths: {
        Pingan: 'js/common/common',
        upload: 'js/lib/webUpload/upload',
        top: 'js/uzj/new_top',
        webuploader: 'js/lib/webUpload/webuploader.min',
        companyTag: 'js/uzj/company.tag',
        popup_layer: 'js/lib/popup_layer',
        jquery_ui_autocomplete_min: 'js/lib/jquery-ui-autocomplete.min',
        autocomplete: 'js/uzj/autocomplete-common'
    },
    shim: {
        jquery_ui_autocomplete_min: {
            deps: ['Pingan']
        },
        autocomplete: {
            deps: ['jquery_ui_autocomplete_min']
        },
        upload: {
            deps: ['Pingan']
        },
        companyTag: {
            deps: ['Pingan']
        },
        webuploader: {
            deps: ['Pingan']
        },
        top: {
            deps: ['Pingan']
        }
    },
    deps: ['top','webuploader']
});


require(['top', 'popup_layer', 'autocomplete', 'upload', 'companyTag','webuploader'], function (top, popup, autocomplete, upload, companyTag, webuploader) {
    WebUploader = upload.WebUploader;

    Pingan.Base = (function ()
    {

        initAddCompany();
        //认领企业-上传营业执照
        upload_single_file('#filePicker3','attachOrgfileDiv','#attachOrgfile',basePath + "/user/datum/" + userCfg.upload + "&isFullPath=false");
        //认领企业-上传企业名片
        upload_single_file('#filePicker4','attachEnterpriseCardDiv','#attachEnterpriseCard',basePath + "/user/datum/" + userCfg.upload + "&isFullPath=false");
        autocomplete.init({model: "fill_without_href"});

    })();


});

//认领企业-初始化
var initAddCompany = function () {
    var errorMsg = new Pingan.Popover($('#errorMsg'), $('#errorMsg'));
    var ownerForm = new Pingan.MForm($("#ownerForm"), errorMsg);
    ownerForm.isAjax=true;
    ownerForm.beforeSubmit = function () {
        var attachOrgfile = $("[name='attachOrgfile']").val();
        var attachEnterpriseCard = $("[name='attachEnterpriseCard']").val();
        if (!attachOrgfile) {
            errorMsg.show('请上传您的营业执照!');
            return false;
        }
        if (!attachEnterpriseCard) {
            errorMsg.show('请上传您的企业名片!');
            return false;
        }
        return true;
    };

    $("#userRealname").blur(function(){
        if(!$("#userRealname").val().isText()){
            $("#errorMsg").html("请输入真实姓名");
            $("#errorMsg").show();
            return;
        }
    });

    var countdown;
    var isRun = true;
    var doChange = function () {
        countdown--;
        if (countdown > 0) {
            isRun = false;
            $('#sendPhoneCode').css("background-color", "#c0c0c0");
            $('#sendPhoneCode').hover(function () {
                $(this).css("background-color", "#c0c0c0");
            });
            $('#sendPhoneCode').css("cursor", "default");
            $('#sendPhoneCode').val(countdown + '秒后可重新操作');
            timer = setTimeout(doChange, 1000);//调用自身实现
        } else {
            isRun = true;
            $('#sendPhoneCode').css("background-color", "#00bb9c");
            $('#sendPhoneCode').hover(function () {
                $(this).css("background-color", "#00c1a1");
            }, function () {
                $(this).css("background-color", "#00bb9c");
            });
            $('#sendPhoneCode').css("cursor", "pointer");
            $('#sendPhoneCode').val('获取验证码');
            clearTimeout(timer);
        }
    };

    $("#sendPhoneCode").click(function () {
        if (isRun) {
            var num = $(this).attr("num");
            var phoneNum = $('#phone').val();
            if (!ownerForm.getItem('phone').validate()) {
                errorMsg.show('手机号格式不正确!');
            } else {
                $.post(basePath + "/user/createPhoneCode", {
                    'phone': phoneNum,
                    'isNotReceive': num
                }, function (data) {
                    if (data.statusCode == 1) {
                        num++;
                        $("#sendPhoneCode").attr("num", num);
                        $("#smsS").val(data['data']['smsed']);
                        countdown = 60;
                        timer = setTimeout(doChange, 50);
                        return false;
                    }else{
                        errorMsg.show(data.statusMessage);
                    }
                });
            }
        }
    });

    ownerForm.afterSubmit=function (result) {
        if(result.statusCode == 1){
            window.location.href = basePath + "/user/owner/add_success";
            return;
        }

        if(result.statusCode == 99999){
            Pingan.malertInfo(result.statusMessage, 'datum-tip-cls', {});
            setTimeout("location.reload()",2000);
            return;
        }

        if(result.statusCode == 2){
            Pingan.malertInfo('您输入的企业不存在', 'datum-tip-cls', {});
            return;
        }

    }
    $.ajax({
        url: basePath+"/province/4003/city",
        type: "GET",
        success:function (result) {
            if(result.statusCode==1){
                var data = result.data;
                var optionHtml = "<option value=''>选择市</option>";
                for(var i=0;i<data.length;i++) {
                    optionHtml+="<option value='"+data[i].id+"'>"+data[i].name+"</option>"
                }
                $("#citySelect").find("option").remove();
                $("#citySelect").append(optionHtml);
            }
        }
    });

    $("#citySelect").change(function () {
        var key = $(this).val();
        if(!key){
            return;
        }
        var txt=$(this).find("option:selected").text();
        $("#city").val(txt);
        $.ajax({
            url: basePath+"/province/"+key+"/city",
            type: "GET",
            success:function (result) {
                if(result.statusCode==1){
                    var data = result.data;
                    var optionHtml = "<option value=''>选择区</option>";
                    for(var i=0;i<data.length;i++) {
                        optionHtml+="<option value='"+data[i].id+"'>"+data[i].name+"</option>"
                    }
                    $("#districtSelect").find("option").remove();
                    $("#districtSelect").append(optionHtml);
                }
            }
        });
    });
    $("#districtSelect").change(function () {
        var key = $(this).val();
        if(!key){
            return;
        }
        var txt=$(this).find("option:selected").text();
        $("#district").val(txt);
    });
};

var upload_single_file=function(file_picker,attach_file_div,attach_img_id,server_url){
    uploaders = WebUploader.create({
        auto: true,
        resize: false,
        swf: basePath + '/js/lib/webUpload/Uploader.swf',
        server: server_url,
        pick: file_picker,
        fileSingleSizeLimit: 1024 * 512 * 4,
        accept: {
            title: 'Images',
            extensions: 'jpg,jpeg,png',
            mimeTypes: 'image/jpg,image/jpeg,image/png'
        },
        duplicate:true
    });
    try {
        var options = {
            afterQueued:function(){
                $("#"+attach_file_div).find("img").attr('style','padding-top: 40px;');
            },
            afterSuccess:function(file, url){
                if(url){
                    $(attach_img_id).val(url);
                }

                $("#"+attach_file_div+"  .success").unbind().bind("click",function(){
                    $(file_picker).find("input[type=file]").trigger("click");
                });
            }
        }
        autoUpload(uploaders, attach_file_div,100,100,options);
    } catch (e) {
        Pingan.malertInfo('服务器异常，上传失败!', 'datum-tip-cls', {});
    }
};
