/**
 * Created by admin on 2016/8/18.
 */
require.config({
    waitSeconds: 0,
    baseUrl: basePath + '/',
    paths: {
        Pingan: 'gov/js/common/common',
        top: 'gov/js/gov_top',
        nav: 'gov/js/ec/nav',
        echarts: 'gov/js/lib/echarts.min',
        zhejiangMap: 'gov/js/lib/map/zhejiang',
        chinaMap: 'gov/js/lib/map/china',
        circliful: 'gov/js/lib/jquery.circliful.min',
        operate: 'gov/js/ec/operate'
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
        zhejiangMap: {
            deps: ['echarts']
        },
        chinaMap: {
            deps: ['echarts']
        },
        circliful: {
            deps: ['Pingan']
        },
        operate: {
            deps: ['echarts', 'Pingan']
        }
    },
    deps: ['Pingan', 'top', 'nav', 'zhejiangMap', 'chinaMap', 'circliful', 'operate']
});

require(['echarts', 'Pingan', 'circliful', 'zhejiangMap', 'chinaMap'], function (echarts, Pingan) {
    Pingan.Init = function () {
        var nav_select = new Pingan.SelectHandler($("#operate_three").find("[data-nav]"), false, true);
        nav_select.selected = function (item) {
            var id = item.attr("data-nav");
            $(".container").find("div[mark='operate']").hide();
            $("div[name=" + id + "]").show();
        };

        var initOperateOverviewAndActiveIndustry = function () {
            $.ajax({
                url: basePath + "/gov/user/ec/operate/overview",
                success: function (result) {
                    if (result.statusCode == 1) {
                        var ebusinessInfo = result.data["ebusinessInfo"];
                        var activeIndustries = result.data["activeIndustries"];
                        ebusinessInfo.activeProportion = 0;
                         ebusinessInfo.activeIndustry = "排名前三的行业销售占比份额总和，<br/>分别为：";
                        for(var i = 0;i<activeIndustries.length;i++){
                            ebusinessInfo.activeProportion += activeIndustries[i].amountProportion/100;
                            ebusinessInfo.activeIndustry +=activeIndustries[i].industry;
                            if(i!=activeIndustries.length-1){
                                ebusinessInfo.activeIndustry +="、"
                            }
                        }
                         operateOverview(ebusinessInfo);
                        initActiveIndustry(activeIndustries);
                        BCAmountProportion(ebusinessInfo);
                        $("#BAmount").text($.numberFormat(ebusinessInfo.bamount/100,2));
                        $("#CAmount").text($.numberFormat(ebusinessInfo.camount/100,2));
                        $("#BQuantity").text($.numberFormat(ebusinessInfo.bquantity));
                        $("#CQuantity").text($.numberFormat(ebusinessInfo.cquantity));
                        var startDate = new Date(ebusinessInfo.startDate).format("yyyy年MM月");
                        var endDate = new Date(ebusinessInfo.endDate).format("yyyy年MM月");
                        $("#dateBetween").text(startDate+"至"+endDate);
                        $("#endDate").text(endDate);
                        $("#independentQuantity").text($.numberFormat(ebusinessInfo.indeQuantity));
                    }
                }
            });
        };
        initOperateOverviewAndActiveIndustry();
        var initActiveIndustry = function (data) {
            var html ="";
            var fgcolor = "#FF9D9B";

            for (var i=0;i<data.length;i++)
            {
                if(i==1){
                    fgcolor="#8BC318"
                }else if(i==2){
                    fgcolor="#309EF5"
                }
                html = html +"<div data-active data-dimension='200' data-text='"+data[i].amountProportion/100+"%' data-info='"+data[i].industry+"' " +
                    "data-width='30'data-fontsize='33' data-percent='"+data[i].amountProportion/100+"'  data-fgcolor='"+fgcolor+"' data-bgcolor='#eee'"+
                "data-fill='#ddd'></div>"
            }
            $("#activeIndustry").html(html);
            $("[data-active]").circliful();
        };
        var operateOverview = function (data) {
            //浙江省2016年1月至6月电商行业经营概况
            var eCommerce_operate_view = {
                tooltip: {
                    trigger: 'item',
                    backgroundColor: '#F7F9FB',
                    borderColor: '#92DAFF',
                    borderWidth: '1px',
                    textStyle: {color: 'black'},
                    poisition: ['50%', '50%'],
                    extraCssText: 'box-shadow: 0 0 3px rgba(0, 0, 0, 0.3);',
                    formatter: function (param) {
                        if (param.value != undefined) {
                            return '<em style="color:' + param.color + ';font-size:16px">' + param.value + '</em>';
                        }
                        return;
                        // return param.value;
                    }
                },
                animationDurationUpdate: 1500,
                animationEasingUpdate: 'quinticInOut',

                series: [
                    {
                        type: 'graph',
                        layout: 'none',
                        symbolSize: 50,
                        roam: false,
                        label: {
                            normal: {
                                show: true,
                                textStyle: {
                                    fontSize: 20
                                }
                            }
                        },
                        edgeSymbol: ['none', 'none'],
                        edgeSymbolSize: [4, 10],
                        edgeLabel: {
                            normal: {
                                textStyle: {
                                    fontSize: 20
                                }
                            }
                        },

                        data: [{
                            name: $.numberFormat(data.activeProportion,2) +"%",
                            value: data.activeIndustry,
                            x: 0,
                            y: 600,
                            symbolSize: 75,
                            itemStyle: {
                                normal: {
                                    color: '#8FD047'
                                }
                            }

                        }, {
                            name: $.numberFormat(data.zjAmount/100,2),
                            x: 1500,
                            y: 390,
                            symbolSize: 100,
                            itemStyle: {
                                normal: {
                                    color: '#D3BC3A'
                                }
                            }

                        }, {
                            name: $.numberFormat(data.zjQuantity),
                            x: 3000,
                            y: 650,
                            symbolSize: 100,
                            itemStyle: {
                                normal: {
                                    color: '#66CCCC'
                                }
                            }
                        }, {
                            name: $.numberFormat(data.indeQuantity),
                            value: '浙江省本地自营电商平台，<br/>如：蘑菇街',
                            x: 4500,
                            y: 500,
                            symbolSize: 75,
                            itemStyle: {
                                normal: {
                                    color: '#FFC891'
                                }
                            }
                        }],
                        // links: [],
                        links: [{
                            source: 0,
                            target: 1
                        }, {
                            source: 1,
                            target: 2
                        }, {
                            source: 2,
                            target: 3
                        }],
                        lineStyle: {
                            normal: {
                                opacity: 0.9,
                                width: 2,
                                curveness: 0
                            }
                        }
                    }
                ]
            };
            echarts_generate_graph('graphChart', eCommerce_operate_view);
        };


        //area_distribution.jsp
        var bdata = [
            {name: '杭州市', amount: '1,878.25亿元', proportion: '35.68%', value: 14357},
            {name: '温州市', amount: '335.49亿元', proportion: '11.16%', value: 4492},
            {name: '宁波市', amount: '941.48亿元', proportion: '8.48%', value: 3413},
            {name: '台州市', amount: '107.07亿元', proportion: '6.54%', value: 2631},
            {name: '嘉兴市', amount: '192.62亿元', proportion: '7.88%', value: 3166},
            {name: '绍兴市', amount: '89.21亿元', proportion: '3.09%', value: 1242},
            {name: '湖州市', amount: '43.43亿元', proportion: '3.12%', value: 1256},
            {name: '丽水市', amount: '65.49亿元', proportion: '1.47%', value: 590},
            {name: '衢州市', amount: '11.56亿元', proportion: '0.86%', value: 345},
            {name: '舟山市', amount: '0.40亿元', proportion: '0.20%', value: 79},
            {name: '金华市', amount: '337.94亿元', proportion: '21.19%', value: 8527}
        ];
        var cdata = [
            {name: '杭州市', amount: '1,112.56亿元', proportion: '40.55%', value: 1613152},
            {name: '金华市', amount: '270.92亿元', proportion: '14.38%', value: 572030},
            {name: '温州市', amount: '346.75亿元', proportion: '12.53%', value: 498258},
            {name: '台州市', amount: '181.55亿元', proportion: '7.62%', value: 303222},
            {name: '宁波市', amount: '256.99亿元', proportion: '7.26%', value: 288973},
            {name: '嘉兴市', amount: '186.89亿元', proportion: '6.89%', value: 273930},
            {name: '湖州市', amount: '35.67亿元', proportion: '4.38% %', value: 174391},
            {name: '绍兴市', amount: '33.74亿元', proportion: '3.43%', value: 136452},
            {name: '丽水市', amount: '13.54亿元', proportion: '1.27%', value: 50415},
            {name: '衢州市', amount: '7.59亿元', proportion: '0.76%', value: 30297},
            {name: '舟山市', amount: '2.10亿元', proportion: '0.44%', value: 17309}
        ];
        var alonedata = [
            {name: '杭州市', amount: '0', proportion: '47.83%', value: 2574},
            {name: '温州市', amount: '0', proportion: '5.24%', value: 282},
            {name: '宁波市', amount: '0', proportion: '13.68%', value: 736},
            {name: '台州市', amount: '0', proportion: '2.71%', value: 117},
            {name: '嘉兴市', amount: '0', proportion: '6.78%', value: 365},
            {name: '绍兴市', amount: '0', proportion: '1.66%', value: 89},
            {name: '湖州市', amount: '0', proportion: '1.02%', value: 55},
            {name: '丽水市', amount: '0', proportion: '3.71%', value: 199},
            {name: '衢州市', amount: '0', proportion: '0%', value: 0},
            {name: '舟山市', amount: '0', proportion: '0.51%', value: 27},
            {name: '金华市', amount: '0', proportion: '16.24%', value: 874}
        ];
        var dataMap = {"bdata": bdata, "cdata": cdata, "alonedata": alonedata};
        //本省B店、C店区域分布情况
        // echarts_generate_graph('shopZhejiangMap', initShopTypeChartsOption(bdata, 14935, "bdata"));

        var initShopTypeCharts = function (type) {
            $.ajax({
                url: basePath + "/gov/user/ec/operate/dist/area?type="+type,
                success: function (result) {
                    if (result.statusCode == 1) {
                        echarts_generate_graph('shopZhejiangMap', initShopTypeChartsOption(result.data, type));
                    }
                }
            });
        };
        initShopTypeCharts(1);
        $("input[name=checkShopType]").click(function () {
            //B、C店区域分布单选按钮关联浙江地图
            initShopTypeCharts($(this).val());
        });


        var initBCAmount = function () {
            $.ajax({
                url: basePath + "/gov/user/ec/operate/amount/compare",
                success: function (result) {
                    if (result.statusCode == 1) {
                        bCAmountChart(result.data);
                    }
                }
            });
        };
        initBCAmount();
        var bCAmountChart = function (data) {
            //turnover_contrast.jsp
            // B、C店交易额对比
            var turnover_contrast_bar_option = {
                tooltip: {
                    show: false
                },
                legend: {
                    data: ['B店', 'C店'],
                    bottom: '0%'
                },
                grid: {
                    left: '4%',
                    right: '6%',
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
                            show: false
                        },
                        splitLine: {
                            show: false
                        },
                        min: -7263,
                        max: 6891
                    }
                ],
                yAxis: [
                    {
                        type: 'category',
                        axisTick: {
                            show: false
                        },
                        axisLine: {
                            show: false
                        },
                        data:data.cityList /*['舟山市', '衢州市', '丽水市', '湖州市', '绍兴市', '嘉兴市', '台州市', '金华市', '宁波市', '温州市', '杭州市']*/
                    }
                ],
                color: [
                    '#339DF1',
                    '#8BC316'
                ],
                series: [
                    {
                        name: 'B店',
                        type: 'bar',
                        stack: '总量',
                        barWidth: 12,
                        label: {
                            normal: {
                                show: true,
                                position: 'left',
                                formatter: function (params, ticket, callback) {
                                    return $.numberFormat(params['data']*(-0.01),2)+"%";
                                }
                            }
                        },
                        data: data.bAmountProportion /*[
                            {value: -0.01, other: '0.01%'},
                            {value: -0.29, other: '0.29%'},
                            {value: -1.62, other: '1.62%'},
                            {value: -1.07, other: '1.07%'},
                            {value: -2.20, other: '2.20%'},
                            {value: -4.76, other: '4.76%'},
                            {value: -2.65, other: '2.65%'},
                            {value: -8.35, other: '8.35%'},
                            {value: -23.26, other: '23.26%'},
                            {value: -8.29, other: '8.29%'},
                            {value: -46.40, other: '46.40%'}
                        ]*/
                    },
                    {
                        name: 'C店',
                        type: 'bar',
                        stack: '总量',
                        barWidth: 12,
                        label: {
                            normal: {
                                show: true,
                                position: 'right',
                                formatter: function (params, ticket, callback) {
                                    return $.numberFormat(params['data']*0.01,2)+"%";
                                }
                            }
                        },
                        data:data.cAmountProportion /*[
                            {value: 0.09, other: '0.09%'},
                            {value: 0.31, other: '0.31%'},
                            {value: 0.55, other: '0.55%'},
                            {value: 1.46, other: '1.46%'},
                            {value: 1.38, other: '1.38%'},
                            {value: 7.63, other: '7.63%'},
                            {value: 7.41, other: '7.41%'},
                            {value: 11.05, other: '11.05%'},
                            {value: 10.49, other: '10.49%'},
                            {value: 14.15, other: '14.15%'},
                            {value: 45.39, other: '45.39%'}
                        ]*/
                    }
                ]
            };
            echarts_generate_graph('businessContrastBar', turnover_contrast_bar_option);
        };


        //B、C店交易额占比
        var BCAmountProportion = function (data) {
            var trading_amount_proportion_option = {
                tooltip: {
                    trigger: 'item',
                    backgroundColor: '#F7F9FB',
                    borderColor: '#92DAFF',
                    borderWidth: '1px',
                    textStyle: {color: 'black'},
                    formatter: function (param) {
                        return param.name + param.value + "%";
                    }
                },
                legend: {
                    orient: 'horizontal',
                    y: 'bottom',

                    padding: [500, 0, 0, 6],
                    data: ['本省B店交易额占比', '本省C店交易额占比', '网络交易额在全国占比']
                },
                label: {

                    normal: {
                        show: true,

                        formatter: function (param) {
                            return param.name + param.percent + "%";
                        }

                    }, emphasis: {
                        show: true,
                        formatter: function (param) {
                            return param.name + param.percent + "%";
                        }
                    }
                },
                series: [
                    {
                        color: ['#CFCEED'],
                        type: 'pie',
                        radius: ['30%', '35%'],
                        tooltip: {show: false},
                        label: {
                            normal: {show: false}
                        },
                        labelLine: {
                            normal: {show: false}
                        },
                        data: [{value: 0, name: ''}]
                    },
                    {
                        zlevel: 0,
                        color: ['#339DF1', '#8BC316'],
                        type: 'pie',
                        radius: ['35%', '70%'],
                        selectedMode: 'multiple',
                        avoidLabelOverlap: true,
                        label: {
                            normal: {
                                show: false,
                                position: 'inside',
                                formatter: function (param) {
                                    return param.name;
                                },
                                textStyle: {
                                    fontWeight: 'bold'
                                }
                            },
                            emphasis: {
                                show: false,
                                textStyle: {
                                    fontSize: '12',
                                    fontWeight: 'bold'
                                }
                            }
                        },
                        labelLine: {
                            normal: {
                                show: false,
                                length: 3.5,
                                length2: 3.5
                            }
                        },
                        data: [
                            {
                                value:data.bamount /*4048*/,
                                name: '本省B店交易额占比',
                                tooltip: {
                                backgroundColor: '#F7F9FB',
                                borderColor: '#92DAFF',
                                borderWidth: '1px',
                                textStyle: {color: 'black'},
                                trigger: 'item',
                                formatter: function (param) {
                                    return '<em style="color: ' + param.color + ';font-size:20px">B店</em>' + '交易额：' + '<em style="color: ' + param.color + ';font-size:20px">' + $.numberFormat(param.value/100, 2) + '</em>' + '亿元，<br/>' +
                                        '在本省占比' + '<em style="color: ' + param.color + ';font-size:20px">' + param.percent + '%</em>';
                                }
                            },
                                label: {
                                    normal: {
                                        show: true,
                                        position: 'inside',
                                        formatter: function () {
                                            return 'B店';
                                        },
                                        textStyle: {
                                            fontWeight: 'bold',
                                            fontSize: '14'
                                        }
                                    },
                                    emphasis: {
                                        show: true,
                                        textStyle: {
                                            fontSize: '18',
                                            fontWeight: 'bold'
                                        }
                                    }
                                }
                            },
                            {
                                value: data.camount/*2451*/,
                                name: '本省C店交易额占比',
                                tooltip: {
                                    backgroundColor: '#F7F9FB',
                                    borderColor: '#92DAFF',
                                    borderWidth: '1px',
                                    textStyle: {color: 'black'},
                                    trigger: 'item',
                                    formatter: function (param) {
                                        return '<em style="color: ' + param.color + ';font-size:20px">C店</em>' + '交易额：' + '<em style="color: ' + param.color + ';font-size:20px">' + $.numberFormat(param.value/100, 2) + '</em>' + '亿元，<br/>' +
                                            '在本省占比' + '<em style="color: ' + param.color + ';font-size:20px">' + param.percent + '%</em>';
                                    }
                                },
                                label: {
                                    normal: {
                                        show: true,
                                        position: 'inside',
                                        formatter: function () {
                                            return 'C店';
                                        },
                                        textStyle: {
                                            fontWeight: 'bold',
                                            fontSize: '14'
                                        }
                                    },
                                    emphasis: {
                                        show: true,
                                        textStyle: {
                                            fontSize: '18',
                                            fontWeight: 'bold'
                                        }
                                    }
                                }
                            }
                        ]
                    }, {
                        zlevel: 1,
                        color: ['pink', 'white'],
                        type: 'pie',
                        radius: ['0%', '30%'],
                        label: {
                            normal: {
                                show: false,
                                position: 'outer',
                                textStyle: {color: '#E54724'}
                            },
                            emphasis: {
                                show: false,
                                textStyle: {
                                    fontSize: '12',
                                    fontWeight: 'bold',
                                    color: '#E54724'
                                }
                            }
                        },
                        labelLine: {
                            normal: {
                                show: false,
                                length: 70,
                                length2: 20
                            }
                        },
                        data: [
                            {
                                value: data.zjAmount,
                                name: '网络交易额在全国占比',
                                labelLine: {normal: {show: false, length: 70, length2: 20}},
                                tooltip: {
                                    trigger: 'item',
                                    formatter: function (param) {
                                        return '本省网络交易额：' + '<em style="color: pink;font-size:20px"">' + $.numberFormat(param.value/100, 2) + '</em>' + '亿元，<br/>' +
                                            '在全国占比：' + '<em style="color: pink;font-size:20px"">' + param.percent + '%</em>'
                                    }
                                }
                            },
                            {
                                value: data.countryAmount-data.zjAmount/*32487*/, 
                                name: '',
                                label: {normal: {show: false}},
                                labelLine: {
                                      normal: {show: false},
                                      emphasis: {show: false}
                                 },
                                 tooltip: {show: false}
                            },
                        ]
                    }
                ]
            };
            echarts_generate_graph('tradingAmountProportion', trading_amount_proportion_option);
        };



        function draw_china(data) {
            //全国访问用户分布图
            var nationwide_interview_users_option = {
                title: {
                    text: '',
                    left: 'right'
                },
                tooltip: {
                    trigger: 'item',
                    formatter: function (params) {
//                    return params.name+'占比'+(params.data.proportion==undefined?'0%':params.data.proportion);
                        return '<em style="color:' + params.color + ';font-size:20px">' + params.name + '</em>' + '占比' +
                            '<em style="color:' + params.color + ';font-size:20px">' + (params.data.proportion == undefined ? '0%' :$.numberFormat(params.data.proportion*0.01,2)) + '%</em>'
                    }
                },
                visualMap: {
                    max: data[0].value,
                    padding: [100, 0],
                    min: 0,
                    left: 'right',
                    top: 'bottom',
                    text: ['高', '低'],           // 文本，默认为数值文本
                    calculable: false,
                    color: ['#F6A57F', '#EDEDED']
                },
                series: [
                    {
                        type: 'map',
                        map: "china",
                        label: {
                            normal: {
                                show: false
                            },
                            emphasis: {
                                show: true
                            }
                        },
                        data:data /*[
                            {name: '上海', proportion: '3.18%', value: 9386342},
                            {name: '云南', proportion: '1.44%', value: 4257430},
                            {name: '内蒙古', proportion: '1.33%', value: 3934040},
                            {name: '北京', proportion: '5.57%', value: 16450374},
                            {name: '吉林', proportion: '1.33%', value: 3930210},
                            {name: '四川', proportion: '3.44%', value: 10151056},
                            {name: '天津', proportion: '2.79%', value: 8252046},
                            {name: '宁夏', proportion: '0.22%', value: 644070},
                            {name: '安徽', proportion: '2.74%', value: 8106666},
                            {name: '山东', proportion: '6.08%', value: 17971840},
                            {name: '山西', proportion: '1.81%', value: 5352760},
                            {name: '广东', proportion: '17.89%', value: 52857560},
                            {name: '广西', proportion: '2.28%', value: 6748506},
                            {name: '新疆', proportion: '0.68%', value: 2005170},
                            {name: '江苏', proportion: '7.50%', value: 22148124},
                            {name: '江西', proportion: '2.65%', value: 7825898},
                            {name: '河北', proportion: '3.77%', value: 11126320},
                            {name: '河南', proportion: '3.92%', value: 11573892},
                            {name: '浙江', proportion: '9.15%', value: 27018496},
                            {name: '海南', proportion: '0.51%', value: 1505958},
                            {name: '湖北', proportion: '3.40%', value: 10050234},
                            {name: '湖南', proportion: '3.27%', value: 9651390},
                            {name: '甘肃', proportion: '0.81%', value: 2382842},
                            {name: '福建', proportion: '5.13%', value: 15141550},
                            {name: '西藏', proportion: '0.05%', value: 137306},
                            {name: '贵州', proportion: '1.08%', value: 3203234},
                            {name: '辽宁', proportion: '2.44%', value: 7219330},
                            {name: '重庆', proportion: '1.45%', value: 4290778},
                            {name: '陕西', proportion: '2.28%', value: 6723960},
                            {name: '青海', proportion: '0.16%', value: 476004},
                            {name: '黑龙江', proportion: '1.62%', value: 4790170},
                            {name: '台湾', proportion: '0%', value: 0},
                            {name: '南海诸岛', proportion: '0%', value: 0}
                        ]*/
                    }
                ]
            };
            echarts_generate_graph('visitChinaMap', nationwide_interview_users_option);
        }


    var nationwide_interview=function () {
        $.ajax({
            url: basePath + "/gov/user/ec/operate/dist/visitor",
            success: function (result) {
                if (result.statusCode == 1) {
                    draw_china(result.data);
                }
            }
        });
    }();


        var initIndependentDist = function () {
            $.ajax({
                url: basePath + "/gov/user/ec/operate/dist/ind/ec",
                success: function (result) {
                    if (result.statusCode == 1) {
                        IndependentDist(result.data);
                    }
                }
            });
        };
        initIndependentDist();
        var IndependentDist = function (data) {
            //浙江省独立电商分布解读环饼图
            var independentOnlineRetailerData = [['杭州市', 2526], ['温州市', 277], ['丽水市', 196], ['台州市', 115], ['嘉兴市', 358],
                ['宁波市', 722], ['湖州市', 54], ['绍兴市', 88], ['舟山市', 27], ['金华市', 858], ['衢州市', 61]];
            var independent_online_retailer_option = {
                tooltip: {
                    trigger: 'item',
                    backgroundColor: '#F7F9FB',
                    borderColor: '#92DAFF',
                    borderWidth: '1px',
                    textStyle: {color: 'black'}

                },
                title: {
                    text: '独立电商数量占比',
                    subtext: '',
//                    x: 'center',
//                    y: 'center',
                    position: 'top',
                    textStyle: {
                        fontWeight: 'normal',
                        fontSize: 16
                    }
                },
                legend: {
                    orient: 'horizontal',
//            y: 'bottom',
//            position:'bottom',
                    padding: [430, 60, 0, 60],
                    data: data.cityList/*['浙江省', independentOnlineRetailerData[0][0], independentOnlineRetailerData[1][0], independentOnlineRetailerData[2][0], independentOnlineRetailerData[3][0]
                        , independentOnlineRetailerData[4][0], independentOnlineRetailerData[5][0], independentOnlineRetailerData[6][0], independentOnlineRetailerData[7][0]
                        , independentOnlineRetailerData[8][0], independentOnlineRetailerData[9][0], independentOnlineRetailerData[10][0]]*/
                },
                label: {

                    normal: {
                        show: true,

                        formatter: function (param) {
                            return param.name + param.percent + "%";
                        }

                    }, emphasis: {
                        show: true,
                        formatter: function (param) {
                            return param.name + param.percent + "%";
                        }

                    }


                },
                series: [
                    {
                        zlevel: 1,
//                name:'访问来源',
//                selectedMode: 'multiple',
                        color: ['pink', 'white'],
                        type: 'pie',
                        radius: ['0%', '30%'],
                        label: {
                            normal: {
                                formatter: function (param) {
                                    return '独立电商数量全国占比' + param.percent + '%'
                                },
                                show: false,
                                position: 'outside',
                                textStyle: {color: '#E54724'}
                            },
                            emphasis: {
                                show: false,
                                textStyle: {
                                    fontSize: '13',
                                    fontWeight: 'bold',
                                    color: '#E54724'

                                }
                            }
                        },
                        labelLine: {
                            normal: {
                                show: false,
                                length: 100,
                                length2: 3,
                                lineStyle: {color: 'pink'}
                            }
                        },
                        data: [
                            {
                                value:data.zjQuantity /*5281*/, name: '浙江省', tooltip: {
                                trigger: 'item',
                                formatter: function (param) {
                                    return '本省独立电商数量：' + '<em style="color: pink;font-size:20px"">' + $.format(param.value, 3, ',') + '</em>家，<br/>' +
                                        '在全国占比：' + '<em style="color: pink;font-size:20px"">' + param.percent + '%</em>'
                                }
                            }
                            },
                            {
                                value: data.exceptZjQuantity/*63126*/,
                                name: '',

                                label: {
                                    normal: {
                                        show: false
                                    }
                                },
                                labelLine: {
                                    normal: {
                                        show: false
                                    },
                                    emphasis:
                                    {
                                    show: false
                                }
                            },
                                tooltip: {
                                    show: false
                                }
                            

        },
                        ]
                    },
                    {
                        color: ['#CFCEED'],
                        tooltip: {show: false},
                        type: 'pie',
                        radius: ['30%', '35%'],
                        data: [{value: 0, name: '', label: {normal: {show: false}}, labelLine: {normal: {show: false}}}]
                    },
                    {

                        selectedMode: 'multiple',
                        color: ['#339DF1', '#8BC316', '#E54724', '#AEADED', '#FFC891', '#66CCCC', '#D3BC3A', '#FC3698', '#81FFFE', /*'#0200E2'*//*'#A1FA08'*/'#CA8EC4', '#FF00FF'],
                        type: 'pie',
                        radius: ['35%', '70%'],
                        avoidLabelOverlap: true,
                        label: {
                            normal: {
                                show: true,
                                position: 'inside',
                                formatter: function (param) {
                                    if(param.dataIndex<=3){
                                        return param.name;
                                    }else {
                                        return "";
                                    }
                                },
                                textStyle: {
//                            color:'#2319DC',
                                    fontWeight: 'bold'
                                }
                            },
                            emphasis: {
                                show: true,
                                lineStyle: {width: 1},
                                textStyle: {
//                            color:'#2319DC',
                                    fontSize: '18',
                                    fontWeight: 'bold'
                                }
                            }
                        },
                        labelLine: {
                            normal: {
                                show: true
                            }
                        },
                        tooltip: {
                            trigger: 'item',
//            formatter: "{a} <br/>{b}: {c} ({d}%)"
                            position: ['20%', '45%'],
                            formatter: function (param) {
//                        return '<em style="color: #339DF1;font-size:20px">'+param.name+'</em>'+'独立电商数量本省占比'+'<em style="color: #339DF1;font-size:20px"">'+param.percent+'%</em>';
//                        return '<em style="color: '+param.color+';font-size:20px">'+param.name+'</em>'+'独立电商数量本省占比'+'<em style="color: '+param.color+';font-size:20px">'+param.percent+'%</em>';
                                return '<em style="color: ' + param.color + ';font-size:20px">' + param.name + '</em>' + '独立电商数量：' + '<em style="color: ' + param.color + ';font-size:20px">' + $.format(param.value, 3, ',') + '</em>' + '家，' +
                                    '<br/>' + '在本省占比' + '<em style="color: ' + param.color + ';font-size:20px">' + param.percent + '%</em>';
                            }
                        },
                        data: data.quantityCityList/*[
                            {value: independentOnlineRetailerData[0][1], name: independentOnlineRetailerData[0][0]},
                            {
                                value: independentOnlineRetailerData[1][1],
                                name: independentOnlineRetailerData[1][0],
                                label: {normal: {show: false}, emphasis: {show: false}}
                            },
                            {
                                value: independentOnlineRetailerData[2][1],
                                name: independentOnlineRetailerData[2][0],
                                label: {normal: {show: false}, emphasis: {show: false}}
                            },
                            {
                                value: independentOnlineRetailerData[3][1],
                                name: independentOnlineRetailerData[3][0],
                                label: {normal: {show: false}, emphasis: {show: false}}
                            },
                            {
                                value: independentOnlineRetailerData[4][1],
                                name: independentOnlineRetailerData[4][0],
                                label: {normal: {show: false}, emphasis: {show: false}}
                            },
                            {value: independentOnlineRetailerData[5][1], name: independentOnlineRetailerData[5][0]},
                            {
                                value: independentOnlineRetailerData[6][1],
                                name: independentOnlineRetailerData[6][0],
                                label: {normal: {show: false}, emphasis: {show: false}}
                            },
                            {
                                value: independentOnlineRetailerData[7][1],
                                name: independentOnlineRetailerData[7][0],
                                label: {normal: {show: false}, emphasis: {show: false}}
                            },
                            {
                                value: independentOnlineRetailerData[8][1],
                                name: independentOnlineRetailerData[8][0],
                                label: {normal: {show: false}, emphasis: {show: false}}
                            },
                            {value: independentOnlineRetailerData[9][1], name: independentOnlineRetailerData[9][0]},
                            {
                                value: independentOnlineRetailerData[10][1],
                                name: independentOnlineRetailerData[10][0],
                                label: {normal: {show: false}, emphasis: {show: false}}
                            }
                        ]*/
                    }
                ]
            };
            //独立电商数量占比
            echarts_generate_graph('independentOnlineRetailer', independent_online_retailer_option);
        };


        //industry_overview.jsp
        //占比前三的畅销行业
/*        $('#myStat').circliful();
        $('#myStat1').circliful();
        $('#myStat2').circliful();*/

        //本省B店、C店行业分布情况:dataMap1:行业a分布指数;dataMap2:行业数量分布指数.
        var dataMap1 = {
            "BnvZhuang": [281.84,310.02,496.03,700.65,998.26,558.64],
            "CnvZhuang": [297.26,312.9,325.42,299.74,315.52,353.36],
            "BbanGongHaoCai": [1.95,2.15,3.44,4.86,6.92,81.65],
            "CbanGongHaoCai": [23.36,24.59,25.57,9.97,10.49,11.75],
            "BjiaYongDianQi": [17.45,19.19,30.70,43.37,61.79,131.30],
            "CjiaYongDianQi": [72.97,76.81,79.88,156.63,164.87,181.66],
            "BjiaJuShengHuo": [52.65,57.92,92.67,130.90,186.50,628.83],
            "CjiaJuShengHuo": [276.43,290.98,302.62,190.08,200.09,224.10],
            "BqiCheYongPin": [10.47,11.52,18.43,26.04,37.09,337.09],
            "CqiCheYongPin": [89.57,94.28,98.05,203.37,214.08,239.77],
            "BshouJiShuMa": [32.64,35.9,57.44,81.13,115.60,111.73],
            "CshouJiShuMa": [39.58,41.66,43.33,52.28,55.04,61.64],
            "BwuJin": [4.00,4.4,7.04,9.94,14.17,124.62],
            "CwuJin": [42.09,44.3,46.07,46.74,49.21,55.04],
            "BmeiZhuangHuLi": [17.75,19.53,31.25,44.14,62.89,82.60],
            "CmeiZhuangHuLi": [60.80,64,66.56,140.68,148.08,165.85],
            "BneiYi": [74.72,82.19,131.50,185.75,264.65,165.21],
            "CneiYi": [64.48,67.87,70.58,70.01,73.69,82.53],
            "BmuYingYongPin": [115.36,126.9,203.04,286.79,408.62,401.55],
            "CmuYingYongPin": [191.88,201.98,210.06,180.56,190.06,212.86],
            "BxieBaoPeiShi": [114.75,126.22,201.95,285.26,406.43,360.49],
            "CxieBaoPeiShi": [202.88,213.56,222.10,199.83,210.35,240.59],
            "BliPin": [8.52,9.37,14.99,21.18,30.17,295.55],
            "CliPin": [78.57,82.7,86.01,62.70,66.00,73.92],
            "ByunDongHuWai": [12.83,14.11,22.58,31.89,45.43,162.82],
            "CyunDongHuWai": [64.48,67.87,70.58,102.35,107.74,120.67],
            "BlingShiTeChan": [12.86,14.15,22.64,31.98,45.56,83.56],
            "ClingShiTeChan": [88.30,92.95,96.67,52.28,55.04,61.64],
            "BdianNaoBanGong": [6.26,6.89,11.02,15.57,22.19,80.22],
            "CdianNaoBanGong": [60.61,63.8,76.56,149.32,157.18,166.04],
            "BtuShuYinXiang": [0,0,0,0,0,6.21],
            "CtuShuYinXiang": [56.36,59.33,61.70,1.55,1.63,1.83],
            "BnanZhuang": [261.93,288.12,460.99,651.15,927.75,435.93],
            "CnanZhuang": [124.51,131.06,136.30,167.93,176.77,197.98],
            "BqiTa": [0,0,0,0,0,0],
            "CqiTa": [0.38,0.4,0.42,0,0,0]
        };
        var dataMap2 = {
            "BnvZhuang": [1262,1269,1215,1191,1147,1170],
            "CnvZhuang": [983298,984954,1004653,1026785,1037157,1039941],
            "BbanGongHaoCai": [164,162,166,169,161,171],
            "CbanGongHaoCai": [33501,34941,35640,37245,37621,37621],
            "BjiaYongDianQi": [263,269,260,264,270,275],
            "CjiaYongDianQi": [73091,74071,75552,80727,81542,81762],
            "BjiaJuShengHuo": [1259,1265,1248,1262,1232,1317],
            "CjiaJuShengHuo": [359021,360900,368118,387319,391231,395143],
            "BqiCheYongPin": [695,707,698,696,687,706],
            "CqiCheYongPin": [112752,114008,116288,122831,124072,125313],
            "BshouJiShuMa": [219,223,221,226,227,234],
            "CshouJiShuMa": [145701,146415,149343,155754,157327,158904],
            "BwuJin": [233,238,235,238,236,261],
            "CwuJin": [75079,76633,78166,81754,82580,82677],
            "BmeiZhuangHuLi": [166,162,164,166,160,173],
            "CmeiZhuangHuLi": [132197,133536,136207,142875,144318,144241],
            "BneiYi": [358,363,349,344,341,346],
            "CneiYi": [109729,110616,112828,115241,116405,117569],
            "BmuYingYongPin": [861,864,850,841,821,841],
            "CmuYingYongPin": [370082,379322,386908,398893,402922,406951],
            "BxieBaoPeiShi": [793,801,751,777,741,755],
            "CxieBaoPeiShi": [399609,406350,414477,429934,434277,438620],
            "BliPin": [617,622,601,604,595,619],
            "CliPin": [190068,195275,199181,206765,208854,209063],
            "ByunDongHuWai": [331,337,319,325,327,341],
            "CyunDongHuWai": [94017,95568,97479,104222,105275,105722],
            "BlingShiTeChan": [175,171,169,172,167,175],
            "ClingShiTeChan": [136926,138505,141275,145910,147384,147384],
            "BdianNaoBanGong": [163,166,168,164,166,168],
            "CdianNaoBanGong": [66326,66124,67446,71343,72064,73601],
            "BtuShuYinXiang": [16,15,17,16,14,13],
            "CtuShuYinXiang": [73998,75460,76969,82065,82894,83001],
            "BnanZhuang": [958,966,921,929,912,913],
            "CnanZhuang": [300947,311085,317307,324658,327937,329166],
            "BqiTa": [1,0,0,2,0,0],
            "CqiTa": [1124,1111,1133,1093,1007,1012]
        };

        //本省B店、C店行业分布情况:生成container1_div，container2_div图表
        /* echarts_generate_graph('container1_div',myChartOption1(dataMap1["Bnz"], dataMap1["Cnz"]));
         echarts_generate_graph('container2_div',myChartOption2(dataMap2["Bnz"], dataMap2["Cnz"]));*/
/*        var myChart1 = echarts.init(document.getElementById('container1_div'));
        myChart1.setOption(myChartOption1(dataMap1["BnvZhuang"], dataMap1["CnvZhuang"]));
        var myChart2 = echarts.init(document.getElementById('container2_div'));
        myChart2.setOption(myChartOption2(dataMap2["BnvZhuang"], dataMap2["CnvZhuang"]));*/
        //B、C店行业分布情况导航js
        /*  var industry_nav = new Pingan.SelectHandler($("#analysis_ul li"), false, true);
        industry_nav.selected = function (item) {
          if (item.attr("data-nav") == 0) {
                myChart1.setOption(myChartOption1(dataMap1["BnvZhuang"], dataMap1["CnvZhuang"]));
                myChart2.setOption(myChartOption2(dataMap2["BnvZhuang"], dataMap2["CnvZhuang"]));
            } else if (item.attr("data-nav") == 1) {
                myChart1.setOption(myChartOption1(dataMap1["BshouJiShuMa"], dataMap1["CshouJiShuMa"]));
                myChart2.setOption(myChartOption2(dataMap2["BshouJiShuMa"], dataMap2["CshouJiShuMa"]));
            } else if (item.attr("data-nav") == 2) {
                myChart1.setOption(myChartOption1(dataMap1["BlingShiTeChan"], dataMap1["ClingShiTeChan"]));
                myChart2.setOption(myChartOption2(dataMap2["BlingShiTeChan"], dataMap2["ClingShiTeChan"]));
            } else if (item.attr("data-nav") == 3) {
                myChart1.setOption(myChartOption1(dataMap1["BjiaJuShengHuo"], dataMap1["CjiaJuShengHuo"]));
                myChart2.setOption(myChartOption2(dataMap2["BjiaJuShengHuo"], dataMap2["CjiaJuShengHuo"]));
            } else if (item.attr("data-nav") == 4) {
                myChart1.setOption(myChartOption1(dataMap1["BmuYingYongPin"], dataMap1["CmuYingYongPin"]));
                myChart2.setOption(myChartOption2(dataMap2["BmuYingYongPin"], dataMap2["CmuYingYongPin"]));
            } else if (item.attr("data-nav") == 5) {
                myChart1.setOption(myChartOption1(dataMap1["BmeiZhuangHuLi"], dataMap1["CmeiZhuangHuLi"]));
                myChart2.setOption(myChartOption2(dataMap2["BmeiZhuangHuLi"], dataMap2["CmeiZhuangHuLi"]));
            } else if (item.attr("data-nav") == 6) {
                myChart1.setOption(myChartOption1(dataMap1["BxieBaoPeiShi"], dataMap1["CxieBaoPeiShi"]));
                myChart2.setOption(myChartOption2(dataMap2["BxieBaoPeiShi"], dataMap2["CxieBaoPeiShi"]));
            } else if (item.attr("data-nav") == 7) {
                myChart1.setOption(myChartOption1(dataMap1["BtuShuYinXiang"], dataMap1["CtuShuYinXiang"]));
                myChart2.setOption(myChartOption2(dataMap2["BtuShuYinXiang"], dataMap2["CtuShuYinXiang"]));
            } else if (item.attr("data-nav") == 8) {
                myChart1.setOption(myChartOption1(dataMap1["BliPin"], dataMap1["CliPin"]));
                myChart2.setOption(myChartOption2(dataMap2["BliPin"], dataMap2["CliPin"]));
            } else if (item.attr("data-nav") == 9) {
                myChart1.setOption(myChartOption1(dataMap1["ByunDongHuWai"], dataMap1["CyunDongHuWai"]));
                myChart2.setOption(myChartOption2(dataMap2["ByunDongHuWai"], dataMap2["CyunDongHuWai"]));
            } else if (item.attr("data-nav") == 10) {
                myChart1.setOption(myChartOption1(dataMap1["BdianNaoBanGong"], dataMap1["CdianNaoBanGong"]));
                myChart2.setOption(myChartOption2(dataMap2["BdianNaoBanGong"], dataMap2["CdianNaoBanGong"]));
            } else if (item.attr("data-nav") == 11) {
                myChart1.setOption(myChartOption1(dataMap1["BnanZhuang"], dataMap1["CnanZhuang"]));
                myChart2.setOption(myChartOption2(dataMap2["BnanZhuang"], dataMap2["CnanZhuang"]));
            } else if (item.attr("data-nav") == 12) {
                myChart1.setOption(myChartOption1(dataMap1["BqiCheYongPin"], dataMap1["CqiCheYongPin"]));
                myChart2.setOption(myChartOption2(dataMap2["BqiCheYongPin"], dataMap2["CqiCheYongPin"]));
            } else if (item.attr("data-nav") == 13) {
                myChart1.setOption(myChartOption1(dataMap1["BjiaYongDianQi"], dataMap1["CjiaYongDianQi"]));
                myChart2.setOption(myChartOption2(dataMap2["BjiaYongDianQi"], dataMap2["CjiaYongDianQi"]));
            } else if (item.attr("data-nav") == 14) {
                myChart1.setOption(myChartOption1(dataMap1["BwuJin"], dataMap1["CwuJin"]));
                myChart2.setOption(myChartOption2(dataMap2["BwuJin"], dataMap2["CwuJin"]));
            } else if (item.attr("data-nav") == 15) {
                myChart1.setOption(myChartOption1(dataMap1["BneiYi"], dataMap1["CneiYi"]));
                myChart2.setOption(myChartOption2(dataMap2["BneiYi"], dataMap2["CneiYi"]));
            } else if (item.attr("data-nav") == 16) {
                myChart1.setOption(myChartOption1(dataMap1["BbanGongHaoCai"], dataMap1["CbanGongHaoCai"]));
                myChart2.setOption(myChartOption2(dataMap2["BbanGongHaoCai"], dataMap2["CbanGongHaoCai"]));
            } else if (item.attr("data-nav") == 17) {
                myChart1.setOption(myChartOption1(dataMap1["BqiTa"], dataMap1["CqiTa"]));
                myChart2.setOption(myChartOption2(dataMap2["BqiTa"], dataMap2["CqiTa"]));
            }

        };*/
        initOption();


        var initBRegisterInfo = function () {
            $.ajax({
                url:basePath+"/gov/user/ec/operate/shop/b/reg",
                success:function (result) {
                    if(result.statusCode==1){
                        bRegisterInfo(result.data);
                    }
                }
            });
        };
        initBRegisterInfo();
        var bRegisterInfo = function (data) {
            //bstore_regester.jsp      B店注册情况
            // 本省B店注册资金及年限分布情况
            var show_register_money_option = {
                title: {
                    text: '注册资金',
                    subtext: '',
                    x: 'center',
                    y: 'center',
                    textStyle: {
                        fontWeight: 'normal',
                        fontSize: 16
                    }
                },
                tooltip: {
                    show: false,
                    trigger: 'item',
                    formatter: "{a} <br/>{b}: {c} ({d}%)"
                },
                legend: {
                    orient: 'horizontal',
                    bottom: '0%',
                    data: data.capitalConditions/*['<10w', '10w-50w', '50w-100w', '100w-500w', '>500w']*/
                },
                series: [
                    {
                        name: '店家百分比',
                        type: 'pie',
                        selectedMode: 'single',
                        radius: ['25%', '58%'],
                        color: ['#86D560', '#AF89D6', '#59ADF3', '#FF999A', '#FFCC67'],

                        label: {
                            normal: {
                                position: 'inner',
                                formatter: '{d}%',

                                textStyle: {
                                    color: '#fff',
                                    fontWeight: 'bold',
                                    fontSize: 14
                                }
                            }
                        },
                        labelLine: {
                            normal: {
                                show: false
                            }
                        },
                        data: data.capitalList/*[
                            {value: 3661, name: '<10w'},
                            {value: 5713, name: '10w-50w'},
                            {value: 9938, name: '50w-100w'},
                            {value: 17623, name: '100w-500w'},
                            {value: 3299, name: '>500w'}
                        ]*/
                    },
                    {
                        name: '店家数量',
                        type: 'pie',
                        radius: ['58%', '83%'],
                        itemStyle: {
                            normal: {
                                color: '#F2F2F2'
                            },
                            emphasis: {
                                color: '#ADADAD'
                            }
                        },
                        label: {
                            normal: {
                                position: 'inner',
                                formatter: '{c}家',
                                textStyle: {
                                    color: '#777777',
                                    fontWeight: 'bold',
                                    fontSize: 14
                                }
                            }
                        },
                        data: data.capitalList/*[
                            {value: 3661, name: '<10w'},
                            {value: 5713, name: '10w-50w'},
                            {value: 9938, name: '50w-100w'},
                            {value: 17623, name: '100w-500w'},
                            {value: 3299, name: '>500w'}
                        ]*/
                    }
                ]
            };
            var show_register_year_option = {
                title: {
                    text: '注册年限',
                    subtext: '',
                    x: 'center',
                    y: 'center',
                    textStyle: {
                        fontWeight: 'normal',
                        fontSize: 16
                    }
                },
                tooltip: {
                    show: false,
                    trigger: 'item',
                    formatter: "{a} <br/>{b}: {c} ({d}%)"
                },
                legend: {
                    orient: 'horizontal',
                    bottom: '0%',
                    data:data.yearConditions /*['<1年', '1年-3年', '3年-5年', '5年-10年', '>10年']*/
                },
                series: [
                    {
                        name: '店家百分比',
                        type: 'pie',
                        selectedMode: 'single',
                        radius: ['25%', '58%'],
                        color: ['#86D560', '#AF89D6', '#59ADF3', '#FF999A', '#FFCC67'],

                        label: {
                            normal: {
                                position: 'inner',
                                formatter:'{d}%',
                                textStyle: {
                                    color: '#fff',
                                    fontWeight: 'bold',
                                    fontSize: 14
                                }
                            }
                        },
                        labelLine: {
                            normal: {
                                show: false
                            }
                        },
                        data:data.yearList/*[
                            {
                                value: 9656,
                                name: '<1年'
                            },
                            {
                                value: 6558,
                                name: '1年-3年'
                            },
                            {
                                value: 9938,
                                name: '3年-5年'
                            },
                            {
                                value: 10541,
                                name: '5年-10年'
                            },
                            {
                                value: 3540,
                                name: '>10年'
                            }
                        ]*/
                    },
                    {
                        name: '店家数量',
                        type: 'pie',
                        radius: ['58%', '83%'],
                        itemStyle: {
                            normal: {
                                color: '#F2F2F2'
                            },
                            emphasis: {
                                color: '#ADADAD'
                            }
                        },
                        label: {
                            normal: {
                                position: 'inner',
                                formatter: '{c}家',
                                textStyle: {
                                    color: '#777777',
                                    fontWeight: 'bold',
                                    fontSize: 14
                                }
                            }
                        },
                        data: data.yearList/*[
                            {
                                value: 9656,
                                name: '<1年'
                            },
                            {
                                value: 6558,
                                name: '1年-3年'
                            },
                            {
                                value: 9938,
                                name: '3年-5年'
                            },
                            {
                                value: 10541,
                                name: '5年-10年'
                            },
                            {
                                value: 3540,
                                name: '>10年'
                            }
                        ]*/
                    }
                ]
            };
            //本省B店注册资金分布情况
            echarts_generate_graph('showRegisterMoney_double_pie', show_register_money_option);
            //本省B店注册年限分布情况
            echarts_generate_graph('showRegisterYear_double_pie', show_register_year_option);
        };

    };
    Pingan.Init();
    //生成echarts图表公共方法
    function echarts_generate_graph(container, option, opts) {
        var graph = echarts.init(document.getElementById(container));
        graph.setOption(option);
    };

    function initShopTypeChartsOption(data, dataType) {
        option = {
            title: {
                text: '',
                left: 'center'
            },
            tooltip: {
                trigger: 'item',
                position: function (point, params, dom) {
                    return [point[0] - 100, point[1] - 53];
                },
                formatter: function (params) {
                    if (dataType == "3") {
                        return '区域分布占比<em style="color: #FF6633">' + params.data.proportion/100 + '%</em>';
                    }
                    return '区域分布占比<em style="color: #FF6633">' + params.data.proportion/100 + '%</em><br/>交易额<em style="color: #FF6633">' + $.numberFormat(params.data.amount/100,2) + '亿元</em>';
                }
            },
            visualMap: {
                min: 0,
                max: data[0].value,
                padding: [6, 90],
                left: 'right',
                top: 'bottom',
                text: ['高', '低'],           // 文本，默认为数值文本
                calculable: false,
                color: ['#AEADED', '#EDEDED']
            },
            series: [
                {
                    type: 'map',
                    map: "浙江",
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
        };
        return option;
    }

    var initIndustryDist = function () {
        var industryDist = function(industryCode){
            $.ajax({
                url: basePath + "/gov/user/ec/operate/dist/industry?industryCode="+industryCode,
                success: function (result) {
                    if (result.statusCode == 1) {
                        echarts_generate_graph('container1_div', myChartOption1(result.data));
                        echarts_generate_graph('container2_div', myChartOption2(result.data));
                    }
                }
            });
        };
        var industry_nav = new Pingan.SelectHandler($("#analysis_ul li"), false, true);
        industry_nav.selected = function (item) {
            if(item.attr("data-nav")!=-1){
                industryDist(item.attr("data-nav"));
            }
        };
        $("#analysis_ul li:first").click();
    };
    initIndustryDist();
    function myChartOption1(data) {
        var option = {
/*            tooltip: {
             trigger: 'axis',
                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                },
             },*/
            tooltip: {
                trigger: 'axis',
                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                },
                backgroundColor: '#F7F9FB',
                borderColor: '#92DAFF',
                borderWidth: '1px',
                textStyle: {color: 'black'},
                position: function (point, params, dom) {
                    return [point[0] - 50, point[1] - 20];
                },
                formatter:function (params) {
                    var html="";
                    for(var i=0;i<params.length;i++)
                    {
                        html+="<div style='float:left;width: 10px; height: 10px; background: "+params[i].color+"; -moz-border-radius: 50px; -webkit-border-radius: 50px; border-radius: 50px;margin-top:6px;margin-right: 5px;'></div> "+"<p style='text-align: left;margin-right: 7px;'>"+params[i].seriesName+": "+$.numberFormat(params[i].data[1],2)+"</p>";
                    }
                    return "<div style='padding: 5px 10px 5px 10px;width: auto;'>"+html+"</div>";
                },
            },
            legend: {
                data: ['B店', 'C店'],
                bottom: '0%'
            },
            grid: {
                left: '4%',
                right: '5%',
                bottom: '10%',
                containLabel: true
            },
            xAxis: [
                {
                    type: 'category',
                    data: data.categoryList/*['五月','六月','七月','八月','九月','十月']*/
                }
            ],
            yAxis: [
                {
                    type: 'value',
                    //name: '单位：亿元'
                }
            ],
            series: [
                {
                    name: 'B店',
                    type: 'bar',
                    //barWidth:35,
                    itemStyle: {
                        normal: {
                            color: '#00BFFF'

                        }
                    },
                    data: data.bAmount
                },
                {
                    name: 'C店',
                    type: 'bar',
                    //barWidth:35,
                    itemStyle: {
                        normal: {
                            color: '#00FF00'
                        }
                    },
                    data: data.cAmount
                }
            ]
        };
        return option;
    }

    function myChartOption2(data) {
        var option1 = {
            tooltip: {
                trigger: 'axis',
                backgroundColor: '#F7F9FB',
                borderColor: '#92DAFF',
                borderWidth: '1px',
                textStyle: {color: 'black'},
                position: function (point, params, dom) {
                    return [point[0] - 155, point[1] - 53];
                },
                formatter:function (params) {
                    var html="";
                    for(var i=0;i<params.length;i++)
                    {
                        html+="<div style='float:left;width: 10px; height: 10px; background: "+params[i].color+"; -moz-border-radius: 50px; -webkit-border-radius: 50px; border-radius: 50px;margin-top:6px;margin-right: 5px;'></div> "+"<p style='text-align: left;margin-right: 7px;'>"+params[i].seriesName+": "+$.format(params[i].data[1],3,',')+"</p>";
                    }
                  return "<div style='padding: 5px 10px 5px 10px;width: auto;'>"+html+"</div>";
                },
            },
            legend: {
                data: ['B店', 'C店'],
                bottom: '0%'
            },
            grid: {
                left: '4%',
                right: '5%',
                bottom: '10%',
                containLabel: true
            },
            xAxis: [
                {
                    type: 'category',
                    boundaryGap: false,
                    data: data.categoryList/*['五月','六月','七月','八月','九月','十月']*/
                }
            ],
            yAxis: [
                {
                   // name: '单位：家',
                    type: 'value',
                }
            ],
            series: [
                {
                    name: 'B店',
                    type: 'line',
                    // stack: '总量',
                    areaStyle: {
                        normal: {
                            color: '#00BFFF'
                        }
                    },
                    data: data.bQuantity
                },
                {
                    name: 'C店',
                    type: 'line',
                   /* stack: '总量',*/
                    areaStyle: {
                        normal: {
                            color: '#32CD32'
                        }
                    },
                    data: data.cQuantity
                }
            ]
        };
        return option1;
    }

    function initOption() {

        var handler = {};
        handler.isShow = false;
        handler.turnDiv = function (action) {
            if (action == "on") {
                handler.isShow = true;
            } else {
                handler.isShow = false;
            }
            setTimeout(function () {
                if (handler.isShow) {
                    $("#enterDiv").fadeIn();
                } else {
                    $("#enterDiv").fadeOut();
                }
            }, 100);
        }

        $("#nameLabel,#enterDiv").on({
            "mouseover": function () {
                handler.turnDiv("on");
            },
            "mouseleave": function () {
                handler.turnDiv("off");
            }
        });
    }

});


