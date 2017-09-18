require.config({
	waitSeconds : 0,
	baseUrl : basePath,
	paths : {
		Pingan : 'js/common/common',
		upload : 'js/lib/webUpload/upload',
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

require(['Pingan', 'upload'], function (Pingan, upload){
	WebUploader = upload.WebUploader;
	
	Pingan.Base = (function (){
		
		//导航
		var initNav = function (){
			new Pingan.NavHandler($("#nav_about_us").find("[data-nav]"));
		}
		
		//验证码
		var initImgCode = function (){
			var imgCode = new Pingan.ImgCode($("#ImageCode"));
		}

		//初始化企业名称
		var initCompanyName = function (){
			var urlHandler = new Pingan.UrlHandler( window.location.href );
			var companyName = urlHandler.params.get("companyName");
			$("#reportWebsite").val(decodeURI(companyName ? companyName : ''));
		};
		
		//初始化上传组件
		var initWebUpload = function (){
			uploader1 = WebUploader.create({
		        auto: true,
		        resize: false,
		        swf: Pingan.basePath + '/js/lib/webUpload/Uploader.swf',
		        server: Pingan.basePath + "/user/datum/uploadAdvise",
		        pick: '#filePicker1',
		        fileSingleSizeLimit: 1024*512*4,
		        accept: {
					title: 'Images',
					extensions: 'gif,jpg,jpeg,bmp,png',
					mimeTypes: 'image/*'
				},
				duplicate:true	
			});
			try{
				var options = {
		          afterQueued:function(){
		             $("#reportAttachDiv").find("img").attr('style','padding-top: 40px;');
		           },
		           afterSuccess:function(file, url){
		        	   if(url){
							$("#reportAttach").val(url);
					   }
		        	$("#reportAttachDiv .success").unbind().bind("click",function(){
						$("#filePicker1").find("input[type=file]").trigger("click");
				     });
		           }
		        }
			 autoUpload(uploader1, "reportAttachDiv",125,125,options);
			}catch(e){
				Pingan.malertInfo('服务器异常，上传失败!','infoMessage warning',{});
			}
		};
        
		
		var init = function (){
			initNav();
			initImgCode();
			initCompanyName();
			initWebUpload();
		}
		
		return {
			init : init
		};
	})();
	
	
	//事件
	Pingan.Event = (function (){
		
		//初始化举报表单
		var initReportForm = function (){
			var errorMsg = new Pingan.Popover($('#errorMsg'), $('#errorMsg'));
			var reportForm = new Pingan.MForm($("#addReport"),errorMsg);
			reportForm.isAjax = true;
			reportForm.beforeSubmit = function (){
				
				var flag = false;
				for ( var i = 0; i < $("[type='checkbox']").length - 1; i++) {
					if ($("[type='checkbox']")[i].checked) {
						$("#report_type").hide();
						flag = true;
						break;
					}
					$("#report_type").show();
				}
				return flag;
			};
			reportForm.afterSubmit = function (result){
				Pingan.malertInfo(result["statusMessage"],'infoMessage',{});
				$("#addReport")[0].reset();
			};
			
			  $("#reportWebsite").blur(function(){
		            if(!$("#reportWebsite").val().isText()){
		            	  $("#errorMsg").html("请输入企业全称");
		            	  $("#errorMsg").show();
		            	  return;
		        	}
	            });
			
		       $("#reportPerson").blur(function(){
		          if(!$("#reportPerson").val().isText()){
		            $("#errorMsg").html("请输入举报人姓名");
		            $("#errorMsg").show();
		        	return;
		         }
	         });
				
			
		/*	$("#code").blur(function(){
				var is_code_true = reportForm.getItem("code").validate();
				if(!is_code_true){
					
					return;
				}
			});*/
			
			
			$("#reportSubmitBtn").click(function (){
				
				$("#addReport").submit();
			});
		};
		
		//初始化反馈建议表单
		var initAdviceForm = function (){
			var adviceForm = new Pingan.MForm($("#adviseForm"));
			adviceForm.isAjax = true;
			adviceForm.afterSubmit = function (result){
				Pingan.malertInfo(result["statusMessage"],'infoMessage',{});
				$("#adviseForm")[0].reset();
			};
			$("#adviceBtn").click(function (){
				$("#adviseForm").submit();
			});
		};
		
		var init = function (){
			initReportForm();
			initAdviceForm();
		};
		
		return {
			init : init
		};
	})();
	
	(function (){
		Pingan.Base.init();
		Pingan.Event.init();
	})();
	
});

function reUpload(obj) {
	$("[name=feedbackAttach]").val("");
	$("#feedbackAttachDiv").html("");
	$("[name=reportAttach]").val("");
	$("#reportAttachDiv").html("");
	$("[class=webuploader-pick]").show();
}
function getQueryString(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
	var r = window.location.search.substr(1).match(reg);
	if (r != null) return r[2];
	return null;
}