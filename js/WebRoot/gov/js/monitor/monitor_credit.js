require.config({
    waitSeconds: 0,
    baseUrl:basePath,
    paths: {
        Pingan : 'gov/js/common/common',
        echarts: 'gov/js/lib/echarts.min',
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
        left: {
            deps: ['Pingan']
        }

    },
    deps: [ 'gov_top', 'left']
});

var echart;
require(['echarts','Pingan'],function (echarts,Pingan){
    echart=echarts;
    Pingan.Init=function () {

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


