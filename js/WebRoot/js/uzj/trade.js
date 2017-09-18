require.config({
	waitSeconds : 0,
	baseUrl : basePath,
	paths : {
		Pingan : 'js/common/common',
		jquery_ui_autocomplete_min: 'js/lib/jquery-ui-autocomplete.min',
        autocomplete: 'js/uzj/autocomplete-common',
		top : 'js/uzj/new_top'
	},
	shim : {
		jquery_ui_autocomplete_min : {
			deps : [ 'Pingan' ]
		},
		autocomplete : {
			deps : [ 'jquery_ui_autocomplete_min' ]
		},
		top : {
			deps : [ 'Pingan' ]
		}
	},
	deps : ['top']
});

require(['Pingan','autocomplete'], function (Pingan,autocomplete){
	
	Pingan.Base = (function (){
		
		var leftDataNav = function(){
			//判断Pingan模块是否加载
			Pingan = Pingan ? Pingan : require("common/common");
			
			/**left**/
			//导航
			new Pingan.NavHandler($("#left_div").find("[data-nav]"));
		}; 
		
		var checkKeyword = function(){
			Pingan.Load.checkPlaceHolder($("#searchKey"));
			Pingan.Load.checkPlaceHolder($("#searchAdKey"));
		};
        
		 var init = function (){
			 leftDataNav();
			 checkKeyword();
		 };
		 
		 return {
			 init:init
		 };
		 
	})();
	
	Pingan.Event = (function (){
		
	  var btnSearch = function (){
		 $("#btn-search").click(function() {
			 checkKeyword();
			 $("#searchForm").submit();
		  });
		};	
			
		var btnAdSearch = function(){
			$("#btn-ad-search").click(function() {
				checkKeyword();
				$("#searchAdForm").submit();
			}); 
		 };
		 
		 var grooveBlock1 =  function(){
			 var html = "<a href='#' class='groove-hover1' style=''><img src='"+basePath+"/images/kitchen/live-icon.png'/> <div class='hover-wz1'> <span class='span-wz11'>评论数 256</span><span class='span-wz21'>播放量 256</span> </div> </a>";
			 $(".groove-block1").mouseover(function(){
			      $('.groove-hover1').remove();
			      $(this).prepend(html);
			  });
			  $(".groove-block1").mouseleave(function(){
			      $('.groove-hover1').remove();
			  });
		 };
		   
         var smallTvShow = function (){
        	$(".small-tv-show").click(function(){
 		        var param =  $(this).attr("param");
 		        $("#qihoo_player").append(param);
 		        Pingan.malert($(".seed-pop"),$("#malert_mask"),{opacity:0.2});
 		    }); 
         };
         
         //金融反欺诈发送验证码
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
         
         //金融反欺诈申请校验
         var addFinancialFraud = function (){
        	 var errorMsg = new Pingan.Popover($('#errorMsg'), $('#errorMsg'));
             var financeForm = new Pingan.MForm($("#financeForm"), errorMsg);
             financeForm.isAjax=true;
             //金融反欺诈短信验证码发送
             $("#sendPhoneCode").click(function () {
            	 if (isRun) {
                     var num = $(this).attr("num");
                     var phoneNum = $('#phone').val();
                     if (!financeForm.getItem('phone').validate()) {
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
             
             financeForm.afterSubmit=function (result) {
	        	 if(result.statusCode == 1){
	        		 $("#financeAdd").hide();
	        		 $("#financeSuccess").show();
	        		 timeJump();
	        		 return;
	        	 }
	        	 
	        	 if(result.statusCode == 2)
	             {
	        		 Pingan.malertInfo('您输入的企业名称不存在！', 'infoMessage warning', {});
	        		 return;
	        	 }
	        	 
	        	 Pingan.malertInfo('金融反欺诈申请入住失败！', 'infoMessage warning', {});
	         };
	         
	         $("#financialRealname").blur(function(){
	        	 if(!$("#financialRealname").val().isText()){
	        		  $("#errorMsg").html("请输入真实姓名");
	        		  $("#errorMsg").show();
	        		  return;
	        	  }
	         });
             
             $("#submitFinance").click(function(){
         	    var phoneNum = $('#phone').val();
         		$("#financialPhone").val(phoneNum);
         		$("#financeForm").submit();
         	 });
         }

         
         var backFinance = function(){
        	 $("#button_success").click(function(){
        		 location.href= basePath + "/user/trade/financial/search";
        	 });
         }
         
         //金融反欺诈申请成功自动跳转页面
         var countTime = 3;
         var timeJump = function(){
         	var doChange =  function(){
 	        	  countTime--;   
 	        	  $("#timeCountDown").html(countTime);
 	   	  		  if(countTime > 0) { 
 	   	  			setTimeout(doChange,1000);
 	   	  		  } else {
 	   	  			  location.href= basePath + "/user/trade/financial/search";    
 	   	  		  }
         	}
         	setTimeout(doChange,1000);
         }
         
         //金融反欺诈申请界面-自动完成
         var initAddCompanyAutoComplete = function () {
        	   autocomplete.init({model: "autocomplete_finance"});
          };
		  
		var init = function (){
			btnSearch();
			btnAdSearch();
			grooveBlock1();
			smallTvShow();
			
			if(financeCfg.page == 'addFinance'){
				addFinancialFraud();
				initAddCompanyAutoComplete();
				backFinance();
			}
			
			if(financeCfg.page == 'financeSuccess'){
				backFinance();
				timeJump();
			}
			
		};
		 
		 return {
			 init:init
		 };
		 
	})();
	
	Pingan.Load = (function (){
	 
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
		
		var checkPlaceHolder = function(obj){
			if(obj && obj.val() == '请输入企业名称、店铺名称查询'){
				obj.val("");
			}
		};
		
		var init = function (){
			initUserName();
		};
		 
		 return {
			 init:init,
			 checkPlaceHolder:checkPlaceHolder
		 };
		 
	})();
	
	 (function (){
		 Pingan.Base.init();
		 Pingan.Load.init();
		 Pingan.Event.init();
	 })();
});
