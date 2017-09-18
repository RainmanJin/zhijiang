require.config({
	waitSeconds : 0,
	baseUrl : basePath,
	paths : {
		Pingan : 'js/common/common',
		comment : 'js/uzj/comment',
		top : 'js/uzj/new_top'
	},
	shim : {
		comment : {
			deps : [ 'Pingan' ]
		},
		top : {
			deps : [ 'Pingan' ]
		}
	},
	deps : ['top']
});

require(['Pingan','comment'], function (Pingan){

	Pingan.Base = (function () {
		var question_symbol_func = function () {
			$("#question_symbol").hover(function () {
				$("#brand_advise_num").css("display", "inline");
			},function () {
                $("#brand_advise_num").css("display", "none");
            });
		};

		var ajax_industry_vote = function () {
			$("#industry_vote_button").click(function () {
				var industryVotes = [];
				$("#industry_vote input:checked").each(function (i) {
					industryVotes[i] = $(this).val();
				});
				if (industryVotes.length == 0) {
					Pingan.malertInfo('请选择您感兴趣的领域进行投票', 'infoMessage warning', {fadeIn:300,fadeOut:300,showTime:1000});
				} else if (industryVotes.length > 3) {
					Pingan.malertInfo('最多可以票选三类', 'infoMessage warning', {fadeIn:300,fadeOut:300,showTime:1000});
				} else {
					$.ajax({
						url: basePath + "/trade/zone/vote",
						data: {"industryVotes": industryVotes},
						type: "post",
						success: function (result) {
							if (result.statusCode == 1) {
                                $("#industry_vote input").hide();
								var industry_dom = $("#industry_vote span");
								for (var i = 0; i < industry_dom.length; i++) {
									industry_dom.eq(i).after("<span style='float: right;'><label style='color:#FF6633;'>" + result.data[i]['voteNum'] + "</label>票</span>");
								}
							} else {
								Pingan.malertInfo('投票失败', 'infoMessage warning', {fadeIn:300,fadeOut:300,showTime:1000});
							}
						},
						beforeSend: function () {
							$("#industry_vote_button").css("cursor", "default");
							$("#industry_vote_button").html("已投票");
							$("#industry_vote_button").css("background-color", "#E7E7E7");
							$("#industry_vote_button").unbind('click');
						}
					});
				}
			});
		};
        var to_report = function () {
            $("#to_company_uncredit_report").click(function () {
            	// console.log('he');
                window.location=basePath+'/about/report.jsp';
            });
        };
		var to_comment = function () {
            var container = $('body'),
                scrollTo = $('#question_symbol');
            container.scrollTop(
                scrollTo.offset().top - container.offset().top + container.scrollTop()
            );
        };
		
		var to_contributions = function () {
			$("#to_contributions").click(function () {
                window.location=basePath+'/trade/business_contributions.jsp';
            });
        };
		
		var to_company_elect = function () {
            $("#to_company_elect").click(function () {
                window.location=basePath+'/companyIndLight/activity';
            });
        };
		
        var getArticle = function(){
        	var articleTable = new Pingan.PageHandler($("#articleTable"), $("#articleTable").siblings(".d-page"));
        	articleTable.formateItem = function (index, model, row){
        		var articleImg = row["articleImg"];
        		if(!articleImg){
        			articleImg = "images/trade-images/1219_img01.jpg";
        		}
        		
        		var articleTags = row["articleTags"] || '';
        		var tags = articleTags.split(' ');
				for(var i in tags){
					if(tags[i] != "")
					{
						tags[i] = '<span>'+tags[i]+'</span>';
					}
				}
				return model.format(row["articleId"],articleImg, new Date(parseInt(row["articleShowtime"])).format("yyyy-MM-dd"),row["articleTitle"],row["articleIntro"], tags.join(''));
           };
        }
        
		var init = function () {
			ajax_industry_vote();
			question_symbol_func();
            to_report();
            to_contributions();
            to_company_elect();
            getArticle();
		};

		return {
			init: init
		};

	})();
	
	Pingan.Event = (function (){


		var init = function (){
            Pingan.lightStar();

		};
		 
		 return {
			 init:init
		 };
		 
	})();
	
	Pingan.Load = (function (){
		
		var init = function (){

		};
		 
		 return {
			 init:init,
		 };
		 
	})();
	
	 (function (){
		 Pingan.Base.init();
		 Pingan.Load.init();
		 Pingan.Event.init();
	 })();
});
