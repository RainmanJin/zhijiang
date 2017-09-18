require.config({
	waitSeconds : 0,
	baseUrl : basePath,
	paths : {
		Pingan : 'js/common/common',
		jquery_ui_autocomplete_min: 'js/lib/jquery-ui-autocomplete.min',
		autocomplete : 'js/uzj/autocomplete-common',
		cookie:'js/lib/new/jquery.cookie',
		sroll:'js/lib/new/scroll',
		top : 'js/uzj/new_top'
	},
	shim : {
		cookie:{
			deps : [ 'Pingan' ]
		},
		sroll:{
			deps : [ 'Pingan' ]
		},
		jquery_ui_autocomplete_min : {
			deps : [ 'Pingan' ]
		},
		autocomplete:{
			deps : [ 'jquery_ui_autocomplete_min' ]
		},
		top : {
			deps : [ 'Pingan' ]
		}
	},
	deps : [ 'top','sroll' ]
});

require(['top', 'sroll', 'autocomplete', 'cookie'], function (top,sroll, autocomplete, cookie){
	
	Pingan.Base = (function (){
		
		//初始化搜索
		var initSearch = function (){
		    $("#searchKey").focus();
			var searchTypeSelect = new Pingan.SelectHandler($("[tip]"), false, true);
			searchTypeSelect.selected = function(item){
				$("#searchType").val(item.attr("tab"));
				$("#searchKey").attr("placeholder", item.attr("tip"));
                $(".n-b-industry").hide();
                $("#industryTab").removeClass("current");
           
			};
			
			var searchForm = new Pingan.MForm($("#searchForm"));
			searchForm.beforeSubmit = function (){
				return $("#searchKey").val() != '';
			};
			
			$("#btn-search").click(function(){
				 $("#searchForm").submit();
			});
            $("#industryTab").click(function () {
                // $("#industryTab").toggleClass("current");
                // $(".n-b-industry").toggle();
                var node = $(".n-b-industry");
                if(!node.is(':visible')){ //如果node是隐藏的则显示node元素，否则隐藏
                    $(this).siblings().removeClass("current");
                    $("#industryTab").addClass("current");
                    node.show();
                }else{
                    $('[tab="all"]').click();
                    node.hide();
                    $("#industryTab").removeClass("current");
                }
            });
		};
		
		var initTopNav = function (){
			$("[markSearch]").click(function(){
				var tabName = "[tab='"+$(this).attr("markSearch")+"']";
				$(tabName).click();
			})
			$("a[name='closeSeed']").find("img").click(function(){
				$(".new-adv").hide();
			});
			top.topNav.select(0);
		};
		
		
	   var acticityPop = function(){
		   var cookieValue = $.cookie('name');
		   if(typeof cookieValue != 'undefined' && cookieValue != null){
			   $("#closeActivity").show();
		   } else {
			   $.cookie('name', 'activity', {expires:7});
			   window.setTimeout(function(){
				   Pingan.malert($("#openActivity"), $("#closeAc"),{opacity:0.2, onclose:function (){
					   $("#closeActivity").show();
				   }});
			   },3000);
		   }
		   
	/*	   $("#openP").click(function(){
			   window.location.href =basePath+"/companyIndLight/activity";
		   });*/
		   
		   $("#immediately").click(function(){
			   window.location.href =basePath+"/taca/immediately/declare";
		   });
		   
		   $(".sd_btn_right").click(function(){
			   window.location.href =basePath+"/taca/index";
		   });
		   
	   };
	   
	   var activitySpeaker = function(){
		   $("#closeActivity").mouseover(function(){
			  $("#activitySpeaker").show(); 
			  $("#speaker").hide();
		   });
		   $("#closeActivity").mouseout(function(){
			   $("#activitySpeaker").hide();
			   $("#speaker").show();
		   });
	   };

	   var industry_modal_dialog = function () {
           $("#industry_modal_button").click(function () {
               Pingan.malert($("#industry_modal_show"), $("#industry_modal_close_btn"), {opacity: 0.2});
           });
       };

	   var companyIndLightShow = function () {
           $("#lightShow li[data-nav]").on('mouseover',function () {
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

	   var companyIndLight =  function(){
		   $.post(basePath+"/companyIndLight/query",{},function(data){
			   if(data.statusCode == 1){
				   var companyIndLights = data.data;
				   if(companyIndLights.length > 0){
					   $("#scrollDiv").show();
					   var num = 0;
					   var modelStr = $("#scrollModel").clone().removeAttr("id").show()[0].outerHTML;
					   var html = "";
					   var lineHtml = "";
					   for(var i = 0;i<companyIndLights.length;i++){
						   var companyIn = companyIndLights[i];
						   lineHtml += modelStr.format(companyIn.companyName,companyIn.province,companyIn.city,companyIn.industryName,companyIn.curCreditLevel,companyIn.curCreditValue,companyIn.companyNameDigest);
						   if(i % 3 == 0){
							   html = html + "<div data-role=\"scrollItem\">";
						   }
						   if((i + 1) % 3 == 0){
							   html = html + lineHtml +"</div>";
							   lineHtml = "";
						   }
					   }
					   if(companyIndLights.length % 3 != 0){
						   html = html + lineHtml + "</div>";
					   }
					   $("#scrollUl").html(html);
					   Pingan.lightStar($(".istar"));
				 } 
			   } 
		   });
	   };
        
		var srollDiv = function(){
			$('[data-role="scrollContent"]').myScroll({
				speed:40, //数值越大，速度越慢
				rowHeight:179 //li的高度
			});
		};
		
		var immediately = function(){
			$("#immediately").click(function(){
				$.post(basePath + "/asso/companyindlight/apply/check", {}, function(data){
					if(data.statusCode==5){
						Pingan.malertInfo('先登录','infoMessage warning',{});
						window.location.href=basePath + "/user/toLogin";
						return false;
					}
					if(data.statusCode==3){
						Pingan.malertInfo('协会用户才可用','infoMessage warning',{});
						return false;
					}
					if(data.statusCode==1){
						var activityNo = data['data'];
                        if(!activityNo){
                            window.location.href = basePath + "/asso/companyindlight/apply";
                        }
							Pingan.mconfirm("继续之前的操作吗？",function (){
								window.location.href=basePath + "/asso/companyindlight/apply?delete=not_delete&activityNo="+activityNo+"&auditS="+auditS;
							},function(){
								window.location.href=basePath + "/asso/companyindlight/apply?activityNo="+activityNo+"&auditS="+auditS;
							},{});

						return false;
					}
				});
			});
		};
		
		var init = function (){
			initSearch();
			initTopNav();
			srollDiv();
			acticityPop();
			companyIndLight();
            industry_modal_dialog();
            companyIndLightShow();
			//immediately();
			//activitySpeaker();
		};
		return {
			init : init
		}
	})();
	
	(function (){
		Pingan.Base.init();
		 autocomplete.init({model:"index", "companyDetailUrl" : $("base").attr("data-detailUrl")});
	})();
	
});