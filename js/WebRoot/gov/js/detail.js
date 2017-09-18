require.config({
	waitSeconds : 0,
	baseUrl : basePath,
	paths : {
		Pingan : 'gov/js/common/common',
		mCustomScrollbar : 'gov/js/lib/jquery.mCustomScrollbar.concat.min',
        category_operation_state : 'gov/js/category_operation_state',
		echarts:'gov/js/lib/echarts.min',
		qrcode : 'gov/js/lib/jquery-qrcode-0.14.0',
		popup : 'gov/js/lib/popup_layer',
		Raphael: 'gov/js/lib/raphael.min',
		comment : 'gov/js/comment',
		top: 'gov/js/gov_top'
	},
	shim : {
		mCustomScrollbar : {
			deps : [ 'Pingan' ]
		},
        category_operation_state : {
			deps : [ 'Pingan','echarts' ]
		},
		qrcode : {
			deps : [ 'Pingan' ]
		},
		popup : {
			deps : [ 'Pingan' ]
		},
		Raphael:{
			deps : [ 'Pingan' ]
		},
		comment : {
			deps : [ 'Pingan' ]
		},
		top : {
			deps : [ 'Pingan' ]
		}
	},
	deps : [ 'top', 'qrcode', 'mCustomScrollbar', 'comment' ]
});
var initWaterElectricGasFundTrend;
require(['Pingan', 'echarts','Raphael','category_operation_state',"qrcode", 'comment'],function (Pingan,echarts,Raphael, category_operation_state,qrcode){
	
	Pingan.Base = (function (){
		
		//初始化全局变量
		var initGlobalVar = function (){
			pvs = new Array(),kws = new Array();
			noData = "<img src='" + basePath + "/images/nodata.jpg' style='width: 459px; height: 221px;' />";
			page_data = new Array();
			domains = new Array();
			viewTab=getUrlParameter("tab");
		};
		
		//是否登录
		var isLogined = function () {
		    var isLogin = false;
            $.ajax({
                url : basePath + "/gov/current/user?currentDate="+new Date().toTimeString(),
                async:false,
                success:function(data){
                    if(data.statusCode==1 && data.data != null){
                     isLogin = true;
                    }
                }
            });
            return isLogin;
		};
		
		//跳转到登录 
		var turnToLogin = function (){
			window.location.href = Pingan.basePath + "/gov/toLogin";
		};
		
		//检验登录
		var checkLogin = function (){
			if(!isLogined()){
				turnToLogin();
			}
		};
		
		
		//初始化二维码
		var initQrcode = function(){
			var options = {
		        render: 'image',
		        minVersion: 1,
		        maxVersion: 40,
		        ecLevel: 'H',
		        left: 0,
		        top: 0,
		        size: 200,
		        fill: '#000',
		        background: '#fff',
		        text: window.location.href,
		        radius: 0,
		        quiet: 3,
		        mode: 4,
		        mSize: 0.2,
		        mPosX: 0.5,
		        mPosY: 0.5,
		        label: 'no label',
		        fontname: 'sans',
		        fontcolor: '#000',
		        image: $("#codeLogo")[0]
		    };
		    $('#qrcode').qrcode(options);
		};

		//初始化我要举报
		var initToReport = function () {
			$("#toReportCompanyName").html($("input[name=reportWebsite]").val());
			$("#iWantReport").click(function () {
				if(!isLogined()){
					checkLogin();
					return;
				}
                Pingan.malert($("#openReport"),$("#closeReport,#cancelToReport"),{opacity:0.2, onclose:function (){
                    // $("#closeActivity").show();
                }});
            });
            var errorMsg = new Pingan.Popover($('#errorMsg'), $('#errorMsg'));
            var toReportForm =new Pingan.MForm($("#toReportForm"),errorMsg);
            toReportForm.isAjax=true;

            toReportForm.afterSubmit=function (result) {
                $("#openReport").fadeOut(150);
                if($("#malert_mask").length!=0){
                    $("#malert_mask").remove();
                }
            };

			$("#confirmToReport").click(function () {
                $("#toReportForm").submit();
            });

/*			$("#cancelToReport").click(function () {
                $("#openReport").fadeOut(150);
                if($("#malert_mask").length!=0){
                    $("#malert_mask").remove();
                }
            });*/

        };
		
        
        /**
		 * 将角度转换成弧度
		 * @param x
		 * @returns {number}
		 */
		var genderAngle = function(x){
			return x * Math.PI / 180
		}
		
		/**
		 * 由于信用分刻度不均匀，定制弧度终点
		 * @param value
		 * @param total
		 * @param angle
		 * @returns {number}
		 */
		var genderAlpha = function(value, total, angle){
			/*
			* 350 - 550 : 0   - 200 : 200 
			* 550 - 600 : 200 - 250 : 50
			* 600 - 650 : 250 - 300 : 50
			* 650 - 700 : 300 - 350 : 50
			* 700 - 950 : 350 - 600 : 250
			* */
			var avgAngle = angle / 5;
			var a = 0;
			if(value <= 200){
				a = value / 200 * avgAngle;
			}
			if(value > 200 && value <= 250){
				a = (1 + (value - 200) / 50) * avgAngle;
			}
			if(value > 250 && value <= 300){
				a = (2 + (value - 250) / 50) * avgAngle;
			}
			if(value > 300 && value <= 350){
				a = (3 + (value - 300) / 50) * avgAngle;
			}
			if(value > 350 && value <= 600){
				a = (4 + (value - 350) / 250) * avgAngle;
			}
			return a;
		}
		
        
		//初始化信用等级
		var initCreditLevel = function (){
            $.ajax({
                url:basePath+"/gov/company/score?companyNameDigest="+DetailCfg.companyNameDigest,
                success:initCreditLevelCallBack
            })
		};
		

		
		var initCreditLevelCallBack = function(json){
			if(json == null || json.statusCode != 1){
				$("#companyLevel").hide();
				return;
			}
			var score = json.data.score;
			var level = json.data.level;
            $("#score-holder").attr('score',score);
            $("#credit_span").html(level);

			var CONSTANT = {
				height : 180,//画板的高度
				width : 290,//画板的宽度
				radius : 115,//圆弧的半径
				angle : 215,//需要生成的圆弧的角度，(圆弧适用左右对称)
				total : 600,//最大值(最小值为0)
				x : 146,//原点在画板的位置 x 轴
				y : 138//原点在画板的位置 y 轴
			}
			//这些常量如以后需要可提取封装出来
			var paper = new Raphael("score-holder", CONSTANT.width,CONSTANT.height);
			var initAlpha = (360 - CONSTANT.angle) / 2;
			var initX = CONSTANT.x - CONSTANT.radius * Math.sin(genderAngle(initAlpha));
			var initY = CONSTANT.y + CONSTANT.radius * Math.cos(genderAngle(initAlpha));
			var endX = initX,endY = initY;
			paper.customAttributes.arc = function (value, total, radius) {
				var alpha = genderAlpha(value, total, CONSTANT.angle);
				//var alpha = CONSTANT.angle / total * value;
				var a = initAlpha + alpha;
				var x = CONSTANT.x - radius * Math.sin(genderAngle(a));
				var y = CONSTANT.y + radius * Math.cos(genderAngle(a));
				endX = x;
				endY = y;
				var path = [["M", initX, initY], ["A", radius, radius, 0, +(alpha > 180), 1, x, y]];
				return {path: path};
			}
			
			//灰色的 底色 圆弧
			paper.path().attr({"stroke-width": 2,stroke: '#f4f4f4'}).attr({arc: [CONSTANT.total,CONSTANT.total,CONSTANT.radius]});
			var score = parseInt($("#score-holder").attr("score"));
			score = score <= 350 ? 350 : score;
			score = score > 950 ? 950 : score;
			score -= 350;
			if(score > 0){
				var arcColor ='#a8cbe9';
				var cricleColor = '#65a0e2';
				var frontArc = paper.path().attr({"stroke-width": 2,stroke: arcColor}).attr({arc: [0,CONSTANT.total,CONSTANT.radius]});
				frontArc.animate({arc: [score, CONSTANT.total, CONSTANT.radius]}, 600, ">",function(){
					//绘制指示点
					paper.circle(endX,endY,3).attr({fill: cricleColor,stroke:cricleColor});
				});
			}
		}

		/**统计的公用方法（在PageHandler.onLoaded方法中调用）
		 * @param obj 最终显示结果的对象
		 * @param name 子项名称
		 * @param total 子项条数
		 * */
		var initCount = function (obj, name, total){
			var oldTotal = Number(obj.html());
			oldTotal = isNaN(oldTotal) ? 0 : oldTotal;
			var namTotal = Number(obj.attr(name));
			namTotal = isNaN(namTotal) ? 0 : namTotal;
			if(namTotal != total){
				var newTotal = oldTotal - namTotal + total;
				obj.html(newTotal);
				obj.attr(name, total);
			}
		}
		
		//统计行政许可信息
		var initCorpProdCoun = function (){
			var corpProdCoun = parseInt(DetailCfg.ssQualificationInformationCount)+parseInt(DetailCfg.safetyProductionLicenseCount)+parseInt(DetailCfg.qualityLicenseForSafetyCount)+parseInt(DetailCfg.dischargePermitCount)+parseInt(DetailCfg.corpProdUalsnbrfCount);
			$("#searchbadge_small").html(corpProdCoun);
		}

		//统计风险信息
		var initJudicialCoun = function (){
		/*	var pageNum1 = 0;
			$("#corpProdPenalty").find("small.searchbadge").each(function (){
				var num = Number($(this).html());
				if(!isNaN(num)){
					pageNum1 += num;
				}
			});
*/
            var pageNum2 = 0;
            var page=$("#sJudicialProceedings small");

            for(var i=0,len=page.length;i<len;i++){
                pageNum2 = parseInt($(page[i]).text()) + pageNum2;
            }
            // $("#knowledgeCount").html(pageNum2);

		    $("#corpProdCount").html(pageNum2);
		};
		
		//统计税务信息
		var initTaxinfoCoun = function (){
		    $("#searchbadge_taxsmall").html(parseInt($("#searchbadge_taxBasic").text())+parseInt($("#searchbadge_rentBasic").text()));
            if($("#searchbadge_taxsmall").text()!=""){
                $("#taxCount").text($("#searchbadge_taxsmall").text());
            }else{
                $("#searchbadge_taxsmall").text(0);
            }

		};

        //统计知识产权
        var initKnowledgeCount = function () {
            var pageNum2 = 0;
            var page=$("[name = 'tab-menu-detail-knowledge'] small");

            for(var i=0,len=page.length;i<len;i++){
                pageNum2 = parseInt($(page[i]).text()) + pageNum2;
            }
            $("#knowledgeCount").html(pageNum2);
        };

		//初始化评论表单
		var initCommentForm = function (){
			
			var companyId = DetailCfg.bizCompanyId;//${requestScope.bizCompany.companyId};
			var companyName = DetailCfg.bizCompanyName;//"${bizCompany.companyName}";
			var userName = DetailCfg.userName;//"${user.userName}";
			$(".bizCompanyId").val(companyId);
			$(".bizCompanyName").val(companyName);
			
			var commentForm = new Pingan.MForm($(".commentForm"));
			commentForm.isAjax = true;
			commentForm.beforeSubmit = function(){
				checkLogin(); 
				var text = commentForm.getItem("commentContent");
				if($("#commentContent").val()=='')
				{
                    Pingan.malertInfo("请输入评论内容", 'infoMessage warning');
					return false;
				}
				if($(".commentLevel").val() == 0) {
					// text.addError("请打分");
                    Pingan.malertInfo("请打分", 'infoMessage warning');
                    return false;
				}
				return true;
			};
			commentForm.afterSubmit = function(result){
				if(typeof result == "string"){
					result = eval('(' + result + ')');
				}
				Pingan.malertInfo(result.statusMessage, 'infoMessage warning');
				if(result.statusCode==1){
					commentForm.reset();
					global.pageHandlers.get("newComment").loadData();
				}else if(result.statusCode == 5){
					turnToLogin();
				}
				return true;
			}
			$("#submitComment").click(function(){$(".commentForm").submit();});
			
		};

        //变更记录初始化长度
        var initChangeListMaxLength = function () {
            maxlength($("#change_list").find("[maxlength]"));
        };

        //初始化资本动态
        var initCapitalDymaincs=function() {
            $(window).load(function () {
                $("#scrollBarContent-1").mCustomScrollbar({
                    theme: "dark-2"
                });
            });
        };

      var initDajieScore = function(){}

		var init = function (){
			initGlobalVar();
			initQrcode();
            // claimLabel();
            initToReport();
			//initCreditLevel();
			initCommentForm();
			initCorpProdCoun();
			initJudicialCoun();
			initTaxinfoCoun();
            initChangeListMaxLength();
            initCapitalDymaincs();
            initKnowledgeCount();
            //initDajieScore();
		};
		
		return {
			init : init,
			isLogined : isLogined,
			turnToLogin : turnToLogin,
			checkLogin : checkLogin,
			initCount : initCount
		};
	})();
	
	Pingan.Load = (function (){

		//加载用户关注信息
		var loadUserFollow = function(){

            $.ajax({
                type: "post",
                async: false,
                url: Pingan.basePath + "/user/favorites/" + DetailCfg.encodExist,
                data:{"companyNameDigest" : DetailCfg.companyNameDigest,"companyId":DetailCfg.bizCompanyId},
                dataType: "jsonp",
                jsonp: "callback",//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
                jsonpCallback: "receive",//自定义的jsonp回调函数名称，
                success: function (data) {
                    if(data.data == true)
                    {
                        $("#follow").html('已关注');
                        $("#follow").addClass('followed');
                    }else{
                        $("#follow").html('关注');
                        $("#follow").removeClass('followed');
                    }
                },
                error: function (e) {
                    console.log("获取关注状态失败",e);
                }
            });

        };
		
		//最近被查询的企业
		var loadSearcheHistory = function (){
			var companyDetailUrl = DetailCfg.companyDetailUrl;
			$.get(Pingan.basePath+"/gov/company/recentsearched/list",function (result){
				if(result["statusCode"] != 1){
					return;
				}
				var coms=result["data"];
				var inHtml="";
				if(coms && coms.length > 0){
					for ( var i = 0; i < coms.length && coms[i] != undefined; i++) {
						// inHtml=inHtml+("<li ><a href='"+companyDetailUrl+"' target='_blank' >").replace('companyNo', coms[i]["companyNo"])+coms[i]["companyName"]+("</a><span><a href='"+companyDetailUrl+"'></a></span></li>").replace('companyNo', coms[i]["companyNo"]);
						inHtml=inHtml+("<a href='"+companyDetailUrl+"' target='_blank' >").replace('companyNo', coms[i]["companyNo"])+coms[i]["companyName"]+"</a>";
						// $("#recentSearched").html(inHtml);
					}
                    $("#recentSearched").append(inHtml);
                    return;
				}
				$("#recentSearched").html("<div style='line-height:45px;text-align:center;'>你还未浏览过任何公司哦</div>");
			});
		};
		
		//加载税务信息
		var loadCompanyTaxChartsNew = function (){
		    /*   companyTaxCharts('${bizCompany.companyNameDigest}',"${basePath}/company/tax/list","tax_nation_chart",1);
		     companyTaxCharts('${bizCompany.companyNameDigest}',"${basePath}/company/tax/list","tax_local_chart",2);
		     companyTaxCharts('${bizCompany.companyNameDigest}',"${basePath}/company/tax/list","elec_pay",3);
		     companyTaxCharts('${bizCompany.companyNameDigest}',"${basePath}/company/tax/list","water_pay",4);*/
			companyTaxChartsNew(DetailCfg.companyNameDigest, Pingan.basePath + "/gov/company/tax/list",9);
		    companyTaxChartsNew(DetailCfg.companyNameDigest, Pingan.basePath + "/gov/company/tax/list", 5);
		    companyTaxChartsNew(DetailCfg.companyNameDigest, Pingan.basePath + "/gov/company/tax/list", 6);
		    companyTaxChartsNew(DetailCfg.companyNameDigest, Pingan.basePath + "/gov/company/tax/list", 14);
		    companyTaxChartsNew(DetailCfg.companyNameDigest, Pingan.basePath + "/gov/company/tax/list", 15);
		    // companyTaxChartsNew(DetailCfg.companyNameDigest, Pingan.basePath + "/company/tax/list", 16);
		};

        //水、电、燃气、公积金缴费趋势
         initWaterElectricGasFundTrend = function (startDateStr,endDateStr,companyNameDigest,isInit){
                $.ajax({
                    url: basePath+"/gov/company/water/electric/gas/fund/trend/ajax/list",
                    data:{"startDateStr":startDateStr,"endDateStr":endDateStr,"companyNameDigest":companyNameDigest,"isInit":isInit},
                    success: function (data) {
                        if (data.statusCode == 1) {
                        	//如果需要授权，默认图表隐藏，在此处打开
                            // $("#water_electric_gas_fund_time").show();
                            // $("#water_electric_gas_fund_trend").show();
                            var data = data['data'];
                            if(!startDateStr){
                                $("#startDate").val(data.dateList[0]);
                            }
                            if(!endDateStr){
                                $("#endDate").val(data.dateList[data.dateList.length-1]);
                            }
                            var water_electric_gas_fund_trend_graph=echarts.init(document.getElementById("water_electric_gas_fund_trend"));
                            water_electric_gas_fund_trend_graph.setOption(option = {
                                    title: {
                                        show:false,
                                        text: '各地区信用等级趋势'
                                    },
                                    color:["#FFCB4F","#59B6F2","#00B99C","#D36A41"],
                                    tooltip: {
                                    	show:false,
                                        trigger: 'axis',
                                        formatter: function (params, ticket, callback) {
                                            var html = params[0].name +" "+"<br/>";
                                            for(var i =0 ;i<params.length;i++){
                                                html +="<div style='width: 10px; height: 10px; background: "+params[i].color+"; -moz-border-radius: 50px; -webkit-border-radius: 50px; border-radius: 50px; float:left; margin-top:6px;'></div> "+params[i].seriesName +"<br/>";

                                            }
                                            return html;
                                        }
                                    },
                                    legend: {
										bottom:'2%',
                                        data:['水','电','燃气','公积金']
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
                                        axisLine:{
                                    		show:false
										},
                                        axisLabel:{
                                        	show:false
										},
                                        axisTick:{show:false},
                                        splitLine: {
                                        	show:true,
                                            lineStyle: {
                                                type: 'solid'
                                            }
                                        },
                                        type: 'value'
                                    },
                                    series: [
                                        {
                                            symbolSize:10,
                                            symbol:'rect',
                                            name:'水',
                                            type:'line',
                                            data:data["water"]
                                        },
                                        {
                                            symbol:'triangle',
                                            symbolSize:10,
                                            name:'电',
                                            type:'line',
                                            data:data["electric"]
                                        },
                                        {
                                            symbol:'emptyCircle',
                                            symbolSize:10,
                                            name:'燃气',
                                            type:'line',
                                            data:data["gas"]
                                        },
                                        {
                                            symbolSize:10,
                                            symbol:'circle',
                                            name:'公积金',
                                            type:'line',
                                            data:data["cpf"]
                                        }
                                    ]
                                }
                            )

                        }else if(data.statusCode == 2)
                        	{
                        		var html='<div class="detail_nodata" >暂未收录该企业相关信息</div>';
                        		$("#water_electric_gas_fund_time").hide();
                        		$("#water_electric_gas_fund_trend").replaceWith(html);
                            }else if(data.statusCode == 4)
                            {
                                var html='<div class="detail_nodata" >参数错误</div>';
                                $("#water_electric_gas_fund_time").hide();
                                $("#water_electric_gas_fund_trend").replaceWith(html);
							}else if(data.statusCode == 6)
							{
                                var html='<div class="detail_nodata" >查询水、电、燃气、公积金趋势失败</div>';
                                $("#water_electric_gas_fund_time").hide();
                                $("#water_electric_gas_fund_trend").replaceWith(html);
							}

                    },
                    error: function(XMLHttpRequest, textStatus, errorThrown) {
                        if(XMLHttpRequest.status==403){
                            Pingan.mconfirm("查询水、电、燃气、公积金趋势失败",function (){
                            });
                        }
                    }
                });
        };
		
		//电商趋势
		var initShopSaletrend = function (){
			$.post(Pingan.basePath + "/gov/shopsaletrend/list",{"companyNameDigest" : DetailCfg.companyNameDigest},function (result){
                category_operation_state.loadShopSaleTrend('shopSaleTrend',result);
				$("#ecshopDiv").hide();
		        $(".tab-menu").find("a").click(function () {
		            $(this).siblings().removeClass("current");
		            $(this).addClass("current");
		        });
			});
		};
		
		//加载企业域名列表
		var initCompanyDomain = function (){
			var page_total = DetailCfg.adminPunishPageTotal;
			var adminPunishPage = DetailCfg.adminPunishPageContent;
		    $.post(Pingan.basePath + "/gov/uwc/detail", "companyId=" + DetailCfg.bizCompanyId, function (resultDm) {
		        if (resultDm["statusCode"] == 1) {
		            if (resultDm["data"].length > 0) {
		                //生成域名标题
		                domains = resultDm["data"];
		                if (domains != undefined && domains != null) {
                            $("#domainList").show();
                            $("#domainCountEm").html(domains.length);
		                    $("#count_domains").html(domains.length);
                            $("#count_domains").show();
		                } else {
		                    $("#count_domains").html(0);
		                }
		                var t_html = "";
		                for (var i = 0; i < domains.length; i++) {
		                    var data = domains[i];
		                    var on_str = "off";
		                    var icp = data["icp"];
		                    if (null == icp) {
		                        icp = "";
		                    }
		                    /* <li><span class="status-zc">白鲸社区</span><span class="status-zy">www.baijingapp.com</span><a href="javascript:void(0)" class="status-zk">展开详情>></a></li> */
		                    if (i == 0) {
		                        t_html += "<li turn='current' display domRow='" + i + "' class='current'><span class='status-zc'>" + data["websiteName"] + "</span><a  href='javascript:void(0)' class='status-zk'>" + data["domain"] + "<img src='" + Pingan.basePath + "/images/link-icon.png'></a></li>";
		                    } else {
		                        if (i < 5) on_str = "stay";
		                        t_html += "<li  display turn='" + on_str + "' domRow='" + i + "'><span class='status-zc'>" + data["websiteName"] + "</span><a  href='javascript:void(0)' class='status-zk'>" + data["domain"] + "<img src='" + Pingan.basePath + "/images/link-icon.png'></a></li>";
		                    }
		                }
		                var imgUrl = "http://snapshot.laoniushuju.com/" + domains[0]["domain"].charAt(0) + "/" + domains[0]["domain"] + ".png";
		                $("#website_img").attr("src", imgUrl);
		                $("#domain_ti").html(t_html);
		                $("#domain_ti").append("<div class='row-page fenye new-row-page' style='text-align:right;'></div>");
		                $("[turn='on']").after($("#website_info"));

		                simpleFenye($("#domain_ti"), 1);

		                var row = -1;
		                //绑定onclick事件
		                $("[domRow]").click(function () {
		                    $("[domRow]").find(".on_off").html("");
		                    $("[domRow]").attr("turn", "off");
		                    if (row != Number($(this).attr("domRow"))) {
		                        row = Number($(this).attr("domRow"));
		                        var imgUrl = "http://snapshot.laoniushuju.com/" + domains[row]["domain"].charAt(0) + "/" + domains[row]["domain"] + ".png";
		                        $("#website_img").attr("src", imgUrl);
		                        $(this).find(".on_off").html("");
		                        $(this).after($("#website_info"));
		                        /* $(this).parent().find("li").find("a").html("展开详情");
		                         $(this).find("a").html("收起"); */
		                        $(this).addClass("current");
		                        $("#website_info").slideDown();
		                       // lightStar();
		                        //判断是否已经加载过该域名的数据
		                        if (pvs[row] != undefined) {
		                            loadPvAndKw(row,category_operation_state);
		                        } else {
		                            postPvAndKw(row,category_operation_state);
		                        }
		                    } else {
		                        /* $(this).find("a").html("展开详情"); */
		                        $(this).removeClass("current");
		                        $("#website_info").slideUp();
		                        row = -1;
		                    }
		                    //Pingan.moveTo($("#manageCredit"), 0, 500)
		                });
		                //lightStar();
		                $("[domRow]").eq(0).click();
		            } else {//未查询到域名
		                $("#sitepv").html(noData);
		                $("#manageCredit").find(".info").nextAll().css("display", "none");
		                $("#manageCredit").append("<div class='detail_nodata'>暂未收录该企业相关信息</div>");
		                $("#manageCredit a").hide();
		            }
		        } else {//查询失败
		            $("#sitepv").html(noData);
		            $("#manageCredit").find(".base-message").nextAll().css("display", "none");
		            $("#manageCredit").append("<div class='detail_nodata'>暂未收录该企业相关信息</div>");
		        }

		        var annual_inspect_count_num = 0;
		        var domainNum = 0;
		        var taxNum = 0;
		        var adminPunishCountNum = 0;
		        var credit_enterpriseInfosCountNum = 0;
		        var corp_prod_awardsCountNum = 0;
		        if (domains != undefined && domains != null) {
		            domainNum = domains.length;
		        }

                var annual_inspect_count_num_html = $("#annual_inspect_count_num").text();
                if(annual_inspect_count_num_html != '' && !isNaN(annual_inspect_count_num_html)){
                    annual_inspect_count_num = parseInt(annual_inspect_count_num_html);
                }
		        var taxHtml = $("#taxCount").text();
		        if(taxHtml != '' && !isNaN(taxHtml)){
		        	taxNum = parseInt(taxHtml);
		        }
		        var adminPunishCountHtml = $("#adminPunishCountEm").text();
                if(adminPunishCountHtml != '' && !isNaN(adminPunishCountHtml)){
                    adminPunishCountNum = parseInt(adminPunishCountHtml);
                }
                var credit_enterprise_infos_count_html = $("#credit_enterpriseInfosCountEm").text();
                if(credit_enterprise_infos_count_html != '' && !isNaN(credit_enterprise_infos_count_html)){
                    credit_enterpriseInfosCountNum = parseInt(credit_enterprise_infos_count_html);
                }
                var corp_prod_awardsCountHtml = $("#corp_prod_awardsCountEm").text();
                if(corp_prod_awardsCountHtml != '' && !isNaN(corp_prod_awardsCountHtml)){
                    corp_prod_awardsCountNum = parseInt(corp_prod_awardsCountHtml);
                }
		        $("#operationCount").html( parseInt(domainNum)+taxNum+adminPunishCountNum+credit_enterpriseInfosCountNum+corp_prod_awardsCountNum+annual_inspect_count_num);
		    });
		};
		
		//初始化分页
		var initPageHandler = function (){
			
			/**基本信息 TODO*/
			
			//变更记录分页
			var changePage = new Pingan.PageHandler($("#change_list"), $("#change_list").next(".d-page"));
			changePage.formateItem = function (index, model, row){
				var item = $(model.format(row["changeField"],row["contentBefore"],row["contentAfter"],new Date(parseInt(row["changeDate"])).format("yyyy-MM-dd")).replace(/null/g, ' '));
				maxlength(item.find("[maxlength]"));
				return item;
			};
			
			
			//分支机构分页
			var branchPage = new Pingan.PageHandler($("#branch_list"), $("#branch_list").next(".d-page"));
			branchPage.formateItem = function (index, model, row){
                var companyNo = row["companyNo"]?DetailCfg.companyDetailUrl.replace("companyNo",row["companyNo"]):"javascript:void(0);";
                var companyName = row["companyName"]?row["companyName"]:"暂无";
                var companyCode = row["companyCode"]?row["companyCode"]:"暂无";
                var legalPerson = row["legalPerson"]?row["legalPerson"]:"暂无";
                var companyStatus = row["companyStatus"]?row["companyStatus"]:"暂无";
                var establishDate = row["establishDate"]?row["establishDate"]:"暂无";
				return model.format(companyNo,companyName,companyCode,legalPerson,companyStatus,establishDate).replace(/null/g, ' ');
			};
			
			//股东分页
			var partnerPage = new Pingan.PageHandler($("#partner_list"), $("#partner_list").parents(".panel-body").siblings(".d-page"));
			partnerPage.formateItem = function (index, model, row){
				var partner = row;
				var stockName = partner.stockName;
				
				//股东名称
				var partnerNameStr = "<a href=\""+Pingan.basePath+"/search?key="+partner.stockName +"\" style=\"text-decoration: none\" partner_name tag_attr='sht'>"+partner.stockName +"</a>";
				if(stockName && (stockName.indexOf(":") > 0)){
					partnerNameStr = "<a href=\""+DetailCfg.companyDetailUrl.replace('companyNo', stockName.split(":")[1])+"\" style=\"text-decoration: none\" partner_name tag_attr='tag_attr='sht''>" + stockName.split(":")[0] +"</a>";
				}
				
				//计算出资比例
				var proportion = 0;
				var allCapital = parseFloat($("#bizCompanyCapital").text().replace(/[ ]/g,"").replace(/[\r\n]/,"").replace(/[^\d|.]/g,""));
				var realCapital = parseFloat((partner.stockCapital + "").replace(/[^\d|.]/g,""));
				if(isNaN(allCapital) || isNaN(realCapital)){
					proportion = "暂未公开";
				}else{
					proportion = parseFloat(Math.round((realCapital / allCapital)*10000))/100;
					proportion = isNaN(proportion) ? "暂未公开" : (proportion + "%");
				}
				return model.format(partnerNameStr, partner.stockCapital || '暂未公开', partner.stockRealcapital || '暂未公开', proportion).replace(/null/g, ' ');
			};
			
			//投资者信息分页
			var investorPage = new Pingan.PageHandler($("#businessInvest_list"), $("#businessInvest_list_dpage").next(".d-page"));
			investorPage.formateItem = function (index, model, row){
				return model.format(row["investorName"],row["icCode"],row["investorNationCode"],row["investAmount"],row["amountUnit"],row["investProportion"]).replace(/null/g, ' ');
			};
			investorPage.onLoaded = function (result){
                if(this.total < 1){
                    this.content.parents(".panel-body").hide();
                }
                if(result.statusCode==1){
                    $("#businessInvest_no").hide();
                }else{
                    $("#nodataInvest").hide();
                }
            };

			//最新评论分页
            var totalCommentCount=0;
			var newCommentPage = new Pingan.PageHandler($("#comments"), $("#comments").siblings(".d-page"));
			newCommentPage.onLoaded = function (result){
				$(".netCommentTotal").text(this.total);
                totalCommentCount = this.total;
                $("#totalCommentCount").html(totalCommentCount);
                if(totalCommentCount==0)
                {
                    $("#totalCommentCount").hide();
                }

                Pingan.Base.initCount($("#commentTotal"), "newComment", this.total);
			};
			newCommentPage.formateItem = function (index, model, row){
				var userName = row.userName;
				var nameStr = isNaN(userName) ? userName.split("@")[0] : (userName.substring(0,3) + "****" + userName.substring(userName.length-2, userName.length));
				var imgDisplay = row.userType == 4 ? "inline" : "none";
				var item = $(model.format(nameStr, imgDisplay, row["commentLevel"], new Date(parseInt(row["commentTime"])).format("yyyy-MM-dd"), row["commentContent"]).replace(/null/g, ' '));
				Pingan.lightStar(item.find(".istar"));
				return item;
			};

			/**经营状况 TODO */
			
			
			
			/**风险信息 TODO */ 
			
			//诉讼记录分页
			var courtPage = new Pingan.PageHandler($("#courtDoc_list"), $("#courtDoc_list").parents(".panel-body").siblings(".d-page"));
			courtPage.formateItem = function (index, model, row){
				return model.format(row["docTitle"],row["docSubtype"],row["docTime"],row["id"]);
			};
			
			//失信被执行分页
			var uncrePage = new Pingan.PageHandler($("#uncre_list"), $("#uncre_list").parents(".panel-body").siblings(".d-page"));
			uncrePage.formateItem = function (index, model, row){
				return model.format(row["anno"],row["actionerMark"],new Date(parseInt(row["filingDate"])).format("yyyy-MM-dd"),row["uncreditId"]);
			};
			
			//涉诉被执行分页
			var exePage = new Pingan.PageHandler($("#exe_list"), $("#exe_list").parents(".panel-body").siblings(".d-page"));
			exePage.formateItem = function (index, model, row){
				return model.format(row["filingNo"],row["execSubject"],row["execStatus"],row["execGov"],new Date(parseInt(row["filingDate"])).format("yyyy-MM-dd"));
			};
			
			
			
			/**累计评论 TODO */

			//网友评论分页
			var netCommentPage = new Pingan.PageHandler($("#netComment_list"), $("#netComment_list").siblings(".d-page"));
			netCommentPage.onLoaded = function (){
				// Pingan.Base.initCount($("#commentTotal"), "netComment", this.total);
				$("#netCommentCount").html(this.total);
            };
			netCommentPage.formateItem = function (index, model, row){
				var userName = row.userName;
				var nameStr = isNaN(userName) ? userName.split("@")[0] : (userName.substring(0,3) + "****" + userName.substring(userName.length-2, userName.length));
				var item = $(model.format(nameStr, row["commentLevel"], new Date(parseInt(row["commentTime"])).format("yyyy-MM-dd"), row["commentContent"]).replace(/null/g, ' '));
				Pingan.lightStar(item.find(".istar"));
				return item;
			};

			//协会评论分页
			var comityCommentPage = new Pingan.PageHandler($("#comityComment_list"), $("#comityComment_list").siblings(".d-page"));
			comityCommentPage.onLoaded = function (){
				// Pingan.Base.initCount($("#commentTotal"), "comityComment", this.total);
                $("#comityCommentCount").html(this.total);
                // totalCommentCount+=this.total;
                // $("#totalCommentCount").html(totalCommentCount);

            };
			comityCommentPage.formateItem = netCommentPage.formateItem;

			//员工评论分页
			var dajieCommentPage = new Pingan.PageHandler($("#dajieComment_list"), $("#dajieComment_list").parent().next(".d-page"));
            dajieCommentPage.onLoaded = function (){
                if(this.total>0){
                    $("#employeeBody").show();
                    $("#dajieComment").show();
                    $("#employeeCommentCount").html(this.total);
                    Pingan.Base.initCount($("#commentTotal"), "employeeCommentCount", this.total);
                    totalCommentCount+=this.total;
                    if(totalCommentCount!=0)
                    {
                        $("#totalCommentCount").html(totalCommentCount);
                    }else
                    	{
                            $("#totalCommentCount").html('');
                            $("#totalCommentCount").removeAttr("class");
                            $("#totalCommentCount").css("border","0");
						}
                }
            };
			dajieCommentPage.formateItem = function (index, model, row){
				return model.format(row["commentContent"], row["identityType"]);
			};

			/**知识产权*/
			
			//商标分页
			var tmInfoPage = new Pingan.PageHandler($("#tmInfoList"), $("#tmInfoList").parents(".ipr").next(".d-page"));
			tmInfoPage.formateItem = function (index, model, row){
				var cls = index % 2 == 0 ? 'ipr-list-left' : '';
				var img = '<img mark="tm_img" src="'+row["imgUrl"]+'"  onerror="javascript:this.style.display=\'none\'" />';
				return model.format(cls, img, row["tmName"], row["intCls"], row["type"], row["catName"]);
			};
			
			//专利分页
			var patentPage = new Pingan.PageHandler($("#patent_list"), $("#patent_list").parents(".panel-body").siblings(".d-page"));
			patentPage.formateItem = function (index, model, row){
				return model.format(row["patentNo"],row["patentName"],row["patentType"],new Date(parseInt(row["patentDate"])).format("yyyy-MM-dd"),row["id"]);
			};
			
			//行政许可资质
			var honorPage = new Pingan.PageHandler($("#honor_list"), $("#honor_list").parents(".change").next(".d-page"));
			honorPage.formateItem = function (index, model, row){
				return model.format('<img src="'+row["thumbnail"]+'" />',row["honorName"],row["authority"],new Date(parseInt(row["notBefore"])).format("yyyy-MM-dd"),new Date(parseInt(row["notAfter"])).format("yyyy-MM-dd"));
			};
			
			//软件著作权
			var softwarePage = new Pingan.PageHandler($("#software_list"), $("#software_list").parents(".panel-body").siblings(".d-page"));
			softwarePage.formateItem = function (index, model, row){
				return model.format(row["softwareName"],new Date(parseInt(row["regDate"])).format("yyyy-MM-dd"));
			};

			//作品著作权
			var bookPage = new Pingan.PageHandler($("#book_list"), $("#book_list").parents(".panel-body").siblings(".d-page"));
			bookPage.formateItem = function (index, model, row){
				return model.format(row["bookName"],row["bookType"],new Date(parseInt(row["regDate"])).format("yyyy-MM-dd"));
			};

			
			
			/**对外投资 */

			//对外投资
			var outinvestPage = new Pingan.PageHandler($("#outinvest_list"), $("#outinvest_list").siblings(".d-page"));
			outinvestPage.formateItem = function (index, model, row){
				var display = row["companyNo"] ? "inline-block" : " none";
				var companyNo = row["companyNo"] ? DetailCfg.companyDetailUrl.replace("companyNo",row["companyNo"]) : "javascript:void(0);";
				return model.format(companyNo, row["companyName"],row["companyStatus"],row["companyCode"],row["legalPerson"],row["establishDate"],row["province"],display);
			};
			
			
			
			/**媒体报道*/

            var initMediaPage = function () {
                //正面报道
                var positiveMediaPage = new Pingan.PageHandler($("#positiveMediaReport"), $("#positiveMediaReport").find(".d-page"));
                positiveMediaPage.formateItem = function (index, model, row){
                    return model.format(encodeURIComponent(row["newsUrl"]), row["newsTitle"], row["newsSitename"], new Date(parseInt(row["newsTime"]) * 1000).format("yyyy-MM-dd hh:mm"));
                };
                positiveMediaPage.onLoaded = function (){
                    $("#searchbadgePositive").html(this.total);
                };

                //负面报道
                var negativeMediaPage = new Pingan.PageHandler($("#negativeMediaReport"), $("#negativeMediaReport").find(".d-page"));
                negativeMediaPage.formateItem = function (index, model, row){
                    return model.format(encodeURIComponent(row["newsUrl"]), row["newsTitle"], row["newsSitename"], new Date(parseInt(row["newsTime"]) * 1000).format("yyyy-MM-dd hh:mm"));
                };
                negativeMediaPage.onLoaded = function (){
                    $("#searchbadgeNegative").html(this.total);
                };

            };
            var initMediaCount = function () {
                $.get(basePath+"/gov/company/ajax/media/count?companyId="+DetailCfg.bizCompanyId,function(data){
                    if(data && data["data"]){
                        $("#media_report_count_num").show();
                        $("#mediaCountTab").text(data["data"]);
                        $("#media_report_count_num").text(data["data"]);
                        initMediaPage();
                    }
                });
            };
            initMediaCount();
			
			/**风险信息*/
			
			//违法/行政处罚
			var corpProdPenaltyPage = new Pingan.PageHandler($("#corpProdPenalty_tbody_list"),$("#corpProdPenalty_tbody_list").parents(".panel-body").find(".d-page"));
			corpProdPenaltyPage.formateItem = function (index, model, row){
				var item = $(model.format(row["punishDocCode"],row["illegalType"],row["illegalFacts"],row["punishContent"],new Date(parseInt(row["illegalDate"])).format("yyyy-MM-dd"),row["id"]));
				return item;
			};
			
			//国税部门监管信息
/*			var enterPrisePenaltyPage = new Pingan.PageHandler($("#enterPrisePenalty_tbody_list"),$("#enterPrisePenalty").find(".d-page"));
			enterPrisePenaltyPage.formateItem = function (index, model, row){
				return model.format(row["taxRegNo"],row["punishDocNo"],row["illegalFacts"],row["situation"],new Date(parseInt(row["punishDate"])).format("yyyy-MM-dd"),row["id"]);
			};
			enterPrisePenaltyPage.onLoaded = function (result){
                if(this.total < 1){
                    this.content.parents(".panel-body").hide();
                }
          /!*      else
                	{
                		$('[data-target="#enterPrisePenalty_div"] small').html(this.total);
                		$("#enterPrisePenalty_div small").html(this.total);
                        $("#enterPrisePenalty_div small").show();
                        $("#corpProdCount").html(parseInt($("#corpProdCount").text())+this.total);
                    }*!/
                if(result.statusCode==1){
                    $("#enterPrisePenalty_no").hide();
                }else{
                    $("#enterPrisePenalty_off").hide();
                }
		     };*/
		     
		   //欠税信息
		   var rentNoPayTaxPage = new Pingan.PageHandler($("#rentNoPayTax_tbody_list"),$("#rentNoPayTax").find(".d-page"));
		   rentNoPayTaxPage.formateItem = function (index, model, row){
				return model.format(row["taxpayerNo"],row["legalPerson"],row["owedTaxAmount"],row["owedTaxName"],new Date(parseInt(row["owedTaxDate"])).format("yyyy-MM-dd"));
			};
			rentNoPayTaxPage.onLoaded = function (result){
                if(this.total < 1){
                    this.content.parents(".panel-body").hide();
                }
          /*      else
                	{
                		$("#searchbadge_rentNoPayTax").html(this.total);
                        $("#corpProdCount").html(parseInt($("#corpProdCount").text())+this.total);
                    }*/
                if(result.statusCode==1){
                    $("#rentNoPayTax_no").hide();

                }else{
                    $("#rentNoPayTax_off").hide();
                }
		    };
		     
		  //未履行生效裁判信息
		  var courtNotCarryOutPage = new Pingan.PageHandler($("#courtNotCarryOut_tbody_list"),$("#courtNotCarryOut_tbody_list").parents(".panel-body").next(".d-page"));
		  courtNotCarryOutPage.formateItem = function (index, model, row){
			  var item = $(model.format(row["anNo"],row["execReason"],row["execGist"],row["execAmount"],row["unexecAmount"],row["execCourt"],new Date(parseInt(row["execDate"])).format("yyyy/MM/dd"),new Date(parseInt(row["publishDate"])).format("yyyy/MM/dd")));
			  return item;
		  };
		  
		 //产品质量监督抽查不合格记录信息
		 var corpProdIspcheckPage = new Pingan.PageHandler($("#corpProdIspcheck_tbody_list"),$("#corpProdIspcheck").find(".d-page"));
		 corpProdIspcheckPage.formateItem = function (index, model, row){
			 return model.format(row["checkItems"],row["unqualifiedContent"],new Date(parseInt(row["checkDate"])).format("yyyy-MM-dd"),row["checkUnit"]);
		 };
		 corpProdIspcheckPage.onLoaded = function (result){
             if(this.total < 1){
                 this.content.parents(".panel-body").hide();
             }
             if(result.statusCode==1){
                 $("#corpProdIspcheck_no").hide();

             }else{
                 $("#corpProdIspcheck_off").hide();
             }
		 };
		  
		 //环境违法信息
		 var environmentIllegalCorpPage = new Pingan.PageHandler($("#environmentIllegalCorp_tbody_list"),$("#environmentIllegalCorp").find(".d-page"));
		 environmentIllegalCorpPage.formateItem = function (index, model, row){
			 return model.format(row["punishDocNo"],row["illegalFacts"],row["punishContent"],new Date(parseInt(row["punishDate"])).format("yyyy-MM-dd"));
		 };
		 environmentIllegalCorpPage.onLoaded = function (result){
             if(this.total < 1){
                 this.content.parents(".panel-body").hide();
             }
             if(result.statusCode==1){
                 $("#environmentIllegalCorp_no").hide();

             }else{
                 $("#environmentIllegalCorp_off").hide();
             }
		 };
		 
		//企业非正常户认定信息
		var identificationPage = new Pingan.PageHandler($("#identification_tbody_list"),$("#identification").find(".d-page"));
		    identificationPage.formateItem = function (index, model, row){
			 return model.format(row["certno"],row["situation"],new Date(parseInt(row["unusualConfirmDate"])).format("yyyy-MM-dd"));
		    };
		    identificationPage.onLoaded = function (result){
                if(this.total < 1){
                    this.content.parents(".panel-body").hide();
                }
                if(result.statusCode==1){
                    $("#identification_no").hide();

                }else{
                    $("#identification_off").hide();
                }
		    };
		   
		 //开庭公告分页
		 var processResultAnnoPage = new Pingan.PageHandler($("#courtAnno_tbody_list"),$("#courtAnno_tbody_list").parents(".panel-body").next(".d-page"));
		    processResultAnnoPage.formateItem = function (index, model, row){
			  var item = $(model.format(row["courtNo"],row["courtName"],new Date(parseInt(row["sittingDate"])).format("yyyy-MM-dd"),row["courtId"]));
			  return item;
		   };
		   
		 //行政执法分页,工商部门监管信息
		 var processResultPunishPage = new Pingan.PageHandler($("#adminPunish_tbody_list"),$("#adminPunish_tbody_list").parents(".zstab-block").next(".d-page"));
	 	 processResultPunishPage.formateItem = function (index, model, row){
		  	  var item = $(model.format(row["punishNo"],row["punishType"],row["punishContent"],new Date(parseInt(row["punishDate"])).format("yyyy-MM-dd"),row["punishId"]));
			  return item;
		   };

            //奖励等良好行为记录分页
            var processResultcorpProdAwardPage = new Pingan.PageHandler($("#corp_prod_awards_tbody_list"), $("#corp_prod_awards_tbody_list").parents(".zstab-block").next(".d-page"));

            processResultcorpProdAwardPage.formateItem = function (index,model,row) {
				var item = $(model.format(row['authority'],row['awardName'],new Date(parseInt(row['credentialValidDate'])).format("yyyy-MM-dd"),row['id']));
				return item;
            };

            //依法统计信用企业信息
            var processResultCreditEnterpriseInfoPage = new Pingan.PageHandler($("#credit_enterprise_info_tbody_list"), $("#credit_enterprise_info_tbody_list").parents(".zstab-block").next(".d-page"));
            processResultCreditEnterpriseInfoPage.formateItem = function (index,model,row) {
                var item = $(model.format(row['orgCode'],row['companyName'],row['statTitle'],new Date(parseInt(row['statDate'])).format("yyyy-MM-dd")));
                return item;
            };

            //年报信息
            var processResultBusinessAnnualInspectPage = new Pingan.PageHandler($("#business_annual_inspect_tbody_list"), $("#business_annual_inspect_tbody_list").parents(".zstab-block").next(".d-page"));
            processResultBusinessAnnualInspectPage.formateItem = function (index,model,row) {
                var item = $(model.format(row['orgCode'],row['companyName'],row['icCode'],row['checkResult'],new Date(parseInt(row['checkDate'])).format("yyyy-MM-dd"),row['status']));
                return item;
            };

            $(".searchbadge").each(function (i) {
			 if($(this).html()==0)
			 {
			 	$(this).hide();
			 }
         });
		  
		};

		var initCompanyIntroduce = function () {
            $.ajax({
                url:basePath+"/gov/company/introduce",
                data:{"companyName":DetailCfg.bizCompanyName},
                success:function (result) {
                    if(result.statusCode==1){
                        if(result.data.resultCode!=0){
                            return;
                        }
                        if(!viewTab){
                            $("#detail_category_div").find("ul li:eq(0)").click();
                        }
                        var data = result.data.data;
                        var introduce = data["introduce"];
                        var developList = data["develop"];
                        var honorList = data["honor"];
                        var productList = data["product"];
                        var ads = data["ads"];
                        initProduct(productList);
                        initHonor(honorList);
                        initDevelop(developList);
                        initIntroduce(introduce,ads);
                    }
                }
            });
            var initHonor = function (honorList) {
                if(honorList&&honorList.length>0){
                    var outerHTML = $("#honorModel").clone().removeAttr("style")[0].outerHTML;
                    var length = honorList.length;
                    var html = "";
                    for(var i = 0;i<length;i++){
                        html += outerHTML.format(honorList[i].honorImg,honorList[i].honorName,honorList[i].issueDate,honorList[i].authority,honorList[i].honorDesc,"<img src='"+honorList[i].honorImg+"'>");

                    }
                    $("#honor").append(html);
                    $("#honor").show();
                    $("#honorNodata").hide();
                    $(".zsBlock_honor_cer").click(function () {
                        var honorImg = $(this).find("input[name='honorImg']").val();
                        var honorName = $(this).find("input[name='honorName']").val();
                        var issueDate = new Date(parseInt($(this).find("input[name='issueDate']").val())).format("yyyy年MM月dd日");
                        var authority = $(this).find("input[name='authority']").val();
                        var honorDesc = $(this).find("input[name='honorDesc']").val();
                        var html ="<div>    <div class ='sd_qua_img'>" +
                            "<img src='"+honorImg+"'> </div> "+
                            "<div class = 'sd_qua_wz' > <h3> "+honorName+" </h3> "+
                            "   <h4><span>获得时间："+issueDate+" </span><span>颁发机构："+ authority+"</span></h4> "+
                            "<p>"+honorDesc+"</p> </div></div>";
                        $("#honorDetail").html(html);
                        Pingan.malert($("#honorAlert"),$("#honorClose"),{opacity:0.2});
                    });
                }
            };
            var initDevelop = function (developList) {
                if(developList&&developList.length>0){
                    var outerHTML = $("#developModel").clone().removeAttr("style")[0].outerHTML;
                    var length = developList.length;
                    var html = "";
                    for(var i = 0;i<length;i++){
                        html += outerHTML.format(new Date(developList[i].developeDate).format("yyyy年MM月dd日"),developList[i].developeEvent);

                    }
                    $("#develop").append(html);
                    $("#develop").show();
                    $("#developNoData").hide();
                }
            };
            var initProduct = function (product) {
                if(product&&product.length>0){
                    var outerHTML = $("[productModel]").clone().removeAttr("style")[0].outerHTML;
                    var html = "";
                    for(var i =0;i<product.length;i++){

                        html += outerHTML.format("<img src='"+product[i].productImg+"'>",product[i].productName,product[i].serviceType,product[i].serviceDesc,product[i].officialWebsite,product[i].servicePrice,product[i].serviceScope);
                    }

                    $("#product").append(html);
                    $("#product").show();
                    $("#productNoData").hide();
                }
            };
            var initIntroduce = function (introduce,ads) {
                if(introduce){

                    $("#introduce").html("<h5>"+introduce.companyDesc+"</h5>");
                    $("#introduce").show();
                    $("#introduceNoData").hide();
                }
                if(ads){
                    $("#ads").html("<div class='zsBlock_none zsBlock_adv'><a target='_blank' href='"+ads.adUrl+"'><img src='"+ads.adImg+"'></a></div>");
                    $("#ads").show();
                    $("#adsNoData").hide();
                }
            };
        };

		var init = function(){
			loadUserFollow();
			loadSearcheHistory();
			loadCompanyTaxChartsNew();
            initWaterElectricGasFundTrend('','',DetailCfg.companyNameDigest,0);
			initShopSaletrend();
			initCompanyDomain();
			initPageHandler();
            initCompanyIntroduce();
		};
		
		return { 
			init : init,
			loadUserFollow : loadUserFollow
		};
	})();
	
	Pingan.Event = (function (){


		//切换标签
	 var initTabs = function (){
		 var searchTypeSelect = new Pingan.SelectHandler($("[tip]"), false, true);
		 searchTypeSelect.selected = function(item){
		 $("#searchType").val(item.attr("tab"));
		 $("#searchKey").attr("placeholder", item.attr("tip"));
	 };

	 var searchForm = new Pingan.MForm($("#searchForm"));
	 searchForm.beforeSubmit = function (){
	 return $("#searchKey").val() != '';
	 };

	 $("#btn-search").click(function(){
	 $("#searchForm").submit();
	 });


         var mediaTabSelect = new Pingan.SelectHandler($("#mediaTab").find("li"),false,true);
         var commentTabSelect = new Pingan.SelectHandler($("#commentTab").find("li"),false,true);
	 };
		
		//搜索
		var initSearch = function (){
			autocomplete.init({model:"index",companyDetailUrl:DetailCfg.companyDetailUrl});
			$("#searchKey").focus(function(){
				$("#searchKey").autocomplete("enable");
				$("#searchKey").autocomplete("search");
			});
			$("#btn-search").click(function(){
				$("#searchForm").submit();
			});
		};
		
		//关注
		var initFollow = function (){
			$("#follow").click(function (){
				if(!Pingan.Base.isLogined()){
					Pingan.Base.checkLogin();
					return;
				}
				$.post(Pingan.basePath + "/gov/favorites/" + ($(this).hasClass("followed") ? DetailCfg.encodRemove : DetailCfg.encodAdd), {"companyNameDigest" : DetailCfg.companyNameDigest,"companyId":DetailCfg.bizCompanyId} ,function(result){

                    if(result.statusCode == 4 ||result.statusCode == 5){
                        Pingan.Base.turnToLogin();
                    } else if(result.statusCode == 1){
                        Pingan.malertInfo(result.statusMessage, 'infoMessage warning',{});
                        Pingan.Load.loadUserFollow();
					}


				},"json");
			});	
		};
		
		//分享
		var initShare = function (){
            new Pingan.SlideButton($(".topspan4"), $("#shareDiv"));
		};
		
		//搜狗地图
		var initHaosouMap = function (){
			$("[data-map]").click(function (){
				Pingan.createHaosouMap($(this).attr("data-map"));
			});
		};
		
		 var uzjLogin = function(){
				var errorMsg = new Pingan.Popover($('#loginErrorMsg'), $('#loginErrorMsg'));
				var loginForm =new Pingan.MForm($("#loginForm"),errorMsg);
			    loginForm.isAjax=true;
			    
			    loginForm.afterSubmit=function (result) {
			    	if(result.statusCode == 1){
			    		 setTimeout("location.reload()", 300);
					}else{
	                    errorMsg.show(result.statusMessage);
					}
			    };
			    
			    $("#loginBtn").click(function () {
			           $("#loginForm").submit();
			     });
	    };
			 
		//校验用户是否登录
		var isCheckLogin = function(obj){
				 Pingan.malert($("#login_div"),"", {opacity: 0.2});
				 $("#login_div").css("top","-150px");
		         $("#operationState").attr("style","display: none;");
		}
		
		//初始化选择控制器
		var initSelectHandler = function () {


		    var needLoginTab="#operationTab,#riskTab,#knowledgeTab,#investTab,#mediaReportTab";
			//主选项卡
			$("#detail_category_div").find("li").click(function(){
				var tabId = $(this).attr("id");
        /*        if (needLoginTab.indexOf(tabId) >= 0 && Pingan.Base.isLogined() == 0) {
                    isCheckLogin();
                    return;
                }*/

				for(var i = 0 ; i < $("#detail_category_div").find("li").length; i++){
					var items = $("#detail_category_div").find("li").eq(i);
					if(items.hasClass("current")){
						$(items.attr("data-mark")).hide();
						$("#detail_category_div").find("li").eq(i).removeClass("current");
						break;
					}
				}
				if($(this).html() == "基本信息"){
					$("#comment_info_div").show();
				}
				
				if($(this).hasClass("current")){
					 if($(this).filter(".current").length == 1 ){
			            return false;
			         }
			         $(this).removeClass("current");
				 } else {
					 $(this).addClass("current");
					$($("#detail_category_div").find("li[class='current']").attr("data-mark")).show();
				 }
			   
				 
			});


            /*var  primaryTab = new Pingan.SelectHandler($("#detail_category_div").find("li"), false, true);
			//从详情页返回主选项卡
			primaryTab.selected=function (item) {
					$("#detail").hide();
					var tabText = item.text().substring(0,4);
					if(item.html() == "基本信息")
					{
						$("#comment_info_div").show();
					}
					if(tabText != "累计评论" || item.html() != "基本信息")
					{
						
					}
					else
					{
						isCheckLogin();
						return;
					}
					$($("#detail_category_div").find("li[class='current']").attr("data-mark")).show();
				};*/
            if(viewTab){
                $("#"+viewTab).click();
            }else{
                $("#detail_category_div").find("li").eq(1).click();
            }
			//经营状况上部锚点
			var operationTab = new Pingan.SelectHandler($("[data-target]"), true, false);
			operationTab.selected = function (item) {
				Pingan.moveTo($(item.attr("data-target")), -100, 500);
			}

			//评论选项卡
			var commentTab = new Pingan.SelectHandler($('#commentTab').find('a'), false, true);
			commentTab.items.eq(0).click();

			//商标选项卡
			var tmInfoSelect = new Pingan.SelectHandler($("#tmInfoTypeBtns").find("a"), false, true);
			tmInfoSelect.selected = function (item) {
				var pageHandler = global.pageHandlers.get("tminfo");
				var status = item.attr("data-status");
				pageHandler.total = 0;
				pageHandler.urlHandler.params.put("status", status);
				pageHandler.go(1);
			}

			//下载二维码
			$("#qrcode_download").on('click', function () {
				var img_src=$('#qrcode').find('img').attr('src');
				downloadImage(img_src);
			});
		};

        //初始化认领标签
        var claimLabel = function () {
            $.ajax({
                type: "GET",
                url: Pingan.basePath + "/gov/company/dbcompany",
                data: {"companyId":DetailCfg.bizCompanyId},
                dataType: "json",
                success: function(data){
                    if(data.statusCode==1){
                        var company=data.data;
                        var isClaimed=company.claimStatus;
                        if(isClaimed==0)
                        {
                            $("#toClaim").html("我要认领");
                            $("#toClaim").click(function () {
                                window.location.href=basePath+"/user/owner/add_init?companyNameDigest="+DetailCfg.companyNameDigest;
                            });

                        }else
                        {
                            $("#toClaim").html("已认领");
                            $("#toClaim").css("cursor","default");

                        }
                    }
                }
            });

        };


		var init = function (){
//			initSearch();
			initTabs();
			initFollow();
			initShare();
			initSelectHandler();
            claimLabel();
            uzjLogin();
			// initHaosouMap();
		};
		
		return { init : init };
		
	})();
	
	(function (){
		Pingan.Base.init();
		Pingan.Load.init();
		Pingan.Event.init();
	})();
});

function dateChang() {
    var startDate = $("#startDate").val();
    var endDate = $("#endDate").val();
    var companyNameDigest = DetailCfg.companyNameDigest;
    initWaterElectricGasFundTrend(startDate,endDate,companyNameDigest,1);
}

//下载二维码
function downloadImage(src) {
	var a = $("<a></a>").attr("href", src).attr("download", "二维码.png").appendTo("body");
	a[0].click();
	a.remove();
}

//长度超出时显示 更多/收起
function maxlength(objs){
	objs.each(function (){
		obj=$(this);
		var s =obj.html();
		obj.attr("mtitle",s);
		var max = obj.attr("maxlength");
		if(s.length>max){
			obj.html(s.substring(0,max)+"<a more='on' href='javascript:void(0)'  style='color:#45a9ff;'>>></a>");
			maxlengthfilter_bangding(obj.find("[more]"));
		}
	});
}

//长度超出时显示 更多/收起
function maxlengthfilter_bangding(a){
	a.click(function (){
		p = a.parent();
		if(a.attr("more")=='on'){
			p.html(p.attr("mtitle")+"<a more='off' href='javascript:void(0)' style='color:#45a9ff;'>&nbsp&nbsp&nbsp&nbsp<<</a>");
		}else{
			// p.html(p.attr("mtitle").substring(0,p.attr("maxlength"))+"<a more='on' href='javascript:void(0)' style='color:#45a9ff;'>…更多</a>");
			p.html(p.attr("mtitle").substring(0,p.attr("maxlength"))+"<a more='on' href='javascript:void(0)' style='color:#45a9ff;'>>></a>");
		}
		maxlengthfilter_bangding(p.find("[more]"));
	});
}

//查看详情后返回
function returnTable(){
	$("#detail").hide();
	$($("#detail_category_div").find("li[class='current']").attr("data-mark")).show();
}

//定位小火箭（返回顶部）
function positionBackButton(obj,mleft,right){
	var offleft = obj.offset().left
	var bottom = $(".bottom").offset().top - (obj.height() + obj.offset().top);
	if(offleft <= 1300){
		obj.css({"right":"","left":"50%","margin-left":mleft + "px"});
	}else{
		obj.css({"right":right + "px","left":"","margin-left":""});
	}
}


//失信被执行详情页
function uncreDetail(uncreditId){
	$.ajax({
		type: "GET",
		url: Pingan.basePath + "/gov/company/uncre/detail",
		data: {"uncreditid":uncreditId},
		dataType: "json",
		success: function(data){
			if(data.statusCode==1){
				data=data.data;
				var h="<li>案&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：<span>"+data["anno"]+"</span></li>"+
					"<li>被执行人名称：<span>"+data["companyName"]+"</span></li>"+
					"<li>组织机构代码证号：<span>"+data["orgNo"]+"</span></li>" +
					"<li>执行法院：<span>"+data["executeUnit"]+"</span></li>" +
					"<li>省份：<span>"+data["province"]+"</span></li>" +
					"<li>执行依据文号：<span>"+data["executeNo"]+"</span></li>" +
					"<li>立案时间：<span>"+new Date(parseInt(data["filingDate"])).format("yyyy-MM-dd")+"</span></li>"+
					"<li>做出执行依据单位：<span>"+data["executeUnit"]+"</span></li>" +
					"<li>生效法律文书确定的义务：<span>"+data["duty"]+"</span></li>" +
					"<li>被执行人的履行情况：<span>"+data["executeStatus"]+"</span></li>" +
					"<li>失信被执行人行为具体情形：<span>"+data["actionerMark"]+"</span></li>" +
					"<li>发布时间：<span>"+new Date(parseInt(data["publishDate"])).format("yyyy-MM-dd")+"</span></li>";
				//"<li>执行标的：<span>"+data["performedPart"]+"</span></li>";
				h = h.replace(/undefined|null|NaN-aN-aN/g, '');
				$("#detail").find("ul").html(h);
				$("#detail").find(".tit").html("<font style='color:red;'>失信被执行："+(data["anno"]==null?"":data["anno"]+"</font>"));

				$(".row-left").hide();
				$("#corpProdPenalty").hide();
				$("#detail").show();
				Pingan.moveTo($("#detail"),-100,500);
			}
		}
	});

}

//诉讼记录详情
function courtDetail(id){
	$.post(Pingan.basePath + "/gov/company/court/detail", {"id":id}, function(result) {
		var courtDocJson = result.data;
		if(null != courtDocJson) {
			var h="<li>案&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：<span>" + courtDocJson.docCode + "</span></li>" +
			"<li>文书名：<span>" + courtDocJson.docTitle + "</span></li>"+
			"<li>案件性质：<span>" + courtDocJson.docType + "</span></li>"+
			"<li>法院名称：<span>" + courtDocJson.courtName + "</span></li>" +
			"<li>判决时间：<span>" + courtDocJson.docTime + "</span></li>"+
			"<li>诉讼记录：<span>" + courtDocJson.docContent + "</span></li>";
			h = h.replace(/undefined|null|NaN-aN-aN/g, '');
			$("#detail").find("ul").html(h);
			$("#detail").find(".tit").html("诉讼记录："+(courtDocJson.docCode == null?"":courtDocJson.docCode));
			//maxlength($("#exe_detail").find("[maxlength]"));
			$(".row-left").hide();
			$("#corpProdPenalty").hide();
			$("#detail").show();
			Pingan.moveTo($("#detail"),-100,500);
		}
	
	});
}
//开庭公告详情
function annoDetail(id){
	$.post(Pingan.basePath + "/gov/company/courtanno/detail",{"id":id},function(result){
		var courtAnnoJson = result.data;
		if(courtAnnoJson){
			var h="<li>法院名称：<span>"+courtAnnoJson.courtName+"</span></li>"+
			"<li>案&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：<span>"+courtAnnoJson.courtNo+"</span></li>" +
			"<li>开庭时间：<span>"+new Date(parseInt(courtAnnoJson.sittingDate)).format("yyyy-MM-dd")+"</span></li>" +
			"<li>开庭地点：<span>"+courtAnnoJson.sittingAddress+"</span></li>" +
			"<li>案件说明：<span>"+courtAnnoJson.courtDescription+"</span></li>";
			h = h.replace(/undefined|null|NaN-aN-aN/g, '');
			$("#detail").find("ul").html(h);
			$("#detail").find(".tit").html("开庭公告："+(courtAnnoJson.courtNo==null?"":courtAnnoJson.courtNo));
			$(".row-left").hide();
			$("#corpProdPenalty").hide();
			$("#detail").show();
			Pingan.moveTo($("#detail"),-100,500);
			//maxlength($("#detail").find("[maxlength]"));
		}
	});
}
//专利详情
function patentDetail(id){
 	$.post(Pingan.basePath + "/gov/company/patent/detail", {"id":id}, function(result) {
 		
 		var patentJson = result.data;
 		if(patentJson){
			var h=	
				"<li>专利名称：<span>"+patentJson["patentName"]+"</span></li>"+
				"<li>申请公布号：<span>"+patentJson["publishCode"]+"</span></li>"+
				"<li>申请公布日：<span>"+new Date(parseInt(patentJson["publishDate"])).format("yyyy-MM-dd")+"</span></li>" +
				"<li>申请号：<span>"+patentJson["patentNo"]+"</span></li>" +
				"<li>申请日：<span>"+new Date(parseInt(patentJson["patentDate"])).format("yyyy-MM-dd")+"</span></li>" +
				"<li>申请人：<span>"+patentJson["applicant"]+"</span></li>" +
				"<li>发明人：<span>"+patentJson["inventors"]+"</span></li>"+
				"<li>地址：<span>"+patentJson["address"]+"</span></li>" +
				"<li>分类号：<span>"+patentJson["ipcType"]+"</span></li>" ;
			
		h = h.replace(/undefined|null|NaN-aN-aN/g, '');
 		$("#detail").find("ul").html(h);
		$("#detail").find(".tit").html("专利类型："+(patentJson.patentType==null?"":patentJson.patentType));
		
 		$(".row-left").hide();
 		$("#knowledgeInfo,#patentpage_div,#honorInfo,#company_honor,#software_div,#bookpage_div,#websites_div").hide();
		$("#detail").show();
		Pingan.moveTo($("#detail"),-100,500);
		
 		}

	});
}

//行政执法详情
function punishDetail(id) {
    $.post(Pingan.basePath + "/gov/company/adminpunish/detail", {"id": id}, function (result) {
        var punishJson = result.data;
        console.log(result);
        if (punishJson) {
            var h = "<li>行政处罚文书号：<span>" + punishJson.punishNo + "</span></li>" +
                "<li>行政处罚内容：<span>" + punishJson.punishContent + "</span></li>" +
                "<li>处罚机构：<span>" + punishJson.punishOrgan + "</span></li>" +
                "<li>处罚类型：<span>" + punishJson.punishType + "</span></li>" +
                "<li>处罚日期：<span>" + new Date(punishJson.punishDate).format("yyyy-MM-dd") + "</span></li>";
            h = h.replace(/undefined|null|NaN-aN-aN/g, '');
            $("#detail").find("ul").html(h);
            $("#detail").find(".tit").html("行政执法：");
            $(".row-left").hide();
            $("#operationState,#ecshopDiv,#manageCredit,#adminPunishInfo,#credit_and_awards").hide();
            $("#detail").show();
            Pingan.moveTo($("#detail"), -100, 500);
        }
    });
}

//奖励等良好行为记录
function corpProdAwardDetail(id) {
        $.ajax({
            type: "GET",
            url: Pingan.basePath + "/gov/company/corpProdAward/detail",
            data: {"id":id},
            dataType: "json",
            success: function(data){
                if(data.statusCode==1){
                    data=data.data;
                    var h="<li>企业名称：<span>"+data["companyName"]+"</span></li>"+
                        "<li>唯一码：<span>"+data["uniqueCode"]+"</span></li>"+
                        "<li>组织机构代码：<span>"+data["orgCode"]+"</span></li>"+
                        "<li>证书编号：<span>"+data["docCode"]+"</span></li>" +
                        "<li>发证机构：<span>"+data["authority"]+"</span></li>" +
                        "<li>发证日期：<span>"+new Date(parseInt(data["certificateDate"])).format("yyyy-MM-dd")+"</span></li>" +
                        "<li>证书有效期满日期：<span>"+new Date(parseInt(data["credentialValidDate"])).format("yyyy-MM-dd")+"</span></li>" +
                        "<li>奖励名称：<span>"+data["awardName"]+"</span></li>" +
                        "<li>奖励类别：<span>"+data["awardType"]+"</span></li>" +
                        "<li>产品名称：<span>"+data["productName"]+"</span></li>"+
                        "<li>发布状态：<span>"+data["publishStatusShow"]+"</span></li>" +
                        "<li>创建人：<span>"+data["founder"]+"</span></li>" +
                        "<li>创建时间：<span>"+new Date(parseInt(data["foundTime"])).format("yyyy-MM-dd")+"</span></li>" +
                        "<li>品牌：<span>"+data["brand"]+"</span></li>"+
                        "<li>规格（名义净含量）：<span>"+data["norms"]+"</span></li>"+
                        "<li>地址：<span>"+data["address"]+"</span></li>"+
                        "<li>商标：<span>"+data["trademark"]+"</span></li>"+
                        "<li>奖励等级、奖励级别：<span>"+data["awardLevel"]+"</span></li>";
                    h = h.replace(/undefined|null|NaN-aN-aN/g, '');
                    $("#detail").find("ul").html(h);
                    $("#detail").find(".tit").html("<font style='color:red;'>奖励等良好行为记录");
                    $(".row-left").hide();
                    // $("#operationState").hide();
                    $("#operationState,#ecshopDiv,#manageCredit,#adminPunishInfo,#credit_and_awards").hide();
                    $("#detail").show();
                    Pingan.moveTo($("#detail"),-100,500);
                }
            }
        });
};

//违法/行政处罚
function corpProdPenaltyDetail(id){
	$.ajax({
		type: "GET",
		url: Pingan.basePath + "/gov/company/corpProdPenalty/detail",
		data: {"id":id},
		dataType: "json",
		success: function(data){
			if(data.statusCode==1){
				data=data.data;
				var h="<li>企业名称：<span>"+data["companyName"]+"</span></li>"+
					"<li>违法违规类型：<span>"+data["illegalType"]+"</span></li>"+
					"<li>处罚单位：<span>"+data["authority"]+"</span></li>" +
					"<li>违法违规内容：<span>"+data["illegalFacts"]+"</span></li>" +
					"<li>违法违规日期：<span>"+new Date(parseInt(data["illegalDate"])).format("yyyy-MM-dd")+"</span></li>" +
					"<li>处罚依据：<span>"+data["punishGist"]+"</span></li>" +
					"<li>处理结果：<span>"+data["punishContent"]+"</span></li>"+
					"<li>查获货值(万元)：<span>"+data["goodsValue"]+"</span></li>" +
					"<li>处罚金额(万元)：<span>"+data["punishAmount"]+"</span></li>" +
					"<li>处罚决定书文书号：<span>"+data["punishDocCode"]+"</span></li>";
				h = h.replace(/undefined|null|NaN-aN-aN/g, '');
				$("#detail").find("ul").html(h);
				$("#detail").find(".tit").html("<font style='color:red;'>违法/行政处罚");
				$(".row-left").hide();
				$("#corpProdPenalty").hide();
				$("#detail").show();
				Pingan.moveTo($("#detail"),-100,500);
			}
		}
	});
}

//国税部门监管信息
function enterPrisePenaltyDetail(id){
	$.ajax({
		type: "GET",
		url: Pingan.basePath + "/gov/company/enterPrisePenalty/detail",
		data: {"id":id},
		dataType: "json",
		success: function(data){
			if(data.statusCode==1){
                data = data.data;
                var h = "<li>企业名称：<span>" + data["companyName"] + "</span></li>" +
                    "<li>组织机构代码：<span>" + data["orgCode"] + "</span></li>" +
                    "<li>序列号：<span>" + data["serialNo"] + "</span></li>" +
                    "<li>税注册号：<span>" + data["taxRegNo"] + "</span></li>" +
                    "<li>惩罚依据：<span>" + data["punishGist"] + "</span></li>" +
                    "<li>情况：<span>" + data["situation"] + "</span></li>" +
                    "<li>周期：<span>" + data["period"] + "</span></li>" +
                    "<li>处罚决定书文书号：<span>" + data["punishDocNo"] + "</span></li>" +
                    "<li>惩罚日期：<span>" + new Date(parseInt(data["punishDate"])).format("yyyy-MM-dd") + "</span></li>" +
                    "<li>录入时间：<span>" + new Date(parseInt(data["includedTime"])).format("yyyy-MM-dd") + "</span></li>";
                h = h.replace(/undefined|null|NaN-aN-aN/g, '');
                $("#detail").find("ul").html(h);
                $("#detail").find(".tit").html("<font style='color:red;'>国税部门监管信息");
                $(".row-left").hide();
                $("#corpProdPenalty").hide();
                $("#detail").show();
                Pingan.moveTo($("#detail"), -100, 500);
			}
		}
	});
}

//计算司法诉讼页总数
function calcTotal(totalType){
	var total = 0 ;
	$("."+totalType).each(function(){
		total = total + parseInt($(this).text());
	});
	$("#"+totalType).text(total);
}

function applyAuthorization(user, companyNameDigest, saveUrl, authData) {

        $.ajax({
            type: "POST",
            dataType:"json",
            url: saveUrl,
            data: {"companyNameDigest": companyNameDigest, "authData": authData},
            async: false,
            success: function (data) {
                if (data.statusCode == 1) {
                	Pingan.malert($("#includ_div"), $("#includ_div").find(".closeImg"), {opacity: 0.2});
                	return;
                }
                $("#infoMessage").text(data.statusMessage);
                $("#infoMessage").fadeIn("slow");
                $("#infoMessage").fadeOut(2000);
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                if(XMLHttpRequest.status==403){
                    mconfirm("请重新登录",function (){
                        window.location.href = Pingan.basePath + "/gov/toLogin";
                    });
                }
            }
        });
}


function blong_domain() {
    $("#domain_ti").find(".fenye").find("a").click(function () {
        //$("#website_info").hide();
        var start = (parseInt($(this).html()) - 1) * 5;
        if (isNaN(start)) {
            start = parseInt(/\d+/g.exec($(this).attr("href")) - 1) * 5;
        }
        start = isNaN(start) ? 0 : start;
        $("[domrow='" + start + "']").click();

    });
}

//加载到页面
function loadPvAndKw(row,category_operation_state) {
    category_operation_state.loadPv('sitepv', pvs[row]);
    if (kws[row] == "" || kws[row] == null) {
        $("#sitekw").html("该站点无相关信息");
    } else {
        category_operation_state.loadKw('sitekw', kws[row]);
    }
}
//从老牛获取数据
function postPvAndKw(row,category_operation_state) {
    try {//七日流量
        $.post(DetailCfg.url_pv, "domain=" + domains[row]["domain"], function (resultPv) {
            pvs[row] = resultPv["statusCode"] == 1 ? resultPv["data"] : null;
            //关键词
            $.post(DetailCfg.url_kw, "domain=" + domains[row]["domain"], function (resultKw) {
                kws[row] = resultKw["statusCode"] == 1 ? resultKw["data"] : null;
                loadPvAndKw(row,category_operation_state);
            });
        });
    } catch (e) {
        //显示无数据的提示图
        pvs[row] = null;
        kws[row] = null;
        $("#sitepv").html(noData);
    }
}

function firmTable() {
    $("#firmDetail").hide();
    $("#fir").show();
}



function companyTaxCharts(companyNameDigest,url,container,authData){
    $.ajax({
        type: "POST",
        url: url,
        data: {"companyNameDigest": companyNameDigest,"authData":authData},
        async: false,
        success: function (data) {
            if (data.statusCode == 1) {
                loadTax(container, data);
                if(data['data']&&data['data']['data'].length>0){
                    $("#taxMsg").find("small").show();
                    var taxHtml = $("#taxMsg").find("small").html();
                    var taxNum = parseInt(taxHtml==""?0:taxHtml);
                    $("#taxMsg").find("small").html(taxNum+1);
                }
            } else if (data.statusCode == 3) {
                //未授权
            }
        }
    });
}

function companyTaxChartsNew(companyNameDigest,url,authData){
    $.ajax({
        type: "POST",
        url: url,
        data: {"companyNameDigest": companyNameDigest,"authData":authData},
        async: false,
        success: function (data) {
        	
            if (data.statusCode == 1) {
            	var dataInfo = data['data'];
            	if(authData==14){
            		$("#tax_nation_noview").remove();
            		if(dataInfo.length > 0){
            			$("#tax_nation_new").show();
            			$("#tax_nation_new tr:nth-child(1) td:nth-child(2)").text(dataInfo[0]['taxRegCode']);
                		$("#tax_nation_new tr:nth-child(1) td:nth-child(4)").text(dataInfo[0]['taxAdminCode']);
                		$("#tax_nation_new tr:nth-child(2) td:nth-child(2)").text(dataInfo[0]['companyStatusCode']);
                		$("#tax_nation_new tr:nth-child(2) td:nth-child(4)").text(new Date(parseInt(dataInfo[0]['taxRegDate'])).format("yyyy-MM-dd"));
                		$("#tax_nation_new tr:nth-child(3) td:nth-child(2)").text(dataInfo[0]['bankCode']);
                		$("#tax_nation_new tr:nth-child(3) td:nth-child(4)").text(dataInfo[0]['taxBankAccount']);
                		$("#tax_nation_new tr:nth-child(4) td:nth-child(2)").text(dataInfo[0]['operationMode']);
                		$("#tax_nation_new tr:nth-child(4) td:nth-child(4)").text(dataInfo[0]['operationValidDate']);
            		}else{
            			//$("#tax_nation_nodata").show();
            		}
            	}else if(authData==15){
            		$("#tax_local_noview").remove();
            		if(dataInfo.length > 0){
	            		$("#tax_local_new").show();
	            		$("#tax_local_new tr:nth-child(1) td:nth-child(2)").text(dataInfo[0]['taxRegCode']);
	            		$("#tax_local_new tr:nth-child(1) td:nth-child(4)").text(dataInfo[0]['taxAdminCode']);
	            		$("#tax_local_new tr:nth-child(2) td:nth-child(2)").text(dataInfo[0]['companyStatusCode']);
	            		$("#tax_local_new tr:nth-child(2) td:nth-child(4)").text(new Date(parseInt(dataInfo[0]['taxRegDate'])).format("yyyy-MM-dd"));
	            		$("#tax_local_new tr:nth-child(3) td:nth-child(2)").text(dataInfo[0]['bankCode']);
	            		$("#tax_local_new tr:nth-child(3) td:nth-child(4)").text(dataInfo[0]['taxBankAccount']);
            		}else{
            			//$("#tax_local_nodata").show();
            		}
            	}else if(authData==5){
            		$("#qc_basic_noview").remove();
            		if(dataInfo.length > 0){
	            		$("#qc_basic_new").show();
	            		$("#qc_basic_new tr:nth-child(1) td:nth-child(2)").text(dataInfo[0]['economicIndustry']);
	            		$("#qc_basic_new tr:nth-child(1) td:nth-child(4)").text(dataInfo[0]['economicType']);
	            		$("#qc_basic_new tr:nth-child(2) td:nth-child(2)").text(dataInfo[0]['administrativeDivision']);
	            		$("#qc_basic_new tr:nth-child(2) td:nth-child(4)").text(dataInfo[0]['employeeCount']);
	            		$("#qc_basic_new tr:nth-child(3) td:nth-child(2)").text(dataInfo[0]['mainProductCode']?dataInfo[0]['mainProductCode']:"-");
	            		$("#qc_basic_new tr:nth-child(3) td:nth-child(4)").text(dataInfo[0]['approveUnit']);
	            		$("#qc_basic_new tr:nth-child(4) td:nth-child(2)").text(new Date(parseInt(dataInfo[0]['annualInspectionValidDate'])).format("yyyy-MM-dd"));
	            		$("#qc_basic_new tr:nth-child(4) td:nth-child(4)").text(new Date(parseInt(dataInfo[0]['annualInspectionDate'])).format("yyyy-MM-dd"));
            		}else{
            			$("#qc_basic_nodata").show();
            		}
            	}else if(authData==6){
            		$("#customs_basic_noview").remove();
            		if(dataInfo.length > 0){
	            		$("#customs_basic_new").show();
	            		$("#customs_basic_new tr:nth-child(1) td:nth-child(2)").text(dataInfo[0]['customsRegCode']);
	            		$("#customs_basic_new tr:nth-child(1) td:nth-child(4)").text(new Date(parseInt(dataInfo[0]['regDate'])).format("yyyy-MM-dd"));
	            		$("#customs_basic_new tr:nth-child(2) td:nth-child(2)").text(dataInfo[0]['imExportAuthorityCode']?dataInfo[0]['imExportAuthorityCode']:"-");
	            		$("#customs_basic_new tr:nth-child(2) td:nth-child(4)").text(dataInfo[0]['approveDocCode']);
            		}else{
            			$("#customs_basic_nodata").show();
            		}
            	}else if(authData==9){
            		$("#dataRentTax_noview").remove();
            		if(dataInfo.length > 0){
            			$("#searchbadge_dataRentTax").html(dataInfo.length);
            			// $("#corpProdCount").html(parseInt($("#corpProdCount").text())+dataInfo.length);
	            		$("#dataRentTaxData").show();
	            		$("#dataRentTaxData tr:nth-child(2) td:nth-child(1)").text(new Date(parseInt(dataInfo[0]['startDate'])).format("yyyy-MM-dd"));
	            		$("#dataRentTaxData tr:nth-child(2) td:nth-child(2)").text(new Date(parseInt(dataInfo[0]['endDate'])).format("yyyy-MM-dd"));
	            		$("#dataRentTaxData tr:nth-child(2) td:nth-child(3)").text(dataInfo[0]['taxpayerCertno']);
	            		$("#dataRentTaxData tr:nth-child(2) td:nth-child(4)").text(dataInfo[0]['taxpayerName']);
	            		$("#dataRentTaxData tr:nth-child(2) td:nth-child(5)").text(dataInfo[0]['authority']);
	            		$("#dataRentTaxData tr:nth-child(4) td:nth-child(1) span").text(dataInfo[0]['illegalFacts']);
	            		$("#dataRentTaxData tr:nth-child(4) td:nth-child(2)").text(dataInfo[0]['checkAmount']);
	            		$("#dataRentTaxData tr:nth-child(4) td:nth-child(3)").text(dataInfo[0]['punishAmount']);
	            		$("#dataRentTaxData tr:nth-child(4) td:nth-child(4)").text(dataInfo[0]['punishStatus']);
            		}else{
            			$("#dataRentTax_nodata").show();
            		}
            	}else if(authData == 16)
            	{
					$("#water_electric_gas_fund_basic_noview").remove();
                    initWaterElectricGasFundTrend('','',DetailCfg.companyNameDigest,0);
				}
            }/*else{
                if(authData==14){
                        //$("#tax_nation_nodata").show();
                }else if(authData==15){
                        //$("#tax_local_nodata").show();
                }else if(authData==5){
                        $("#qc_basic_nodata").show();
                }else if(authData==6){
                        $("#customs_basic_nodata").show();
                }else if(authData==9) {
                    $("#dataRentTax_nodata").show();

                }
            }*/
        }
    });
}
function applyAuthorizationInit(authData) {
	if(!Pingan.Base.isLogined()){
		Pingan.Base.checkLogin();
		return;
	}
    applyAuthorization(DetailCfg.userName, DetailCfg.companyNameDigest, Pingan.basePath + "/gov/authorization/" + DetailCfg.encodApply, authData);
}
//简单分页(不涉及后台分页,获取网站域名列表时用到)
function simpleFenye(context,npage){
	npage,spage=1,pn=5,pin=2;
	var list = context.find("[display]");
	var sum=list.length;
	if(sum != 0){
		spage = sum%pn==0?sum/pn:parseInt(sum/pn+1);
		context.find("[display]").hide();
		var start=npage-pin>1?npage-pin:1;
		var end=start+pin*2>spage?spage:start+pin*2;
		start = end-pin*2>0?end-pin*2:1;
		var start_p = (npage-1)*pn;
		var end_p = start_p+pn>sum?sum:start_p+pn;
		context.find("[display]").slice(start_p,end_p).show();
		var pHtml="";
		for(var i=start;i<=end;i++){
			if(i!=npage){
				pHtml=pHtml+"<a href='javascript:simpleFenye($(\"#"+context.attr("id")+"\"),"+i+");'>"+i+"</a>";
			}else{
				pHtml=pHtml+"<a class='current'>"+i+"</a>";
			}
		}
		//上一页
		if(npage > 1){
			pHtml="<a href='javascript:simpleFenye($(\"#"+context.attr("id")+"\"),"+(npage-1)+");'><<</a>"+pHtml;
		}
		//下一页
		if(npage < spage){
			pHtml=pHtml+"<a href='javascript:simpleFenye($(\"#"+context.attr("id")+"\"),"+(npage+1)+");'>>></a>";
		}
		pHtml = (npage == spage && npage == 1)?"":pHtml;
		context.find(".fenye").html(pHtml);
		context.find(".fenye").find("[href]").css("color","#1d97ff");
	}
	blong_domain();
}

var getUrlParameter = function (sParam) {
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++) {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam) {
            return sParameterName[1];
        }
    }
}