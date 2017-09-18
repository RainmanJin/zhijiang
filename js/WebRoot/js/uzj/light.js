require.config({
	waitSeconds : 0,
	baseUrl : basePath,
	paths : {
		Pingan : 'js/common/common',
		bootstrap:'js/lib/new/bootstrap.min',
		autocomplete : 'js/lib/jquery-ui-autocomplete.min',
		top : 'js/uzj/new_top'
	},
	shim : {
		bootstrap : {
			deps:['Pingan']
		},
		autocomplete:{
            deps:['Pingan']
        },
        top : {
			deps : [ 'Pingan' ]
		}
	},
	deps : [ 'top']
});

require(['Pingan','autocomplete'], function (Pingan,autocomplete){
	
	  Pingan.Init = function () {
		   var nav_select = new Pingan.SelectHandler($("#light_div").find("span"), false, true);
	  };
	  Pingan.Init();
});

