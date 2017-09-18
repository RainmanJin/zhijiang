require.config({
    waitSeconds: 0,
    baseUrl: basePath,
    paths: {
        Pingan: 'gov/js/common/common',
        autocomplete: 'gov/js/autocomplete-common',
        jquery_ui_autocomplete_min: 'gov/js/lib/jquery-ui-autocomplete.min',
        top: 'gov/js/gov_top'
    },
    shim: {
        top: {
            deps: ['Pingan']
        },
        jquery_ui_autocomplete_min: {
            deps: ['Pingan']
        },
        autocomplete: {
            deps: ['jquery_ui_autocomplete_min']
        }
    },
    deps: ['Pingan', 'top', 'jquery_ui_autocomplete_min']
});

define(['Pingan','autocomplete'],function (Pingan,autocomplete){
	
	Pingan.Base = (function (){
		
		var urlHandler = (function (){
			return new Pingan.UrlHandler(window.location.href);
		})();
		
		//查询分页
		var initPageHandler = function(){
			
			//全部查询
			var pageAll = new Pingan.PageHandler($("#all"), $("#all").find(".new-page"));
/*			pageAll.turnBefore = function (page) {
                var mark=$("#pageListParams input[name=customParam"+page+"]").val();
                if(mark){
                    pageAll.urlHandler.params.put("mark", mark);
                }
            };*/
			//按名称查询
			var pageCompany = new Pingan.PageHandler($("#company"), $("#company").find(".new-page"));
			// pageCompany.formateItem = function(index, model, row){
			// 	return model.format(row["companyNo"],row["companyName"],row["legalPerson"],row["capital"],row["establishDate"].substring(0,10),row["companyAddress"],row["companyStatus"]);
			// };
			
			//按地址查询
			var pageAddress = new Pingan.PageHandler($("#address"), $("#address").find(".new-page"));
			// pageAddress.formateItem = function(index, model, row){
			// 	return model.format(row["companyNo"],row["companyName"],row["legalPerson"],row["capital"],row["establishDate"].substring(0,10),row["companyAddress"],row["companyStatus"]);
			// };

			//按董高监查询
			var pageEmployee = new Pingan.PageHandler($("#employee"), $("#employee").find(".new-page"));
			// pageEmployee.formateItem = function(index, model, row){
			// 	return model.format(row["companyNo"],row["companyName"],row["legalPerson"],row["capital"],row["establishDate"].substring(0,10),row["employeeName"],row["companyStatus"]);
			// };

			//按法人、股东查询
			var pagePerson = new Pingan.PageHandler($("#person"), $("#person").find(".new-page"));
			// pagePerson.formateItem = function(index, model, row){
			// 	return model.format(row["companyNo"],row["companyName"],row["legalPerson"],row["capital"],row["establishDate"].substring(0,10),row["partnerStockName"],row["companyStatus"]);
			// };

			//按经营范围查询
			var pageScope = new Pingan.PageHandler($("#scope"), $("#scope").find(".new-page"));
			// pageScope.formateItem = function(index, model, row){
			// 	return model.format(row["companyNo"],row["companyName"],row["legalPerson"],row["capital"],row["establishDate"].substring(0,10),row["businessScope"],row["companyStatus"]);
			// };

			//按品牌产品查询
			var pageTrademark = new Pingan.PageHandler($("#trademark"), $("#trademark").find(".new-page"));
			// pageTrademark.formateItem = function(index, model, row){
			// 	return model.format(row["companyNo"],row["companyName"],row["legalPerson"],row["capital"],row["establishDate"].substring(0,10),row["trademark"],row["companyStatus"]);
			// };
		};
		
		//初始化查询表单
		var initSearchForm = function (){
			var searchForm = new Pingan.MForm($("#searchForm"));
			$("#btn-search").click(function (){
				$("#searchForm").trigger("submit");
			});
		};

		//下拉按钮
		var initSlideButton = function (){
			new Pingan.SlideButton($("#areachoose"), $("#area"));
			new Pingan.SlideButton($("#creditTypeBtn"), $("#creditType"));
		};
		
		var init = function (){
			initPageHandler();
			initSlideButton();
			initSearchForm();
		};
		
		return {
			init : init,
			urlHandler : urlHandler
		};
		
	})();
	
	
	Pingan.Event = (function (){
		
		//添加收录
		var initIncludeCompany = function (){
			$(".new-includ-pad a").click(function (){
				Pingan.malert($("#includ_div"),$("#includ_div").find(".closeImg"),{opacity:0.2});
				$(".rel-b").click(function (){
					if($.trim($("#companyname").val()) != ""){
						$("#includ_div").find(".closeImg").click();
						Pingan.malertInfo('提交成功！','infoMessage warning',{});
					}else{
						Pingan.malertInfo('请输入企业全称！','infoMessage warning',{});
						return false;
					}
				});
			});
		};

		//切换标签
		var initTabs = function (){
			var tabSelectHandler = new Pingan.SelectHandler($('.n-b-index li'), false, true);
			tabSelectHandler.selected = function (item){
				var tab = item.attr("tab");
				// $(".list-result").hide();
				// $("#"+tab).show();
				$("#searchType").val(tab);
				// var pageHandler = global.pageHandlers.get(tab);
				// pageHandler.cfg.nodata = ".data-no-tip";
				// var load = function (){
				// 	$("#total").html(pageHandler.total);
				// 	pageHandler.checkNone();
				// }
				// load();
				// pageHandler.onLoaded = load;
			};
			
			//切换到记录标签
			// var searchType = Pingan.Base.urlHandler.params.get("searchType") || 'all';
			var searchType = $("#searchType").val();
			$("[tab='"+searchType+"']").click();
            $("[tab='"+searchType+"']").siblings("li").removeClass("current");
			$("[tab='"+searchType+"']").addClass("current");

            var searchTypeTabHandler = new Pingan.SelectHandler($("#searchTypeTab a"),false,true);
            searchTypeTabHandler.selected = function (item){
                var tab = item.attr("tab");
                $("#searchType").val(tab);
                locationHref();
            };
            var industryTab = new Pingan.SelectHandler($('#industryTab a'), false, true);
            industryTab.selected = function (item) {
                var tab = item.attr("data-attr");
                $("#industryName").val(tab);
                locationHref();
            };
            var cityTab = new Pingan.SelectHandler($('#areaTab a'),false,true);
            cityTab.selected = function (item) {
                var tab = item.attr("data-attr");
                $("#cityCode").val(tab);
                locationHref();
            };
            var capitalTab = new Pingan.SelectHandler($('#capitalTab a'),false,true);
            capitalTab.selected = function (item) {
                var tab = item.attr("data-attr");
                $("#capitalNumberCode").val(tab);
                locationHref();
            };
            var creditTab = new Pingan.SelectHandler($('#creditTab a'),false,true);
            creditTab.selected = function (item) {
                var tab = item.attr("data-attr");
                $("#curCreditType").val(tab);
                locationHref();
            };

            var locationHref = function () {
                var searchType = $("#searchType").val();
                var industryName = $("#industryName").val();
                var cityCode = $("#cityCode").val();
                var capitalNumberCode = $("#capitalNumberCode").val();
                var curCreditType = $("#curCreditType").val();
                var searchKey = $("#searchKey").val();
                location.href=basePath+"/gov/search?key="+searchKey+"&searchType="+searchType+"&industryName="+industryName+"&cityCode="+cityCode+"&capitalNumberCode="+capitalNumberCode+"&curCreditType="+curCreditType;
            }
		};
        
		
		//浏览记录
		var initBrowseHistory = function (){
			var cfg = config;
			var cookieValue = cfg.cookieValue;
			if(!cookieValue)
			{
				return false;
			}
			// var title = "<h3 class=\"detail-list-h3\"><span>最近搜索公司</span></h3>";
			var historyHtml = "";
			// var htmlTemplate = "<p><a target='_blank' href='"+cfg.companyDetailUrl+"'>{1}</a></p>";
			var htmlTemplate = "<a target='_blank' href='"+cfg.companyDetailUrl+"'>{1}</a>";
			if(cookieValue)
			{
				var cookieJson = eval('(' + cookieValue + ')');
				for(var key in cookieJson)
				{
					if(!cookieJson[key]['companyNo'])
					{
						continue;
					}
					var companyName = "";
					if(cookieJson[key]['companyName'])
					{
						companyName = cookieJson[key]['companyName'];
					}
					var html = htmlTemplate.format(cookieJson[key]['companyNo'], companyName, new Date(parseInt(cookieJson[key]['createDate'])).format("yyyy-MM-dd hh:mm:ss"));
					historyHtml += html;
				}
				if($.trim(historyHtml) == ""){
					historyHtml = "<div style='line-height:45px;text-align:center;border-bottom: 1px solid #eaeaea;'>您还未浏览过任何公司哦</div>";
				}
				$("#nearlyVisited").append( historyHtml);
			}
			//处理页面展示
			return true;
		};
		
		var init = function (){
			initIncludeCompany();
			initTabs();
			initBrowseHistory();
		};
		
		return {
			init : init
		};
	})();
	
	
	$(document).ready(function () {
		Pingan.Base.init();
		Pingan.Event.init();
		autocomplete.init({model:"index", "companyDetailUrl" : $("base").attr("data-detailUrl")});
	});
	
});
