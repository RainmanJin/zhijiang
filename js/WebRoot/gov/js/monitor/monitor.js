/**
 * Created by wangjunling on 2016/7/11.
 */
require.config({
    waitSeconds: 0,
    baseUrl: basePath,
    urlArgs: "r=" + (new Date()).getTime(),
    paths: {
        Pingan: 'gov/js/common/common',
        autocomplete: 'gov/js/lib/jquery-ui-autocomplete.min',
        upload: 'gov/js/monitor/upload',
        gov_top: 'gov/js/gov_top',
        monitor: "gov/js/monitor/monitor",
        left: 'gov/js/monitor/monitor_left',
        mCustomScrollbar: 'gov/js/lib/jquery.mCustomScrollbar.concat.min'
    },
    shim: {

        autocomplete: {
            deps: ['Pingan']
        },
        upload: {
            deps: ['Pingan']
        },
        monitor: {
            deps: ['Pingan']
        },
        gov_top: {
            deps: ['Pingan']
        },
        left: {
            deps: ['Pingan']
        },
        mCustomScrollbar: {
            deps: ['Pingan']
        }

    },
    deps: ['upload', 'gov_top','left', 'autocomplete', 'monitor']
});
require(['Pingan', 'upload','autocomplete', 'mCustomScrollbar'], function (Pingan, upload, autocomplete, mCustomScrollbar) {
    if (monitorCfg.page == 'detail') {

        var newsCurpage = 0;
        Pingan.Event = function () {

            $("[data-target]").click(function () {
                var div = $($(this).attr("data-target"));
                Pingan.moveTo(div, -100, 500);
            });

            Pingan.addFavorite($(".govColl"), document.title, location.href);
            $(".govPrint").click(function () {
                window.print();
            });

            $("#corpProdPenaltyTable").on("click", "a[detail-data]", function () {
                corpProdPenaltyDetail($(this).attr('detail-data'));
            });
            $("#courtDocTable").on("click", "a[detail-data]", function () {
                courtDetail($(this).attr('detail-data'));
            });
            $("#enterPrisePenaltyTable").on("click", "a[detail-data]", function () {
                enterPrisePenaltyDetail($(this).attr('detail-data'));
            });
        };
        Pingan.Init = function () {


            //负面报道
            var negativeMediaPage = new Pingan.PageHandler($("#negativeMediaReport"), $("#negativeMediaReport_page"));
            negativeMediaPage.formateItem = function (index, model, row){
                var newTip = "";
                if(new Date(row["lastupdatetime"]).getTime()>new Date(monitorCfg.lastReadTime).getTime()){
                    newTip = "<em>new</em>";
                }
                return model.format(encodeURIComponent(row["newsUrl"]), row["newsTitle"], row["newsSitename"], new Date(parseInt(row["newsTime"]) * 1000).format("yyyy-MM-dd hh:mm"),newTip);
            };

            corpProdPenaltyTable = new Pingan.PageHandler($("#corpProdPenaltyTable"), $("#corpProdPenaltyPage"));
            corpProdPenaltyTable.formateItem = function (index, model, row) {
                var newTip = "";
                if(new Date(row["lastupdatetime"]).getTime()>new Date(monitorCfg.lastReadTime).getTime()){
                    newTip = "<em>new</em>";
                }
                return model.format(row["punishDocCode"], row["illegalType"], row["illegalFacts"], row["punishContent"], new Date(parseInt(row["illegalDate"])).format("yyyy-MM-dd"), row["id"],newTip);
            };
            corpProdPenaltyTable.checkNone = function () {
                checkNone(corpProdPenaltyTable);
            };
            enterPrisePenaltyTable = new Pingan.PageHandler($("#enterPrisePenaltyTable"), $("#enterPrisePenaltyPage"));

            enterPrisePenaltyTable.formateItem = function (index, model, row) {
                var newTip = "";
                if(new Date(row["lastupdatetime"]).getTime()>new Date(monitorCfg.lastReadTime).getTime()){
                    newTip = "<em>new</em>";
                }
                return model.format(row["taxRegNo"], row["punishDocNo"], row["illegalFacts"], row["situation"], new Date(parseInt(row["punishDate"])).format("yyyy-MM-dd"), row["id"],newTip);
            };
            enterPrisePenaltyTable.checkNone = function () {
                checkNone(enterPrisePenaltyTable);
            };
            uncreTable = new Pingan.PageHandler($("#uncreTable"), $("#uncrePage"));
            uncreTable.formateItem = function (index, model, row) {
                var newTip = "";
                if(new Date(row["filingDate"]).getTime()>new Date(monitorCfg.lastReadTime).getTime()){
                    newTip = "<em>new</em>";
                }
                return model.format(row["anno"], row["actionerMark"], new Date(parseInt(row["filingDate"])).format("yyyy-MM-dd"),newTip);
            };
            uncreTable.checkNone = function () {
                checkNone(uncreTable);
            };
            rentNoPayTaxTable = new Pingan.PageHandler($("#rentNoPayTaxTable"), $("#rentNoPayTaxPage"));

            rentNoPayTaxTable.formateItem = function (index, model, row) {
                var newTip = "";
                if(new Date(row["lastupdatetime"]).getTime()>new Date(monitorCfg.lastReadTime).getTime()){
                    newTip = "<em>new</em>";
                }
                return model.format(row["taxpayerNo"], row["legalPerson"], row['owedTaxAmount'], row['owedTaxName'], new Date(parseInt(row["owedTaxDate"])).format("yyyy-MM-dd"),newTip);
            };
            rentNoPayTaxTable.checkNone = function () {
                checkNone(rentNoPayTaxTable);
            };
            courtDocTable = new Pingan.PageHandler($("#courtDocTable"), $("#courtDocPage"));

            courtDocTable.checkNone = function () {
                checkNone(courtDocTable);
            };
            courtDocTable.formateItem = function (index, model, row) {
                var newTip = "";
                if(new Date(row["docSubmitTime"]).getTime()>new Date(monitorCfg.lastReadTime).getTime()){
                    newTip = "<em>new</em>";
                }
                return model.format(row["docTitle"]?row["docTitle"]:"-", row["docSubtype"]?row["docSubtype"]:"-", row["docTime"]?row["docTime"]:"-", row["id"],newTip);
            };
            Pingan.Event();
        };
        function checkNone(table) {
            if (table.total <= 0) {
                table.content.parent().parent().hide();
                $(table.cfg.nodata).show();
            } else {
                table.content.parent().parent().show();
                $(table.cfg.nodata).hide();
            }
        }
        Pingan.Init();

    }  else if (monitorCfg.page == 'list') {

        Pingan.Event = function () {

            $("#filterBtn").click(function(){
                var risk = $(this).attr("risk");
                companyMonitorTable.urlHandler.params.put("risk", risk);
                companyMonitorTable.total=0;
                companyMonitorTable.go(1);

                hiddenDeleteComponent();
                if(risk!=""){
                    $(this).attr("risk","");
                    $(this).find("label").text("全部企业");
                }else{
                    $(this).attr("risk","risk");
                    $(this).find("label").text("风险企业");
                }

            });
            function hiddenDeleteComponent() {
                $("#operateAll").prop("checked", false);
                $("#operateAll").parent().removeClass("on_check");
                $("#operateAllTip").hide();
                $("#delete").hide();
                $("#selectText").hide();
            }
            //pop弹框js
            $("#select_info_group_pop,#select_info_cityCode_pop").unbind('click').click(function (e) {
                $(this).next("ul").toggle();
                $(this).toggleClass("tag_select_open");
                e.stopPropagation()
            });
            $("#select_info_group_pop,#select_info_cityCode_pop").next("ul").find("li").unbind('click').click(function (e) {
                var prev = $(this).parent().prev();
                prev.attr("data-typename",$(this).text());
                prev.text($(this).text());
                prev.attr("data-attr",$(this).attr("data-attr"));
                $(this).parent().hide();
                Pingan.textOverHide();
                $("#select_info_group_pop,#select_info_cityCode_pop").removeClass("tag_select_open");
                e.stopPropagation()
            });

            $("#delete").click(function () {
                var array = [];
                var arrayCompanyNames = [];
                $("input[name='foreignCapitalId']:checked").each(function (i, v) {
                    array[i] = $(this).val();
                    arrayCompanyNames[i] = $(this).attr('data-attr');
                });
                if (array.length <= 0) {
                    Pingan.malertInfo("请选择要删除的企业", 'infoMessage warning', {});
                    return;
                }
                $("#deleteCount").text(array.length);
                Pingan.malert($("#deleteConfirm"),$("#deleteNo"), {});
            });
            $("#deleteYes").click(function () {
                var array = [];
                var arrayCompanyNames = [];
                $("input[name='foreignCapitalId']:checked").each(function (i, v) {
                    array[i] = $(this).val();
                    arrayCompanyNames[i] = $(this).attr('data-attr');
                });
                if (array.length <= 0) {
                    Pingan.malertInfo("请选择要删除的企业", 'infoMessage warning', {});
                    return;
                }
                deleteAjax(array, arrayCompanyNames,companyMonitorTable.urlHandler.params.container);
            });
            $("#deleteAll").click(function () {
                $("#deleteType").val("all");
                $("#deleteCount").text(companyMonitorTable.total);
                Pingan.malert($("#deleteConfirm"),$("#deleteNo"), {});
            });
            $("#prepareListCallBack").on("click", "#operateAll", function () {
                $("#selectText").hide();
                var isCheck = $(this).is(":checked");
                $("input[name='foreignCapitalId']").prop("checked", isCheck);
                if(isCheck&&companyMonitorTable.total>0){
                    $("#operateAllTip").show();
                    $(this).parent().addClass("on_check");
                    $("input[name='foreignCapitalId']").parent().addClass("on_check");
                    $("#delete").show();
                }else {
                    $("#operateAllTip").hide();
                    $(this).parent().removeClass("on_check");
                    $("input[name='foreignCapitalId']").parent().removeClass("on_check");
                    $("#delete").hide();
                }
                var length = $("input[name='foreignCapitalId']:checked").length;
                $("#chooseNumber").html(length);

            });
            $("#prepareListCallBack").on("click", "input[name='foreignCapitalId']", function () {
                if(!$(this).is(":checked")){
                    $("#operateAll").prop("checked", false);
                    $("#operateAll").parent().removeClass("on_check");
                    $(this).parent().removeClass("on_check");

                }else{
                    $(this).parent().addClass("on_check");
                    $("#delete").show();
                }
                var chooseNum = $("input[name='foreignCapitalId']:checked").length;
                var countNum = $("input[name='foreignCapitalId']").length;
                if(chooseNum==countNum){
                    $("#operateAll").prop("checked", true);
                    $("#operateAll").parent().addClass("on_check");
                    $("#selectText").hide();
                    $("#operateAllTip").show();
                }
                else if(chooseNum>1){
                    $("#operateAllTip").hide();
                    $("#selectText").show();
                }
                if(chooseNum==0){
                    $("#operateAll").prop("checked", false);
                    $("#operateAll").parent().removeClass("on_check");
                    $("#delete").hide();
                    $("#selectText").hide();
                }
                $("#chooseNumber").html(chooseNum);
                if(chooseNum==1){
                    $("#selectText").show();
                }
            });
            $("#prepareListCallBack").on("click", ".deleteTag", function () {
                var array = [];
                var arrayCompanyNames = [];
                array[0] = $(this).attr("data-attr");
                arrayCompanyNames[0] = $(this).parents('tr').find('input').attr('data-attr');
                Pingan.mconfirm("是否删除该企业？", function () {
                    deleteAjax(array, arrayCompanyNames)
                }, function () {
                    return;
                }, {})
            });
            $("#companyNameKey").blur(function () {
                var companyName = $("#companyNameKey").val();
                companyName = companyName.replace(/^\s+|\s+$/g, "");
                $("#companyNameKey").val(companyName);
                if (companyName == "") {
                    $("#prompt").show();
                } else {
                    $("#prompt").hide();
                }
            });

            $("#type").blur(function () {
                var type = $(".foreign-main select[name='type']").val();
                if ((!type) || ("" == type )) {
                    $("#promptType").show();
                } else {
                    $("#promptType").hide();
                }
            });

            $("#city").blur(function () {
                var city = $(".foreign-main select[name='city']").val();
                if (city == "") {
                    $("#promptCity").show();
                } else {
                    $("#promptCity").hide();
                }
            });
            showAddCompanyPrepareInfoDiv(upload);


            $("#select_info_cityCode,#select_info_type").click(function (e) {
                $(this).next("ul").toggle();
                // $(this).toggleClass("tag_select_open");
                e.stopPropagation()
            });
            $("#select_info_cityCode,#select_info_type").next("ul").find("li").click(function (e) {
                var prev = $(this).parent().prev();
                prev.find("label").html($(this).text());
                prev.attr("data-attr",$(this).attr("data-attr"));
                $(this).parent().hide();
                Pingan.textOverHide(prev.find("label"));
                $("#select_info_cityCode,#select_info_type").removeClass("tag_select_open");

                var cityCode = $("#select_info_cityCode").attr("data-attr");
                var type = $("#select_info_type").attr("data-attr");
                // reloadListTable(cityCode, type);
                companyMonitorTable.urlHandler.params.put("cityCode", cityCode);
                companyMonitorTable.urlHandler.params.put("type", type);
                companyMonitorTable.total=0;
                companyMonitorTable.go(1);
                e.stopPropagation()
                hiddenDeleteComponent();
            });
            $("body").click(function () {
                $(".tag_options").hide();
                $("#select_info_cityCode,#select_info_type").removeClass("tag_select_open");
            });

            $("#searchBtn").click(function () {
                var companyName = $("#companyNameInput").val();

                companyMonitorTable.urlHandler.params.put("companyName", companyName);
                companyMonitorTable.total=0;
                companyMonitorTable.go(1);
                hiddenDeleteComponent();
            });
            document.onkeydown = function (event) {
                var e = event || window.event || arguments.callee.caller.arguments[0];
                if (e && e.keyCode == 13) { // enter 键
                    if ($("#companyNameInput").is(":focus")) {
                        $("#searchBtn").click();
                    }
                }
            };

            $("#sortSelect").change(function () {
                var val = $("#sortSelect").val();
                if(!val){
                    $("#sortImg").hide();
                }else{
                    $("#sortImg").attr("src",basePath+"/images/gov-images/desc.png");
                    $("#sortImg").attr("order_type","desc");
                    $("#sortImg").show();
                }
                companyMonitorTable.urlHandler.params.put("sortField",val);
                companyMonitorTable.urlHandler.params.put("sortType",$("#sortImg").attr("order_type"));
                companyMonitorTable.total=0;
                companyMonitorTable.go(1);
                hiddenDeleteComponent();
            });

            $("#titleTr").find("[sort-field]").click(function () {
                var sortField = $(this).attr("sort-field");
                var sort = $(this).attr("sort");
                $("#titleTr").find("[sort-field]").attr("sort","");
                $("#titleTr").find("[sort-field]").find("em").remove();
                $("#titleTr").find("[sort-field]").append("<em class='govA4-e1'></em><em class='govA4-e2'></em>");
                if(sort==""||sort=="asc"){
                    sort = "desc";
                    $(this).find("em").remove();
                    $(this).append("<em class='govA4-e2'></em>");
                }else {
                    sort = "asc";
                    $(this).find("em").remove();
                    $(this).append("<em class='govA4-e1'></em>");
                }
                $(this).attr("sort",sort);
                companyMonitorTable.urlHandler.params.put("sortField",sortField);
                companyMonitorTable.urlHandler.params.put("sortType",sort);
                companyMonitorTable.total=0;
                companyMonitorTable.go(1);
                hiddenDeleteComponent();

            });
   /*         $("#sortImg").click(function () {
                var orderType = $("#sortImg").attr("order_type");
                if(orderType==="desc"){
                    $("#sortImg").attr("src",basePath+"/images/gov-images/asc.png");
                    $("#sortImg").attr("order_type","asc");
                }else {
                    $("#sortImg").attr("src",basePath+"/images/gov-images/desc.png");
                    $("#sortImg").attr("order_type","desc");
                }
                companyMonitorTable.urlHandler.params.put("sortField",$("#sortSelect").val());
                companyMonitorTable.urlHandler.params.put("sortType",$("#sortImg").attr("order_type"));
                companyMonitorTable.total=0;
                companyMonitorTable.go(1);
            })*/


        };
        Pingan.Init = function () {
            companyMonitorTable = new Pingan.PageHandler($("#companyMonitorTable"), $(".zs_page_new"));
            companyMonitorTable.formateItem = function (index, model, row) {
                var type = row["groupName"];
                if (!type) {
                    type = '未分组';
                }
                return model.format(row["city"], type, row["companyName"], row["punishCount"], row["uncreditCount"], row["owedTaxCount"], row["judgmentCount"], row["newsCount"], row["id"],
                newTip(row["unreadPunishCount"]),newTip(row["unreadUncreditCount"]),newTip(row["unreadOwedTaxCount"]),newTip(row["unreadJudgmentCount"]),newTip(row["unreadNewsCount"])).replace(/null/g, ' ');

            };
            function newTip(count) {
                if(count){
                    return "<i>"+count+"</i>";
                }
                return "";
            }
            companyMonitorTable.onLoaded = function (result) {

                $("#operateAllTip").find("label").eq(0).text(result.data.total>result.data.perPageSize?result.data.perPageSize:result.data.total);
                $("#operateAllTip").find("label").eq(1).text(result.data.total);
                $("#operateAll").prop("checked", false);
                $("#companyMonitorTable input[type='checkbox']:first").attr('name','');
                $("#chooseNumber").html(0);
            };


            preparedCompanyNameAutoComplete();

            Pingan.Event();
        };

        Pingan.Init();
    }
});

function deleteAjax(ids, companyNames,params) {
    var url = basePath + "/gov/user/monitor/delete";
    var param = {"ids": ids, "companyNames": companyNames};
    if($("#deleteType").val()=="all"){
        url = basePath + "/gov/user/monitor/delete/all";
        param=params;
    }
    $("#deleteType").val("");
    $.ajax({
        type: "POST",
        url: url,
        async: false,
        data: param,
        success: function (data) {

            if (data.statusCode == 1) {
                Pingan.malertInfo('删除成功', 'infoMessage warning', {});
                setTimeout(function ()
                {
                    window.location.reload();
                },1000);
            } else {
                Pingan.malertInfo('删除失败，请稍后再试', 'infoMessage warning', {});
            }
        },
        error: function () {
            Pingan.malertInfo('error删除失败，请稍后再试', 'infoMessage warning', {});
        }
    });
}

function showAddCompanyPrepareInfoDiv(upload) {
    $("#editAdd_a").click(function () {
        $("#select_info_type").removeClass("tag_select_open");
        $("#select_info_cityCode").removeClass("tag_select_open");
        $("#options_type").hide();
        $("#options_city").hide();
        Pingan.malert($(".Add_pop"), $("#malert_mask,.Add-close"), {opacity: 0.2});

        webuploader = upload.WebUploader;
        uploader1 = webuploader.create({
            auto: true,
            resize: false,
            swf: basePath + '/js/lib/webUpload/Uploader.swf',
            server: basePath + "/gov/user/monitor/import",
            pick: {id: '#excel_import_upload', multiple: false,},

//            fileNumLimit: 1,
//            sendAsBinary:t    rue,  //指明使用二进制的方式上传文件
            fileSingleSizeLimit: 1048576,

//        fileSingleSizeLimit: 1024*512*4,
            accept: {
                title: 'file',
                extensions: 'xls,xlsx',
//                mimeTypes: 'application/msexcel'
//                mimeTypes: '.xls,.xlsx'
                mimeTypes: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,application/vnd.ms-excel'
            },
            duplicate: true
        });
        try {
            autoUpload(uploader1, "reportAttachDiv");
        } catch (e) {
            Pingan.malertInfo('服务器异常，上传失败!', 'infoMessage warning', {});
        }
    });

    var selectHandler =new Pingan.SelectHandler($("#addTab").find("li"),false,true);

    $(".foreign-button input[name='cancel']").click(function () {
        removeAddCompanyPrepareInfoDiv();
    });

    var addForm =new Pingan.MForm($("#addForm"));
    addForm.isAjax=true;
    addForm.afterSubmit=function (result) {
        $("#malert_mask").click();
        if(result.statusCode == 1){
            $("[name=groupId]").val('');
            $("#companyType").val('');
            removeAddCompanyPrepareInfoDiv();
            Pingan.malertInfo('数据正在导入，请稍候刷新页面', 'infoMessage warning', {fadeOut:3000});
            setTimeout(function ()
            {
                window.location.reload();
            },3000);
        }else {
            Pingan.malertInfo(result.statusMessage, 'infoMessage warning', {fadeOut:3000});
        }
    };
    $("#submitAdd").click(function () {
        $("#addForm").submit();
    });

}

function removeAddCompanyPrepareInfoDiv() {
    $(".foreign-pop").hide();
    $("#malert_mask").remove();
    $("#companyNameKey").val("");
   $("#select_info_cityCode_pop").attr("data-attr",0);
   $("#select_info_cityCode_pop").html("请选择");

   $("#select_info_group_pop").prop("data-attr",0);
   $("#select_info_group_pop").html("请选择");

    $("#prompt").hide();
    $("#promptType").hide();
    $("#promptCity").hide();
    $("html,body").css("overflow","auto");
}

function preparedCompanyNameAutoComplete() {
    $("#companyNameKey").autocomplete({
        source: function (request, response) {
            $.getJSON(basePath + "/gov/autocomplete/lists", {
                "key": $("#companyNameKey").val(),
                "npage": 0
            }, response);
        },
        minLength: 2,
        select:function (event, ui) {
            var item = ui.item;
            if(item["companyNameDigest"]){
                $("#companyNameDigest").val(item["companyNameDigest"]);
            }
        }
    });
    $("#companyNameKey").data("ui-autocomplete")._renderItemData = function (ul, item) {
        var companyName = item.companyName.replace(/<em>/g, '').replace(/<\/em>/g, '').replace(/null/g, '');
        item["value"] = companyName;
        return jQuery("<li></li>").data("item.autocomplete", item).data(
            "ui-autocomplete-item", item).append("<li>"
            + "<span>" + item.value + "</span></li>").appendTo(ul);
    };

    $("#companyType").autocomplete({
        source: function (request, response) {
            $.getJSON(basePath + "/gov/user/monitor/autocomplete/types", {
                "typeName": $("#companyType").val()
            }, response);
        },
        minLength: 0
    }).focus(function () {
        $(this).autocomplete("search");
    });
    $("#companyType").data("ui-autocomplete")._renderItemData = function (ul, item) {
        var groupName = item.groupName.replace(/<em>/g, '').replace(/<\/em>/g, '').replace(/null/g, '');
        item["value"] = groupName;
        return jQuery("<li></li>").data("item.autocomplete", item).data(
            "ui-autocomplete-item", item).append("<li>"
            + "<span>" + item.value + "</span></li>").appendTo(ul);
    };

    $("ul.ui-autocomplete").css('position', 'fixed');
}

//违法/行政处罚
function corpProdPenaltyDetail(id) {
    $.ajax({
        type: "GET",
        url: basePath + "/gov/user/company/monitor/detail/corpProdPenalty/detail",
        data: {"id": id},
        dataType: "json",
        success: function (data) {
            if (data.statusCode == 1) {
                data = data.data;
                var h =
                    "<p><span>企业名称：</span>" + data["companyName"] + "</p>" +
                    "<p><span>违规类型：</span>" + data["illegalType"] + "</p>" +
                    "<p><span>处罚单位：</span>" + data["authority"] + "</p>" +
                    "<p><span>违法日期：</span>" + new Date(parseInt(data["illegalDate"])).format("yyyy-MM-dd") + "</p>" +
                    "<p  style='width: 100%;'><span>文书号：</span>" + data["punishDocCode"] + "</p>";
                h = h.replace(/undefined|null|NaN-aN-aN/g, '');

                var detailMain = "<p>企业名称：" + data["companyName"] + "</p>" +
                    "<p>违法违规类型：" + data["illegalType"] + "</p>" +
                    "<p>处罚单位：" + data["authority"] + "</p>" +
                    "<p>违法违规内容：" + data["illegalFacts"] + "</p>" +
                    "<p>违法违规日期：" + new Date(parseInt(data["illegalDate"])).format("yyyy-MM-dd") + "</p>" +
                    "<p>处罚依据：" + data["punishGist"] + "</p>" +
                    "<p>处理结果：" + data["punishContent"] + "</p>" +
                    "<p>查获货值(万元)：" + data["goodsValue"] + "</p>" +
                    "<p>处罚金额(万元)：" + data["punishAmount"] + "</p>" +
                    "<p>处罚决定书文书号：" + data["punishDocCode"] + "</p>";
                detailMain = detailMain.replace(/undefined|null|NaN-aN-aN/g, '');
                $("#detail").find(".Detail_top").html(h);
                $("#detail").find(".Detail_main").html(detailMain);
                $("#detail").find("h2").html("违法/行政处罚");
                Pingan.malert($("#detail"),$(".Add-close"),{});
            }
        }
    });
}
function returnTable() {
    $("#detail").hide();
    $("#corpProdPenalty").show()
}
//国税部门监管信息
function enterPrisePenaltyDetail(id) {
    $.ajax({
        type: "GET",
        url: basePath + "/gov/user/company/monitor/detail/enterPrisePenalty/detail",
        data: {"id": id},
        dataType: "json",
        success: function (data) {
            if (data.statusCode == 1) {
                data = data.data;
                var h =
                    "<p><i>企业名称：</i>" + data["companyName"] + "</p>" +
                    "<p><i>违法违规类型：</i>" + data["illegalType"] + "</p>" +
                    "<p><i>处罚单位：</i>" + data["authority"] + "</p>" +
                    "<p><i>违法违规内容：</i>" + data["illegalFacts"] + "</p>" +
                    "<p><i>违法违规日期：</i>" + new Date(parseInt(data["illegalDate"])).format("yyyy-MM-dd") + "</p>" +
                    "<p><i>处罚依据：</i>" + data["punishGist"] + "</p>" +
                    "<p><i>处理结果：</i>" + data["punishContent"] + "</p>" +
                    "<p><i>查获货值(万元)：</i>" + data["goodsValue"] + "</p>" +
                    "<p><i>处罚金额(万元)：</i>" + data["punishAmount"] + "</p>" +
                    "<p><i>处罚决定书文书号：</i>" + data["punishDocNo"] + "</p>";
                h = h.replace(/undefined|null|NaN-aN-aN/g, '');
                $("#detail").find(".Detail_main").html(h);
                $("#detail").find("h2").html("国税部门监管信息");
                Pingan.malert($("#detail"),$(".Add-close"),{});
            }
        }
    });
}

//诉讼记录详情
function courtDetail(id) {
    $.post(basePath + "/gov/user/company/monitor/detail/court/detail", {"id": id}, function (result) {
        var courtDocJson = result.data;
        if (null != courtDocJson) {
            var h =
                "<p><span>案&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：</span>" + courtDocJson.docCode + "</p>" +
                "<p><span>案件性质：</span>" + courtDocJson.docType + "</p>" +
                "<p><span>法院名称：</span>" + courtDocJson.courtName + "</p>" +
                "<p><span>判决时间：</span>" + courtDocJson.docTime + "</p>" +
                "<p style='width: 100%;'><span>文书名：</span>" + courtDocJson.docTitle + "</p>";

            h = h.replace(/undefined|null|NaN-aN-aN/g, '');
            $("#detail").find(".Detail_top").html(h);
            var detail =   "<p>诉讼记录：" + courtDocJson.docContent + "</p>";
            detail = detail.replace(/undefined|null|NaN-aN-aN/g, '');
            $("#detail").find(".Detail_main").html(detail);
            $("#detail").find("h2").html("诉讼记录：" + (courtDocJson.docCode == null ? "" : courtDocJson.docCode));
            Pingan.malert($("#detail"),$(".Add-close"),{});
        }

    });
}

function generateMediaReport(curpage, total, companyId, companyName) {
    //查询企业相关媒体报道
    var url = basePath + "/gov/user/company/monitor/detail/news/list?companyId=" + companyId + "&curpage=" + curpage + "&total=" + total;
    var newsArray = new Array();
    var num = curpage * 5 + 1;
    $.post(url, function (data) {
        $("#mediaReportTotal").val(data.data.total);
        if(data.data.total>0)
        {
            $("a[data-target='#newsDiv']").find("em").text(data.data.total);
        }
        newsArray = data.data.content;
        if (newsArray.length == 0) {
            if (curpage == 0) {
                $("#newsDiv").append("<div class='panel-table'>暂未收录该企业相关信息</div>");
            }
            $("#getMoreMediaReport").find("a").html("加载完毕");
            $("#getMoreMediaReport").unbind("click");
        }
        var n_html = "";
        if (newsArray && newsArray.length > 0) {
            for (var i = 0; i < newsArray.length && i < 10; i++) {
                var mediaReport = newsArray[i];
                var title = newsArray[i]["newsTitle"];
                var content = newsArray[i]["newsContent"];
                title = title.replace(/(<b>|<\/b>)/g, "");
//					content=content.replace(/(<b>|<\/b>)/g,"").substring(0,39)+"......";
                n_html = n_html + "<div class='media-main'>";
                n_html = n_html + "<a href='" + basePath + "/detail/detail_haosou.jsp?url=" + encodeURIComponent(mediaReport.newsUrl) + "&s=" + companyId + "&name=" + companyName + "' target=\"blank\">" + num + "、" + title + "</a>";
                n_html = n_html + "<p><span>来源：" + mediaReport.newsSitename + "</span><span>&nbsp;&nbsp;&nbsp;<span>" + new Date(mediaReport.newsTime * 1000).format("yyyy-MM-dd") + "</span></p>";
                n_html = n_html + "</div>";
                num += 1;
            }
            if (data.data.total > 5) {
                $("#getMoreMediaReport").find("a").html("加载更多...");
            } else {
                $("#scrollBarContent-2").css("height", "");
            }
            if (curpage == 0) {
                $(".news").find("ul").css({"color": "#666"});
                /* $(".news").find("ul").append(n_html); */

            } else {
                $(".news").find(".mCSB_container").css({"color": "#666"});
                /* $(".news").find(".mCSB_container").append(n_html); */
            }
            $("#getMoreMediaReport").before(n_html);
            $("#media_report").show();
        }

    });

}
