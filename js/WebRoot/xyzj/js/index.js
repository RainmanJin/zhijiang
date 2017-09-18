require.config({
	waitSeconds : 0,
	baseUrl : basePath,
	paths : {
		Pingan : 'js/common/common'
	}
});

require(['Pingan'], function (Pingan){
	
	Pingan.Base = (function (){
		
		//初始化搜索
		var initSearch = function (){
			var searchTypeSelect = new Pingan.SelectHandler($("[tip]"), false, true);
			searchTypeSelect.selected = function(item){
                $("#btn-search").removeClass("h-stop");
                $("#searchKey").removeAttr("readonly");
                $("#searchKey").attr("placeholder", item.attr("tip"));
                if(item.attr("tip")=="该类信息暂不开放查询"){
                    $("#btn-search").unbind("click");
                    $("#btn-search").addClass("h-stop");
                    $("#searchKey").attr("readonly","readonly");
                }else {
                    $("#btn-search").unbind("click").bind("click",searchFun);
                }
			};
			
			var searchForm = new Pingan.MForm($("#searchForm"));
			searchForm.beforeSubmit = function (){
				return $("#searchKey").val() != '';
			};
			var searchFun = function () {
                $("#searchForm").submit();
            };
			$("#btn-search").bind("click",searchFun);
		};

		var init = function (){
			initSearch();
		};
		return {
			init : init
		}
	})();
	
	(function (){
		Pingan.Base.init();
	})();
	
});