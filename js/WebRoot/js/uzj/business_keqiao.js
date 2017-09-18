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
		
		var leftDataNav = function(){
			//判断Pingan模块是否加载
			Pingan = Pingan ? Pingan : require("common/common");
			
			/**left**/
			//导航
			new Pingan.NavHandler($("#left_div").find("[data-nav]"));
		};
		
        var getKeQiao = function(){
        	var keQiaoTable = new Pingan.PageHandler($("#keqiaoTable"),$("#keqiaoTable").siblings(".d-page")) ;
        		keQiaoTable.formateItem = function(index, model, row){
        			var image = imgUrl(row.shopCreditRating);
        			var companyHref = row.companyNameDigest ?basePath+"/company/professionalInfo?n="+row.companyNameDigest : "javascript:void(0);";
        			return model.format(row.shopName,row.legalPerson,row.capital,row.operatingYear?row.operatingYear+"年":"",row.compUrl,image,companyHref);
        		}
        }
        
       var imgUrl = function(start){
    	   var url = "";
    	   switch (start){
    	   		case 1:
    	   			url = 'images/trade-images/star/one-star1.png';
    	   			break;
    	   		case 2:
    	   			url = 'images/trade-images/star/two-star1.png';
    	   			break;
    	   		case 3:
    	   			url = 'images/trade-images/star/three-star1.png';
    	   			break;
    	   		case 4:
    	   			url = 'images/trade-images/star/four-star1.png';
    	   			break;
    	   		case 5:
    	   			url = 'images/trade-images/star/five-star1.png';
    	   			break;
    	   		case 6:
    	   			url = 'images/trade-images/star/one-star2.png';
    	   			break;
    	   		case 7:
    	   			url = 'images/trade-images/star/two-star2.png';
    	   			break;
    	   		case 8:
    	   			url = 'images/trade-images/star/three-star2.png';
    	   			break;
    	   		case 9:
    	   			url = 'images/trade-images/star/four-star2.png';
    	   			break;
    	   		default:
    	   			url = 'images/trade-images/star/five-star2.png';
    	   }
    	   return url;
    	   
       } 
        
		var init = function () {
			leftDataNav();
			getKeQiao();
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
