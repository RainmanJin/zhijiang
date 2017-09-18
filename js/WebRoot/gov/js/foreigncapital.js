require.config({
    waitSeconds : 0,
    baseUrl:basePath,
    paths : {
        Pingan : 'gov/js/common/common',
        foreigncapital:'gov/js/foreigncapital',
        gov_top:'gov/js/gov_top'
    },
    shim : {
        gov_top:{
            deps:['Pingan']
        },
        foreigncapital : {
            deps : [ 'Pingan']
        }
    },
    deps : [ 'Pingan', 'gov_top', 'foreigncapital' ]
});
require(['Pingan'], function (Pingan) {
    new Pingan.NavHandler($('#creditculture').find('[data-nav]'));
    if (foreigncapitalCfg.page == 'search') {
    Pingan.Event = function () {
        $("#areaChoose").find("a").click(function () {
            clearCurrentClass("areaChoose", $(this));
            setUrlParam(companySearchList,"cityCode",$(this).text() == "全部" ? "" : $(this).attr("data-attr"));
            companySearchList.go(1);
        });
        $("#industryChoose").find("a").click(function () {
            $("#industryChoose").find("a").removeClass("current");
            $(this).addClass("current");

            var name = $(this).text();
            if (name == "全部") {
                name = "";
                
            }
            setUrlParam(companySearchList,"industryName",name);
            companySearchList.go(1);
        });
        $("#capitalChoose").find("a").click(function () {
            $("#capitalChoose").find("a").removeClass("current");
            $(this).addClass("current");
            setUrlParam(companySearchList,"capitalNumberCode",$(this).text() == "全部" ? "" : $(this).attr("data-attr"));

            companySearchList.go(1);
        });
        $("#companySearch").click(function () {
            setUrlParam(companySearchList,"key",$("#companyKey").val());
            companySearchList.go(1);
        });

        $("#orderChoose").change(function () {
            if ($("[name='orderField']").val() == $("#orderChoose").find("option:selected").attr("data-attr")) {

            } else {
                setUrlParam(companySearchList,"orderType",2);
                setChooseImg("down")
            }
            var orderField = $("#orderChoose").find("option:selected").attr("data-attr");
            $("[name='orderField']").val(orderField);
            setUrlParam(companySearchList,"orderField",orderField);
         
            companySearchList.go(1);
            if (orderField == "") {
                $("#orderImg").hide();
            } else {
                $("#orderImg").show();
            }
        });

        $("#orderImg").click(function () {
            var orderType = $("[name='orderType']").val();
            if (orderType != '1') {
                setUrlParam(companySearchList,"orderType",1);
                setChooseImg("up");
            } else {
                setUrlParam(companySearchList,"orderType",2);
                setChooseImg("down");
            }
            companySearchList.go(1);
        });

        $("#companySearchList").on("click",".addToList",function () {
            var companyNameDigest = $(this).attr("data-attr");
            addToListFunction(companyNameDigest);
        });
    };

    Pingan.Init = function () {
        companySearchList = new Pingan.PageHandler($("#companySearchList"), $(".f-page"));
        companySearchList.formateItem = function(index, model, row){
            var officialWebsite = row["officialWebsite"];
            var haveOfficialWebsite = "查看企业官网";
            var officialPhone = row["officialPhone"];
            if (!officialWebsite || officialWebsite == "" || officialWebsite == null) {
                officialWebsite = "javascript:void(0);";
                haveOfficialWebsite = "暂无企业官网";
            }

            if (!officialPhone || officialPhone == "") {
                officialPhone = "暂无";
            }else{
                officialPhone = officialPhone[0];
            }
            var city = row["city"];
            if (!city || city == "") {
                city = "";
            } else {
                city = "<span>" + city + "</span>"
            }
            var address = row["companyAddress"];
            if (address && address.length > 11) {
                address = address.substring(0, 11) + "...";
            }
            return model.format(row["companyName"], city, row["industryName"]==null?'未知':row["industryName"], officialPhone, address, row["establishDate"], row["capital"]==null?'未知':row["capital"], row["curCreditLevel"], officialWebsite, row["companyNameDigest"],row["companyNo"],haveOfficialWebsite);

        };
        companySearchList.onLoaded = function () {
            Pingan.autoFoot();
            $("#totalforeign").text(companySearchList.total);
            Pingan.textOverHide();
            Pingan.lightStar();
        };
        Pingan.Event();
    };
    Pingan.Init();
}else if(foreigncapitalCfg.page=='add'){
        Pingan.Event = (function () {
          var checkAll = function () {
                $("#operateAll").click(function () {
                    var isCheck =$(this).is(":checked");
                    $("input[name='checkItem']").prop("checked",isCheck);
                    var length = $("input[name='checkItem']:checked").length;
                    $("#chooseNumber").html("选中"+length+"个文件");
                });
            };
          var checkOne=  function() {
                $("input[name='checkItem']").click(function () {
                    var chooseNum = $("input[name='checkItem']:checked").length;
                    $("#chooseNumber").html("选中" + chooseNum + "个文件");
                });
            };
            var exportExcel =  function (){
                $("#export").click(function () {
                    var array = [];
                    $("input[name='checkItem']:checked").each(function(i, v){
                        array[i] = $(this).attr("data-attr");
                    });
                    if(array.length<=0){
                        Pingan.malertInfo('请选择要导出的企业！', 'infoMessage warning', {});
                        return;
                    }
                    window.location.href = basePath + "/gov/user/foreigncapital/exportexcel?ids=" + array;
                });
            };
            var deleteOne = function (){
                $(".deleteTag").click(function () {
                    var ids = [];
                    ids[0] = $(this).attr("data-attr");
                    Pingan.mconfirm("是否删除该企业？", function () {
                        deleteAjax(ids)
                    }, function () {
                        return;
                    }, {})
                });
            };
          var betchDelete =  function () {
                $("#delete").click(function () {
                    var array = [];
                    $("input[name='checkItem']:checked").each(function(i, v){
                        array[i] = $(this).attr("data-attr");
                    });
                    if(array.length<=0){
                        Pingan.malertInfo('请选择要删除的企业！', 'infoMessage warning', {});
                        return;
                    }
                    Pingan.mconfirm("批量删除选中的所有企业？", function () {

                        deleteAjax(array);
                    }, function () {
                        return;
                    }, {})
                });
            };
            var init = function (){
                checkAll();
                checkOne();
                exportExcel();
                deleteOne();
                betchDelete();
            };
            return { init : init };
        })();


        Pingan.Init = function () {
            var pageAll = new Pingan.PageHandler($("#companyAddList"), $("#companyAddList").find(".page"));
            Pingan.textOverHide();
        };
        
        (function () {
            Pingan.Init();
            Pingan.Event.init();
        })();
    }

});

function setUrlParam(obj,field,value) {
    obj.urlHandler.params.put(field,value);
}

function clearCurrentClass(divId, currentTag) {
    $("#" + divId).find("a").attr("class", "");
    currentTag.attr("class", "current");
}

function setChooseImg(chooseType) {
    if (chooseType == "up") {
        $("[name='orderType']").val("1");
        $("#orderImg").attr("src", basePath + "/images/retils/retails-up.png");
    } else {
        $("[name='orderType']").val("2");
        $("#orderImg").attr("src", basePath + "/images/retils/retails-down.png");
    }
}


function addToListFunction(companyNameDigest) {
    $.ajax({
        url: basePath + "/gov/user/foreigncapital/add?companyNameDigest=" + companyNameDigest,
        success: function (result) {
            if (result.statusCode == 1) {
                Pingan.malert($("#addSuccess"), $("#addSuccess").find(".pop-close"), {opacity: 0.2})
            } else {
                alert("企业添加列表失败，请稍后再试");
            }
        }
    })
}


function deleteAjax(ids) {
    $.ajax({
        url: basePath + "/gov/user/foreigncapital/delete",
        data: {"ids": ids},
        success: function (data) {
            if (data.statusCode == 1) {
                Pingan.malertInfo('删除成功', 'infoMessage warning', {});
                setTimeout(function () {
                    window.location.href = basePath + "/gov/user/foreigncapital/list";
                }, 1500);

            } else {
                Pingan.malert("删除失败，请稍后再试");
            }
        }
    })
}

