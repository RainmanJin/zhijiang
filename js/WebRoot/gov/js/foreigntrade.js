require.config({
    waitSeconds: 0,
    baseUrl:basePath,
    paths: {
        Pingan : 'gov/js/common/common',
        echarts: 'gov/js/lib/echarts.min',
        zhejiang: 'gov/js/lib/map/zhejiang',
        gov_top: 'gov/js/gov_top',
        foreigntrade: "gov/js/foreigntrade"
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
        foreigntrade: {
            deps: ['Pingan','zhejiang']
        }
    },
    deps: [ 'gov_top', 'zhejiang', 'foreigntrade']
});
require(['echarts','Pingan','zhejiang'],function (echarts,Pingan,zhejiang) {
    Pingan.Event=function () {
        $("#areaChoose").find("a").click(function(){
            clearCurrentClass("areaChoose",$(this));
            var cityCode = $(this).attr("data-attr");
            foreigntradeTable.urlHandler.params.put("cityCode",cityCode==undefined?'':cityCode);
            foreigntradeTable.go(1);

        });
        $("#companyTypeDiv").find("a").click(function(){
            $("#companyTypeDiv").find("a").removeClass("current");
            $(this).addClass("current");
            var companyType = $(this).text();
            if(companyType=="全部"){
                companyType="";
            }
            foreigntradeTable.urlHandler.params.put("companyType",companyType);
            foreigntradeTable.go(1);

        });

        $("#capital_choose").find("a").click(function(){
            $("#capital_choose").find("a").removeClass("current");
            $(this).addClass("current");
            var capitalNumber =  $(this).attr("data-attr");
            if($(this).text() == "全部"){
                capitalNumber="";
            }
            foreigntradeTable.urlHandler.params.put("capitalNumber",capitalNumber);
            foreigntradeTable.go(1);

        });
    };

	Pingan.Init=function () {
        foreigntradeTable = new Pingan.PageHandler($("#foreigntradeTable"), $(".f-page"));
        foreigntradeTable.formateItem = function(index, model, row){
            var curCreditLevel = row["curCreditLevel"];
            var establishDate = new Date(parseInt(row["establishDate"])).format("yyyy-MM-dd")
            if (!establishDate) {
                establishDate = "";
            }

            if (!curCreditLevel) {
                curCreditLevle = 0;
            }
            return model.format(row["companyName"], row["legalPerson"], row["capital"], establishDate, row["companyType"], curCreditLevel,row["companyNameDigest"]);
        };
        foreigntradeTable.onLoaded = function () {
            Pingan.lightStar();
        };
        Pingan.Event();
        loadTradeRecordMapAjax();
    };
    Pingan.Init();
    
	function clearCurrentClass(divId,currentTag){
		$("#"+ divId).find("a").attr("class","");
		currentTag.attr("class","current");
	}


function loadTradeRecordMapAjax() {
	var saveUrl = basePath+"/gov/user/traderecord/ajaxlist";
	$.ajax({
		type: "POST",
		url: saveUrl,
		data: {},
		async: true,
		success: function (data) {
			if (data.statusCode == 1) {
				var datas = data['data'];
				chartsZhejiangMap(datas['customTradeRecordList'], datas['maxCompanyTotal']);
				singleHorizontalBar(datas['nameList'], datas['dataList']);
			} else if(data.statusCode == 99999){
				mconfirm("查询出错",function (){
				});
			}
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			if(XMLHttpRequest.status==403){
				mconfirm("失败",function (){
				});
			}
		}
	});
}

function singleHorizontalBar(names,values){
	var myChart_bar = echarts.init(document.getElementById('singleHorizontalBar'));
	var option_bar = {
		tooltip : {
			show: false
		},
		legend: {
			show: false
		},
		grid: {
			left: '4%',
			right: '6%',
			bottom: '5%',
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
					show: false,
					lineStyle:{
						color:'#FFFFFF'
					}
				},
				data : names//['舟山市','衢州市','丽水市','湖州市','绍兴市','嘉兴市','台州市','金华市','宁波市','温州市','杭州市']
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
				barWidth: 12,
				label: {
					normal: {
						show: true,
						position: 'right',
						formatter: '{c}家',
						textStyle:{
							color:'#fff'
						}
					}
				},
				data: values//['18', 18, 18, 18, 18, 18, 58, 68, 78, 88, '76']
			}
		]
	};
	myChart_bar.setOption(option_bar);
}

function chartsZhejiangMap(datas, maxVal){
	var charts_zhejiang_map = echarts.init(document.getElementById('chartsZhejiangMap'));
	var option_chart_map =
	{
		title: {
			text: '',
			left: 'center'
		},
		tooltip: {
			trigger: 'item',
			formatter: function (params) {
				return '备案企业数量<em style="color: #FF6633">' + params.data.amount+'</em><br/>区域分布占比<em style="color: #FF6633">'+params.data.proportion+'</em>';
			}
		},
		visualMap: {
			min: 0,
			max: maxVal,
			left: 'right',
			padding:[6,150],
			top: 'bottom',
			text: ['高', '低'],           // 文本，默认为数值文本
			calculable: false,
			color: ['#329BB9', '#EDEDED'],
			itemWidth:15,
			formatter: function (value) {
				return '';
			},
			textStyle:{
				color:'#ffff'
			}
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
				/*[
				 {name: '杭州市',amount: '120家', proportion: '44%',  value: 120},
				 {name: '温州市',amount: '110家', proportion: '33.3%', value: 110},
				 {name: '宁波市',amount: '100家', proportion: '16%',  value: 100},
				 {name: '台州市',amount: '50家', proportion: '1.6%',  value: 50},
				 {name: '嘉兴市',amount: '50家', proportion: '1.6%',  value: 50},
				 {name: '绍兴市',amount: '50家', proportion: '1.6%',  value: 50},
				 {name: '湖州市',amount: '5家', proportion: '1.6%',  value: 5},
				 {name: '丽水市',amount: '8家', proportion: '1.6%',  value: 8},
				 {name: '衢州市',amount: '50家', proportion: '1.6%',  value: 50},
				 {name: '舟山市',amount: '10家', proportion: '1.6%',  value: 10},
				 {name: '金华市',amount: '50家', proportion: '1.6%',  value: 50}
				 ]*/
			}
		]
	};
	charts_zhejiang_map.setOption(option_chart_map);
}

});

