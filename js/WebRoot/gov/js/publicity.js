require.config({
    waitSeconds: 0,
    baseUrl: basePath,
    paths: {
        Pingan: 'gov/js/common/common',
        autocomplete: 'gov/js/lib/jquery-ui-autocomplete.min',
        publicity:'gov/js/publicity',
        top: 'gov/js/gov_top'
    },
    shim: {
        top: {
            deps: ['Pingan']
        },
        autocomplete: {
            deps: ['Pingan']
        },
        publicity:{
            deps:["Pingan"]
        }
    },
    deps: ['Pingan', 'top', 'autocomplete','publicity']
});

require(['Pingan','autocomplete'],function (Pingan,autocomplete){

    var publicityTable;
    var dataList = {};
	Pingan.Base = (function (){

		//查询分页
		var initPageHandler = function(){
			 publicityTable = new Pingan.PageHandler($("#publicityTable"), $(".pub-page"));
            publicityTable.formateItem = function(index,model,row){
                dataList[row.id+""] = row;
                var reason ="";
                if(row["addReason"]){
                    reason = row["addReason"].substring(0,20);
                }
                return model.format(row["companyName"],row["city"],new Date(row["startDate"]).format("yyyy年MM月dd日"),reason,row["id"]).replace(/null/g, ' ');
            }
            publicityTable.onLoaded = function (result) {
                $("#total").text(result.data.total);
            }
		};

        //是否登录
        var isLogined = function () {
            var isLogin = false;
            $.ajax({
                url : basePath + "/gov/current/user?currentDate="+new Date().toTimeString(),
                success:function(data){
                    if(data.data!=null && data.data["userType"]==3){
                        $("#addBtn").show();
                    }else {
                        $("#addBtn").hide();
                    }
                }
            });
            return isLogin;
        };

		var init = function (){
			initPageHandler();
            isLogined();
		}();

	})();


	Pingan.Event = (function (){

	    var typeTab = function () {
            $(".pub-ul").find("li").click(function () {
                $(".pub-ul").find("li").removeClass("current");
                $(this).addClass("current");
                $(".pub-value").hide();
                var type = $(this).attr("tab");
                $("#"+$(this).attr("tab")+"").show();
                loadPage(publicityTable);
            })
        };
	    var categoryTab = function () {
            $("#categoryTab").find("a").click(function () {
                $(this).siblings().removeClass("current");
                $(this).addClass("current");
                loadPage(publicityTable);
            })
        };

	    var cityTab = function () {
            $("#cityTab").change(function () {
                loadPage(publicityTable);
            })
        }
	    var addPop = function () {
            $("#addBtn").click(function () {
                Pingan.malert($("#addPop"),$("#addPopClose"),{});
            })
            $("#companyNameKey").autocomplete({
                source: function (request, response) {
                    $.getJSON(basePath + "/gov/autocomplete/list", {
                        "key": $("#companyNameKey").val(),
                        "npage": 0
                    }, response);
                },
                minLength: 2,
                select:function (event, ui) {
                    var item = ui.item;
                    if(item["creditNo"]){
                        $("#creditNo").text(item["creditNo"]);
                    }
                    if(item["legalPerson"]){
                        $("#legalPerson").text(item["legalPerson"]);
                    }
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

            $("select[name='publicityType']").change(function () {
                var type = $(this).val();
                $("select[name='companyCategory']").find('option').hide();
                $("select[name='companyCategory']").find('option[tab='+type+']').show();
            });

            var publicityForm =new Pingan.MForm($("#publicityForm"));
            publicityForm.isAjax=true;
            publicityForm.beforeSubmit = function () {
                var companyNameDigest = $("#companyNameDigest").val();
                if(!companyNameDigest){
                    Pingan.malertInfo('该企业暂未收录！','infoMessage warning',{});
                    return false;
                }
                return true;
            }
            publicityForm.afterSubmit=function (result) {
                if(result.statusCode == 1) {
                    Pingan.malertInfo('提交成功！','infoMessage warning',{});
                    $("#publicityForm")[0].reset();
                    $("#addPopClose").click();
                    loadPage(publicityTable);
                }else {
                    Pingan.malertInfo(result.statusMessage,'infoMessage warning',{});
                }
            };

        };

	    var detailPop = function () {
            $("#publicityTable").on("click","tr",function () {
                var id =$(this).attr("row");
                var row = dataList[id];
               var model =  $("#detailModel").find("[model]").clone().removeAttr("model").removeAttr("style")[0].outerHTML;
              var detailHtml = model.format(row["companyName"],row["startDate"],row["publicityTypeName"],row["companyCategory"],row["legalPerson"],row["legalPersonIdcard"],row["endDate"],row["addReason"],row["enrolBasis"],row["companyNameDigest"]);

                $("#detailPop").html(detailHtml);
                Pingan.malert($("#detailPop"),$("#detailPopClose"),{});
            })
        };
		var init = function (){
		    typeTab();
            categoryTab();
            addPop();
            cityTab();
            detailPop();
		}();

	})();


});

function loadPage(publicityTable) {
    var type = $(".pub-ul").find(".current").attr("tab");
    publicityTable.urlHandler.params.put("publicityType",type);
    var companyCategory = $("#"+type+"").find(".current").attr("tab");
    publicityTable.urlHandler.params.put("companyCategory",companyCategory);

    var cityCode = $("#cityTab").val();
    publicityTable.urlHandler.params.put("cityCode",cityCode);
    publicityTable.init();
}