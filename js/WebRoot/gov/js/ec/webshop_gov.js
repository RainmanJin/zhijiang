require(['Pingan'],function (Pingan) {
	Pingan.Init=function () {

		//webshop_list分页
		var webshopPage = new Pingan.PageHandler($("#webShop_list"), $("#webShop_list").parents(".spread").siblings(".s-page"));
		webshopPage.formateItem = function (index, model, row){
			// Pingan.lightStar();
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
			return model.format(row["shopName"],row["curMainBusiness"],city,companyHref,row["companyName"],row["saleAmountShow"],curCreditLevel).replace(/null/g, ' ');
		};
		webshopPage.onLoaded = function (){
			Pingan.lightStar();
			//shop底部
			Pingan.autoFoot();
		};
		
	//shop
	// $("#foot").css({position:"static", bottom:"0", width:"100%", margin:"0 auto"});
	// showBrowseEcHistory({"cookieValue":'${SHUIDIXY_ECSHOP_COOKIE}',"companyDetailUrl":"${fn:replace(companyDetailUrl, 'companyNo', '{0}')}"});
	//webshop_gov
	$("#industryChoose").find("a").click(function(){
		clearCurrentClass("industryChoose",$(this));
		var business = $(this).text() == "全部" ? "" : $(this).text();
		setUrlParam(webshopPage,"curMainBusiness",business);
		webshopPage.go(1);
	});
	
	$("#areaChoose").find("a").click(function(){
		clearCurrentClass("areaChoose",$(this));
		$("[name='cityCode']").val($(this).attr("data-attr"));
		setUrlParam(webshopPage,"cityCode",$(this).text() == "全部" ? "" : $(this).attr("data-attr"));
		webshopPage.go(1);
	});

	$("#webShopSearch").click(function(){
		$("[name='key']").val($("#webShopKey").val());
		setUrlParam(webshopPage,"key",$("#webShopKey").val());
		webshopPage.go(1);
	});
	
	$("#orderChoose").find("a").click(function(){
		clearCurrentClass("orderChoose",$(this));
		if($(this).text() != "综合"){
			if($("[name='orderField']").val() == $(this).attr("data-attr")){
				 getOppositeOrderType($(this),$("[name='orderType']").val());

			} else{
				setChooseImg($(this),"down");
				setUrlParam(webshopPage,"orderType",2);
			}
			$("[name='orderField']").val($(this).attr("data-attr"));
			setUrlParam(webshopPage,"orderField",$(this).attr("data-attr"));
		} else {
			$("[name='orderField']").val("");
			webshopPage.urlHandler.params.remove("orderField");
			webshopPage.urlHandler.params.remove("orderType");
			$(".orderImg").hide();
		}
		webshopPage.go(1);
	});

	function setChooseImg(aTag,chooseType){
		$(".orderImg").hide();
		if(chooseType == "up"){
			$("[name='orderType']").val("1");
			aTag.find(".orderImg").attr("src",basePath + "/images/retils/retails-up.png");
		} else {
			$("[name='orderType']").val("2");
			aTag.find(".orderImg").attr("src",basePath+"/images/retils/retails-down.png");
		}
		aTag.find(".orderImg").show();
	}
	
	function getOppositeOrderType(aTag,orderType){
		if(orderType == 1){
			setChooseImg(aTag,"down");
			setUrlParam(webshopPage,"orderType",2);
		} else{
			setChooseImg(aTag,"up");
			setUrlParam(webshopPage,"orderType",1);
		}
	}
	
	function clearCurrentClass(divId,currentTag){
		$("#"+ divId).find("a").attr("class","");
		currentTag.attr("class","current");
	}
		
	function setUrlParam(obj,field,value) {
		obj.urlHandler.params.put(field,value);
	}
	};
	Pingan.Init();
});

function getOppositeOrderType(orderType){
	if(orderType == 1){
		$("[name='orderType']").val("2")
	} else{
		$("[name='orderType']").val("1")
	}
}

function clearCurrentClass(divId,currentTag){
	$("#"+ divId).find("a").attr("class","");
	currentTag.attr("class","current");
}

function initHrefChange(){
	var curMainBusiness = $("[name='curMainBusiness']").val();
	var cityCode = 	$("[name='cityCode']").val();
	var curCreditLevel = $("[name='curCreditLevel']").val();
	var orderField = $("[name='orderField']").val();
	var orderType = $("[name='orderType']").val();
	var key = $("[name='key']").val();
	var href = basePath + "/gov/user/ecshop/trade/webshop?curMainBusiness="+curMainBusiness + "&cityCode="+cityCode +"&curCreditLevel="+curCreditLevel + "&orderField="+orderField + "&orderType="+orderType+"&key="+key;
	window.location = href;
}

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
	/*var htmlTemplate = "<div class='j-bl'> " +
							"<p><em class='j-number'>{1}</em><a terget='_blank href='#'>{2}</a></p>" +
						"</div>"*/
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

require.config({
	waitSeconds: 0,
	baseUrl: basePath+'/',
	paths: {
		Pingan: 'gov/js/common/common',
		top: 'gov/js/gov_top',
		nav:'gov/js/ec/nav',
		webshop_gov:'gov/js/ec/webshop_gov'
	},
	shim: {
		top:
		{
			deps:['Pingan']
		},
		nav:
		{
			deps:['Pingan']
		},
		webshop_gov:
		{
			deps:['Pingan']
		}
	},
	deps: ['Pingan', 'top', 'nav', 'webshop_gov']
});