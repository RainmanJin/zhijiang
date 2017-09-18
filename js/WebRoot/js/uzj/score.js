require.config({
	waitSeconds : 0,
	baseUrl : basePath,
	paths : {
		Pingan : 'js/common/common',
		top : 'js/uzj/new_top'
	},
	shim : {
		top : {
			deps : [ 'Pingan' ]
		}
	},
	deps : ['top']
});

require(['Pingan'], function (Pingan){

	Pingan.Base = (function () {
		var question_symbol_func = function () {
			$("#question_symbol").mouseover(function () {
				$("#brand_advise_num").css("display", "inline");
			}).mouseout(function () {
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
		var init = function () {
			ajax_industry_vote();
			question_symbol_func();
		};

		return {
			init: init
		};

	})();

	 (function (){
		 Pingan.Base.init();
	 })();
});
