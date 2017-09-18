define('companyTag', ['Pingan'], function(Pingan){
	function initCompanyTags(cfg){
		var companyTag = {}
		var url = cfg.url;
		var tagNoShow = cfg.tagNoShow;
		var tagNo = new Array();
		var lastTagNo = new Array();
		var tagNum = 0;
		var lastTagNum = 0;
		var dataStore = {};
		
		companyTag.pTagClick = function (){
			var pNo = $(this).attr("tagNo");
			$(this).siblings().find("li").css("background","");
			$(this).find("li").css("background","#0fa9bb");
			if(dataStore[pNo]){
				companyTag.createCTag(dataStore[pNo]);
				return ;
			}
			$.get(url, {"pTagNo":pNo}, function(data){
				if(data.data){
					companyTag.createCTag(data.data);
					dataStore[pNo] = data.data;
				}
			});
		};
		
		companyTag.createCTag = function (data){
			var cTags = data;
			$("#cTagChoose").html("<li class=\"li-bg\">行业小类</li>");
			for(var index in cTags ){
				 var cTag = cTags[index];
				 checkIndex();
				 if(cTag == undefined || cTag.tagName == undefined){
					 continue;
				 }
				 if(tagNo.indexOf(cTag.tagNo+"") < 0){
						$("#cTagChoose").append("<a href=\"javascript:void(0)\" onmouseover:'javascript:void(0);' tagNo=\""+cTag.tagNo+"\"><li>"+cTag.tagName+"</li></a>");
				 }else{
					$("#cTagChoose").append("<a href=\"javascript:void(0)\" onmouseover:'javascript:void(0);'  tagNo=\""+cTag.tagNo+"\"><li  style=\"background:#0fa9bb\">"+cTag.tagName+"</li></a>");		   					
				 }
			}
			//行业小类标签点击时
			$("#cTagChoose").find("a").click(companyTag.chooseCTag);	   		
		};
		
		companyTag.cancelFunction = function (){
			$("#tagChoose").hide();
			tagNo = lastTagNo.slice(0);
			tagNum = lastTagNum;
			//将行业标签中的元素复制到   已选择  中
			$("#selected").find("a").remove();
			$("#tagNo").parent().find("a").clone(true).appendTo($("#selected"));
			//模拟点击一次父标签
			$("#pTagChoose").find("a:first").click();
			//将选中的标签加上颜色
			$("#cTagChoose").find("a").each(function(){
				var temp = $(this).attr("tagNo");
				if(tagNo && tagNo.length > 0){
					for(var index in tagNo){
						var tagChoosed = tagNo[index];
						if(temp == tagChoosed){
							$(this).find("li").css("background","#0fa9bb");
						}
					}
				}
			});
		};
		
		companyTag.confirmFunction = function (){
			lastTagNo = tagNo.slice(0);
			lastTagNum = tagNum;
			$("#tagChoose").hide();
			$("#tagNo").parent().find("a").remove();
			$("#selected").find("a").clone(true).appendTo($("#tagNo").parent());
		};
		
		companyTag.chooseCTag = function (){
			var cNo = $(this).attr("tagNo");
			var tagNoSelected = $("#tagNo").val();
			if(tagNum >= 3){
				alert("最多可以选择三个标签");
				return;
			}
			checkIndex();
			if(tagNo.indexOf(cNo) >= 0){
				return;	
			}
			$(this).find("li").css("background","#0fa9bb");
			html="<a href=\"javascript:void(0)\"><span class=\"text\" style='width:inherit;'>"+$(this).find("li").text()+"</span><span class=\"delete\" tagNo=\""+cNo+"\">x</span></a>"
			$("#selected").append(html);
			$(".delete").unbind("click").on("click",companyTag.deleteCTag);
			tagNum = tagNum + 1;
			tagNo.push(cNo);
		};
		
		companyTag.deleteCTag = function (){
			var deleteTagNo = $(this).attr("tagNo");
			//已选标签中去除该标签
			$(this).parent().remove();
			//行业小类中的样式变为普通
			$("#cTagChoose").find("[tagNo='"+deleteTagNo+"']").find("li").css("background","");
			tagNum = tagNum -1;
			companyTag.removeElement(tagNo,deleteTagNo);			
		};
		
		companyTag.removeElement = function (tagNo,val){
			for(var index in tagNo){
				if(tagNo[index] == val){
					tagNo.splice(index,1);
				}
			}
		};
		
		function checkIndex(){
			if (!Array.prototype.indexOf){  
		        Array.prototype.indexOf = function(elt ){  
		        var len = this.length >>> 0;  
		        var from = Number(arguments[1]) || 0;  
		        from = (from < 0)  
		             ? Math.ceil(from)  
		             : Math.floor(from);  
		        if (from < 0)  
		          from += len;  
		        for (; from < len; from++)  
		        {  
		          if (from in this &&  
		              this[from] === elt)  
		            return from;  
		        }  
		        return -1;  
		      };  
		    } 
		}
		
		if("" != tagNoShow){
			tagNo = tagNoShow.split(",");
			lastTagNo = tagNo.slice(0);
			tagNum = tagNo.length;
			lastTagNum = tagNum;			
		}
		$("#tagPlus").click(function(){
			$("#tagChoose").show();
		});

		//点击  x 删除 
		$(".delete").unbind("click").on("click", companyTag.deleteCTag);

		//确定事件
		$(".sure,#tagClose").click(companyTag.confirmFunction);

		//取消事件
		$(".cancel").click(companyTag.cancelFunction);

		//行业大类标签点击时
		$("#pTagChoose").find("a").click(companyTag.pTagClick);
		return tagNo;
	}
	return {initCompanyTags : initCompanyTags};
});

