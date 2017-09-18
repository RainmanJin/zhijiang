var mapLine = {};
var xAxisData = [];

var industryCodes = [];
var arryLegnd = [];
var arrySeries = [];
require(['echarts', 'Pingan'], function (echarts, Pingan) {

    Pingan.Init = function () {
        var myChart1;
        var myChart2;
        var initRank = function () {
            $.ajax({
                url: basePath + "/gov/user/ec/credit/rank",
                success: function (result) {
                    if (result.statusCode == 1) {
                        rankBind(result.data);
                    }
                }
            });
        };
        initRank();
        var rankBind = function (data) {
            var creditList = data.creditList;
            if (creditList && creditList.length > 0) {
                $("#statDateLabel").text(new Date(creditList[0].statDate).format("yyyy年MM月"));
            }
            var lrrList = data.lrrList;
            var creditIndustryArray = [];
            var creditNumArray = [];
            var linkRelativeRatioArray = [];
            for (var i = 0; i < creditList.length; i++) {
                creditIndustryArray[i] = creditList[i].industry;
                creditNumArray[i] = creditList[i].creditNum;
                linkRelativeRatioArray[i] = creditList[i].linkRelativeRatio;
            }
            var lrrIndustryArray = [];
            var lrrNumArray = [];
            for (var i = 0; i < lrrList.length; i++) {
                lrrIndustryArray[i] = lrrList[i].industry;
                lrrNumArray[i] = lrrList[i].linkRelativeRatio;
            }

            var classL = data.avgLinkRelativeRatio >= 0 ? 'industry-tit-c3' : 'industry-tit-c1';
            var html = "<div class='industry-tit-list'><h4 >行业整体（B店）信用平均指数</h4>" +
                "<p><span id='num3'>" + data.avgCreditNum + "</span><b class='" + classL + "'>"
                + data.avgLinkRelativeRatio/100.00 + "%</b><b class='industry-tit-c2'>环比</b></p></div>";

            var model = $("#industryRank").find("[model]").removeAttr("model").removeAttr("style")[0].outerHTML;
            for (var i = 1; i < 4; i++) {
                var ratio = linkRelativeRatioArray[linkRelativeRatioArray.length - i];
                html = html + model.format(creditIndustryArray[creditIndustryArray.length - i], creditNumArray[creditNumArray.length - i], ratio >= 0 ? 'industry-tit-c3' : 'industry-tit-c1', ratio ? ratio/100.00 : 0);
            }
            $("#industryRank").html(html);

            myChart1 = rankingBar1(creditIndustryArray, creditNumArray);
            myChart2 = rankingBar2(lrrIndustryArray, lrrNumArray);
        };
        window.onresize = function () {
            var myChart3 = lineChars();
            myChart1.resize();
            myChart2.resize();
            myChart3.resize();
        };

        $("#credit_check").find("input").unbind('click').on('click', function () {
            var length = $("input[name='creditCheck']:checked").length;
            if (length > 5) {
                Pingan.malertInfo('所选类型不可超过五个', 'infoMessage warning', {});
                $(this).attr("checked", false);
                return;
            }
            if ($(this).is(":checked")) {
                $(this).attr("checked", true);
                $("input[name='creditCheck']:checked").each(function (i, v) {
                    industryCodes[i] = $(this).val();
                });
                var cityCode = $("a.current").attr('code');
                loadIndustryCreditIndex(cityCode, industryCodes);
                $("input[name='creditCheck']:checked").each(function (j, v) {
                    arryLegnd[j] = $(this).next('span').html();
                    if (!mapLine.hasOwnProperty($(this).val())) {
                        mapLine[$(this).val()] = {data: [], name: $(this).val(), type: 'line', stack: null};
                    }
                    arrySeries[j] = mapLine[$(this).val()];
                    industryCodes[j] = $(this).val();
                });
            } else {
                $(this).attr("checked", false);
                for (var h = 0; h < arryLegnd.length; h++) {
                    if (arryLegnd[h] == $(this).next('span').html()) {
                        arryLegnd.splice(h, 1);
                    }
                }
                for (var k = 0; k < arrySeries.length; k++) {
                    if (arrySeries[k].name == $(this).next('span').html()) {
                        arrySeries.splice(k, 1);
                    }
                }
                if(arryLegnd.length==0||arrySeries.length==0){
                    arrySeries=[];
                    arryLegnd=[];
                    xAxisData=[];
                }
            }
            return lineCharts(arrySeries, arryLegnd, xAxisData);
        });

        $("#credit_value").find("a").unbind('click').on('click', function () {
            $("#credit_value").find("a").removeClass("current");
            $(this).addClass("current");
            var cityCode = $(this).attr("code");
            industryCodes=[];
            $("input[name='creditCheck']:checked").each(function (j, v) {
                industryCodes[j] = $(this).val();
            });
            if(industryCodes.length==0){
                industryCodes[0] = 17;
                industryCodes[1] = 1;
                $("input[name='creditCheck']").eq(0).prop("checked",true);
                $("input[name='creditCheck']").eq(1).prop("checked",true);
            }
            loadIndustryCreditIndex(cityCode, industryCodes);
            return lineCharts(arrySeries, arryLegnd, xAxisData);
        });
        industryCodes[0] = 17;
        industryCodes[1] = 1;
        loadIndustryCreditIndex(0, industryCodes);
    };
    Pingan.Init();

    function loadIndustryCreditIndex(cityCode, industryCodes) {
        var saveUrl = basePath + "/gov/user/ec/credit/city";
        $.ajax({
            type: "post",
            url: saveUrl,
            data: {industryCodes: industryCodes, cityCode: cityCode},
            async: false,
            success: function (data) {
                if (data.statusCode == 1) {
                    var datas = data['data'];
                    if (datas == null) {
                        datas = [];
                        datas['cityMap'] = [];
                        datas['statDate'] = [];
                    }
                    mapLine = datas['cityMap'];
                    xAxisData = datas['statDate'];
                    $("#credit_index_time").html("时间：" + xAxisData[0] + "至" + xAxisData[xAxisData.length - 1]);
                    lineChars();
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                if (XMLHttpRequest.status == 6) {
                    Pingan.malertInfo("加载行业信用指数出错", 'infoMessage warning', {});
                }
            }
        });
    };

    function rankingBar1(creditIndustryArray, creditNumArray) {
        var myChart_bar = echarts.init(document.getElementById('rankingBar1'));
        var option_bar = {
            tooltip: {
                show: false
            },
            legend: {
                show: false,
                data: [''],
                bottom: '0%'
            },
            grid: {
                left: '4%',
                right: '11%',
                bottom: '5%',
                containLabel: true
            },
            xAxis: [
                {
                    type: 'value',
                    axisLabel: {
                        show: true,
                        textStyle: {
                            color: '#A1A1A1'
                        }
                    },
                    splitLine: {
                        show: true
                    },
                    min: 0
                    // max: 2500
                }
            ],
            yAxis: [
                {
                    type: 'category',
                    axisLabel: {
                        margin: 15,
                        formatter: function (value, index) {
                            if (value.length == 2) {
                                value = value + "　";
                            }
                            if (value.length == 3) {
                                value = value + "　";
                            }
                            if (value.length == 4) {
                                value = value + " ";
                            }
                            return creditIndustryArray.length - index + "  " + value;
                        },
                        textStyle: {
                            color: function (value) {
                                if ($.inArray(value, creditIndustryArray) > 4) {
                                    return "#FF3D0D";
                                } else {
                                    return "#333333";
                                }
                            },
                            fontSize: 14
                        }
                    },
                    data: creditIndustryArray
                }
            ],
            color: ['#339DF1'],
            series: [
                {
                    name: '',
                    type: 'bar',
                    stack: '总量',
                    barWidth: 13,
                    label: {
                        normal: {
                            show: true,
                            position: 'right',
                            formatter: '{c}分',
                            textStyle: {
                                color: '#333333',
                                fontStyle: 'normal',
                                fontWeight: 'bold',
                                fontFamily: 'sans-serif',
                                fontSize: 14
                            }
                        }
                    },
                    data: creditNumArray
                }
            ]
        };
        myChart_bar.setOption(option_bar);
        return myChart_bar;
    }

    function rankingBar2(lrrIndustryArray, lrrNumArray) {
        var myChart_bar = echarts.init(document.getElementById('rankingBar2'));
        var i = 0;
        var option_bar = {
            tooltip: {
                show: false
            },
            legend: {
                show: false,
                data: [''],
                bottom: '0%'
            },
            grid: {
                left: '4%',
                right: '11%',
                bottom: '5%',
                containLabel: true
            },
            xAxis: [
                {
                    type: 'value',
                    axisTick: {
                        show: false
                    },
                    axisLine: {
                        show: false
                    },
                    axisLabel: {
                        show: true,
                        textStyle: {
                            color: '#A1A1A1'
                        }
                    },
                    splitLine: {
                        show: true
                    },
                    min: 0
                    // max: 100
                }
            ],
            yAxis: [
                {
                    type: 'category',
                    axisLabel: {
                        margin: 15,
                        formatter: function (value, index) {
                            if (value.length == 2) {
                                value = value + "　　";
                            }
                            if (value.length == 3) {
                                value = value + "　";
                            }
                            return lrrIndustryArray.length - index + "  " + value;
                        },
                        textStyle: {
                            color: function (value) {
                                if ($.inArray(value, lrrIndustryArray) > 4) {
                                    return "#FF3D0D";
                                } else {
                                    return "#333333";
                                }
                            },
                            fontSize: 14
                        }
                    },
                    data: lrrIndustryArray
                }
            ],
            color: ['#339DF1'],
            series: [
                {
                    name: '',
                    type: 'bar',
                    stack: '总量',
                    barWidth: 13,
                    label: {
                        normal: {
                            show: true,
                            position: 'right',
                            formatter: function (data) {
                                return data.value/100.00+"%";
                            },
                            textStyle: {
                                color: '#333333',
                                fontStyle: 'normal',
                                fontWeight: 'bold',
                                fontFamily: 'sans-serif',
                                fontSize: 14
                            }
                        }
                    },
                    data: lrrNumArray
                }
            ]
        };
        myChart_bar.setOption(option_bar);
        return myChart_bar;
    }

    function lineCharts(arry, arryLegnd, xAxisData) {
        var myChart_bar = echarts.init(document.getElementById('lineChart'));
        option = {
            tooltip: {
                show:true,
                trigger: 'axis',
                formatter: function (params, ticket, callback) {
                    var html = "";
                    for(var i =0 ;i<params.length;i++){
                        html +="<div style='width: 10px; height: 10px; background: "+params[i].color+"; -moz-border-radius: 50px; -webkit-border-radius: 50px; border-radius: 50px; float:left; margin-left:6px;margin-top:6px;'></div> "+params[i].seriesName+": "+params[i].data[1] +"<br/>";
                    }
                    return html;
                }
            },
            legend: {
                left: '60',
                textStyle: {
                    fontSize: 14
                },
                data: arryLegnd,
                bottom: '5%'
            },
            grid: {
                left: '3%',
                right: '4%',
                height: '280',
                bottom: '15%',
                containLabel: true
            },
            toolbox: {
                show: false,
                feature: {
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: xAxisData
            },
            yAxis: {
                type: 'value'
            },
            series: arry


        };

        myChart_bar.setOption(option);
        return myChart_bar;
    }

    function lineChars() {
        $("input[name='creditCheck']:checked").each(function (i, v) {
            arryLegnd[i] = $(this).next('span').html();
            if (!mapLine.hasOwnProperty($(this).val())) {
                mapLine[$(this).val()] = {data: [], name: $(this).val(), type: 'line', stack: null};
            }
            arrySeries[i] = mapLine[$(this).val()];
            industryCodes[i] = $(this).val();
        });
        return lineCharts(arrySeries, arryLegnd, xAxisData);
    }

});

require.config({
    waitSeconds: 0,
    baseUrl: basePath + '/',
    paths: {
        Pingan: 'gov/js/common/common',
        top: 'gov/js/gov_top',
        nav: 'gov/js/ec/nav',
        echarts: 'gov/js/lib/echarts.min',
        credit: 'gov/js/ec/credit'

    },
    shim: {
        main: {
            deps: ['Pingan']
        },
        top: {
            deps: ['Pingan']
        },
        echarts: {
            deps: ['Pingan']
        },

        credit: {
            deps: ['echarts']
        }
    },
    deps: ['Pingan', 'top', 'nav', 'echarts', 'credit']
});