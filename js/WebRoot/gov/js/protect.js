require.config({
    waitSeconds : 0,
    baseUrl : basePath,
    paths : {
        Pingan : 'gov/js/common/common',
        gov_top : 'gov/js/gov_top',
        echarts : 'gov/js/lib/echarts.min',
        china_map : 'gov/js/lib/map/china',
        protect : 'gov/js/protect'
    },
    shim : {
        gov_top : {
            deps : [ 'Pingan' ]
        },
        echarts : {
            deps : [ 'Pingan' ]
        },
        protect : {
            deps : [ 'Pingan', 'echarts', 'china_map' ]
        }
    },
    deps : [ 'Pingan', 'gov_top', 'protect' ]
});
require(['echarts','china_map'], function (echarts,china_map) {
    Echarts = echarts;
    Pingan.Event = function () {
        $("#typeCheck").find("input[type='radio']").click(function () {
            var statDate = $("#proportionStatDate").val();
            $("#brandChecked").val($(this).val());
            loadBrandHighMapsAjax($(this).val(), "张小泉", statDate);
        });
        $("#brandTable").find("tr").on('click', function () {
            $("#brandTable").find("tr").removeClass("current");
            $(this).addClass("current");
            var brandName = $(this).find("label").text();
            var startStatDate = $("#startStatDate").val();
            var endStatDate = $("#endStatDate").val();
            var statDate = $("#proportionStatDate").val();
            var brandChecked = $("#brandChecked").val();
            platFormAjax(startStatDate, endStatDate, brandName);
            $("[name='provinceCode']").val("-1");
            $("#areachoose").html("全国");
            loadBrandHighMapsAjax(brandChecked, brandName, statDate);
        });

        areachoose();
    };
    Pingan.Init = function () {
        noData = "<img src='" + basePath + "/images/spvision_images/b-img23.jpg' style='width: 100%; height: 321px;' />";
        var brandName = $(".current td label").text();
        var startStatDate = $("#startStatDate").val();
        var endStatDate = $("#endStatDate").val();
        var statDate = $("#proportionStatDate").val();
        var brandChecked = $("#brandChecked").val();
        platFormAjax(startStatDate, endStatDate, brandName);
        loadBrandHighMapsAjax(brandChecked, brandName, statDate);
        showProvince();
        Pingan.Event();
    };
    Pingan.Init();
});
function changeStatDate() {
    var startStatDate = $("#startStatDate").val();
    var endStatDate = $("#endStatDate").val();
    brandName = $(".current td label").text();
    platFormAjax(startStatDate, endStatDate, brandName);
}
function areachoose() {

    var isAreaShow = false;

    $("#areachoose").click(function () {
        $(".area").toggle();
    });
    $(".area, #areachoose").mouseover(function () {
        $(".area").fadeIn();
        isAreaShow = true;
    });
    $(".area").mouseleave(function () {
        $(".area").fadeOut();
        isAreaShow = false;
    });
    $("#areachoose").mouseleave(function () {
        isAreaShow = false;
        setTimeout(function () {
            if (!isAreaShow) {
                $(".area").fadeOut();
                isAreaShow = false;
            }
        }, 300);
    });
}

function deleteAddedProvince(obj) {
    $("#" + $(obj).parent().attr('name')).show();
    $(obj).parent().remove();
}

function unauthedProvinceClick(obj) {
    $("#addedProvince p").append("<a href='javascript:void(0)' name='" + $(obj).attr("id") + "'>" + $(obj).text() + "<img src='" + basePath + "/images/spvision_images/close.png' onclick='javascript:deleteAddedProvince(this)' /></a>");
    $(obj).hide();
}

function brandTypeClick(obj) {

    var statDate = $("#proportionStatDate").val();
    $("#brandChecked").val($(obj).val());
    loadBrandHighMapsAjax($(obj).val(), "张小泉", statDate);
}

function proportionStatDateChang() {
    var statDate = $("#proportionStatDate").val();
    var brandChecked = $("#brandChecked").val();
    loadBrandHighMapsAjax(brandChecked, "张小泉", statDate);
}

function loadBrandHighMapsAjax(authType, brandName, timeStr) {
    var saveUrl = basePath + "/gov/user/platformbrandmap";
    $.ajax({
        type: "POST",
        url: saveUrl,
        data: {"authType": authType, "brandName": brandName, "timeStr": timeStr},
        async: false,
        success: function (data) {
            if (data.statusCode == 1) {
                var datas = data['data'];
                $("#proportionStatDate").val(datas['timeStr']);
                initHighCharts(datas['brandList'], datas['proportionDescription']);
                getTopFiveProvince(datas['topFiveProvince']);
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            if (XMLHttpRequest.status == 403) {
                mconfirm("加载中国地图出错", function () {
                });
            }
        }
    });
}

function getTopFiveProvince(data) {
    $("#topFiveProvince").html('');
    var proportion, province, classAttr, title;
    var html = "<div class='pro-padding'><ul><li>";
    for (var i = 0; i < 5; i++) {
        if (data==null||data[i] == null) {
            proportion = '0.0%';
            province = '暂无省份';
        } else {
            proportion = data[i].proportion;
            province = data[i].province;
        }
        switch (i) {
            case 0:
                classAttr = "pro-blue";
                title = "分布占比第一";
                break;
            case 1:
                classAttr = "pro-yellow";
                title = "分布占比第二";
                break;
            case 2:
                classAttr = "pro-sky";
                title = "分布占比第三";
                break;
            case 3:
                classAttr = "pro-brown";
                title = "分布占比第四";
                break;
            case 4:
                classAttr = "pro-green";
                title = "分布占比第五";
                break;
            default:
                break;
        }
        html = html + "<div class='pro-width " + classAttr + "'>";
        html = html + proportion;
        html = html + "</div><div class='pro-area'><h4>";
        html = html + province;
        html = html + "</h4><p>" + title + "</p></div></li><li>";
    }
    html = html + "</ul></div>";
    $("#topFiveProvince").html(html);
}

function initHighCharts(data, proportionDescription) {
    var visitChinaMap = Echarts.init(document.getElementById('container2'));
    visitChinaMap.setOption(
        option = {
            tooltip: {
                trigger: 'item',
                formatter: function (params) {
                    if(params.data.value==undefined){return "暂无数据";}
                    return proportionDescription + '百分比:<em style="color:' + params.color + ';font-size:18px">' + params.value + '%</em>';
                }
            },
            visualMap: {
                max: 100,
                min: 0,
                padding: [150, 0],
                left: 'left',
                top: 'bottom',
                itemWidth: 10,
                text: ['100%', '0%'],           // 文本，默认为数值文本
                calculable: false,
                color: ['#990041', '#efecf3'],
                formatter: function (value) {
                    return ''; // 范围标签显示内容。
                }
            },
            series: [
                {
                    name: '中国',
                    type: 'map',
                    mapType: 'china',
                    selectedMode: false,
                    label: {
                        normal: {
                            show: true
                        },
                        emphasis: {
                            show: true
                        }
                    },
                    data: data
                }
            ]
        }
    );
}

function platFormAjax(startStatDate, endStatDate, brandName) {
    $.ajax({
        type: "POST",
        url: basePath + '/gov/user/search/platform/brandstat',
        data: {"startStatDate": startStatDate, "endStatDate": endStatDate, "brandName": brandName},
        async: false,
        success: function (data) {
            var authDatas = data["data"];
            if (data.statusCode == 1) {
                container(authDatas.monthList, authDatas.unauthCountList, authDatas.authCountList);
            } else {
                $("#container").html(noData);
            }
            $("#startStatDate").val(authDatas.startStatDate);
            $("#endStatDate").val(authDatas.endStatDate);
        }
    });
}


function container(statDates, unauthedSoldCount, authedSoldCounts) {
	if(statDates == null || unauthedSoldCount == null || authedSoldCounts ==null){
		 $("#container").html(noData);
         return;
	}
    var myChart = Echarts.init(document.getElementById('container'));
    var option = {
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            left: '60',
            textStyle: {
                fontSize: 14
            },
            data: ['未授权品牌店铺', '授权品牌店铺'],
            bottom: '5%'
        },
        toolbox: {
            show: false,
            feature: {
                saveAsImage: {}
            }
        },
        grid: {
            left: '3%',
            right: '5%',
            height: '75%',
            bottom: '16%',
            containLabel: true
        },
        xAxis: [
            {
                type: 'category',
                boundaryGap: false,
                data: statDates
            }
        ],
        yAxis: [
            {
                type: 'value',
                name: '数量（家）',
                /*nameLocation:'middle',
                 nameGap:50,*/
            }
        ],
        series: [
            {
                name: '授权品牌店铺',
                type: 'line',
                // stack: '总量',
                areaStyle: {
                    normal: {
                        color: '#000000'
                    }
                },
                itemStyle: {
                    normal: {
                        color: '#000000'
                    }
                },
                data: authedSoldCounts
            },
            {
                name: '未授权品牌店铺',
                type: 'line',
                // stack: '总量',
                areaStyle: {
                    normal: {
                        color: '#32CD32'
                    }

                },
                itemStyle: {
                    normal: {
                        color: '#32CD32'
                    }
                },
                data: unauthedSoldCount
            }


        ]
    };
    myChart.setOption(option);
}


function brandProvince(code, startStatDate, endStatDate) {
    if (code == -1) {
        brandName = $(".current td label").text();
        platFormAjax(startStatDate, endStatDate, brandName);
    } else {
        $.ajax({
            type: "POST",
            url: basePath + '/gov/user/search/platformBrand/provincestat',
            data: {"provinceCode": code, "startTime": startStatDate, "endTime": endStatDate},
            async: false,
            success: function (data) {

                var authDatas = data["data"];
                if (data.statusCode == 1) {
                    container(authDatas.monthList, authDatas.unauthCountList, authDatas.authCountList);
                } else {
                    $("#container").html(noData);
                }
            }
        });
    }
}


function showProvince() {
    $.get(basePath + "/gov/user/search/province", function (result) {
        if (result["statusCode"] == 1) {
            var pros = result["data"];
            var inHtml = "<h4 class='areah4'><a href='javascript:void(0)' code='-1'>全国</a></h4>";
            for (var area in pros) {
                if (area == "国家") continue;
                var are = pros[area];
                inHtml = inHtml + "<h4 class='areah4'>";
                inHtml = inHtml + "		<p>" + area + "</p>";
                for (var code in are) {
                    var color_c = "";
                    if (code == $("[name='provinceCode']").val()) {
                        color_c = " style='color:#1d97ff;'";
                        $("#areachoose").text(are[code]);
                    }
                    inHtml = inHtml + "<a href='javascript:void(0)'  code= '" + code + "'" + color_c + ">" + are[code] + "</a>";
                }
                inHtml = inHtml + "</h4>";
            }
            var color_c = "";
            if ($("[name='provinceCode']").val() == "") {
                color_c = " style='color:#1d97ff;'";
            }
            $(".area").html(inHtml);
            $(".area a").click(function () {
                $("[name='provinceCode']").val($(this).attr("code"));

                brandProvince($(this).attr("code"), $("#startStatDate").val(), $("#endStatDate").val());
                $(".area").hide();
                $("#areachoose").html($(this).html());
            });
        }
    });
}
    
