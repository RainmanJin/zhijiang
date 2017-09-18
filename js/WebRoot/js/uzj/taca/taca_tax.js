require.config({
	waitSeconds : 0,
	baseUrl : basePath,
	paths : {
		Pingan : 'js/common/common',
		upload : 'js/lib/webUpload/upload',
        tacaLeft:'js/uzj/taca/taca_left',
		top : 'js/uzj/new_top'
	},
	shim : {
		upload : {
			deps : [ 'Pingan' ]
		},
		top : {
			deps : [ 'Pingan' ]
		}
	},
	deps : [ 'top' ,'tacaLeft']
});

require(['Pingan', 'upload','tacaLeft'], function (Pingan, upload,tacaLeft){
	WebUploader = upload.WebUploader;
	
	Pingan.Base = (function (){
		var imgUpload = function(filePicker,reportAttachDiv,reportAttach){
			uploader2 = WebUploader.create({
				auto: true,
                resize: false,
                swf: basePath + '/js/lib/webUpload/Uploader.swf',
                server: basePath + "/user/datum/uploaddatum",
                pick: filePicker,
                fileSingleSizeLimit: 1024 * 512 * 4,
                accept: {
                    title: 'Images',
                    extensions: 'jpg,jpeg,png',
                    mimeTypes: 'image/jpg,image/jpeg,image/png'
                },
                duplicate:true		
			});
			try{
				var options = {
		          afterQueued:function(){
		        	 //$("#"+reportAttachDiv).attr('style','margin-top: 0px;margin-left: -15px;position: absolute;bottom: 0;top:0;');
		        	  $("#"+reportAttachDiv).attr('style','margin-top: 0px;');
		        	  $("#"+reportAttachDiv).addClass("datumLinkdiv");
		              $("#"+reportAttachDiv).find("img").addClass("img01");
		              $("#"+reportAttachDiv).find("img").attr('style','padding-top: 0px;');
		          },
		           afterSuccess:function(file, url){
		        	   if(url){
							$(reportAttach).val(url);
					   }
		        	$("#"+reportAttachDiv + " .success").unbind().bind("click",function(){
						$(filePicker).find("input[type=file]").trigger("click");
				     });
		        	//$("#"+reportAttachDiv).find("div .success").attr('style','position: absolute;bottom: 0;z-index: 999;width: 100%;background-color: #00bb9c;');
		        	$("#"+reportAttachDiv).find("div .success").addClass("uploadSuccess");
		           }
		        }
			 autoUpload(uploader2, reportAttachDiv,135,135,options);
			}catch(e){
				Pingan.malertInfo('服务器异常，上传失败!','infoMessage warning',{});
			}
		
		}
		
		var init_radio_func = function ()
        {
            $('input[type=checkbox]').on('click', function(){
            	if($(this).parent().hasClass("jqChecked")){
            		 $(this).parent().removeClass("jqChecked");
            		 $(this).removeAttr("checked"); 
            		 return;
            	} 
            	$(this).attr("checked","true"); 
                $(this).parent().addClass("jqChecked");         
            });
            
        };
        
        var searchRecord = function(){
        	window.location.href = basePath + "/taca/search/labor";
        }
        
        var saveBtn = function(){
        	var taxForm = new Pingan.MForm($("#addTaxForm"));
        		taxForm.isAjax = true;
        		taxForm.afterSubmit = function (result) {
			    	if(result.statusCode == 1){
			    		Pingan.malertInfo('保存成功!', 'datum-tip-cls', {callback:function () {
                            tacaLeft.locationNextPage();
                        }});
                        return;
			    	}
			    	if(result.statusCode == 5){
			    		Pingan.malertInfo('请重新登录!', 'datum-tip-cls', {});
			    		return;
			    	}
                    if (result === "") {
                        return;
                    }
			    	Pingan.malertInfo('保存失败，请稍后重试！', 'm-alert-info-failed', {});
			    }
        }

        
        var check = function() {
        	$('input[type=checkbox]').filter(function (n){
               if($(this).val() == $("#"+$(this).attr('attr')).val()){
                    $(this).click();
               }
           });
        }
        
        var searchImg = function(datumLinkId,datumLinkDivId,filePicker){
        	var datumLink = $(datumLinkId).val();
        	var item = "<div class='img-wrap' style='position: relative;'><img />" +
						"<div class='success' ><a href='javascript:void(0)' style='color:white;'>重新上传</a></div>" +
						"</div>";
        	if(datumLink != ""){
        		 imgUpload(filePicker,datumLinkDivId,datumLinkId);
        		$("#"+datumLinkDivId).addClass("file-item").html(item);
        		$("#"+datumLinkDivId +" img").attr("src",basePath+"/"+datumLink);
        		$("#"+datumLinkDivId).find("img").addClass("img01");
        		$("#"+datumLinkDivId).find("img").attr('style','padding-top: 0px;');
        		//$("#"+datumLinkDivId).find("img").attr('style','padding-top: 0px;max-width:108px;max-height:108px;min-width:108px;min-height:108px;');
        	    $("#"+datumLinkDivId).addClass("datumLinkdiv");
        	    $("#"+datumLinkDivId).attr("style","margin-top: 0px;");
        		//$("#"+datumLinkDivId).attr("style","margin-top: 0px;margin-left: -15px;position: absolute;bottom: 0;top:0;");
     			//$("#"+datumLinkDivId).find("div .success").attr('style','position: absolute;bottom: 0;z-index: 999;width: 100%;background-color: #00bb9c;top:85px;');
     			$("#"+datumLinkDivId).find("div .success").addClass("imgSuccess");
     			//强制删除,防止重复弹出上传
     			var length = $(filePicker).find("input[type=file]").length;
     			$(filePicker).find("input[type=file]").each(function(index,element){
     				if((index+1)<length){
     					$(element).remove();
     				}
     			});
     			
     			$("#"+datumLinkDivId).find(".success").unbind().bind("click",function(e){
     				e.preventDefault();
     				$(filePicker).find("input[type=file]").trigger("click");
     			});
        	} else {
        		var html = '<input type="button"/>'+
        					'<img src="'+basePath+'/images/base-upload.png"/>';
        		 $(filePicker).html(html);
        		 $(filePicker).find("img").last().after('<div id="'+datumLinkDivId+'" class="uploader-list"></div>');
    			 imgUpload(filePicker,datumLinkDivId,datumLinkId);
        	}
        }
        
        var init_number_input = function () {
            $("#container_id").on('keyup',"input[data-attr='number']",function () {
                var tmptxt=$(this).val();
                var t_age = tmptxt.replace(/[^\d^\.]+/g,'');
               if(!t_age||t_age<0){
                    t_age='';
                }
                $(this).val(t_age);
            });
        };
       
		
		var init = function (){
			init_radio_func();
			saveBtn();
			check();
			searchImg("#datumLink0","datumLink0Div","#filePicker1");
			searchImg("#datumLink1","datumLink1Div","#filePicker2");
			searchImg("#datumLink2","datumLink2Div","#filePicker3");
			searchImg("#datumLink3","datumLink3Div","#filePicker4");
			searchImg("#datumLink4","datumLink4Div","#filePicker5");
			init_number_input();
		}
		
		return {
			init : init
		};
	})();
	
	
	//事件
	Pingan.Event = (function (){
		var init = function (){};
		return {
			init : init
		};
	})();
	
	(function (){
		Pingan.Base.init();
		Pingan.Event.init();
	})();
	
});