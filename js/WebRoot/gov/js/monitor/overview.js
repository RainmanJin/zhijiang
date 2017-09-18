require.config({
    waitSeconds: 0,
    baseUrl:basePath,
    paths: {
        Pingan : 'gov/js/common/common',
        echarts: 'gov/js/lib/echarts.min',
        zhejiang: 'gov/js/lib/map/zhejiang',
        gov_top: 'gov/js/monitor/monitor_top',
        left: 'gov/js/monitor/monitor_left'
    },
    shim: {

        gov_top: {
            deps: ['Pingan']
        },
        echarts: {
            deps: ['Pingan']
        },
        zhejiang: {
            deps: ['echarts']
        },
        left: {
            deps: ['Pingan']
        }

    },
    deps: [ 'gov_top', 'left', 'zhejiang']
});

var businessContrastBarMaps;
var tradingAmountProportions;
var echart;
require(['echarts','Pingan','zhejiang'],function (echarts,Pingan,zhejiang){
    echart=echarts;
    Pingan.Init=function () {
        noData = "<img src='" + Pingan.basePath + "/images/gov-images/nodata.jpg' style='width: 660; height: 260px;' />";


        initCityDist();
        window.onresize = function () {
            businessContrastBarMaps.resize();
            tradingAmountProportions.resize();
        }

        initCreditList();

        var selectHandler =new Pingan.SelectHandler($("#citySelect").find("span"),false,true);
        selectHandler.selected=function (item) {
            var startDate = $("#startDate").val();
            var endDate = $("#endDate").val();
            $("#cityCode").val(item.attr("city-code"));
            $("#city").val(item.text());
            initCreditTendency(item.attr("city-code"),startDate,endDate);
        }
        $("#citySelect").find("span").eq(0).click();
    };
    Pingan.Init();

});

function statDateChang() {
    var statDate = $("#statDate").val();
    initCityDist(statDate);
}
var initCityDist = function (statDate) {
    $.ajax({
        url: basePath+"/gov/user/monitor/company/dist",
        data:{"statDateStr":statDate},
        success: function (data) {
            if (data.statusCode == 1) {
                var datas = data['data'];
                $("#statDate").val(new Date(datas["statDate"]).format("yyyy-MM"));
                if(datas['cityDistList'].length == 0){
                    $("#businessContrastBar").html(noData);
                } else {
                    businessContrastBarMaps = businessContrastBarMap(datas['cityDistList']);
                }

                if(datas['cityList'].length == 0){
                    $("#tradingAmountProportion").html(noData);
                } else {
                    tradingAmountProportions = tradingAmountProportion(datas['quantityList'],datas['cityList']);
                }

            } else{
                $("#businessContrastBar").html(noData);
                $("#tradingAmountProportion").html(noData);
            }
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            if(XMLHttpRequest.status==403){
                Pingan.mconfirm("失败",function (){
                });
            }
        }
    });
};
function businessContrastBarMap(datas){
    var business_cotrastbar_map = echart.init(document.getElementById('businessContrastBar'));
    var option_chart_map =
        {
            title: {
                text: '',
                left: 'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: function (params) {
                    return '分布数量: ' + params.data.value+'家<br/>区域分布占比: '+params.data.proportion;
                }
            },
            visualMap: {
                min: 0,
                max: datas[datas.length-1].value,
                right: 80,
                padding:[6,50],
                top: 'bottom',
                text: ['高', '低'],           // 文本，默认为数值文本
                calculable: false,
                color: ['#00A7E9', '#EDEDED'],
                itemWidth:15
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
                    data: datas
                }
            ]
        };
    business_cotrastbar_map.setOption(option_chart_map);
    return business_cotrastbar_map;
}



function tradingAmountProportion(datas,citys){
    var myChart_bar = echart.init(document.getElementById('tradingAmountProportion'));
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
                        formatter:function (value, index) {
                            return citys.length-index+"  "+value;
                        },
                        textStyle:{
                            fontSize:16
                        }
                    },
                data :citys
            }
        ],
        color: [
            '#00A7E9',
            '#00A7E9'
        ],
        series : [
            {
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
function dateChang() {
    var startDate = $("#startDate").val();
    var endDate = $("#endDate").val();
    var cityCode = $("#cityCode").val();
    initCreditTendency(cityCode,startDate,endDate);
}
function statDateChang() {
    initCreditList($("#statDate").val());
}
var initCreditList = function (statDate) {
    $.ajax({
        url: basePath+"/gov/user/monitor/credit/ajax/list",
        data:{"statDateStr":statDate},
        success: function (data) {
            console.log(data);
            if (data.statusCode == 1) {
                $("#creditList").find("table").show();
                $("#creditList").find("img[name='noData']").hide();
                $("#statDateStr").parent("span").show();
                var data = data['data'];
                $("#statDate").val(new Date(data[0].statDate).format("yyyy-MM"));
                $("#statDateStr").text(new Date(data[0].statDate).format("yyyy-MM-dd"));
                var outerHTML = $("#creditModel").clone().removeAttr("model").removeAttr("style")[0].outerHTML;
                var html = "";
                for(var i=0;i<data.length;i++){
                    var row = data[i];
                    var className="gT_span";
                    if(i<3){
                        className +=i+1;
                    }else{
                        className="gT_span4";
                    }
                    html += outerHTML.format(className,i+1,row["city"],row["companyTotal"],row["companyLevel1"],row["companyLevel2"],row["companyLevel3"],row["companyLevel4"],row["companyLevel5"],row["cityCode"]);
                }

                $("#creditBody").html(html);

            } else{
                $("#creditList").find("table").hide();
                $("#creditList").find("img[name='noData']").show();
                $("#statDateStr").parent("span").hide();
            }
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            if(XMLHttpRequest.status==403){
                Pingan.mconfirm("失败",function (){
                });
            }
        }
    });
};
var initCreditTendency =function (cityCode,startDate,endDate) {
    $.ajax({
        url: basePath+"/gov/user/monitor/credit/trend/ajax/list",
        data:{"cityCode":cityCode,"startDateStr":startDate,"endDateStr":endDate},
        success: function (data) {
            if (data.statusCode == 1) {
                var data = data['data'];
                if(!startDate){
                    $("#startDate").val(new Date(data.dateList[0]).format("yyyy-MM"));
                }
                if(!endDate){
                    $("#endDate").val(new Date(data.dateList[data.dateList.length-1]).format("yyyy-MM"));
                }
                var siteShopStatHalfYearTre=echart.init(document.getElementById("creditTendency"));
                siteShopStatHalfYearTre.setOption(option = {
                        title: {
                            show:false,
                            text: '各地区信用等级趋势'
                        },
                        color:["#E4CF71","#E67965","#08A3D0","#AACF7F","#B394D4","#6AC291"],
                        tooltip: {
                            trigger: 'axis',
                            formatter: function (params, ticket, callback) {

                                var html = params[0].name +" "+$("#city").val()+"<br/>";
                                for(var i =0 ;i<params.length;i++){
                                    html +="<div style='width: 10px; height: 10px; background: "+params[i].color+"; -moz-border-radius: 50px; -webkit-border-radius: 50px; border-radius: 50px; float:left; margin-top:6px;'></div> "+params[i].seriesName +":"+params[i].value+"<br/>";

                                }
                                return html;
                            }
                        },
                        legend: {
                            padding: [386,100],
                            data:['企业总数','AAA级','AA级','A级','B级',"C级"]
                        },
                        grid: {
                            left: '3%',
                            right: '4%',
                            bottom: '10%',
                            top:'2%',
                            containLabel: true
                        },
                        xAxis: {
                            type: 'category',
                            boundaryGap: false,
                            data: data["dateList"]
                        },
                        yAxis: {
                            type: 'value'
                        },
                        series: [
                            {
                                name:'企业总数',
                                type:'line',
                                data:data["total"]
                            },
                            {
                                name:'AAA级',
                                type:'line',
                                data:data["level1"]
                            },
                            {
                                name:'AA级',
                                type:'line',
                                data:data["level2"]
                            },
                            {
                                name:'A级',
                                type:'line',
                                data:data["level3"]
                            },
                            {
                                name:'B级',
                                type:'line',
                                data:data["level4"]
                            },
                            {
                                name:'C级',
                                type:'line',
                                data:data["level5"]
                            }
                        ]
                    }
                )

            }
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            if(XMLHttpRequest.status==403){
                Pingan.mconfirm("失败",function (){
                });
            }
        }
    });
};
