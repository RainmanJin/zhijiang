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
	deps : [ 'top','tacaLeft' ]
});

require(['Pingan', 'upload','tacaLeft'], function (Pingan, upload,tacaLeft){
	WebUploader = upload.WebUploader;
	
	Pingan.Base = (function (){
		var init_radio_func = function ()
        {
            $('input[type=radio]').on('click', function(){
            	if($(".bR-one").find("label").hasClass("jqChecked")){
            		$(".bR-one").find("label").removeClass("jqChecked");
            	}
                $(this).parent().addClass("jqChecked");
            });
        };
        

        var saveBtn = function(){
        	var laborForm = new Pingan.MForm($("#addLaborForm"));
        		laborForm.isAjax = true;
        		laborForm.afterSubmit = function (result) {
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
        
        var radio_check = function() {
        	$('input[type=radio]').filter(function (n) {
                if($(this).val() == $("#"+$(this).attr('attr')).val()){
                    $(this).click();
                }
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
        
		var init = function (){
			init_radio_func();
			saveBtn();
			radio_check();
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