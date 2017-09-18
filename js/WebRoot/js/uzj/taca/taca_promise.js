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
    	var init_radio_func = function ()
        {
    		 $('input[type=radio]').on('click', function(){
                 var name = $(this).attr("name");
                 $("input[type=radio][name="+name+"]").parent().removeClass("jqChecked");
                 $(this).parent().addClass("jqChecked");
                 $(this).attr("checked",true);
              });
        }
        
        var upPage = function(){
            $("#upPage").click(function () {
                window.location.href = basePath + "/taca/apply/other?activityId="+$("input[name='activityId']").val();
            })
        }
        var nextPage = function(){
            window.location.href = basePath + "/taca/end?activityId="+$("input[name='activityId']").val();
        }

        var saveBtn = function(){
            $("#mconfirmBtn").click(function () {
                var isPromise = $('input:radio[id="isPromise"]:checked').val();
                if(typeof(isPromise) == 'undefined'){
                    Pingan.malertInfo('请选择是否同意承诺书!', 'datum-tip-cls', {});
                    return false;
                }else{
                    Pingan.malert($("#auditConfirm"),$("#btnCancle"),{});

                }
            });

            var errorMsg = new Pingan.Popover($('#errorMsg'), $('#errorMsg'));

            var promiseForm = new Pingan.MForm($("#addPromiseForm"),errorMsg);
            promiseForm.isAjax = true;
            promiseForm.beforeSubmit = function(){
                var auditType = $("input[type=radio][name=auditType]:checked").val();
                if(auditType=="1"){
                    if ($("#citySelect").val()===""||$("#districtSelect").val()==="") {
                        errorMsg.show("请选择市区");
                        return false;
                    }
                }
                if(auditType=="2"){
                    if ($("#s1").val()==="") {
                        errorMsg.show("请选择协会行业");
                        return false;
                    }
                }
                return true;
            };
            promiseForm.afterSubmit = function (result) {
                if(result.statusCode == 1){
                    Pingan.malertInfo('资料提交成功!', 'datum-tip-cls', {callback:nextPage});
                    return;
                }
                if(result.statusCode == 5){
                    Pingan.malertInfo('请重新登录!', 'datum-tip-cls', {});
                    return;
                }
                if (result === "") {
                    return;
                }
                Pingan.malertInfo('保存失败，请稍后重试！', 'm-alert-info-failed', {});
            }

        };
        var init_base_select_option = function ()
        {

            $("#citySelect").change(function () {
                var key = $(this).val();
                if(!key){
                    var optionHtml = "<option value=''>请选择</option>";
                    $("#districtSelect").find("option").remove();
                    $("#districtSelect").append(optionHtml);
                    return;
                }
                $.ajax({
                    url: basePath+"/role/parent/"+key,
                    type: "GET",
                    success:function (result) {
                        if(result.statusCode==1){
                            var data = result.data;
                            var optionHtml = "<option value=''>请选择</option>";
                            for(var i=0;i<data.length;i++) {
                                optionHtml+="<option value="+data[i].id+">"+data[i].aliasName+"</option>"
                            }
                            $("#districtSelect").find("option").remove();
                            $("#districtSelect").append(optionHtml);
                        }
                    }
                });
            });
        };
        var init = function () {
        	init_radio_func();
        	saveBtn();
            init_base_select_option();
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

});