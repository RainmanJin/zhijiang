var loadAdIllegalPie = null;

var echarts_generate_graph = null;
require(['echarts', 'Pingan'], function (echarts, Pingan) {
    Pingan.Init = function () {
        //广告违法监测-地区 导航
        var nav_citySelect = new Pingan.SelectHandler($("#ad_illegal_monitor").find("[data-nav]"), false, true);
        nav_citySelect.selected = function (item) {
            var cityCode = item.attr("data-nav");
            loadAdIllegalIndex(cityCode);
        };

        loadOtherPunishment();
        loadAdIllegalIndex(4003001);
        loadAdIllegalPie($("#currentMaxDate").val());
        loadAdIllegalIndustry();
    };

    //生成echarts图表公共方法
    echarts_generate_graph = function (container, option, opts) {
        var graph = echarts.init(document.getElementById(container));
        graph.setOption(option);
    };

    //其他行政处罚信息数量统计
    function loadOtherPunishment() {
        var saveUrl = basePath + "/gov/user/ec/supervise/other/punishment";
        $.ajax({
            type: "POST",
            url: saveUrl,
            // data: {"cityName":"hangzhou"},
            async: false,
            success: function (data) {
                if (data.statusCode == 1) {
                    var datas = data['data'];
                    echarts_generate_graph('otherPunishmentTreemap', otherPunishmentTreeMapOption(datas));
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                if (XMLHttpRequest.status == 6) {
                    Pingan.malertInfo("加载其他行政处罚数据出错", 'infoMessage warning', {});
                }
            }
        });
    }

    //广告违法地域分布指数
    function loadAdIllegalIndex(cityCode) {
        var saveUrl = basePath + "/gov/user/ec/supervise/ad/illegal/index?cityCode=" + cityCode;
        $.ajax({
            type: "POST",
            url: saveUrl,
            // data: {"authType": authType, "brandName": brandName, "timeStr": timeStr},
            async: false,
            success: function (data) {
                if (data.statusCode == 1) {
                    var datas = data['data'];
                    if (datas == null) {
                        datas = [];
                        datas[cityCode] = [];
                        datas['monthlyLegendList'] = [];
                    }
                    echarts_generate_graph('adIllegalAreaDistributionIndex', adIllegalAreaDistributionIndexOption(datas[cityCode], datas['monthlyLegendList']));
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                if (XMLHttpRequest.status == 6) {
                    Pingan.malertInfo("加载广告违法地域分布指数数据出错", 'infoMessage warning', {});
                }
            }
        });
    }

    //广告违法地域分布图
    loadAdIllegalPie = function (month) {
        var saveUrl = basePath + "/gov/user/ec/supervise/ad/illegal/pie?month=" + month;
        $.ajax({
            type: "POST",
            url: saveUrl,
            // data: {"authType": authType, "brandName": brandName, "timeStr": timeStr},
            async: false,
            success: function (data) {
                if (data.statusCode == 1) {
                    var datas = data['data'];
                    if (datas == null) {
                        datas = [];
                        datas['totalList'] = [];
                    }
                    echarts_generate_graph('adIllegalAreaDistributionPie', adIllegalAreaDistributionPieOption(datas['totalList']));
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                if (XMLHttpRequest.status == 6) {
                    Pingan.malertInfo("加载广告违法地域分布图数据出错", 'infoMessage warning', {});
                }
            }
        });
    }

    //广告违法线索行业分布图
    var loadAdIllegalIndustry = function () {
        var saveUrl = basePath + "/gov/user/ec/supervise/ad/illegal/industry";
        $.ajax({
            type: "POST",
            url: saveUrl,
            async: false,
            success: function (data) {
                if (data.statusCode == 1) {
                    var datas = data['data'];
                    if (datas == null) {
                        datas = [];
                        datas['AdIllegalIndustryData'] = [];
                        datas['maxValue'] = 0;
                        datas['legendData'] = 0;
                    }
                    echarts_generate_graph('categoryChart', categoryChartOption(datas['AdIllegalIndustryData'], datas['maxValue'], datas['legendData']));
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                if (XMLHttpRequest.status == 6) {
                    Pingan.malertInfo("加载广告违法线索行业分布图数据出错", 'infoMessage warning', {});
                }
            }
        });
    };

    function categoryChartOption(data, maxValue, legendData) {
        var option = {
            title: {
                text: ''
            },
            legend: {
                // right: 10,
                bottom: 0,
                // data: ['0~5%', '5%~10%', '10%~20%', '20%~30%', '30%~' + maxValue + '%']
                data: legendData
            },
            xAxis: {
                type: 'value',
                max: maxValue,
                splitLine: {
                    show: false,
                    lineStyle: {
                        type: 'dashed'
                    }
                },
                axisLabel: {
                    formatter: function (param) {
                        return param + '%';
                    }
                }
            },
            label: {
                normal: {
                    show: false,
                    textStyle: {color: 'white'},
                    formatter: function (params) {
                        return params.value[3] + '\n\r' + params.value[0] + '%';
                    }
                }, emphasis: {
                    position: 'top',
                    textStyle: {
                        fontWeight: 'bold',
                        fontSize: 15
                    },
                    formatter: function (params) {
                        return params.value[3] + ',占比:' + params.value[0] + '%';
                    }
                }
            },
            yAxis: {
                show: false,
                type: 'value',
                min: 0,
                splitLine: {
                    lineStyle: {
                        type: 'dashed'
                    }
                },
                scale: true
            },
            series: [{
                name: '0~5%',
                data: data[0],
                type: 'scatter',
                symbolSize: function (data) {
                    return data[0] < 2 ? data[0] * 15 : (data[0] < 5 ? data[0] * 8 : data[0]*10);
                },
                label: {
                    emphasis: {
                        show: true,
                        formatter: function (param) {
                            return param.data[2] + ',占比:' + param.data[0] + "%";
                        },
                        position: 'top'
                    }
                },
                itemStyle: {
                    normal: {
                        shadowBlur: 10,
                        shadowColor: 'rgba(120, 36, 50, 0.5)',
                        shadowOffsetY: 5,
                        color: new echarts.graphic.RadialGradient(0.4, 0.3, 1, [{
                            offset: 0,
                            color: 'rgb(251, 118, 123)'
                        }, {
                            offset: 1,
                            color: 'rgb(204, 46, 72)'
                        }])
                    }
                }
            }, {
                name: '5%~10%',
                data: data[1],
                type: 'scatter',
                symbolSize: function (data) {
                    // return data[0] < 2 ? data[0] * 15 : (data[0] <= 5 ? data[0] * 8 : (data[0] <= 10 ? data[0] * 4.5 : data[0] * 4));
                    return data[0]*4;
                },
                label: {
                    emphasis: {
                        show: true,
                        formatter: function (param) {
                            return param.data[2] + ',占比:' + param.data[0] + "%";
                        },
                        position: 'top',
                        textStyle: {
                            color: 'rgb(53, 255, 51)'
                        }
                    }
                },
                itemStyle: {
                    normal: {
                        shadowBlur: 10,
                        shadowColor: 'rgba(25, 100, 150, 0.5)',
                        shadowOffsetY: 5,
                        color: new echarts.graphic.RadialGradient(0.4, 0.3, 1, [{
                            offset: 0,
                            color: 'rgb(53, 255, 51)'
                        }, {
                            offset: 1,
                            color: 'rgb(25, 183, 190)'
                        }])
                    }
                }
            },
                {
                    name: '10%~20%',
                    data: data[2],
                    type: 'scatter',
                    symbolSize: function (data) {
                        return data[0] * 4;
                    },
                    label: {
                        emphasis: {
                            show: true,
                            formatter: function (param) {
                                return param.data[2] + ',占比:' + param.data[0] + "%";
                            },
                            position: 'top',
                            textStyle: {
                                color: 'purple'
                            }
                        }
                    },
                    itemStyle: {
                        normal: {
                            shadowBlur: 10,
                            shadowColor: 'rgba(120, 36, 50, 0.5)',
                            shadowOffsetY: 5,
                            color: new echarts.graphic.RadialGradient(0.4, 0.3, 1, [{
                                offset: 0,
                                color: '#f02cff'
                            }, {
                                offset: 1,
                                color: '#ce36ff'
                            }])
                        }
                    }
                }, {
                    name: '20%~30%',
                    data: data[3],
                    type: 'scatter',
                    symbolSize: function (data) {
                        return data[0] * 4;
                    },
                    label: {
                        emphasis: {
                            show: true,
                            formatter: function (param) {
                                return param.data[2] + ',占比:' + param.data[0] + "%";
                            },
                            position: 'top'
                        }
                    },
                    itemStyle: {
                        normal: {
                            shadowBlur: 10,
                            shadowColor: 'rgba(25, 100, 150, 0.5)',
                            shadowOffsetY: 5,
                            color: new echarts.graphic.RadialGradient(0.4, 0.3, 1, [{
                                offset: 0,
                                color: 'rgb(129, 227, 238)'
                            }, {
                                offset: 1,
                                color: 'rgb(25, 183, 207)'
                            }])
                        }
                    }
                },
                {
                    name: '30%~' + maxValue + '%',
                    data: data[4],
                    type: 'scatter',
                    symbolSize: function (data) {
                        // return data[0] * 3.5;
                        return data[0] * 4;
                    },
                    label: {
                        emphasis: {
                            show: true,
                            formatter: function (param) {
                                return param.data[2] + ',占比:' + param.data[0] + "%";
                            },
                            position: 'top'
                        }
                    },
                    itemStyle: {
                        normal: {
                            shadowBlur: 10,
                            shadowColor: 'rgba(120, 36, 50, 0.5)',
                            shadowOffsetY: 5,
                            color: new echarts.graphic.RadialGradient(0.4, 0.3, 1, [{
                                offset: 0,
                                color: '#ffc832'
                            }, {
                                offset: 1,
                                color: '#FFA500'
                            }])
                        }
                    }
                }
            ]
        };
        return option;
    };
    Pingan.Init();
});
function otherPunishmentTreeMapOption(datas) {
    var option = {

        tooltip: {
            backgroundColor: '#F7F9FB',
            borderColor: '#92DAFF',
            borderWidth: '1px',
            textStyle: {color: 'black'},
            position: function (point, params, dom) {
                return [point[0] - 100, point[1]];
            },
            formatter: function (info) {
                return '<em style="font-size:20px">' + info.name + '</em>'
            }
        },
        series: [
            {
                name: 'Disk Usage',
                type: 'treemap',
                roam: false,
                visibleMin: 300,
                nodeClick: false,
                breadcrumb: {
                    show: false
                },
                itemStyle: {
                    normal: {
                        borderColor: '#fff'
                    }
                },
                levels: [{
                    itemStyle: {
                        normal: {
                            borderWidth: 0,
                            gapWidth: 5
                        }
                    }
                }],
                data: datas
            }
        ]
    };
    return option;
};

function adIllegalAreaDistributionIndexOption(data, legends) {
    var option =
        {
            toolbox: {
                feature: {
                    dataView: {show: false, readOnly: false},
                    magicType: {show: false, type: ['line', 'bar']},
                    restore: {show: false},
                    saveAsImage: {show: false}
                }
            },
            /*  title:{
             text:'2016',
             right:'50%'
             },*/
            tooltip: {
                trigger: 'item',
                position: 'bottom'
            },
            xAxis: [
                {
                    type: 'category',
                    axisTick: {
                        alignWithLabel: false
                    },
                    data: legends
                }
            ],
            yAxis: [
                {
                    show: false,
                    type: 'value',
                    name: '百分比',
                    min: 0,
                    max: 100,
                    // max: m2,
                    position: 'center',
                    axisLabel: {
                        formatter: '{value} %'
                    }
                },
                {
                    show: false,
                    type: 'value',
                    name: '条数',
                    min: 0,
                    // max: data[1][1],
                    axisLabel: {
                        formatter: '{value} 条'
                    }
                }
            ],
            series: [
                {
                    tooltip: {show: false},
                    name: '百分比',
                    type: 'bar',
                    color: ['#7878D2'],
                    label: {
                        normal: {
                            show: true,
                            position: 'top',
                            formatter: function (param) {
                                if (param.data[1] == 0) {
                                    return ""
                                }
                                return param.data[1] + "%";
                            },
                            emphasis: {
                                show: false
                            }
                        }
                    },
                    data: data[0]
                },
                {
                    name: '条数',
                    tooltip: {
                        backgroundColor: '#F7F9FB',
                        borderColor: '#92DAFF',
                        borderWidth: '1px',
                        textStyle: {color: 'black'},
                        trigger: 'item',
                        position: 'right',
                        formatter: function (param) {
                            if (param.data[1] == 0) {
                                return ""
                            }
                            return "共" + '<em style="color:' + param.color + ';font-size:16px;">' + $.format(param.data[1], 3, ',') + "</em>条，其中" + '<em style="color:' + param.color + ';font-size:16px">'
                                + $.format(param.data[2], 3, ',') + "</em>条<br/>涉及特供专供，" +
                                '<em style="color:' + param.color + ';font-size:16px;">' + $.format(param.data[3], 3, ',') +
                                "</em>条涉及<br/>虚假荣誉，" + '<em style="color:' + param.color + ';font-size:16px;">' + $.format(param.data[4], 3, ',') +
                                "</em>条涉及<br/>绝对化用语。"
                        }
                    },
                    label: {
                        normal: {
                            show: false,
                            formatter: function (param) {
                                if (param.data[1] == 0) {
                                    return ""
                                }
                                return param.data[2] + "条"
                            }
                        }
                    },
                    itemStyle: {
                        normal: {
                            borderWidth: 13
                        }
                    },
                    yAxisIndex: 1,
                    type: 'line',
                    color: ['#FFA500'],
                    data: data[1]
                }
            ]
        }
    return option;
};

function adIllegalAreaDistributionPieOption(superviseMonthlyData) {
    option = {
        tooltip: {
            trigger: 'item',
            backgroundColor: '#F7F9FB',
            borderColor: '#92DAFF',
            borderWidth: '1px',
            textStyle: {color: 'black'},
            formatter: function (params) {
                return '<em style="font-size:20px">' + params.name + '</em>' + ":" +
                    '<em style="color:' + params.color + ';font-size:20px">' + $.format(params.value, 3, ',') + '</em>' + "条,占比" +
                    '<em style="color:' + params.color + ';font-size:20px">' + params.percent + '</em>' + "%"
            }
        },

        legend: {
            orient: 'horizontal',
            y: 'bottom',

            padding: [700, 0, 0, 6],
            data: superviseMonthlyData[0]
        },
        series: [
            {
                color: ['#921AFF', 'orange', 'green', '#0080FF'],
                type: 'pie',
                radius: ['30%', '70%'],
                avoidLabelOverlap: true,
                label: {
                    normal: {
                        show: true,
                        position: 'inner'
                    },
                    emphasis: {
                        show: true,
                        textStyle: {
                            fontSize: '15',
                            fontWeight: 'bold'
                        }
                    }
                },
                labelLine: {
                    normal: {
                        show: true
                    }
                },
                data: superviseMonthlyData[1]
            }
        ]
    };
    return option;
}

//广告违法地域分布图changeSuperviseDate
function changeSuperviseDate() {
    var superviseDate = $("#startStatDate").val();
    loadAdIllegalPie(superviseDate);
};

require.config({
    waitSeconds: 0,
    baseUrl: basePath + '/',
    paths: {
        Pingan: 'gov/js/common/common',
        top: 'gov/js/gov_top',
        nav: 'gov/js/ec/nav',
        echarts: 'gov/js/lib/echarts.min',
        supervise: 'gov/js/ec/supervise'
    },
    shim: {
        top: {
            deps: ['Pingan']
        },
        nav: {
            deps: ['Pingan']
        },
        echarts: {
            deps: ['Pingan']
        },
        supervise: {
            deps: ['echarts']
        }
    },
    deps: ['Pingan', 'top', 'nav', 'echarts', 'supervise']
});