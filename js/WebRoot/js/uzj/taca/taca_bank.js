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
	deps : [ 'top' ]
});

require(['Pingan', 'upload','tacaLeft'], function (Pingan, upload,tacaLeft){
	WebUploader = upload.WebUploader;
	
	Pingan.Base = (function (){
		//初始化上传组件
		var initWebUpload = function (){
			uploader1 = WebUploader.create({
		        auto: true,
		        resize: false,
		        swf: Pingan.basePath + '/js/lib/webUpload/Uploader.swf',
		        server: Pingan.basePath + "/user/datum/uploaddatum",
		        pick: '#filePicker1',
		        fileSingleSizeLimit: 1024*1024*4,
		        accept: {
					title: 'File',
					extensions: 'pdf',
					mimeTypes: '.pdf'
				},
				duplicate:true	
			});
			try{
				var options = {
		          afterQueued:function(){
		        	  $("#reportDocumentUrlDiv").attr('style','margin-top: 0px;');
		              $("#reportDocumentUrlDiv").addClass("datumLinkdiv");
		              $("#reportDocumentUrlDiv").find("img").addClass("img01");
		              $("#reportDocumentUrlDiv").find("img").attr('style','padding-top: 0px;');
		           },
		           afterSuccess:function(file, url){
		        	   if(url){
		        		    $("#fileName").val(file.name);
							$("#reportDocumentUrl").val(url);
					   }
		        	  $("#reportDocumentUrlDiv .success").unbind().bind("click",function(){
						 $("#filePicker1").find("input[type=file]").trigger("click");
				      });
		        	  var success_original_file = '<div class="success uploadSuccess" style=" width: 108px; margin-bottom: -1px; height: 23px;top:0;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;"><a href="javascript:void(0)" style="color:white;" title="'+file.name+'">'+file.name+'</a></div>';
		              $("#reportDocumentUrlDiv").find("div .success").addClass("uploadSuccess");
		              $("#reportDocumentUrlDiv div .success.uploadSuccess").css('width', '108px').css('margin-bottom','-1px').css('height','20px');
		              $("#reportDocumentUrlDiv .uploadSuccess").siblings('span').after('<img src="'+basePath+'/images/pdf_icon.png" style="max-width: 87px;margin-top: 13px;padding-left: 30px;max-height: 35px;min-width: 56px;min-height: 56px;">').remove();
		              $("#reportDocumentUrlDiv .uploadSuccess").before(success_original_file);
		           }
		        }
			 autoUpload(uploader1, "reportDocumentUrlDiv",0,0,options);
			}catch(e){
				Pingan.malertInfo('服务器异常，上传失败!','infoMessage warning',{});
			}
		};

        
        var saveBtn = function(){
        	var bankForm = new Pingan.MForm($("#addBankForm"));
        		bankForm.isAjax = true;
        		bankForm.afterSubmit = function (result) {
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

        
        var checked = function() {
        	$('input[type=checkbox]').filter(function (n){
                if($(this).val() == $("#"+$(this).attr('attr')).val()){
                     $(this).click();
                }
            });
        	
        	 $("select").each(function () {
        	      var checked_name = $(this).attr('data-attr');
        	      var checked_val = $('#'+checked_name).val();
        	      $(this).find('option[value="'+checked_val+'"]').attr('selected', 'selected');
        	});
        }
        
        var searchFile = function(){
        	var fileName = $("#fileName").val();
        	var reportDocumentUrl = $("#reportDocumentUrl").val();
        	var item = "<div class='img-wrap' style='position: relative;'><img />" +
						"<div class='success' ><a href='javascript:void(0)' style='color:white;'>重新上传</a></div>" +
						"</div>";
        	 var itemOriginalName = '<div class="success imgSuccess" style="width: 108px;top: 0px;height: 23px;bottom: -42px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;"><a href="javascript:void(0)" style="color:white;" title='+fileName+' >'+fileName+'</a></div>';
        	if(reportDocumentUrl != ""){
        		initWebUpload();
        		 $("#reportDocumentUrlDiv").addClass("file-item").html(item);
        	     $("#reportDocumentUrlDiv  img").attr("src",basePath+"/images/pdf_icon.png");
        	     $("#reportDocumentUrlDiv").find("img").addClass("img01");
        	     $("#reportDocumentUrlDiv").find("img").attr('style','max-width: 87px;margin-top:12px;padding-left: 30px;max-height: 35px;min-width: 56px;min-height: 56px;');
        	     $("#reportDocumentUrlDiv").addClass("datumLinkdiv");
        	     $("#reportDocumentUrlDiv").find("div .success").attr('style','width: 108px;position: absolute;z-index: 999;background-color: #00bb9c;top: 79px;');
        	     $("#reportDocumentUrlDiv").find("div .success").before(itemOriginalName);
        		
        		//强制删除,防止重复弹出上传
     			var length = $("#filePicker1").find("input[type=file]").length;
     			$("#filePicker1").find("input[type=file]").each(function(index,element){
     				if((index+1)<length){
     					$(element).remove();
     				}
     			});
     			
     			$("#reportDocumentUrlDiv").find(".success").unbind().bind("click",function(e){
     				e.preventDefault();
     				$("#filePicker1").find("input[type=file]").trigger("click");
     			});
     			return;
        	}
        	
        	/*var html = "<strong>上传附件</strong>"+
        			   "<img src='"+basePath+"/images/icon015.png' style='padding-top: 0px;cursor: pointer;'>";*/
        	var html = '<input type="button"/>'+
        			   '<img src="'+basePath+'/images/base-upload.png"/>';
        	$("#filePicker1").html(html);
        	$("#filePicker1").find("img").last().after('<div id="reportDocumentUrlDiv" class="uploader-list"></div>');
        	initWebUpload();
        }
        
		var init = function (){
			check_fun();
			saveBtn();
			checked();
			add_repeat_block_new('#abnormality_model','[data-attr="abnormality_tab"]', 3, "#abnormality_green", "#abnormality_red",'abnormality_tab');
			add_repeat_block_new('#overdue_model','[data-attr="overdue_tab"]', 3, "#overdue_green", "#overdue_red",'overdue_tab');
			//initWebUpload();
			searchFile();
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

/**
 * @author michael
 * @param repeat_obj    需要重复的内容选择器，eg:".add-test"
 * @param repeat_max_count  需要重复的最大次数，eg:6
 * @param add_btn       添加按钮选择器：eg：".add_btn"
 * @param del_btn       删除按钮选择器：eg：".del_btn"
 * @param add_dom       添加按钮dom：eg:$(".add_btn")[0].outerHTML
 * @param del_dom       删除按钮dom：eg:$(".del_btn")[0].outerHTML  //可以在js中声明删除按钮html变量 var del_dom
 * @param container     重复内容最外部容器对象， eg:$("#content_id")
 * @param deal_func     处理函数deal_func
 */
var add_repeat_block_new = function (repeat_model,repeat_obj, repeat_max_count, add_btn, del_btn,repeat_attr)
{
    $(add_btn).unbind('click').on('click', function ()
    {
        var block_num = $(repeat_obj).length;
        var repeat_d = $(repeat_model).clone().removeAttr('style').removeAttr('id').attr('data-attr',repeat_attr)[0].outerHTML;
        repeat_d = repeat_d.replace(/\[.*]/g, "[" + block_num++ + "]");
        $(this).parent().before(repeat_d);
        check_fun();
        init_number_input();
        init_add_del_btn();
    });

    $(del_btn).unbind('click').on('click', function ()
    {
    	$(this).parent().prev().remove();
        check_fun();
        init_number_input();
        init_add_del_btn();
    });
    var init_add_del_btn = function ()
    {
        var block_num = $(repeat_obj).length;
        if(block_num===1)
        {
            $(del_btn).hide();
            $(add_btn).show();
        }else if(block_num === repeat_max_count){
            $(add_btn).hide();
            $(del_btn).show();
        }else
        {
            $(add_btn).show();
            $(del_btn).show();
        }
    };
    init_add_del_btn();
};

var check_fun = function(){
    $('input[type=checkbox]').unbind('click').on('click', function(){
        if($(this).parent().hasClass("jqChecked")){
        	 $(this).parent().removeClass("jqChecked");
        	 $(this).removeAttr("checked"); 
        	 return;
        } 
        $(this).attr("checked","true"); 
        $(this).parent().addClass("jqChecked");         
    });
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