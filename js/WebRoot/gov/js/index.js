/**
 * Created by wangjunling on 2016/8/18.
 */
require.config({
    waitSeconds : 0,
    baseUrl:basePath,
    paths : {
        Pingan : 'gov/js/common/common',
        autocomplete : 'gov/js/lib/jquery-ui-autocomplete.min',
        autocomplete_common:'gov/js/autocomplete-common',
        gov_top:'gov/js/gov_top',
        index:"gov/js/index",
        bootstrap:"gov/js/lib/bootstrap3/js/bootstrap"
    },
    shim : {
        autocomplete:{
            deps:['Pingan']
        },
        autocomplete_common:{
            deps:['autocomplete']
        },
        gov_top:{
            deps:['Pingan']
        },
        index : {
            deps : [ 'Pingan']
        },
        bootstrap:{
            deps:['Pingan']
        }
    },
    deps : [ 'Pingan','gov_top','autocomplete_common', 'index','bootstrap' ]
});
require(['Pingan','autocomplete','bootstrap'],function (Pingan,autocomplete,bootstrap) {

    Pingan.Event = function () {
        $("[tip]").click(function(){
            $("[tip]").removeClass("current");
            $(this).addClass("current");
            $("#searchType").val($(this).attr("tab"));
            if(validKey()){
                $("#searchKey").autocomplete("search");
            }else{
                $("#searchKey").focus();
                $("#searchKey").attr("placeholder", $(this).attr("tip"));
            }
        });
        $(".layout index-input layout-over li").click(function(){
            $(".layout index-input layout-over").find("li").removeClass("current");
            $(this).addClass("current");
            $("#searchType").val($(this).attr("tab"));

            var key = $("#searchKey").val();
            if(key == "" || key == "可以按企业名称、注册号、法人、股东、高管、品牌查询" || key == "按企业名称查询" || key == "按法人、股东查询" || key =="按地址查询" || key =="按经营范围查询"){
                $("#searchKey").val($(this).attr("tip"));
            }
            if($("#searchType").val() != "all"){
                $("#searchKey").autocomplete("close");
                $("#searchKey").autocomplete("disable");
            }else{
                $("#searchKey").autocomplete("enable");
                $("#searchKey").autocomplete("search");
            }
        });
        $("[markSearch]").click(function(){
            var tabName = "[tab='"+$(this).attr("markSearch")+"']";
            $(tabName).click();
        })
        $("a[name='closeSeed']").find("img").click(function(){
            $(".new-adv").hide();
        });
        $("#ownerClose").click(function () {
            $(this).hide();
            $(this).next().hide();
        });

$("#publicTab").find("li").click(function () {
    $("#publicTab").find("li").removeClass("current");
    $(this).addClass("current");
    var tab = $(this).attr("tab");
    if(tab=="keepList"){
        $("#keepList").show();
        $("#breakList").hide();
    }else   if(tab=="breakList"){
        $("#breakList").show();
        $("#keepList").hide();
    }
});
        $(".carousel").carousel({
            interval:3000
        })
    }


    Pingan.Event();
});