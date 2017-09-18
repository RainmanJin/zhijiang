require.config({
    waitSeconds: 0,
    baseUrl:basePath,
    paths: {
        Pingan : 'gov/js/common/common',
        echarts: 'gov/js/lib/echarts.min',
        gov_top: 'gov/js/monitor/monitor_top',
        left: 'gov/js/monitor/monitor_left',
        // select_2_css:'gov/js/monitor_new/select2css',
        ec_industry_digest: "gov/js/monitor_new/ec_industry_digest"
    },
    shim: {

        gov_top: {
            deps: ['Pingan']
        },
        echarts: {
            deps: ['Pingan']
        },
        left: {
            deps: ['Pingan']
        },
        ec_industry_digest: {
            deps: ['Pingan']
        }
    },
    deps: [ 'gov_top', 'left','ec_industry_digest' ]
});
require(['echarts','Pingan'],function (echarts,Pingan){

    Pingan.Init=function () {
        noData = "<img src='" + Pingan.basePath + "/images/gov-images/nodata.jpg' style='width: 660; height: 260px;' />";
        $.post(basePath+"/gov/user/company/monitor/stat/shop/ajax/list",{},function (result){
            siteShopStatHalfYearTrend('siteShopStatHalfYear',result);
        });
    };
    Pingan.Init();

    function tradingAmountProportion(datas,citys){
        var myChart_bar = echarts.init(document.getElementById('tradingAmountProportion'));
        var option_bar = {
            tooltip : {
                show: false
            },
            legend: {
                show: false
            },
            grid: {
                left: '3%',
                right: '20%',
                bottom: '5%',
                y:0,
                x:150,
                containLabel: true
            },
            xAxis : [
                {
                    type : 'value',
                    axisTick:
                        {
                            show: false
                        },
                    axisLine:
                        {
                            show: false
                        },
                    axisLabel:
                        {
                            show: false
                        },
                    splitLine:
                        {
                            show: false
                        }
                }
            ],
            yAxis : [
                {
                    type : 'category',
                    axisTick:
                        {
                            show: false
                        },
                    axisLine:
                        {
                            show: false
                        },
                    axisLabel:
                        {
                            textStyle:{
                                fontSize:16
                            }
                        },
                    data :citys
                }
            ],
            color: [
                '#1DC8E6',
                '#8BC316',
            ],
            series : [
                {
                    name:'C店',
                    type:'bar',
                    stack: '总量',
                    barWidth: 14,
                    label: {
                        normal: {
                            show: true,
                            position: 'right',
                            formatter: '{c}家',
                            textStyle:{
                                color:'#5F5F5F',
                                fontSize:14
                            }
                        }
                    },
                    data:datas
                }
            ]
        };
        myChart_bar.setOption(option_bar);
        return myChart_bar;
    }

    function siteShopStatHalfYearTrend(container,data) {
        var list = data["data"];

        if (data && list.length!=0) {
            var statDate = new Array();
            var totalNum = new Array();
            var newNum = new Array();
            var closedNum = new Array();

            for(var i=0;i<list.length;i++){
                statDate.push(new Date(parseInt(list[i].statDate)).format("yyyy年MM月"));
                totalNum.push(list[i].shopTotalNum);
                newNum.push(list[i].shopNew);
                closedNum.push(list[i].shopClosed);
                if( i == list.length - 1 ){
                    $("#shopTotalNum").html(list[i].shopTotalNum);
                    $("#shopNew").html(list[i].shopNew);
                    $("#shopClosed").html(list[i].shopClosed);
                }
            }

            var siteShopStatHalfYearTre=echarts.init(document.getElementById(container));
            siteShopStatHalfYearTre.setOption(option = {
                    title: {
                        show:false,
                        text: '电商企业近半年趋势',
                        // padding:['50%','50%']
                        top:'6%',
                        right:'center',
                        textStyle:{
                            fontWeight:'normal'
                        }
                    },
                    tooltip: {
                        trigger: 'axis',
                        textStyle:{
                            fontSize:14,
                        },
                        position:function (point, params, dom) {
                            return [point[0]-180,point[1]-53];
                        }
                    },
                    label:{
                        normal:{
                            show:true,
                            formatter:function (param) {
                                return $.format(param['value'],3,',')
                            },
                            textStyle:{
                                fontSize:14,
                            },
                        },
                        emphasis:{
                            show:true,
                            formatter:function (param) {
                                return $.format(param['value'],3,',')
                            },
                            textStyle:{
                                fontSize:17,
                            },
                        }
                    },
                    legend: {
                        padding: [380,100],
                        textStyle:{
                            fontSize:14,
                        },
                        data:['活跃电商企业总数','本月新增','本月歇业']
                    },
                    xAxis: {
                        type: 'category',
                        boundaryGap: false,
                        axisLabel:{margin:14,
                            textStyle:{
                                fontSize:14,
                            },
                        },
                        data:statDate
                    },
                    yAxis: [{
                        type: 'value',
                        name:'数量 (家)',
                        axisTick:{show:false},
                        axisLabel: {
                            formatter: function (param) {
                                return param/1000+'k'
                            },
                            textStyle:{
                                fontSize:14,
                            },
                        },
                        nameLocation:'middle',
                        nameGap:50,
                        nameTextStyle:{
                            fontSize:14,
                        },
                        axisLine:{show:false},
                        min:0,
                        // interval:5000
                    }],
                    series: [
                        {
                            symbol:'circle',
                            symbolSize:12,
                            itemStyle:{
                                normal:{
                                    color:'#F6D24A',
                                },
                            },
                            name:'活跃电商企业总数',
                            type:'line',
                            data:totalNum
                        },
                        {
                            symbol:'diamond',
                            symbolSize:12,
                            itemStyle:{
                                normal:{
                                    color:'#A9D96C',
                                },
                            },
                            name:'本月新增',
                            type:'line',
                            data:newNum
                        },
                        {
                            symbol:'triangle',
                            symbolSize:12,
                            itemStyle:{
                                normal:{
                                    color:'#58C9F5',
                                },
                            },
                            name:'本月歇业',
                            type:'line',
                            data:(closedNum['value']==0)?(closedNum['value']==1):closedNum
                        }
                    ]
                }
            )


        }else{//显示无数据的提示图
            $("#"+container).html('');
        }

    }

    function siteClueStatHalfYearTrend(container,data) {
        var list = data["data"];

        if (data && list.length!=0) {
            var startDate = new Array();
            var totalNum = new Array();
            var dealNum = new Array();
            var caseNum = new Array();
            var caseDealNum = new Array();

            for(var i=0;i<list.length;i++){
                startDate.push(new Date(parseInt(list[i].startDate)).format("yyyy年MM月"));
                totalNum.push(list[i].clueTotalNum);
                dealNum.push(list[i].clueDealNum);
                caseNum.push(list[i].caseNum);
                caseDealNum.push(list[i].caseDealNum);
                if( i == list.length - 1 ){
                    $(".top-wz label").text(new Date(parseInt(list[i].startDate)).format("MM月份"));
                    $("#clueTotalNum").html($.format(list[i].clueTotalNum,3,','));
                    $("#clueDealNum").html($.format(list[i].clueDealNum,3,','));
                    $("#caseNum").html($.format(list[i].caseNum,3,','));
                    $("#caseDealNum").html($.format(list[i].caseDealNum,3,','));

                    var clueDealProbability = list[i].clueDealNum * 100 / list[i].clueTotalNum;
                    var caseDealProbability = list[i].caseDealNum * 100 / list[i].caseNum;
                    $("#clueDealProbability").html( parseInt(clueDealProbability) + "%" );
                    $("#caseDealProbability").html( parseInt(caseDealProbability) + "%" );

                }
            }


            var siteShopStatHalfYearTre=echarts.init(document.getElementById(container));
            siteShopStatHalfYearTre.setOption(option = {
                    title: {
                        text: '监管成效近半年趋势',
                        // padding:['50%','50%']
                        top:'2%',
                        right:'center',
                        textStyle:{
                            fontWeight:'normal'
                        }
                    },
                    tooltip: {
                        trigger: 'axis',
                        backgroundColor:'#F7F9FB',
                        borderColor:'#92DAFF',
                        borderWidth:'1px',
                        textStyle:{color:'black'},
                        position:function (point, params, dom) {
                            return [point[0]-185,point[1]-63];
                        },
                        // formatter: function(param) {
                        // 	var name;
                        // 	var tip='';
                        // 	var seriesName=new Array;
                        // 	var value=new Array;
                        // 	for(var i=0;i<4;i++){
                        // 		name=param[0]['name'];
                        // 		seriesName.push(param[i]['seriesName']);
                        // 		value.push($.format(param[i]['value'], 3, ','));
                        // 	}
                        // 	for(var i=0;i<4;i++){
                        // 		tip+=(seriesName[i]+':'+value[i]+'个<br/>')
                        // 	}
                        // 	return name+'<br/>'+tip;
                        // }
                        // formatter:'{b0}<br>{a0}: {c0}家<br />{b1}: {c1}家<br />{b2}: {c2}家<br />{b3}: {c3}家'
                    },
                    label:{
                        normal:{
                            show:true,
                            formatter:function (param) {
                                return $.format(param['value'],3,',')
                            }
                        },
                        emphasis:{
                            show:true,
                            formatter:function (param) {
                                return $.format(param['value'],3,',')
                            }
                        }
                    },
                    legend: {
                        padding: [380,100],
                        data:['发现线索数','已初审线索数','需复审线索数','已复审线索数']
                    },
                    xAxis: {
                        type: 'category',
                        boundaryGap: true,
                        axisLabel:{margin:14},
                        data:startDate,
                        // axisTick:{interval:0}
                    },
                    yAxis: [{
                        type: 'value',
                        name:'数量 (个)',
                        axisTick:{show:false},
                        axisLabel: {
                            formatter: function (param) {
                                return param/1000+'k'
                            }
                        },
                        nameLocation:'middle',
                        nameGap:50,
                        axisLine:{show:false},
                        min:0,
                        // interval:20000
                    }],
                    series: [
                        {
                            symbol:'circle',
                            symbolSize:12,
                            name:'发现线索数',
                            type:'line',
                            data:totalNum
                        },
                        {
                            symbol:'roundRect',
                            symbolSize:12,
                            name:'已初审线索数',
                            type:'line',
                            data:dealNum
                        },
                        {
                            symbol:'triangle',
                            symbolSize:12,
                            name:'需复审线索数',
                            type:'line',
                            data:caseNum
                        },
                        {
                            symbol:'diamond',
                            symbolSize:12,
                            name:'已复审线索数',
                            type:'line',
                            data:caseDealNum
                        }
                    ]
                }
            )


        }else{//显示无数据的提示图
            $("#"+container).html('');
        }

    }
});


