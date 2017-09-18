require.config({
    waitSeconds: 0,
    baseUrl: './',
    paths: {
        jquery_lib: 'js/jquery',
        echarts: 'js/echarts.min',
    },
    shim: {
        echarts: {
            deps: ['jquery_lib']
        },

    },
    deps: ['jquery_lib', 'echarts']
});

require(['echarts'], function (echarts) {


    var href = location.href;
    var c = 1;

    var step = /c\=(\d{1,1})/.exec(href);
    if(step && step.length>1) {
        c = parseInt(step[1])
    }
    var lrrIndustryArray = ["制造业", "住宿和餐饮", "软件和信息技术", "房地产", "采矿业","居民服务","科研和技术"	,"卫生和社会工作","教育","公共管理"];
    var lrrNumArray = [461, 179, 133, 113, 110,102,100,94,92,83];
    lrrNumArray = lrrNumArray.reverse();
    var lrrIndustryArray3= ["<50", "50-100", "100-500", "500-1000", "1000-2000",">2000"];
    var lrrNumArray3= [76,19,39,14,5,7];
    var lrrIndustryArray4= ["<100", "100-200", "200-300", ">300"];
    var lrrNumArray4= [2,5,1,3];
    switch (c) {
        case  1:
            var lrrIndustryArray1 = ["公共管理", "教育", "卫生和社会工作", "居民服务", "科研和技术服务", "住宿和餐饮业", "房地产", "软件和信息技术 ", "制造业", "文娱和体育", "批发和零售", "租赁和商务服务", "采矿业", "能源供应", "金融业", "交通运输", "建筑业", "农、林、牧、渔业"];
            var lrrNumArray1 = [653, 194, 153, 127, 126, 108, 106, 103, 91, 89, 78, 76, 70, 66, 64, 63, 60, 60];
            var lrrIndustryArray2 = ["杭州得银企业咨询有限公司", "杭州泰富投资管理有限公司", "杭州前锦众程人力资源有限公司", "浙江天猫技术有限公司", "杭州普吉投资管理有限公司", "杭州易才人力资源管理有限公司", "杭州娃哈哈宏盛食品饮料营销有限公司", "杭州阿里妈妈软件服务有限公司 ", "杭州江南人才服务有限公司", "杭州金粟投资管理有限公司"];
            var lrrNumArray2 = [4637,3476,3204,2853,2046,2007,1819,1799,1776,1720];
            var topName='全行业';
            break
        case 2:
            var lrrIndustryArray1 = ["烟草制品业", "纺织服装、服饰业", "酒、饮料和精制茶", "农副食品加工业", "纺织业", "橡胶和塑料制品业", "造纸和纸制品业", "有色金属冶炼和加工","文工体育和娱乐用品制造","印刷和记录媒介复制","计算机和其他电子设备制造","皮革、毛皮、羽毛制品和制鞋业","石油加工和核燃料加工","医药制造","其他制造业","化学原料和化学制品","仪器仪表","黑色金属冶炼和加工"];
            var lrrNumArray1 = [244,121,118,113,111,109,104,101,100,97,95,95,93,92,92,88,88,87];
            var lrrIndustryArray2 = ["杭州天堂雨衣有限公司", "上虞市顺风金属表面处理有限公司", "杭州永通管业有限公司", "杭州余杭新文服饰有限公司", "杭州华谊服装有限公司", "金普奥膜科技（杭州）有限公司", "杭州明成制衣有限公司", "杭州华泰光纤技术有限公司","杭州特璐咔羽绒制品有限公司","浙江圣山染整有限公司"];
            var lrrNumArray2 = [756,690,677,585,545,541,535,524,508,507];
            var topName='制造业';
            break
        case 3:
            var lrrIndustryArray1 = ["毛纺织及染整精加工", "非家用纺织制成品制造", "丝绢纺织及印染精加工", "麻纺织及染整精加工", "家用纺织制成品制造", "棉纺织及印染精加工", "针织或钩针编织物", "化纤织造及印染精加工 "];
            var lrrNumArray1 = [288, 133, 123, 114, 113, 98, 98, 45];
            var lrrIndustryArray2 = ["杭州明成制衣有限公司", "桐庐申丰提花布有限公司", "浙江凯胜畜产品加工有限公司", "杭州路联皮革有限公司", "杭州春风针织服饰有限公司", "杭州金弘三鸟羽绒制品有限公司", "杭州望涛皮革制品有限公司", "浙江华银非织造布有限公司","杭州福达纺织品印染有限公司","杭州金龙箱包有限公司"];
            var lrrNumArray2 = [535,494,348,334,312,305,302,299,293,280];
            var topName='纺织业';

            break
        case 4:
            var lrrIndustryArray1 = ["毛织造加工", "毛条和毛纱线加工"];
            var lrrNumArray1 = [297, 170];
            var lrrIndustryArray2 = ["杭州明成制衣有限公司", "杭州中希毛纺织有限公司", "杭州阿娟纱业有限公司", "杭州霞腾毛纺织有限公司", "杭州亮盈制衣有限公司", "杭州安东媛毛纺织有限公司", "杭州方茂科技有限公司", "桐庐联诚服饰有限公司", "杭州登峰绒线有限公司", "杭州澳贝呢绒有限公司"];
            var topName='毛纺织及染整精加工';
            var lrrNumArray2 = [535,360,309,201,174,149,142,130,114,112];

            break
    }
    for(i=0;i<lrrIndustryArray2.length;i++){
        var li='<li>'+lrrIndustryArray2[i]+'</li>';
        $('.company-list').append(li);
        var liData='<li>'+lrrNumArray2[i]+'</li>';
        $('.company-list-data').append(liData);
    }
    $('.top-name').html(topName);
    $(".company-list li").click(function () {
        window.location = './industry.html';
    });
    if (companyCfg.page == 'digest') {
        industry_digest(lrrIndustryArray, lrrNumArray);
        $("#hangzhou_digest_icon").click(function () {
            window.location = './industry_comparison.jsp';
        });
    } else if (companyCfg.page == 'detail') {
        echart_detail_contrast(lrrIndustryArray1, lrrNumArray1);
    } else if (companyCfg.page == 'industry_operate') {
        var scat_data = [[[520, 800, '浙江江山农村银行有限公司', '0~5%'], [800, 800, '杭州双宇物流有限公司', '0~5%']], [[375, 410, '杭州明成制衣有限公司', '5%~10%']], [[2500, 800, '阿里巴巴网络科技有限公司', '10%~20%']], [[1000, 2500, '百度有限公司', '20%~30%']]];
        company_operate_ability_analytic_1_scatt(scat_data, 30);
        company_operate_ability_analytic_2(lrrIndustryArray3, lrrNumArray3);
        company_operate_ability_analytic_3(lrrIndustryArray4, lrrNumArray4);
        company_operate_ability_analytic_4(lrrIndustryArray, lrrIndustryArray);
    } else if (companyCfg.page == 'company_operate') {
        var scat_data = [[[520, 800, '浙江江山农村银行有限公司', '0~5%'], [800, 800, '杭州双宇物流有限公司', '0~5%']], [[375, 410, '杭州明成制衣有限公司', '5%~10%']], [[2500, 800, '阿里巴巴网络科技有限公司', '10%~20%']], [[1000, 2500, '百度有限公司', '20%~30%']]];
        company_operate_ability_analytic_1_scatt(scat_data, 30);
        company_operate_ability_analytic_2(lrrIndustryArray3, lrrNumArray3);
        company_operate_ability_analytic_3(lrrIndustryArray4, lrrNumArray4);
        company_operate_ability_analytic_5(lrrIndustryArray, lrrIndustryArray);
    }


    function industry_digest(lrrIndustryArray, lrrNumArray) {
        //var data = [ '图书音像','鞋包配饰','美妆护理','母婴用品','家居生活','零售特产','手机数码','女装'];
        var myChart_bar = echarts.init(document.getElementById('echart_industry_operate_development'));
        var i = 0;
        var option_bar = {
            tooltip: {
                show: false
            },

            title: {
                text: '行业信用排行',
                left: 'left',
                textStyle: {
                    color: '#CCCCCC',
                    fontStyle: 'normal',
                    fontWeight: '700',
                    fontFamily: 'STHeitiSC-Medium',
                    fontSize: 16,
                },
                // subtext: '（"十三五"规划重点发展行业）',
                // subtextStyle: {
                // 	color: '#CCCCCC',
                // 	fontStyle: 'normal',
                // 	fontWeight: 500,
                // 	fontFamily: 'sans-serif',
                // 	fontSize: 12,
                // },
            },

            legend: {
                show: false,
                data: [''],
                bottom: '0%'
            },
            grid: {
                left: '4%',
                right: '5%',
                bottom: '1%',
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

                    splitLine: {
                        show: false
                    },

                    axisLabel: {
                        show: false,
                        textStyle: {
                            color: '#A1A1A1'
                        }
                    },

                    min: 0
                    // max: 100
                }
            ],
            yAxis: [
                {
                    type: 'category',
                    axisLine: {
                        show: false
                    },
                    axisLabel: {
                        margin: 15,
                        formatter: function (value, index) {
                            if (value.length == 2) {
                                value = value + "　　　　　　";
                            }
                            if (value.length == 3) {
                                value = value + "　　　　　";
                            }
                            if (value.length == 4) {
                                value = value + "　　　　";
                            }
                            if (value.length == 5) {
                                value = value + "　　　";
                            }
                            if (value.length == 6) {
                                value = value + "　　";
                            }
                            if (value.length == 7) {
                                value = value + "　";
                            }
                            if (value.length == 8) {
                                value = value + "";
                            }
                            return "  " + value;
                        },
                        textStyle: {
                            color: function (value) {
                                if ($.inArray(value, lrrIndustryArray) > 10) {
                                    return "#FF3D0D";
                                } else {
                                    return "white";
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
                    itemStyle: {
                        normal: {
                            color: '#FFCC33'
                        }
                    },
                    label: {
                        normal: {
                            show: false,
                            position: 'right',
                            formatter: function (data) {
                                return data.value / 100.00 + "%";
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
                    data: lrrNumArray/*[8, 9, 12, 13, 14.5, 17, 23, 24]*/
                }
            ]
        };

        // 路径配置
        myChart_bar.setOption(option_bar);
        myChart_bar.on('click', function (params) {
            if (params.name === '制造业') {
                console.log(params);
                window.location = './industry_comparison.jsp';
                // 点击到了 markPoint 上
                if (params.seriesIndex === 5) {
                    // 点击到了 index 为 5 的 series 的 markPoint 上。
                }
                console.log(params);
            }

            //window.open('https://www.baidu.com/s?wd=' + encodeURIComponent(params.name));
        });
        return myChart_bar;
    }


    function echart_detail_contrast(lrrIndustryArray1, lrrNumArray1) {
        //var data = [ '图书音像','鞋包配饰','美妆护理','母婴用品','家居生活','零售特产','手机数码','女装'];
        var myChart_bar = echarts.init(document.getElementById('echart_industry_contrast'));
        var i = 0;

        var option = {

            title: {
                text: '区域各行业信用分数对比分析',
                left: 'left',
                textStyle: {
                    color: 'white',
                    fontStyle: 'normal',
                    fontWeight: '700',
                    fontFamily: 'STHeitiSC-Medium',
                    fontSize: 16,
                },
                // subtext: '（"十三五"规划重点发展行业）',
                // subtextStyle: {
                // 	color: '#CCCCCC',
                // 	fontStyle: 'normal',
                // 	fontWeight: 500,
                // 	fontFamily: 'sans-serif',
                // 	fontSize: 12,
                // },
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                    type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                },
                backgroundColor: '#F7F9FB',
                borderColor: '#92DAFF',
                borderWidth: '1px',
                textStyle: {color: 'black'},
                position: function (point, params, dom) {
                    return [point[0] - 50, point[1] + 20];
                }
            },
            legend: {
                show: false,
                data: ['信用分数', '经营指数'],
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
                    axisLine: {
                        show: false
                    },
                    // rotate: 60,
                    axisLabel: {
                        show: true,
                        textStyle: {
                            color: 'white'
                        },
                        formatter: function (value, index) {
                            var len = value.length;
                            var chuizhi = '';

                            for (var i = 0; i < len; i++) {
                                var temp = value[i];
                                chuizhi += temp + '\n';
                            }
                            return chuizhi;
                        },
                    },
                    type: 'category',
                    data:lrrIndustryArray1
                }
            ],
            yAxis: [
                {
                    axisLabel: {
                        show: false,
                        textStyle: {
                            color: 'blue'
                        },

                    },
                    splitLine: {
                        lineStyle: {
                            color: ['white'],
                            width: 1,
                            type: 'dashed',
                        }
                    },
                    axisLine: {
                        show: false
                    },
                    type: 'value',
                    name: ''
                }
            ],
            series: [
                {
                    name: '信用分数',
                    type: 'bar',
                    //barWidth:35,
                    itemStyle: {
                        normal: {
                            color: '#FFCC33'
                        }
                    },
                    barCategoryGap: '75%',
                    data: lrrNumArray1
                }
            ]
        };


        myChart_bar.setOption(option);
        myChart_bar.on('click', function (params) {
            if(c==4){
                return;
            }
            window.location='industry_comparison.jsp?c='+(c+1);
        });
        return myChart_bar;
    }


    function company_operate_ability_analytic_1_scatt(data, maxValue) {
        var myChart_bar = echarts.init(document.getElementById('company_operate_ability_anylytic1'));
        var option = {
            backgroundColor: 'rgba(90, 99, 120, 0.8)',
            title: {
                text: '2016年度毛纺织及染整精加工企业信用能力分析',
                left:'20',
                top:'20',
                textStyle: {
                    color: '#ffffff',
                    fontStyle: 'normal',
                    fontWeight: '700',
                    fontFamily: 'STHeitiSC-Medium',
                    fontSize: 16
                }
            },
            grid: {
                top:'100',
                left: '60',
                right: '100',
                bottom: '100',
                containLabel: true
            },
            legend: {
                // right: 10,
                show: false,
                bottom: 0,
                data: ['0~5', '5~10', '10~20', '20~30']

            },
            xAxis: {
                // name:'营收/万元',
                name: '',
                nameLocation: 'middle',
                nameGap: 30,
                nameTextStyle: {
                    color: 'white',
                },
                type: 'value',
                max: 392,
                splitLine: {
                    show: true,
                    lineStyle: {
                        type: 'dashed'
                    }
                },
                axisLabel: {
                    textStyle: {color: 'white'},

                }
            },
            label: {
                normal: {
                    show: false,
                    textStyle: {color: 'white'},
                    formatter: function (params) {
                        return params.value[2] + '\n\r' + params.value[0] + '%';
                    }
                }, emphasis: {
                    position: 'top',
                    textStyle: {
                        color:'#ffffff',
                        fontWeight: 'normal',
                        fontSize: 12
                    },
                    formatter: function (params) {
                        return params.value[2];
                    }
                }
            },
            yAxis: {
                name: '',
                nameLocation: 'middle',
                nameTextStyle: {
                    color: 'white',
                },
                nameGap: 50,
                axisLabel: {
                    textStyle: {color: 'white'},

                },
                nameRotate: 0,
                show: true,
                type: 'value',
                min: 0,
                max: 947,
                splitLine: {
                    lineStyle: {
                        type: 'dashed'
                    }
                },
                scale: true
            },
            series: [{
                name: '0~5',
                data: data[0],
                type: 'scatter',
                symbolSize: function (data) {
                    var size_data = data[0] / 1000;
                    return size_data < 2 ? size_data * 40 : (size_data < 3 ? size_data * 30 : (size_data < 10 ? size_data * 15 : size_data * 4));
                },

                label: {
                    emphasis: {
                        show: true,
                        formatter: function (param) {
                            return param.data[2];
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
                },
                markLine: {
                    /* data: [{
                     type: 'average',
                     name: '平均值'
                     }]*/
                    itemStyle: {
                        normal: {
                            // color: 各异,           // 标线主色，线色，symbol主色
                            // borderColor: 随color,     // 标线symbol边框颜色，优先于color
                            borderWidth: 2,          // 标线symbol边框线宽，单位px，默认为2
                            label: {

                                show: true,
                                formatter: function (param) {
                                    return '行业营收能力平均线';
                                },
                                // 可选为 'start'|'end'|'left'|'right'|'top'|'bottom'
                                position: 'end',
                                textStyle: {         // 默认使用全局文本样式，详见TEXTSTYLE
                                    color: 'white'
                                }
                            },
                            lineStyle: {
                                // color: 随borderColor, // 主色，线色，优先级高于borderColor和color
                                // width: 随borderWidth, // 优先于borderWidth
                                color: '#FF9933',
                                type: 'solid',
                                shadowColor: 'rgba(0,0,0,0)', //默认透明
                                shadowBlur: 5,
                                shadowOffsetX: 3,
                                shadowOffsetY: 3
                            }
                        }
                    },
                    data: [
                        [
                            {name: '标线1起点', value: 50, x: 350, y: 480},
                            {name: '标线1终点', x: 350, y: 85}
                        ],
                        [
                            {
                                name: '标线2起点', value: 100, x:100, y: 300, itemStyle: {
                                normal: {
                                    // color: 各异,           // 标线主色，线色，symbol主色
                                    // borderColor: 随color,     // 标线symbol边框颜色，优先于color
                                    borderWidth: 2,          // 标线symbol边框线宽，单位px，默认为2
                                    label: {
                                        show: true,
                                        formatter: function (param) {
                                            return '行\n业\n投\n入\n能\n力\n平\n均\n线';
                                        },
                                        // 可选为 'start'|'end'|'left'|'right'|'top'|'bottom'
                                        position: 'end',
                                        textStyle: {         // 默认使用全局文本样式，详见TEXTSTYLE
                                            color: 'white'
                                        }
                                    },
                                    lineStyle: {
                                        // color: 随borderColor, // 主色，线色，优先级高于borderColor和color
                                        // width: 随borderWidth, // 优先于borderWidth
                                        color: '#40CCA6',
                                        type: 'solid',
                                        shadowColor: 'rgba(0,0,0,0)', //默认透明
                                        shadowBlur: 5,
                                        shadowOffsetX: 3,
                                        shadowOffsetY: 3
                                    }
                                }
                            },
                            },
                            {
                                name: '标线2终点', x: 640, y: 300, itemStyle: {
                                normal: {
                                    // color: 各异,           // 标线主色，线色，symbol主色
                                    // borderColor: 随color,     // 标线symbol边框颜色，优先于color
                                    borderWidth: 2,          // 标线symbol边框线宽，单位px，默认为2
                                    label: {
                                        show: true,
                                        formatter: function (param) {
                                            return 'asdfsadf';
                                        },
                                        // 可选为 'start'|'end'|'left'|'right'|'top'|'bottom'
                                        position: 'end',
                                        textStyle: {         // 默认使用全局文本样式，详见TEXTSTYLE
                                            color: 'white'
                                        }
                                    },
                                    lineStyle: {
                                        // color: 随borderColor, // 主色，线色，优先级高于borderColor和color
                                        // width: 随borderWidth, // 优先于borderWidth
                                        color: '#ffffff',
                                        type: 'solid',
                                        shadowColor: 'rgba(0,0,0,0)', //默认透明
                                        shadowBlur: 5,
                                        shadowOffsetX: 3,
                                        shadowOffsetY: 3
                                    }
                                }
                            },
                            }
                        ]]
                },


            }, {
                name: '5~10',
                data: data[1],
                type: 'scatter',
                symbolSize: function (data) {
                    var size_data = data[0] / 1000;
                    // return size_data < 2 ? size_data * 20 : (size_data <= 5 ? size_data * 20 : (size_data <= 10 ? size_data * 4.5 : size_data * 4));

                    return 40;
                },
                label: {
                    emphasis: {
                        show: true,
                        formatter: function (param) {
                            return param.data[2];
                        },
                        position: 'top',
                        textStyle: {
                            // color: 'rgb(53, 255, 51)'
                            color:'#ffffff',
                            fontWeight: 'normal',
                            fontSize: 12
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
                    name: '10~20',
                    data: data[2],
                    type: 'scatter',
                    symbolSize: function (data) {
                        // var size_data = data[0] / 1000;
                        // var size_data = data[0] / 1000;
                        // return size_data * 20;
                        return 100;

                    },
                    label: {
                        emphasis: {
                            show: true,
                            formatter: function (param) {
                                return param.data[2];
                            },
                            position: 'top',
                            textStyle: {
                                // color: 'purple'
                                color:'#ffffff',
                                fontWeight: 'normal',
                                fontSize: 12
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
                    name: '20~30',
                    data: data[3],
                    type: 'scatter',
                    symbolSize: function (data) {
                        var size_data = data[0] / 1000;
                        return size_data * 50;
                    },
                    label: {
                        emphasis: {
                            show: true,
                            formatter: function (param) {
                                return param.data[2];
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
                }


            ]
        };
        myChart_bar.setOption(option);
    }

    function company_operate_ability_analytic_2(lrrIndustryArray3, lrrNumArray3) {
        var myChart_bar_ci = echarts.init(document.getElementById('company_operate_ability_anylytic2'));
        var myChart_bar_ci_option = {
            backgroundColor: 'rgba(90, 99, 120, 0.8)',
            title: {
                text: '毛纺织及染整精加工企业投入能力分布情况',
                textStyle: {
                    color: '#F2F2F2',
                    fontStyle: 'normal',
                    fontWeight: '200',
                    fontFamily: 'STHeitiSC-Medium',
                    fontSize: 14
                }
            }, tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },

            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            legend: {
                orient: 'vertical',
                top: 'middle',
                left: '280',
                align: 'left',
                textStyle: {
                    color: ['']

                },
                formatter: function (name) {
                    return name;
                },

                x: 'left',
                data: lrrIndustryArray3
            },
            series: [
                {

                    name: '访问来源',
                    type: 'pie',
                    radius: ['50%', '70%'],
                    center:['30%','50%'],
                    avoidLabelOverlap: false,
                    label: {
                        normal: {
                            show: false,
                            position: 'center'
                        },
                        emphasis: {
                            show: true,
                            textStyle: {
                                fontSize: '30',
                                fontWeight: 'bold'
                            }
                        }
                    },
                    labelLine: {
                        normal: {
                            show: false
                        }
                    },
                    data: [
                        {
                            value: lrrNumArray3[0], name: lrrIndustryArray3[0], itemStyle: {
                            normal: {
                                color: '#4B97F7'
                            }
                        }
                        },
                        {
                            value: lrrNumArray3[1], name: lrrIndustryArray3[1], itemStyle: {
                            normal: {
                                color: '#4B88DA'
                            }
                        }
                        },
                        {
                            value: lrrNumArray3[2], name: lrrIndustryArray3[2], itemStyle: {
                            normal: {
                                color: '#4974AD'
                            }
                        }
                        },
                        {
                            value: lrrNumArray3[3], name: lrrIndustryArray3[3], itemStyle: {
                            normal: {
                                color: '#66CC33'
                            }
                        }
                        },
                        {
                            value: lrrNumArray3[4], name: lrrIndustryArray3[4], itemStyle: {
                            normal: {
                                color: '#58904B'
                            }
                        }
                        },
                        {
                            value: lrrNumArray3[5], name: lrrIndustryArray3[5], itemStyle: {
                            normal: {
                                color: '#799472'
                            }
                        }
                        }
                    ]

                }
            ]
        };

        myChart_bar_ci.setOption(myChart_bar_ci_option);

    }

    function company_operate_ability_analytic_3(lrrIndustryArray4, lrrNumArray4) {
        var myChart_bar = echarts.init(document.getElementById('company_operate_ability_anylytic3'));
        var myChart_bar_option = {
            backgroundColor: 'rgba(90, 99, 120, 0.8)',
            title: {
                text: '毛纺织及染整精加工企业营收指数分布情况',
                textStyle: {
                    color: '#F2F2F2',
                    fontStyle: 'normal',
                    fontWeight: '200',
                    fontFamily: 'STHeitiSC-Medium',
                    fontSize: 14
                }
            },
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                top: 'middle',
                left: '280',
                // padding:[15,200,15,15],
                align: 'left',
                textStyle: {
                    color: ['']
                    //fontSize:30,

                },
                formatter: function (name) {
                    return name;
                },

                x: 'left',
                data: lrrIndustryArray4
            },
            series: [
                {

                    name: '访问来源',
                    type: 'pie',
                    radius: ['50%', '70%'],
                    center:['30%','50%'],
                    avoidLabelOverlap: false,
                    label: {
                        normal: {
                            show: false,
                            position: 'center'
                        },
                        emphasis: {
                            show: true,
                            textStyle: {
                                fontSize: '30',
                                fontWeight: 'bold'
                            }
                        }
                    },
                    labelLine: {
                        normal: {
                            show: false
                        }
                    },
                    data: [
                        {
                            value: lrrNumArray4[0], name: lrrIndustryArray4[0], itemStyle: {
                            normal: {
                                color: '#B1972B'
                            }
                        }
                        },
                        {
                            value: lrrNumArray4[1], name: lrrIndustryArray4[1], itemStyle: {
                            normal: {
                                color: '#FF9966'
                            }
                        }
                        },
                        {
                            value: lrrNumArray4[2], name: lrrIndustryArray4[2], itemStyle: {
                            normal: {
                                color: '#CC8465'
                            }
                        }
                        },
                        {
                            value: lrrNumArray4[3], name: lrrIndustryArray4[3], itemStyle: {
                            normal: {
                                color: '#A47564'
                            }
                        }
                        }
                    ]

                }
            ]
        };


        myChart_bar.setOption(myChart_bar_option);
    }


    function company_operate_ability_analytic_4(lrrIndustryArray, lrrIndustryArray) {
        var myChart_bar = echarts.init(document.getElementById('company_operate_ability_anylytic4'));
        var myChart_bar_option = {
            backgroundColor: 'rgba(90, 99, 120, 0.8)',
            title: {
                show: false,
                text: '堆叠区域图'
            },
            tooltip: {

                show: false,
                trigger: 'axis',
                backgroundColor: '#F7F9FB',
                borderColor: '#92DAFF',
                borderWidth: '1px',
                textStyle: {color: 'black'},
                formatter: function (params, ticket, callback) {
                    var html = params[0].name + " " + "<br/>";
                    for (var i = 0; i < params.length; i++) {
                        html += "<div style='width: 10px; height: 10px; background: " + params[i].color +
                            "; -moz-border-radius: 50px; -webkit-border-radius: 50px; border-radius: 50px; float:left; margin-top:6px;'></div>  &nbsp;&nbsp; " +
                            params[i].seriesName + ": <br/>" + "<span style='color:" + 'red' + ";font-weight:600;'>" + toThousands(params[i].value) + "</span>" + "/万元";

                    }
                    return html;
                }
            },


            legend: {

                left: '80',
                top: '60',
                textStyle: {
                    color: 'white',
                },
                data: ['企业投入能力', '企业营收能力']
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: [
                {
                    type: 'category',
                    boundaryGap: false,
                    axisLabel: {
                        textStyle: {color: 'white'},
                    },
                    data: ['2016-01', '2016-02', '2016-03', '2016-04', '2016-05', '2016-06', '2016-07', '2016-08', '2016-09']
                }
            ],
            yAxis: [
                {
                    type: 'value',
                    splitLine: {
                        show: false
                    },
                    axisLabel: {
                        show: false,
                    },
                    axisLine: {
                        show: false
                    },
                    axisTick: {
                        show: false
                    },
                }
            ],
            series: [
                {
                    itemStyle: {
                        normal: {color: '#48978B'}
                    },
                    symbolSize: 10,
                    //symbol:'circle',
                    name: '行业营收均值',
                    type: 'line',
                    stack: '总量',
                    areaStyle: {normal: {}},
                    data: [120, 132, 101, 134, 90, 230, 210, 240, 159]
                },


            ]
        };
        myChart_bar.setOption(myChart_bar_option);
    }

    function company_operate_ability_analytic_5(lrrIndustryArray, lrrIndustryArray) {
        var myChart_bar = echarts.init(document.getElementById('company_operate_ability_anylytic4'));
        var myChart_bar_option = {
            backgroundColor: 'rgba(90, 99, 120, 0.8)',
            title: {
                text: '杭州明成制衣有限公司',
                left: '35',
                top: '25',
                textStyle: {
                    color: '#F2F2F2',
                    fontStyle: 'normal',
                    fontWeight: '200',
                    fontFamily: 'STHeitiSC-Medium',
                    fontSize: 14
                }
            },
            tooltip: {

                show: false,
                trigger: 'axis',
                backgroundColor: '#F7F9FB',
                borderColor: '#92DAFF',
                borderWidth: '1px',
                textStyle: {color: 'black'},
                formatter: function (params, ticket, callback) {
                    var html = params[0].name + " " + "<br/>";
                    var cha_data = params[1].value - params[0].value;
                    for (var i = 0; i < params.length; i++) {
                        html += "<div style='width: 10px; height: 10px; background: " + params[i].color +
                            "; -moz-border-radius: 50px; -webkit-border-radius: 50px; border-radius: 50px; float:left; margin-top:6px;'></div>  &nbsp;&nbsp; " +
                            params[i].seriesName + ": <br/>" + "<span style='color:" + 'red' + ";font-weight:600;'>" + toThousands(params[i].value) + "</span>" + " 万元</br>";


                    }
                    return html + "企业营收高于行业均值：<br/><span style='color:" + 'red' + ";font-weight:600;'>" + toThousands(cha_data) + "</span> 万元";
                }
            },

            legend: {
                left: '45',
                top: '60',
                textStyle: {
                    color: 'white',
                },
                orient: 'vertical',
                data: ['企业投入能力', '企业营收能力']
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            grid: {
                left: '40',
                right: '60',
                bottom: '50',
                containLabel: true
            },
            xAxis: [
                {
                    type: 'category',
                    boundaryGap: false,
                    axisLabel: {
                        textStyle: {color: 'white'},
                    },
                    data: ['2016-02','2016-03', '2016-04', '2016-05', '2016-06', '2016-07', '2016-08', '2016-09']
                }
            ],
            yAxis: [
                {
                    type: 'value',
                    splitLine: {
                        show: false
                    },
                    axisLabel: {
                        show: false,
                    },
                    axisLine: {
                        show: false
                    },
                    axisTick: {
                        show: false
                    },
                }
            ],
            series: [
                {
                    itemStyle: {
                        normal: {color: '#48978B'}
                    },
                    symbolSize: 10,
                    //symbol:'circle',
                    name: '企业投入能力',
                    type: 'line',
                    stack: '总量',
                    areaStyle: {normal: {}},
                    data: [ 71806155.18/1.8, 130973936.46000001/2.4, 46443520.86000001/2.1, 99690801.26/1.9, 71239115.2/2.0, 61791419.88000001/2.6, 74840176.28/2.5, 84886473.52/2.3]
                },
                {
                    itemStyle: {
                        normal: {color: '#3276AB'}
                    },
                    symbolSize: 10,
                    //symbol:'circle',
                    name: '企业营收能力',
                    type: 'line',
                    stack: '总量',
                    areaStyle: {normal: {}},
                    data: [ 71806155.18, 130973936.46000001, 46443520.86000001, 99690801.26, 71239115.2, 61791419.88000001, 74840176.28, 84886473.52]
                },


            ]
        };
        myChart_bar.setOption(myChart_bar_option);
    }


    // 方法六
    function toThousands(num) {
        return (num || 0).toString().replace(/(\d)(?=(?:\d{3})+$)/g, '$1,');
    }


});
