require.config({
    waitSeconds: 0,
    baseUrl: basePath,
    paths: {
        Pingan: 'js/common/common',
        lightbox: "js/lib/new/lightbox-2.6.min",
        top: 'js/uzj/new_top',
        audit_top:'js/uzj/taca/audit_top'
    },
    shim: {
    	lightbox: {
            deps: ['Pingan']
        },
        slide: {
            deps: ['Pingan']
        },
        top: {
            deps: ['Pingan']
        },
        audit_top: {
            deps: ['Pingan']
        }
        },
    deps: ['top','audit_top','lightbox']
});

require(['Pingan'], function (Pingan)
{
    Pingan.Base = (function ()
    {
        var init_radio_func = function ()
        {
            $('input[type=radio]').on('click', function(){
                $(this).parent().addClass("jqChecked").siblings().removeClass("jqChecked");
            });
            
            if(activityCfg.page != 'record'){
            	$('input[type=checkbox]').on('click', function(){
                	if($(this).parent().hasClass("jqChecked")){
                		 $(this).parent().removeClass("jqChecked");
                		 $(this).removeAttr("checked"); 
                		 return;
                	} 
                	$(this).attr("checked","true"); 
                    $(this).parent().addClass("jqChecked");         
                });
            }
            
            if(activityCfg.page == 'record'){
                $('input[type=checkbox]').on('click', function(){
                	if($(this).parent().hasClass("jqChecked")){
                		 $(this).parent().removeClass("jqChecked");
                		 $(this).parent().parent().parent().removeClass("hover-boxshadow");
                		 $(this).removeAttr("checked"); 
                		 return;
                	} 
                	$(this).attr("checked","true"); 
                    $(this).parent().addClass("jqChecked");   
                    $(this).parent().parent().parent().addClass("hover-boxshadow");
                });
            }
        };
        
    	 var init_step_page = function (){
    		 if(activityCfg.page == 'company_operate'){
    			 var top_three_tpe = $("#select_v").val();
    	         $('#check_box_id input[type=radio]').filter(function (n){
    	               if($(this).val() === top_three_tpe) {
    	                   $(this).click();
    	             }
    	         });
    		 }
    		 
    		 $('input[type=radio]').filter(function (n){
			     if($(this).val() == $("#"+$(this).attr('attr')).val()) {
			          $(this).click();
			     }
			 });
    		 
    		 if(activityCfg.page != 'record'){
    			 $('input[type=checkbox]').filter(function (n){
                     if($(this).val() == $("#"+$(this).attr('attr')).val()){
                          $(this).click();
                     }
                 });
    		 }
    		
             $("select").each(function () {
                  var checked_name = $(this).attr('data-attr');
                  var checked_val = $('#'+checked_name).val();
                  $(this).find('option[value="'+checked_val+'"]').attr('selected', 'selected');
            });
             
             if(activityCfg.page == 'record'){
             	$('input[type=checkbox]').filter(function (n){
                    if($(this).val() == $("#"+$(this).attr('attr')).val()){
                         $(this).click();
                         $(this).parent().parent().parent().addClass("hover-boxshadow");
                    }
                });
             }
             
             if(activityCfg.page == 'company_finance'){
            	 var tacaDatums = JSON.parse(activityCfg.tacaDatums);
                 var dt1 = 0;
                 tacaDatums.forEach(function (value, index, array)
                 {
                     $("[data-attr=upload]").eq(dt1).find('input').eq(0).val(value.id);
                     $("[data-attr=upload]").eq(dt1).find('input').eq(1).val(value.datumLink);
                     $("[data-attr=upload]").eq(dt1).find('input').eq(2).val(value.datumOriginalName);
                     dt1++;
                 });
             }
    	 }
    	 
    	var next_page = function(){
    		var  activityId = $("#activityId").val();
    		var  companyNameDigest = $("#companyNameDigest").val();
    		$("#more_li").click(function(){
    			window.open(basePath + "/company/professionalInfo?n=" + companyNameDigest);
    		});

    		$(".bt1").click(function () {
                window.location.href =$("#taca_details_nav").find(".current").next().attr("href");
            });
            $(".bt2").click(function () {
                window.location.href =$("#taca_details_nav").find(".current").prev().attr("href");
            });
    	}

        var init_left_nav = function ()
        {
            new Pingan.NavHandler($("#taca_details_nav").find("[data-nav]"));
        };
    	
        var init = function () {
        	init_radio_func();
        	init_step_page();
            init_left_nav();
        	if(activityCfg.page == 'company_finance'){
        		searchImg("#datumLink0","datumLink0Div","#filePicker1");
                searchImg("#datumLink1","datumLink1Div","#filePicker2");
                $("#filePicker1").click(function () {
                    var datum = $("#datumLink0").val();
                    if(datum){
                        window.open(basePath+"/"+datum);
                    }
                })
                $("#filePicker2").click(function () {
                    var datum = $("#datumLink1").val();
                    if(datum){
                        window.open(basePath+"/"+datum);
                    }
                })
           }
           if(activityCfg.page == 'bank'){
        	  searchImg("#reportDocumentUrl","reportDocumentUrlDiv","#filePicker3");
        	  $("#filePicker3").click(function () {
        	      window.open(basePath+"/"+$("#reportDocumentUrl").val());

              })
           }
           next_page();
        };
        return {
            init: init
        };
    })();


    //事件
    Pingan.Event = (function ()
    {
        var init = function ()
        {
        };
        return {
            init: init
        };
    })();

    (function ()
    {
        Pingan.Base.init();
        Pingan.Event.init();
    })();

});

var searchImg = function(datumLinkId,datumLinkDivId,filePicker){
    var datumLink = $(datumLinkId).val();
    var datumOriginalName = $(datumLinkId).next().val();
    var pic_name = datumOriginalName ===""?'':datumOriginalName.split('.')[1]==='pdf'?'pdf_icon.png':'doc_icon.png';
    var item = "<div class='img-wrap' style='position: relative;'><img />" +
        "<div class='success' ></div>" +
        "</div>";
    var itemOriginalName = '<div class="success imgSuccess" style="width: 108px;top: 74px;height: 23px;bottom: -42px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;margin-left: 15px;"><a href="javascript:void(0)" style="color:white;" title='+datumOriginalName+' >'+datumOriginalName+'</a></div>';
    if(datumLink != ""){
        var default_pic_url = 'images/'+pic_name;
        $("#"+datumLinkDivId).addClass("file-item").html(item);
        $("#"+datumLinkDivId +" img").attr("src",basePath+"/"+default_pic_url);
        $("#"+datumLinkDivId).find("img").addClass("img01");
        $("#"+datumLinkDivId).find("img").attr('style','max-width: 87px;margin-top:12px;padding-left: 49px;max-height: 35px;min-width: 56px;min-height: 56px;');
        $("#"+datumLinkDivId).addClass("datumLinkdiv");
        $("#"+datumLinkDivId).find("div .success").attr('style','width: 108px;position: absolute;z-index: 999;background-color: #00bb9c;top: 79px;margin-left: 15px;');
        $("#"+datumLinkDivId).find("div .success").before(itemOriginalName);
        //强制删除,防止重复弹出上传
    } else {
        var html = '<input type="button"/>'+
            '<img src="'+basePath+'/images/base-upload.png"/>';
        $(filePicker).html(html);

        if(datumLinkDivId == "datumLink0Div"){
            $(filePicker).find("img").last().after('<div id="datumLink0Div" class="uploader-list"></div>');
        }

        if(datumLinkDivId == "datumLink1Div"){
            $(filePicker).find("img").last().after('<div id="datumLink1Div" class="uploader-list"></div>');
        }
        // imgUpload(filePicker,datumLinkDivId,datumLinkId);
    }
};