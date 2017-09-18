//自动完成功能
define('autocomplete', ['Pingan'], function (Pingan){
	function init(cfg){
		var model = cfg.model;
		if(model == "index"){
			var companyDetailUrl = cfg.companyDetailUrl;
			indexEventManage();
			$("#searchKey").autocomplete({
				source: function (request,response){
					$.getJSON( Pingan.basePath+"/autocomplete/list", {"key":$("#searchKey").val(), "searchType":$("#searchType").val()}, response );
				},
				minLength: 2,
				select: function(event,ui){
					window.location.href = companyDetailUrl.replace(/companyNo/g ,ui.item.companyNo);
			        return false;
				},
				focus:function(event, ui){
					if(event.button == 0){
						return false;
					}
					var keyValue = ui.item.companyName.replace(/<em>|<\/em>/g,'');
					$("#searchKey").val(keyValue);
					return false;
				}
			});
			$( "#searchKey" ).on( "autocompleteresponse", function( event, ui ) {
				$("#searchKey").data( "ui-autocomplete" )._renderItemData = function( ul, item ) {
					var companyName = item.companyName.replace(/<em>/g, '<strong>').replace(/<\/em>/g,'</strong>').replace(/null/g,'');
					item["value"] = companyName;
					item["label"] = item.companyNo;
					var url = companyDetailUrl.replace(/companyNo/g, item.companyNo);
					return jQuery("<li></li>").data("item.autocomplete", item).data(
						    "ui-autocomplete-item", item).append("<li style='line-height: 25px;'>"+ item.value+"</li>").appendTo(ul);
				};
			});
			
		}else if(model == "owner"){
			var url = cfg.url;
			$("#searchKey").autocomplete({
				source: function (request,response){
					$.getJSON( Pingan.basePath+"/autocomplete/list", {"key":$("#searchKey").val(), "searchType":"companyContent"}, response );
				},
				minLength: 2,
				select: function(event,ui){
					window.location.href = url+"&companyNameDigest="+ui.item.companyNameDigest;
				},
				focus:function(event, ui){
					if(event.button == 0){
						return false;
					}
					var keyValue = ui.item.companyName.replace(/<em>|<\/em>/g,'');
					$("#searchKey").val(keyValue);
					return false;
				}
			});
			$( "#searchKey" ).on( "autocompleteresponse", function( event, ui ) {
				$("#searchKey").data( "ui-autocomplete" )._renderItemData = function( ul, item ) {
					var companyName = item.companyName.replace(/<em>/g, '').replace(/<\/em>/g,'').replace(/null/g,'');
					item["value"] = companyName;
					item["label"] = item.companyNameDigest;
					var li = $("<li><a href='"+url+"&companyNameDigest="+item["label"]+"' style='display:none;'><i>认领</i></a>"+ item.value + "</li>");
					li.on({
						"mouseover":function (){
							$(this).find("a").show();
						},
						"mouseout":function (){
							$(this).find("a").hide();
						}
					});
					li = li.data("ui-autocomplete-item", item);
					ul.attr("class","tag-options");
					return li.appendTo(ul);
				};
			} );
		}else if(model == "fill_without_href"){
            var url = cfg.url;
            $("#searchKey").autocomplete({
                source: function (request,response){
                    $.getJSON( Pingan.basePath+"/autocomplete/list", {"key":$("#searchKey").val(), "searchType":"companyContent"}, response );
                },
                minLength: 2,
                select: function(event,ui){
                    // window.location.href = url+"&companyNameDigest="+ui.item.companyNameDigest;
                	$(this).attr('title',(ui.item.value));
					$(this).attr('value',(ui.item.value));
					$("#companyCode").val(ui.item.companyCode);
                },
                focus:function(event, ui){
                    if(event.button == 0){
                        return false;
                    }
                    var keyValue = ui.item.companyName.replace(/<em>|<\/em>/g,'');
                    $("#searchKey").val(keyValue);
                    return false;
                }
            });
            $( "#searchKey" ).on( "autocompleteresponse", function( event, ui ) {
                $("#searchKey").data( "ui-autocomplete" )._renderItemData = function( ul, item ) {
                    var companyName = item.companyName.replace(/<em>/g, '').replace(/<\/em>/g,'').replace(/null/g,'');
                    item["value"] = companyName;
                    item["label"] = item.companyNameDigest;
                   /* var li = $("<li><a href='"+url+"&companyNameDigest="+item["label"]+"' style='display:none;'><!--<i>认领</i>--></a>"+ item.value + "</li>");
                    li.on({
                        "mouseover":function (){
                            $(this).find("a").show();
                        },
                        "mouseout":function (){
                            $(this).find("a").hide();
                        }
                    });
                    li = li.data("ui-autocomplete-item", item);
                    ul.attr("class","tag-options");
                    return li.appendTo(ul);*/
                    return jQuery("<li></li>").data("item.autocomplete", item).data(
						    "ui-autocomplete-item", item).append("<li style='line-height: 25px;'>"+ item.value+"</li>").appendTo(ul);
                };
            } );
		} else if (model == "autocomplete_finance"){

            var url = cfg.url;
            $("#companyName").autocomplete({
                source: function (request,response){
                    $.getJSON( Pingan.basePath+"/autocomplete/list", {"key":$("#companyName").val(), "searchType":"companyContent"}, response );
                },
                minLength: 2,
                select: function(event,ui){
                    // window.location.href = url+"&companyNameDigest="+ui.item.companyNameDigest;
                	$(this).attr('title',(ui.item.value));
					$(this).attr('value',(ui.item.value));
					$("#companyNameDigest").val(ui.item.companyNameDigest);
                },
                focus:function(event, ui){
                    if(event.button == 0){
                        return false;
                    }
                    var keyValue = ui.item.companyName.replace(/<em>|<\/em>/g,'');
                    $("#searchKey").val(keyValue);
                    return false;
                }
            });
            $( "#companyName" ).on( "autocompleteresponse", function( event, ui ) {
                $("#companyName").data( "ui-autocomplete" )._renderItemData = function( ul, item ) {
                    var companyName = item.companyName.replace(/<em>/g, '').replace(/<\/em>/g,'').replace(/null/g,'');
                    item["value"] = companyName;
                    item["label"] = item.companyNameDigest;
                    /*var li = $("<li><a href='"+url+"&companyNameDigest="+item["label"]+"' style='display:none;'><!--<i>认领</i>--></a>"+ item.value + "</li>");
                    li.on({
                        "mouseover":function (){
                            $(this).find("a").show();
                        },
                        "mouseout":function (){
                            $(this).find("a").hide();
                        }
                    });
                    li = li.data("ui-autocomplete-item", item);
                    ul.attr("class","tag-options");
                    return li.appendTo(ul);*/
                    return jQuery("<li></li>").data("item.autocomplete", item).data(
						    "ui-autocomplete-item", item).append("<li style='line-height: 25px;'>"+ item.value+"</li>").appendTo(ul);
                };
            } );
            
		}

	}
	function indexEventManage(){
		$("#searchForm").submit(function (){
			if(validKey()){
				return true;
			}else{
				var searchKey = $("#searchKey");
				searchKey.css("borderColor","red");
				setTimeout(function(){
					searchKey.css("borderColor","#d1d1d1");
				},300);
				return false;
			}
		});
		$("[tip]").click(function(){
			$("[tip]").removeClass("current");
			$(this).addClass("current");
			$("#searchType").val($(this).attr("tab"));
			if(validKey()){
				$("#searchKey").autocomplete("search");
			}else{
				$("#searchKey").focus();
				$("#searchKey").attr("placeholder", $(this).attr("tip"));
			}
		});
		/*$("#searchKey").on(
			{"click":function(){
				if($(this).val() == $(".index-input").find(".current").attr("tip")){
					$(this).val("");
				}
			},
			"blur":function(){
				if($("#searchKey").val() == ""){
					$(".current").click();
				}
			}}
		);*/
	}

	function validKey(){
		var result = true;
		var v = $.trim($("#searchKey").val());
		for (i=0 ;i < $("[tip]").length;i ++){
			if($("[tip]").eq(i).attr("tip") == v || v == ""){
				result = false;
				break;
			}
		}
		return result;
	}
	
	return {
		init : init,
		indexEventManage : indexEventManage,
		validKey : validKey
	};
});
