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
	deps : [ 'top' ]
});

require(['Pingan', 'top'], function (Pingan){
	
	Pingan.Load = (function (){
		
		var help_left_init = function(){
			var data_nav_body = $("body").attr("data-nav");
			$("#help_h li").each(function(){
				$(this).find("a").removeClass("current");
				var data_nav = $(this).attr("data-nav");
				if(data_nav_body == data_nav){
					$(this).find("a").addClass("current");
				}
			});
		}
        
		
		var init = function (){
			help_left_init();
		};
		
		return {
			init : init
		};
	})();
	
	(function (){
		Pingan.Load.init();
	})();
	
});
