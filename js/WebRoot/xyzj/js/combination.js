require.config({
	waitSeconds : 0,
	baseUrl : basePath,
	paths : {
		Pingan : 'js/common/common',
		mCustomScrollbar : 'js/lib/jquery.mCustomScrollbar.concat.min',
		echarts:'js/lib/echarts/build/dist/echarts'
	},
	shim : {
		mCustomScrollbar : {
			deps : [ 'Pingan' ]
		},
		echarts : {
			deps : [ 'Pingan' ]
		}
	}
});
require(['Pingan','echarts','mCustomScrollbar'], function (Pingan,echarts){
	
	Pingan.Base = (function (){
		
		/**page.callback.js**/
		var initGlobalVar = function(){
			 page_data = new Array();
		};
		
		/** company_shcema.jsp **/
		var companyShcema = function (){
			//禁用鼠标右键
			//Pingan.forbiddenContextMenu();
			var cfg = {
					level : CompanySchemaCfg.level,
					dateLimit : CompanySchemaCfg.dateLimit,
					result : CompanySchemaCfg.result,
					nodeResult : CompanySchemaCfg.nodeResult,
					linkResult : CompanySchemaCfg.linkResult,
					companyDetailUrl : CompanySchemaCfg.companyDetailUrl
				};
			
				if(typeof(CompanySchemaCfg.result) != "undefined"){
					Pingan.Load.initCompanySchema(cfg);
					Pingan.Load.closes();
					Pingan.Load.detailList();
					Pingan.Load.btnClose();
					Pingan.Load.level();
					Pingan.Load.dateLimit();
				}
			    
			//分享
			window._bd_share_config = {
					"common": {
						"bdSnsKey": {},
						"bdText": "",
						"bdMini": "2",
						"bdMiniList": ["tsina","qzone","weixin","renren","tqq","ty"],
						"bdPic" : "",
						"bdStyle": "0",
						"bdSize": "24"
					},
					"share": {}
			};
			
			with(document) 0[(getElementsByTagName('head')[0] || body)
			                 .appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];
		};
		
		var init = function (){
			initGlobalVar();
			companyShcema();
		};
		
		return {
			init : init
		};
		
	})();
	
	
	 Pingan.Event = function () {
		 //按回车登录
		 $(function(){
			 $(document).keydown(function(event){
				 if(event.keyCode==13){
					 $("#loginBtn").click();
				 }
			 });
		 });
			 
	     var init = function(){};
		 
		 return { 
			init : init
		};
		
	 }();
	
  Pingan.Load = (function (){
	 /** company_shcema.jsp **/
	 var initCompanySchema = function(cfg){

			var presentLevel = cfg.level ;
			var presentDateLimit = parseInt(cfg.dateLimit) ;
			$("select[name='level'] option[value=" + presentLevel + "]").attr("selected","selected");
			$("select[name='dateLimit'] option[value=" + presentDateLimit + "]").attr("selected","selected");
			var result = cfg.result;
			var bizCompany = result.bizCompany;
			var nodes = cfg.nodeResult;
			var links = cfg.linkResult;
			var categorys = [{name: 'root'},{name: '股东'},{name:'高管'},{name:'对外投资'}];
			var colors = ['#48a2fd', '#ff8f6a', '#59e896', '#7BA7F4'];
			
			for(var index in nodes) {
				if(nodes[index].category==0 && nodes[index].type==0) {
					nodes.itemStyle = {"normal":{"textStyle":{"color":"white"}}};
				}
			}
			
			for(var index in links){
				var link = links[index];
				if(link.type == 1){
					link.itemStyle = {"normal":{"color":colors[0]}};
				} 
				if(link.type == 2){
					link.itemStyle = {"normal":{"color":colors[1]}};
				}
				if(link.type == 3){
					link.itemStyle = {"normal":{"color":colors[2]}};
				}
			}
			
			for(var index in nodes){
				var node = nodes[index];
				if(node.category == 0 || node.nodeType == 0){
					node.itemStyle =  {"normal":{"label":{"position":"inside"}}};
				}
				if((node.category ==0 && node.nodeType == 0)) {
					node.initial = [$("#echa").width() / 2, $("#echa").height() / 2 - 100];
					node.fixX = true;
					node.fixY = true;
				}
				if(node.name == '股东') {
					node.initial = [$("#echa").width() / 2 - 320, $("#echa").height() / 2 - 260];
					node.fixX = true;
					node.fixY = true;
				}
				if(node.name == '高管') {
					node.initial = [$("#echa").width() / 2 - 320, $("#echa").height() / 2 + 120];
					node.fixX = true;
					node.fixY = true;
				}
				if(node.name == '对外投资') {
					node.initial = [$("#echa").width() / 2 + 380, $("#echa").height() / 2 - 150];
					node.fixX = true;
					node.fixY = true;
				}
				if( node.nodeType == 1){
					if(node.category == 1 ){
						node.symbolSize = 8;
					}
					if(node.category == 2){
						node.symbolSize = 8;
					}
					if(node.category == 3 ){
						node.symbolSize = 8;
					}
				}
			}
			
			var showDetail = function(result) {
				$("#detail_div").fadeOut(600);
				//公司详情
				var company = result.bizCompanyDetail;
				if(null == company) {
					$("#infoMessage").text("暂未查询到您所查询的公司信息!");
					$("#infoMessage").fadeIn("slow");
					$("#infoMessage").fadeOut(1500);
					return;
				}
				var partners = result.partnerList;
				var employees = result.employeeList;
				var outinvests = result.outinvestList;
				var detailUrl = Pingan.basePath + "/xyzj/detail?s="+company.companyNo; 
				var schemaUrl = Pingan.basePath + "/xyzj/company/schema/list?s=" + company.companyNo;
				$("#search_company_detail").attr("href", detailUrl);
				$("#search_company_schema").attr("href", schemaUrl);
				$("#company_name").html(company.companyName);
				$("#company_status").html(company.companyStatus);
				$("#legal_person").html(company.legalPerson);
				$("#capital").html(company.capital);
				$("#establish_date").html(company.establishDate);
				//股东详情begin
				var partnerHtml = "";
				partnerHtml += "<tr>" +
			                       "<th class='s-messaget1'>名称</th>" + 
			                       "<th class='s-messaget2'>占股比例</th>" +
			                   "</tr>";
				$("#partner_list").empty();
				if(null != partners && "" != partners) {
					for(var index in partners) {
						var proportion = "-";
			    		if(partners[index].proportion){
			    			 proportion = partners[index].proportion+"%";
			    		}
						partnerHtml += "<tr>" + 
										   "<td class='s-messaget1'>" + partners[index].stockName + "</td>" + 
										   "<td class='s-messaget2'>" + proportion + "</td>" + 
									   "</tr>";
					}
					$("#partner_list").append(partnerHtml);
				}else {
					$("#partner_list").append(partnerHtml);
					$("#partner_list").find("tbody").append("<h4 class='s-messageh4'>暂无该企业相关信息</h4>");
				}
				//end
				
				//主要人员begin
				var employeeHtml = "";
				employeeHtml += "<tr>" +
			                       "<th class='s-messaget1'>名称</th>" + 
			                       "<th class='s-messaget2'>职位</th>" +
			                   "</tr>";
			    $("#employee_list").empty();
			    if(null != employees && "" != employees) {
			    	for(var index in employees) {
						employeeHtml += "<tr>" + 
											"<td class='s-messaget1'>" + employees[index].employeeName + "</td>" + 
											"<td class='s-messaget2'>" + employees[index].position + "</td>" + 
										"</tr>";
					}
					$("#employee_list").append(employeeHtml);
			    }else {
			    	$("#employee_list").append(employeeHtml);
			    	$("#employee_list").find("tbody").append("<h4 class='s-messageh4'>暂无该企业相关信息</h4>");
			    }                       
				//end
				
				//对外投资begin
				var outinvestHtml = "<tr><th class='s-messaget1'>名称</th></tr>";
			    $("#outinvest_list").empty();
			    if(null != outinvests && "" != outinvests) {
			    	for(var index in outinvests) {
						outinvestHtml += "<tr><td class='s-messaget1'>" + outinvests[index].companyName + "</td></tr>";
					}
					$("#outinvest_list").append(outinvestHtml);
			    }else {
			    	$("#outinvest_list").append(outinvestHtml);
			    	$("#outinvest_list").find("tbody").append("<h4 class='s-messageh4'>暂无该企业相关信息</h4>");
			    }                       
				//end
				
				$("#detail_div").fadeIn("slow");

				//滚动条自定义
				$("#scrollBarContent-1").mCustomScrollbar({
			    	theme:"dark-2",
			    	scrollbarPosition:"inside"
			    });
				
				$("#scrollBarContent-1").find("#mCSB_1_container").css("margin-right","10px");
			}
			
			// 路径配置
		    require.config({
		        paths: {
		            echarts: Pingan.basePath + '/js/lib/echarts/build/dist'
		        }
		    });
		    require( [
			            'echarts',
			            'echarts/chart/force'
			        ],function(ec){
		    		var myChart = echarts.init(document.getElementById('echa')); 
		            var option = {
						    backgroundColor: '#f6f6f6',
						    title: {
						    	padding: [20, 0, 0, 50],
						    	textStyle: { fontSize: 24, fontWeight: 'bold', color: '#000000'},
						        text: bizCompany.companyName,
						        itemGap: 15,
						        x: 'left',
						        y: 'top'
						    },
						    tooltip : {
						        trigger: 'item',
						        formatter: '{b}'
						    },
						    toolbox: {
						        show : true,
						        feature : {
						            restore : {show: true}
						        },
						        padding: [125, 45, 0, 0]
						    },
						    color: colors,
						    legend: {
						    	orient: 'vertical',
						    	padding: [50, 40, 0, 0],
						        x: 'right',
						        data: ['股东','高管','对外投资'],
						        textStyle: {color : 'auto'},
						        selectedMode: true
						    },
						    series: [
						        {
						            type: 'force',
						            name : "企业关系",
						            ribbonType: false,
						            categories: categorys,
						            itemStyle: {
						                normal: {
						                    label: {
						                        show: true,
						                        textStyle: {
						                        	color: '#000000'
						                        },
						                        position: 'bottom'
						                    },
						                    nodeStyle : {
						                        brushType : 'both',
						                        borderColor : 'rgba(255,215,0,0.4)',
						                        borderWidth : 1
						                    },
						                    linkStyle: {
						                        type: 'curve'
						                    }
						                },
						                emphasis: {
						                    label: {
						                        show: true
						                    },
						                    nodeStyle: {
						                    	borderWidth: 0
						                    },
						                    linkStyle : {type : 'curve'}
						                }
						            },
						            useWorker: false,
						            minRadius: 10,
						            maxRadius: 20,
						            gravity: 1.1,
						            draggable: true,
						            scaling: 1.2,
						            roam: true,
						            roamController: {show:true},
						            nodes: nodes,
						            links : links
						        }
						    ]
						};
		    
		            myChart.setOption(option); 
		            var ecConfig = require('echarts/config');
					function focus(param) {
					    var data = param.data;
					    var links = option.series[0].links;
					    var nodes = option.series[0].nodes;
					    if (data.source !== undefined && data.target !== undefined) { //点击的是边
					        var sourceNode = nodes.filter(function (n) {return n.name == data.source;})[0];
					        var targetNode = nodes.filter(function (n) {return n.name == data.target;})[0];
					    } else { // 点击的是点
					        if(data.category == 1 && data.nodeType == 1) {	//股东	需要根据公司名称去查
					        	var stockName = data.object.companyNameDigest;
					        	if(stockName != null && stockName.indexOf("公司") > -1) {
						        	$.post(Pingan.basePath + "/xyzj/company/schema/detail", {"companyNameDigest":stockName}, function(result) {
										if(result.statusCode==1){
											showDetail(result.data);
										}
						        	});
					        	}
					        }
					        if(data.category == 2 && data.nodeType == 1) {}	//高管ignore
					        if(data.category==0 || (data.category == 3 && data.nodeType == 1)) {	//对外投资	
					        	$.post(Pingan.basePath + "/xyzj/company/schema/detail", {"companyNameDigest":data.object.companyNameDigest}, function(result) {
									if(result.statusCode==1) {
										showDetail(result.data);
									}
					        	});
					        }
					    }
					}
					myChart.on(ecConfig.EVENT.CLICK, focus);
					
					//图标加载完成调用
					myChart.on(ecConfig.EVENT.FORCE_LAYOUT_END, function () {
					});
					
					window.onresize = myChart.resize;
		    });
			
	 };
	 
	 var closes = function(){
		 $("#detail_div").fadeOut(500);
	 };
	    
	 var detailList = function (){
		   $("#detail_list").find("a").on("click", function(){
				$("#detail_list").find("a").removeClass("current");
				$(this).addClass("current");
				var id = $(this).attr("attr");
				$("#detail_list").find("table").hide();
				$("#" + id).show();
			});
	 };
	 
	 var btnClose = function(){
		 $("#btnClose").on("click", function() {
				$("#detail_div").hide();
			});
	 };

	var level = function (){
		$("#level").change(function() {
			$("#search_form").find("input[name='level']").val($(this).val());
			$("#search_form").submit();
		});
	};
	
	var dateLimit =  function(){
		$("#dateLimit").change(function(){
			$("#search_form").find("input[name='dateLimit']").val($(this).val());
			$("#search_form").submit();
		});
	};
	 
	 var init = function (){
	 };
	 
	  return {
		  init : init,
		  initCompanySchema:initCompanySchema,
		  closes:closes,
		  detailList:detailList,
		  btnClose:btnClose,
		  level:level,
		  dateLimit:dateLimit
	  };
	  
  })();
	 
   (function (){
	  Pingan.Base.init();
	  Pingan.Load.init();
	  Pingan.Event.init();
	})();
	
});