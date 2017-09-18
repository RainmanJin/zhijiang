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
        var init_base_select_option = function ()
        {
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

                        var city_selected = "<option selected='selected' value="+$('#cityCode_id').val()+">"+$('#city_id').val()+"</option>";
                        var city_selected_id = $('#cityCode_id').val();
                        if (city_selected_id !== "")
                        {
                            $("[name=cityCode]select").find('option[value=' + city_selected_id + ']')
                                .attr('selected', 'selected');
                            $("[name=city]").val($('#city_id').val());
                        }
                    }
                }
            });

            $("#citySelect").change(function () {
                var key = $(this).val();
                if(!key){
                    var optionHtml = "<option value=''>选择区</option>";
                    $("#districtSelect").find("option").remove();
                    $("#districtSelect").append(optionHtml);
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
                                optionHtml+="<option value="+data[i].id+">"+data[i].name+"</option>"
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
        var init_base_select = function ()
        {
            var industry_selected = $("#industry_id").val();
            var district_selected= "<option selected='selected' value="+$('#districtCode_id').val()+">"+$('#district_id').val()+"</option>";
            if(industry_selected !=="")
            {
                $('[name=industry]select').find('option[value=' + industry_selected + ']').attr('selected', 'selected');
            }
            $("[name=districtCode]select").append(district_selected);
            $("[name=district]").val($('#district_id').val());
        };
        var to_step_one = function ()
        {
            var errorMsg = new Pingan.Popover($('#errorMsg'), $('#errorMsg'));
            var taca_base_info_form = new Pingan.MForm($("#taca_base_info"),errorMsg);
            taca_base_info_form.isAjax = true;

            taca_base_info_form.afterSubmit = function (result) {
                if (result.statusCode === 1) {
                    var data = result.data;
                	if(data.submitType === 2){
                		Pingan.malertInfo('您为2017年到期复审企业，将自动为您跳转复审流程!', 'datum-tip-cls01',{"showTime":5000,callback:function () {
                            window.location.href = basePath + "/taca/apply/company/operate?activityId="+data.id;
                        }}, {});
                		return;
                	}
                    window.location.href = basePath + "/taca/apply/company/operate?activityId="+data.id;
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
        var init = function () {
            init_base_select_option();
            init_base_select();
            to_step_one();
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
