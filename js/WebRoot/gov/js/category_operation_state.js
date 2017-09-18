define(['Pingan','echarts'], function (Pingan,echarts){

	//电商趋势
	function loadShopSaleTrend(container, data){
		var list = data["data"];
		if (data && list.length!=0) {
			var calculateDate = new Array();
			var amount = new Array();
			var shopName = "";
			
			for(var i=0;i<list.length;i++){
				calculateDate.push(new Date(parseInt(list[i].calculateDate)).format("yyyy年MM月"));
				amount.push(Number(list[i].saleAmount)/100);
				shopName = list[i].shopName;
			}


			var myChart = echarts.init(document.getElementById(container));
			var option = {
				tooltip: {
					trigger: 'axis',
					backgroundColor:'#F7F9FB',
					borderColor:'#92DAFF',
					borderWidth:'1px',
					textStyle:{color:'black'},
					position:function (point, params, dom) {
						return [point[0],point[1]];
					}
				},
				title:{
					text:shopName+'近半年销售趋势',
					// top:'3%',
					right:'center',
					textStyle:{
						fontWeight:'normal'
					}
				},
				legend: {
					bottom: 'auto',
					textStyle: {
						fontSize: 14,
						fontWeight:'bold'
					},
					data: ['销售金额'],
					bottom: '1%'
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
						axisTick:{
							alignWithLabel:true
						},
						axisLabel:{
							rotate:45,
							interval:0
						},
						boundaryGap: true,
						data: calculateDate
					}
				],
				yAxis: [
					{
						type: 'value',
						name: '金额 (元)',
						nameLocation:'middle',
						nameGap:65,
						axisLabel: {
							formatter: function (param) {
								if(param>=100000000){
									return $.numberFormat(param/100000000,1)+'亿';
								}else if(param==0){return 0;}
								return $.numberFormat(param/10000,1)+'万'
							}
						}
					}
				],
				series: [
					{
						symbol:'circle',
						symbolSize:12,
						name: '销售金额',
						smooth: true,
						type: 'line',
						// stack: '总量',
						/*areaStyle: {
							normal: {
								color: '#000000'
							}
						},*/
						itemStyle: {
							normal: {
								color: '#7CB5EC'
							}
						},
						data: amount
					}

				]
			};
			myChart.setOption(option);
		}else{//显示无数据的提示图
            $("#"+container).height('');
			$("#"+container).html('<div class="detail_nodata">暂未收录该企业相关信息</div>');
		}
	}

	function processEventData(data,basePath){
			var chartData = data;
			var chartYData = new Array();
	 		var i = 0;
	 		$.each(data,function(index,content){
	 			var yVal = null;
	 			if( i == 0)
	 			{
	 				chartStartTime = content.time;
	 			}
	 			i++;
	 			var val = content.creditValue;
	 			if("null" == val){
	 				val = null;
	 			}
	 			var newVal = val;
	 			if(null != newVal){
	 				newVal = parseInt(newVal)
	 			}
	 			if(content.events != null && content.events.length > 0)
	 			{
	 				yVal ={
	 						y:newVal,
	 						marker: {
	                            symbol: "url("+basePath+"images/hightchart/credit-event.png)"
	                        }
	 				};
	 			}
	 			else
	 			{
	 				yVal = newVal;
	 			}
	 			chartYData.push(yVal);
	 		});
	 		return chartYData;
	}

	function processEventTime(chartData)
	{
				var chartX = new Array();
				if(chartData != null && chartData.length > 0 && chartStartTime != null)
	       		{
					var x = chartStartTime;
					var year = x.substring(0,4);
					var mouth =  x.substring(4);
					var mouthInt = parseInt(mouth,10);
					var yearInt =  parseInt(year,10);
					for(var i = 0; i < 12 ; i++)
					{
						if(i != 0){
							mouthInt += 1;
						}
						if(mouthInt > 12)
						{
							yearInt += 1;
							mouthInt = 1;
						}
						if(mouthInt < 10)
						{
							mouth = "0"+mouthInt;
						}
						else
						{
							mouth = mouthInt;
						}
						chartX.push(((yearInt+"").substring(2,4)+"."+mouth));
					}
	       		}
				
				return chartX;

	}

	function getCreditEvents(time,chartData,basePath){
		var eventHtml = "";
	  	if(chartData != null && chartData.length > 0)
		{
	 		$.each(chartData,function(index,content){
	 			var year = content.time.substring(2,4);
	 			var moutn = content.time.substring(4,6);
	 			if((year+"."+moutn) == time){
	 			if(content.events != null && content.events.length > 0)
	 			{
	 				var  ul = "<div style='padding:0 8px;'><table>";
	 				var i = 0;
	 				$.each(content.events,function(index,event){
	 					var score = event.score;
	 					var imgSrc = basePath+"images/hightchart/up.png";
	 					if(score != null && score < 0)
	 					{
	 						score = (score+"").substring(1);
	 						imgSrc = basePath+"images/hightchart/down.png";
	 					}
	 					var a = event.event;
	 					if(event.link != null)
	 					{
	 						 a = "<a href='"+event.link+"'  target='_blank' class='credit-chart-event-a'>"+a+"</a>";
	 					}
	 					ul+="<tr>";
	 					ul+="<td  style='font-size:14px;font-family: Arial;' align='right'>"+score+"</td>" +
	 							"<td ><img style='margin-top:1px;' src='"+imgSrc+"' />&nbsp;</td>" +
	 							"<td style='white-space: nowrap;'>"+a+"</td>";
	 					ul+="</tr>";
	 					i++;
	 					if(i==8)
	 					{
	 						ul+="<tr>";
		 					ul+="<td  colspan='3'>......</td>";
		 					ul+="</tr>";
	 						return false;
	 					}
	 				});
	 				ul+="</table></div>";
	 				eventHtml+=ul;
	 			}
	 			var growth =content.growth;
	 			var fen = growth+"";
	 			var sign = "+";
	 			if(growth< 0)
	 			{
	 				fen = fen.substring(1);
	 				sign = "-";
	 			}
	 			if(growth != 0)
	 			{
	 				eventHtml+="<div style='padding:20px 15px 0px 15px ;text-align:center;clear:both;'><span style='font-size:30px;display:inline-block;font-family: Arial;'>"+sign+"</span><span style='font-size:45px;display:inline-block;font-family: Arial;'>"+fen+"</span><span style='font-size:14px;'>分</span></div>";
			 			}
		 			}
		 		});
		
			 }
		  return eventHtml;
	  }

	function getBottomTip(chartData,companyName)
	{
			var startTime = chartData[0].time;
			var endTime = chartData[chartData.length-1].time;
			var startYear = startTime.substring(0,4);
			var startMouth =  startTime.substring(4);
			var endYear = endTime.substring(0,4);
			var endMouth =  endTime.substring(4);
			startTime = startYear+"年"+startMouth+"月";
			endTime = endYear+"年"+endMouth+"月";
		 	return companyName+"信用成长记录（"+startTime+" - "+endTime+"）";
	}

	//事件
	function loadEvents(containerId,result,companyName,basePath){
		basePath = basePath + "/";
		 var data=result["data"];
		 //总流量信息
		 if (!data || data.length==0) {
			 return;
		 }
		 var chartData = result.data;
		 var chartYData = processEventData(data,basePath);
		 var chartX = processEventTime(chartData);
		 var isShowChart = false;

		 $.each(chartYData,function(index,content){
			 if(content != null)
			{
				 isShowChart = true;
				 return true;
			}
		 });
		 
		 if(isShowChart)
		 {
			var creditRecordEchart = echarts.init(document.getElementById(containerId));

             var creditRecordOption = {
                 tooltip: {
                     trigger: 'axis',
                     backgroundColor: '#F7F9FB',
                     borderColor: '#92DAFF',
                     borderWidth: '1px',
                     textStyle: {color: 'black'},
                     position: function (point, params, dom) {
                         return [point[0] - 155, point[1] - 53];
                     },

                 },
                 legend: {
                     data: getBottomTip(chartData, companyName),
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
                         data: chartX
                     }
                 ],
                 yAxis: [
                     {
                         name: '单位：亿',
                         type: 'value',
                         axisLabel: {
                             formatter: function (param) {
                                 return param/100000000;
                             }
                         },
                     }
                 ],
                 series: [
                     {
						 name : 'dd',
                         type: 'line',
                         // stack: '总量',
                         areaStyle: {
                             normal: {
                                 color: '#00BFFF'
                             }
                         },
                         data: chartYData
                     }
                 ]
             };
             creditRecordEchart.setOption(creditRecordOption);

			}else{
				var html = "<div  style='color:#4d4d4d;text-align: center;font-size:12px;padding:50px 0 30px 0;font-family:\"宋体\";'>网站未被收录，暂无信用记录    <a style='text-decoration: none;color:#008bd0;' href='"+basePath+"user/index.jsp'>去提交收录>></a></div>";
				$("#"+containerId).html(html);
			}
	}


	//关键词
	function loadKw(objname,kw){
		var obj=$("#"+objname);
		var kwHtml="";
		for(var i=0;i<kw.length;i++){
			kwHtml=kwHtml+"<li>"+kw[i]["xdate"]+"</li>";
		}
		obj.html(kwHtml);
	}

	//七日流量
	function loadPv(obj,pv){
		pv = eval("(" + pv.originalResult + ")");
		var pvData=pv["data"]["pv 数据"]["series"];
		var pvDataLen=pvData.length;
		//总流量信息
		if (pv && pvData.length!=0) {
			var pvX=new Array();
			var pvY=new Array();
			
			for(var i=0;i<pvData.length;i++){
				var xd=pvData[i].xdate;
				pvX.push(xd);//xd.substring(5,xd.length)
				pvY.push(pvData[i].value);
			}

			//echartsPV
            var creditRecordEchart = echarts.init(document.getElementById(obj));

            var creditRecordOption = {
                tooltip: {
                    trigger: 'axis',
                    backgroundColor: '#F7F9FB',
                    // borderColor: '#92DAFF',
                    borderColor: 'orange',
                    borderWidth: '1px',
                    textStyle: {color: 'black'},
                    formatter : function(param) {
                  			return param[0].name+"<br/>"+"pv 数据："+ $.numberFormat(param[0].value,0);
                    }

                },
                legend: {
                    data: [pv["data"]["pv 数据"]["title"]+'站点pv数据（'+pvData[0]['xdate']+' - '+pvData[pvDataLen-1]['xdate']+'）'],
					// data: ['pv'],
					bottom:'1%',
                },
                grid: {
                    left: '4%',
                    right: '5%',
					top:'7%',
                    // bottom: '10%',
                    containLabel: true
                },
                xAxis: [
                    {
                        type: 'category',
                        boundaryGap: false,
                        data: pvX,
                        axisLabel: {
                          rotate:30,
							// margin:6,
                            interval:0
                        },
                    }
                ],
                yAxis: [
                    {
                        // name: 'PV单位：亿',
                        type: 'value',
                        axisLabel: {
                            formatter: function(param) {
                                //单位转换
                                if(param>=1000000000000){
                                    return (param/1000000000000)+" 万亿PV";
                                }else if(param>=100000000&&param<1000000000000){
                                    return (param/100000000)+" 亿PV";
                                }else if(param>=10000&&param<100000000){
                                    return (param/10000)+" 万PV";
                                }else{
                                    if(param==0){
                                        return 0;
                                    }else{
                                        return param+" PV";
                                    }
                                }
                            }
                        },
                    }
                ],
                series: [
                    {
						name:[pv["data"]["pv 数据"]["title"]+'站点pv数据（'+pvData[0]['xdate']+' - '+pvData[pvDataLen-1]['xdate']+'）'],
                        type: 'line',
                        areaStyle: {
                            normal: {
                                color: '#00bb9c'
                            }
                        },
                        smooth: true,
                        data: pvY
                    }
                ]
            };
            creditRecordEchart.setOption(creditRecordOption);
		}else{//显示无数据的提示图
			$("#"+obj).html(noData);
		}
		
	}
	function loadTax(container, data){
		$("#"+container).removeClass();
		var map=data["data"];
		var taxData=map["data"];
		var msg = data["statusMessage"];
		var dateField=map["dateField"];
		var amountField=map["amountField"];

		if (data && taxData.length!=0) {
			var nationX=new Array();
			var nationY=new Array();
			while(taxData.length < 12){
				var date = new Date(taxData[taxData.length-1][dateField]);
				var datestr =date.format("yyyy-MM-dd");
				date.setDate(1);
				date.setMonth(date.getMonth()+1);
				var d = date.getMonth();
				 datestr =date.format("yyyy-MM-dd");
				var taxD = {};
				taxD[dateField]=date;
				taxD[amountField]=0;
				taxData.push(taxD);
			}
			for(var i=0;i<taxData.length;i++){
				var xd= new Date(taxData[i][dateField]).format("yyyy-MM") ;

				nationX.push(xd);//xd.substring(5,xd.length)

				nationY.push(taxData[i][amountField]);
			}

            //taxechartsPV
            var creditRecordEchart = echarts.init(document.getElementById(container));

            var creditRecordOption = {
                tooltip: {
                    trigger: 'axis',
                    backgroundColor: '#F7F9FB',
                    borderColor: '#92DAFF',
                    borderWidth: '1px',
                    textStyle: {color: 'black'},
                    position: function (point, params, dom) {
                        return [point[0] - 155, point[1] - 53];
                    },
                },
                legend: {
                    data: new Date(taxData[0][dateField]).format("yyyy-MM")+"到"+new Date(taxData[taxData.length-1][dateField]).format("yyyy-MM")+ msg,
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
                        data: nationX
                    }
                ],
                yAxis: [
                    {
                        name: '单位：亿',
                        type: 'value',
                        axisLabel: {
                            formatter: function (param) {
                                return param/100000000;
                            }
                        },
                    }
                ],
                series: [
                    {
						name:'pv',
                        type: 'line',
                        // stack: '总量',
                        areaStyle: {
                            normal: {
                                color: '#00BFFF'
                            }
                        },
                        data: nationY
                    },

                ]
            };
            creditRecordEchart.setOption(creditRecordOption);
		}else{//显示无数据的提示图
			$("#"+container).html(noData);
		}
	}
	return {
		loadShopSaleTrend : loadShopSaleTrend,
		processEventData : processEventData,
		processEventTime : processEventTime,
		getCreditEvents : getCreditEvents,
		getBottomTip : getBottomTip,
		loadEvents : loadEvents,
		loadKw : loadKw,
		loadPv : loadPv,
		loadTax : loadTax
	};
});

