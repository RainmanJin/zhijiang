require.config({
	waitSeconds : 0,
	baseUrl : basePath,
	paths : {
		Pingan : 'js/common/common',
		sroll:'js/lib/new/scroll',
		jquery_ui_autocomplete_min: 'js/lib/jquery-ui-autocomplete.min',
        autocomplete: 'js/uzj/autocomplete-common',
		mCustomScrollbar : 'js/lib/jquery.mCustomScrollbar.concat.min',
		echarts:'js/lib/echarts/build/dist/echarts',
		top : 'js/uzj/new_top'
	},
	shim : {
		mCustomScrollbar : {
			deps : [ 'Pingan' ]
		},
	    sroll:{
			deps : [ 'Pingan' ]
		},
		jquery_ui_autocomplete_min : {
			deps : [ 'Pingan' ]
		},
		autocomplete : {
			deps : [ 'jquery_ui_autocomplete_min' ]
		},
		echarts : {
			deps : [ 'Pingan' ]
		},
		top : {
			deps : [ 'Pingan' ]
		}
	},
	deps : [ 'top' ]
});
require(['Pingan','autocomplete','sroll','mCustomScrollbar','echarts'], function (Pingan,autocomplete,sroll){
	
	Pingan.Base = (function (){
		
		/**page.callback.js**/
		var initGlobalVar = function(){
			 page_data = new Array();
		};
		Pingan.lightStar($(".istar"));
		
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
		
		
		/**notincluded.jsp**/
		var notincluded = function (){
			if(CompanySchemaCfg.notincluded == "notincluded"){
				var count = 3;
				setInterval(function() {
					count = count - 1;
					$("#count").html(count);
					if(count == 0) {
						window.location.href = Pingan.basePath+"/index.jsp"; 		
					}
				}, 1000);
			}
		};
        
		var init = function (){
			initGlobalVar();
			companyShcema();
			notincluded();
		};
		
		return {
			init : init
		};
		
	})();
	
	
	 Pingan.Event = function () {
		 /**login.jsp**/
		 var uzjLogin = function(){
			var errorMsg = new Pingan.Popover($('#errorMsg'), $('#errorMsg'));
			var loginForm =new Pingan.MForm($("#loginForm"),errorMsg);
		    loginForm.isAjax=true;
		    
		    loginForm.afterSubmit=function (result) {
		    	var fromUrl =$("#fromUrl").val();
		    	if(result.statusCode == 1){
					window.location.href = fromUrl;
				}else{
                    errorMsg.show(result.statusMessage);
				}
		    };
		    
		    $("#loginBtn").click(function () {
		           $("#loginForm").submit();
		     });
		 };
		 
		 
		 /**integrity.jsp(诚信厨房)**/
		 /*var seedTv = function(){
			 var html = "<a href='#' class='groove-hover' style=''><img src='"+Pingan.basePath+"/images/kitchen/live-icon.png'/> <div class='hover-wz'> <span class='span-wz1'>评论数 256</span><span class='span-wz2'>播放量 256</span> </div> </a>";
		     $(".groove-block").mouseover(function(){
		         $('.groove-hover').remove();
		         $(this).prepend(html);
		     });
		     
		     $(".groove-block").mouseleave(function(){
		         $('.groove-hover').remove();
		     });
		     
		     Pingan.Load.initUserName();

		   $(".tv-show").click(function(){
		 	 $("#tv-name").text($(this).attr("data-attr"));
		      var param =  $(this).attr("param");
		         $("#qihoo_player").append(param);
		         Pingan.malert($(".seed-pop"),$("#malert_mask"),{opacity:0.2});
		     });
		 };*/
		   //诚信厨房申请
	       var countdown;
           var isRun = true;
           var doChange = function () {
               countdown--;
               if (countdown > 0) {
                   isRun = false;
                   $('#sendPhoneCode').css("background-color", "#c0c0c0");
                   $('#sendPhoneCode').hover(function () {
                       $(this).css("background-color", "#c0c0c0");
                   });
                   $('#sendPhoneCode').css("cursor", "default");
                   $('#sendPhoneCode').val(countdown + '秒后可重新操作');
                   timer = setTimeout(doChange, 1000);//调用自身实现
               } else {
                   isRun = true;
                   $('#sendPhoneCode').css("background-color", "#00bb9c");
                   $('#sendPhoneCode').hover(function () {
                       $(this).css("background-color", "#00c1a1");
                   }, function () {
                       $(this).css("background-color", "#00bb9c");
                   });
                   $('#sendPhoneCode').css("cursor", "pointer");
                   $('#sendPhoneCode').val('获取验证码');
                   clearTimeout(timer);
               }
          };
          
          //诚信厨房申请界面-自动完成
          var initAddCompanyAutoComplete = function () {
         	   autocomplete.init({model: "autocomplete_finance"});
          };
          
          var kitchenScroll = function () {
        	  $('[data-role="scrollContent"]').myScroll({
  				speed:40, //数值越大，速度越慢
  				rowHeight:179 //li的高度
  			});
          };
          
          var kitchenShow = function () {
              $("#kitchenLeft,#kitchenRight").on('click',function () {
   			   var data_nav_attr=$(this).attr('data-nav');
   			   var off_set ='0px';
   			   if(data_nav_attr=='lightPage2')
   			   {
   					off_set = '-805px';
   			   }else
   			   	{
                       off_set = '400px';
   				}
   			   $(this).siblings().removeClass('current');
   			   $(this).addClass('current');
                  $("#scrollDiv").css('transform','translate3d('+off_set+', 0px, 0px)').css('transition-duration','0.5s');
              });
              var reset_flag =0;
              var auto_circle_picture = function () {
   				if(reset_flag==0){
                       $("#scrollDiv").css('transform','translate3d(-805px, 0px, 0px)').css('transition-duration','0.5s');
                       $("#lightShow li[data-nav]").eq(0).removeClass('current');
                       $("#lightShow li[data-nav]").eq(1).addClass('current');
                       reset_flag=1;
                   }else{
                       $("#scrollDiv").css('transform','translate3d(400px, 0px, 0px)').css('transition-duration','0.5s');
                       $("#lightShow li[data-nav]").eq(1).removeClass('current');
                       $("#lightShow li[data-nav]").eq(0).addClass('current');
                       reset_flag=0;
                   }
              };
   		   window.setInterval(auto_circle_picture,5000);
          }; 
          
         //诚信厨房申请提交 
		 var addIntegrityKitchen = function(){
			 var errorMsg = new Pingan.Popover($('#errorMsg'), $('#errorMsg'));
	         var integrityForm = new Pingan.MForm($("#kitchenForm"), errorMsg);
	         integrityForm.isAjax=true;
	         
	         $("#sendPhoneCode").click(function () {
            	 if (isRun) {
                     var num = $(this).attr("num");
                     var phoneNum = $('#phone').val();
                     if (!integrityForm.getItem('phone').validate()) {
                         errorMsg.show('手机号格式不正确!');
                     } else {
                         $.post(basePath + "/user/createPhoneCode", {
                             'phone': phoneNum,
                             'isNotReceive': num
                         }, function (data) {
                             if (data.statusCode == 1) {
                                 num++;
                                 $("#sendPhoneCode").attr("num", num);
                                 $("#smsS").val(data['data']['smsed']);
                                 countdown = 60;
                                 timer = setTimeout(doChange, 50);
                                 return false;
                             }
                         });
                     }
                 }
             });
	       
	         integrityForm.afterSubmit=function (result) {
	        	 if(result.statusCode == 1){
	        		 $("#integrityAdd").hide();
	        		 $("#integritySuccess").show();
	        		 timeJump();
	        		 return;
	        	 }
	        	 
	        	 if(result.statusCode == 2){
	        		 Pingan.malertInfo('您输入的企业名称不存在！', 'infoMessage warning', {});
	        		 return;
	        	 }
	        		 
	        	 Pingan.malertInfo('诚信厨房申请入住失败！', 'infoMessage warning', {});
	         };
	         
	         $("#integrityRealname").blur(function(){
	        	 if(!$("#integrityRealname").val().isText()){
	        		  $("#errorMsg").html("请输入真实姓名");
	        		  $("#errorMsg").show();
	        		  return;
	        	 }
	         });
	          
	         $("#submitKitchen").click(function(){
	        	    var phoneNum = $('#phone').val();
	        		$("#integrityPhone").val(phoneNum);
	        	    $("#kitchenForm").submit();
	         });
		 }
		 
		 //诚信厨房申请成功自动跳转页面
         var countTime = 3;
         var timeJump = function(){
         	var doChange =  function(){
 	        	  countTime--;   
 	        	  $("#timeCountDown").html(countTime);
 	   	  		  if(countTime > 0) { 
 	   	  			setTimeout(doChange,1000);
 	   	  		  } else {
 	   	  			  location.href= basePath + "/user/integrity/kitchen/search";    
 	   	  		  }
         	}
         	setTimeout(doChange,1000);
         }
         
         var backIntegrity = function(){
        	 $("#button_success").click(function(){
        		 location.href= basePath + "/user/integrity/kitchen/search";
        	 });
         }
		 
		 
		 /**train.jsp**/
		 var trainStyle =  function(){
			 $(".t-style").click(function(){
					var href = $(this).attr("data_attr");
					if(href){
						window.location.href = href;
					}
		     });
		 };
		 
		 
		 /**webshop.jsp**/
		 var indeustryChoose = function(){
			 var indeustry = new Pingan.SelectHandler($("#industryChoose").find("a"), false, true);
			 indeustry.selected = function (item){
				 var business = item.text() == "全部" ? "" : item.text();
				 var pageHandler = global.pageHandlers.get("webShopInfo");
				 pageHandler.urlHandler.params.put("curMainBusiness", business);
				 pageHandler.onLoaded = function(){
			    	 Pingan.autoFoot();
			    	 return true;
			     }
				 pageHandler.total = 0;
				 pageHandler.go(1);
				 pageHandler.loadData();
				 return true;
			 }
	    }; 
	  
	  var areaChoose = function(){
		  var area = new Pingan.SelectHandler($("#areaChoose").find("a"),false, true);
		  area.selected = function (item){
			  $("[name='cityCode']").val(item.attr("data-attr"));
			  var pageHandler = global.pageHandlers.get("webShopInfo");
			     pageHandler.urlHandler.params.put("cityCode", item.attr("data-attr"));
			     pageHandler.onLoaded = function(){
			    	 Pingan.autoFoot();
			    	 return true;
			     }
			     pageHandler.total = 0;
			     pageHandler.go(1);
				 pageHandler.loadData();
		  }
	  };
	 
	  var creditValueChoose = function(){
		  var creditValue = new Pingan.SelectHandler($("#creditValueChoose").find("a"),false, true);
		  creditValue.selected = function (item){
			  console.info(item);
			  $("[name='curCreditLevel']").val(item.attr("data-attr"));
			  var pageHandler = global.pageHandlers.get("webShopInfo");
			  pageHandler.urlHandler.params.put("curCreditLevel", item.attr("data-attr"));
			  pageHandler.onLoaded = function(){
		    	 Pingan.autoFoot();
		    	 return true;
			  }
			  pageHandler.total = 0;
			  pageHandler.go(1);
			  pageHandler.loadData();
		  }
	  };
		
	  var initWebShopSearch = function(){
		  $("#webShopSearch").click(function (){
			  var pageHandler = global.pageHandlers.get("webShopInfo");
			  pageHandler.urlHandler.params.put("key", $("#webShopKey").val());
			  pageHandler.onLoaded = function(){
		    	 Pingan.autoFoot();
		    	 return true;
			  }
			  pageHandler.total = 0;
			  pageHandler.go(1);
			  pageHandler.loadData();
		  });
	  };

	  var orderChoose = function(){
		  var orderCh = new Pingan.SelectHandler($("#orderChoose").find("a"),false, true);
		  orderCh.selected = function (item){
			  	var pageHandler = global.pageHandlers.get("webShopInfo");
				if(item.text() != "综合"){
					if($("[name='orderField']").val() == item.attr("data-attr")){
						if($("[name='orderType']").val() == 1){
							Pingan.Load.setChooseImg(item,"down");
							pageHandler.urlHandler.params.put("orderType", "2");
						} else{
							Pingan.Load.setChooseImg(item,"up");
							pageHandler.urlHandler.params.put("orderType", "1");
						}
					} else{
						Pingan.Load.setChooseImg(item,"down");
						pageHandler.urlHandler.params.put("orderType", "2");
					}
					$("[name='orderField']").val(item.attr("data-attr"));
					pageHandler.urlHandler.params.put("orderField", item.attr("data-attr"));
				} else {
					$("[name='orderField']").val("");
					pageHandler.urlHandler.params.put("orderField", item.attr("data-attr"));
					$(".orderImg").hide();
				}
				pageHandler.onLoaded = function(){
			    	 Pingan.autoFoot();
			    	 return true;
				}
				pageHandler.total = 0;
			    pageHandler.go(1);
				pageHandler.loadData();
		  }
	  };

		 //按回车登录
		 $(function(){
			 $(document).keydown(function(event){
				 if(event.keyCode==13){
					 $("#loginBtn").click();
				 }
			 });
		 });
			 

			 var init = function(){
			 uzjLogin();
			 kitchenScroll();
			 kitchenShow();
			 if(CompanySchemaCfg.page == "addIntegrity"){
				 addIntegrityKitchen();
				 initAddCompanyAutoComplete();
				 backIntegrity();
			 }
			 trainStyle();
			 indeustryChoose();
			 areaChoose();
			 creditValueChoose();
			 initWebShopSearch();
			 orderChoose();
		 };
		 
		 return { 
			init : init
		};
		
	 }();
	
  Pingan.Load = (function (){
    
	  /**seed.jsp**/
	  var initUserName = function(){
		    var handler = {};
		    handler.isShow = false;
			handler.turnDiv = function (action){
			if(action == "on"){
				 handler.isShow = true;
			 }else{
				 handler.isShow = false;
			 }
			 setTimeout(function (){
				  if(handler.isShow){
				        $("#userCenterDiv").fadeIn();
				 }else{
				       $("#userCenterDiv").fadeOut();
				   }
			 }, 100);
		 }
		    $("#userNameLabel,#userCenterDiv").on({
				"mouseover":function (){
				     handler.turnDiv("on");
				 },
				 "mouseleave":function (){
				     handler.turnDiv("off");
				 }
		   });
	 };
	 
	 
	 /**webshop.jsp**/
	 var webShopPos = function(){
		 $("#foot").css({position:"static", bottom:"0", width:"100%", margin:"0 auto"});	
		 showBrowseEcHistory({"cookieValue":CompanySchemaCfg.cookieValue,"companyDetailUrl":CompanySchemaCfg.companyDetailUrl});
		 Pingan.textOverHide($("#ico_abs_infor").find("#showLength"));
	 };
	 
	 var setChooseImg = function(aTag,chooseType){
		 $(".orderImg").hide();
			if(chooseType == "up"){
				$("[name='orderType']").val("1");
				aTag.find(".orderImg").attr("src",Pingan.basePath + "/images/retils/retails-up.png");
			} else {
				$("[name='orderType']").val("2");
				aTag.find(".orderImg").attr("src",Pingan.basePath+"/images/retils/retails-down.png");
			}
		 aTag.find(".orderImg").show();
	 };
	 
	 var processResultWebShop = function (){
			 var webShopPage = new Pingan.PageHandler($("#webShop_tr"),$("#webShopList").find(".d-page"));
			 webShopPage.formateItem = function (index, model, row){
				var curCreditLevel = Number(row["curCreditLevel"]);
				var companyHref = "#";
				var companyNo = row['companyNo'];
				var city = row['city'];
				if(!curCreditLevel){
					curCreditLevel = 0;
				}
				if(city == ""){
					city = "未知";
				}
				if(companyNo && companyNo != ""){
					companyHref = basePath + "/company/professionalInfo?s=" + companyNo + "&shopname=" + row["shopName"];
				}
				var shopName = row["shopName"];
				if(shopName && shopName.length > 6){
					shopName = shopName.substring(0,6) + "...";
				}
				var item = $(model.format(shopName,row["curMainBusiness"],city,companyHref,row["companyName"],row["saleAmountShow"]==null?'0.00':row["saleAmountShow"],curCreditLevel));
				Pingan.lightStar(item.find(".istar"));
				return item;
			 };
	};
	
	 
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
				var detailUrl = cfg.companyDetailUrl.replace("companyNo", company.companyNo);
				var schemaUrl = Pingan.basePath + "/company/schema/list?s=" + company.companyNo;
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
		    require(
		        [
		            'echarts',
		            'echarts/chart/force'
		        ],
		        function (ec) {
		            var myChart = ec.init(document.getElementById('echa')); 
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
						        	$.post(Pingan.basePath + "/company/schema/detail", {"companyNameDigest":stockName}, function(result) {
										if(result.statusCode==1){
											showDetail(result.data);
										}
						        	});
					        	}
					        }
					        if(data.category == 2 && data.nodeType == 1) {}	//高管ignore
					        if(data.category==0 || (data.category == 3 && data.nodeType == 1)) {	//对外投资	
					        	$.post(Pingan.basePath + "/company/schema/detail", {"companyNameDigest":data.object.companyNameDigest}, function(result) {
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
		        }
		    );
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
		 webShopPos();
		 processResultWebShop();
	 };
	 
	  return {
		  init : init,
		  initUserName:initUserName,
		  setChooseImg:setChooseImg,
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


/**webshop.jsp**/
function showBrowseEcHistory(cfg){
	var cookieValue = cfg.cookieValue;
	var companyDetailUrl = cfg.companyDetailUrl;
	if(!cookieValue)
	{
		return false;
	}
	var title = "<h3 class=\"detail-list-h3\"><span>最近搜索网店</span></h3>";
	var historyHtml = "";
	var htmlTemplate = "<p><a target='_blank' href='"+companyDetailUrl+"'>{1}</a></p>";
	if(cookieValue)
	{
		var cookieJson = eval('(' + cookieValue + ')');
		for(var key in cookieJson)
		{
			var shopName = cookieJson[key]['shopName'];
			if(!shopName)
			{
				continue;
			}
			var companyNo = "#";
			if(cookieJson[key]['companyNo'])
			{
				companyNo = cookieJson[key]['companyNo'];
			}
			var html = htmlTemplate.format(companyNo,shopName);
			historyHtml += html;
		}
		if(historyHtml == ""){
			historyHtml = "<div class=\"preview-list preview-last\">你还未浏览过任何信用网店哦</div>";
		}
		$("#ecshopVisited").html(title + historyHtml);
	}		
}