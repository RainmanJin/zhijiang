require.config({
    waitSeconds: 0,
    baseUrl: basePath,
    paths: {
        Pingan: 'js/common/common',
        upload: 'js/lib/webUpload/upload',
        top: 'js/uzj/new_top',
        webuploader: 'js/lib/webUpload/webuploader.min',
        companyTag: 'js/uzj/company.tag',
        popup_layer: 'js/lib/popup_layer',
        jquery_ui_autocomplete_min: 'js/lib/jquery-ui-autocomplete.min',
        autocomplete: 'js/uzj/autocomplete-common'
    },
    shim: {
        jquery_ui_autocomplete_min: {
            deps: ['Pingan']
        },
        autocomplete: {
            deps: ['jquery_ui_autocomplete_min']
        },
        upload: {
            deps: ['Pingan']
        },
        companyTag: {
            deps: ['Pingan']
        },
        webuploader: {
            deps: ['Pingan']
        },
        top: {
            deps: ['Pingan']
        }
    },
    deps: ['top','webuploader']
});


require(['top', 'popup_layer', 'autocomplete', 'upload', 'companyTag','webuploader'], function (top, popup, autocomplete, upload, companyTag,webuploader) {
    WebUploader = upload.WebUploader;

    Pingan.Base = (function () {

        var initUser = function () {
            //星星等级
            Pingan.lightStar($(".star-inline"));

            Pingan.lightStar($(".istar"));

            var bkvl = $("[bkv]").attr("bkv");

            if (bkvl == '1')$("[bkv]").hide();

            $("#searchCompanyName").focus();

            //溢出显示省略号
            $("[to_h]").each(function () {
                var s = $(this).html();
                $(this).attr("title", s);
                if (s.length > 12) {
                    $(this).html(s.substring(0, 10) + "...");
                }
            });
            
            $("#searchKey").focus(function () {
                $("#searchKey").autocomplete("enable");
                $("#searchKey").autocomplete("search");
            });
            $("#searchBtn").click(function () {
                var key = $("input[name='key']").val();
                if (key) {
                    location.href = basePath + '/search?key=' + key;
                }
            });
            /**left.jsp**/
            //导航
            new Pingan.NavHandler($("#left_ul").find("[data-nav]"));
        };

        var init = function () {
            initUser();
        };

        return {
            init: init
        };

    })();


    Pingan.Load = (function () {
        //授权管理-确认授权或拒绝操作
        var permissionOrRefuseMconfirm = function (id, url, authResult) {
            var tip = "确定" + (authResult == 1 ? '授权' : '拒绝') + "吗？";
            Pingan.mconfirm(tip, function () {
                $.post(url, {"id": id, "authResult": authResult}, function (data) {
                    Pingan.malertInfo(data.statusMessage, 'datum-tip-cls', {});
                    setTimeout("location.reload()", 500);
                    //global.pageHandlers.get("authInfo").loadData();
                    //global.pageHandlers.get("authHistoryInfo").loadData();
                });
            }, function () {
                return;
            }, {});
        }

        //初始化所有分页
        var initPageHandler = function () {
            //授权管理-认领我的企业分页
            var authPage = new Pingan.PageHandler($("#auth_tr"), $("#authorizationTable").siblings(".new-page"));
            authPage.formateItem = function (index, model, row) {
                var item = $(model.format(row['id'], new Date(parseInt(row['applyTime'])).format("yyyy-MM-dd"), row['applyUserName'], userCfg.authDataType[row['authData']]));
                item.find("[data-id]").click(function () {
                    var id = $(this).attr("data-id");
                    var url = basePath + "/user/authorization/" + userCfg.encodeUpdate;
                    var authResult = Number($(this).attr("data-type"));
                    permissionOrRefuseMconfirm(id, url, authResult);
                });
                return item;
            };

            //授权管理-授权历史分页
      /*      var authHistoryPage = new Pingan.PageHandler($("#authHistory_tr"), $("#authHistoryList").children(".new-page"));
            authHistoryPage.formateItem = function (index, model, row) {
                var applyTime = new Date(parseInt(row['applyTime'])).format("yyyy-MM-dd");
                var applyUserName = row['applyUserName'];
                var authData = userCfg.authDataType[row['authData']];
                var authResult = row['authResult'];
                var operate = null;
                if (authResult == 1) {
                    operate = '授权';
                } else {
                    operate = '拒绝';
                }
                var operateUserName = row['operateUserName'];
                var authTime = new Date(parseInt(row['authTime'])).format("yyyy-MM-dd")
                var item = $(model.format(applyTime, applyUserName, authData, operate, operateUserName, authTime));
                return item;
            };*/

        }

        //绑定邮箱-初始化
        var initLod = function () {
            var cnt = 5;
            if (cnt < 0) {
                window.location.href = basePath + "/index.jsp";
            } else {
                var str = "页面<font color=red>" + cnt + "</font>秒后跳转,<a href='" + basePath + "/index.jsp'>点击立即跳转</a>";
                cnt--;
                $("#showTime").html(str)
            }
            setTimeout("lod()", 1000);
        };

        //找回密码-初始化
        var initFindInfo = function () {
            var username = userCfg.email;
            if (username == "") {
                window.location.href = basePath + "/user/toLogin";
            } else {
                var strs = username.split("@");
                $("#email").text(strs[0]);
            }
            if ($("#findInfo").text() != "") {
                var link = "<a href='http://mail." + username.split("@")[1] + "' target=_blank>点击登录邮箱</a>";
                $("#findInfo").append(link);
            }
        };

        //用户中心-初始化
        var initIndex = function () {
            var userName = userCfg.userName;
            var userId = userCfg.userId;
            if (userName != "" || userName != null) {
                getFavorites(userId, 1);
                getComments(userId);
                getCorrections(userId);
            }
            ;
            var getFavorites = function (userId, currentPage) {
                if (currentPage == null || currentPage == "") {
                    currentPage = 1;
                }

                $.post(basePath + "/user/favorites/" + userCfg.ajaxListuRL, {
                    "userId": userId,
                    "currentPage": currentPage
                }, function (data) {
                    if (data == null || data == undefined) {
                        $(".countFavorite").text(0);
                    } else {
                        $(".countFavorite").html("<a href='" + basePath + "/user/favorites/list' style='float:none'>" + data.length + "</a>");
                        var str = "";
                        $("#listFavorites").empty();

                        $(data).each(function (index, item) {
                            str += "<div class='attention1'><p>" + item.companyName + "</p><div class='attention-star'><span>信用等级:&nbsp;</span>" +
                                "<a href='${companyDetailUrl}'><label class='istar' config='{\"n\":".replace('companyNo', item.companyNo) + item.creditLevel + ",\"s\":50,\"size\":12,\"img\":\"" + basePath + "/images/star.png\"}'></label></a></div>" +
                                "<a href='javascript:void(0)'><img src='" + basePath + "/images/close.png' onclick='cancel(" + item.favoritesId + ")'/></a></div>";
                        });
                        $("#listFavorites").append(str);
                        Pingan.lightStar($(".istar"));
                    }
                    ;
                });
            }
            var getComments = function (userId) {
                $.post(basePath + "/user/comment/" + userCfg.countComments, {"userId": userId}, function (data) {
                    if (data.statusCode != 1) {
                        $("#countComment").text(0);
                    } else {
                        $("#countComment").html("<a href='" + basePath + "/user/comment/list'>" + data.data + "</a>");
                    }
                });
            }
            var getCorrections = function (userId) {
                $.post(basePath + "/user/correction/" + userCfg.countCorrections, {"userId": userId}, function (data) {
                    if (data.statusCode != 1) {
                        $("#countCorrection").text(0);
                    } else {
                        $("#countCorrection").html("<a href='" + basePath + "/user/correction/list'>" + data.data + "</a>");
                    }
                });
            };
        };

        //用户注册
        var registerSubmit = function () {
            var errorMsg = new Pingan.Popover($('#errorMsg'), $('#errorMsg'));
            var registerform = new Pingan.MForm($("#registerform"), errorMsg);
            registerform.isAjax = true;


            registerform.afterSubmit = function (result) {
                errorMsg.show(result.statusMessage);
                if (result.statusCode == 1) {
                    if ($("#username").val().isEmail()) {//我们已经向您的邮箱发送了一封激活邮件，请点击邮件中的链接完成注册！
                        window.location.href = basePath + "/user/registerResult.jsp?email=" + $("#username").val();
                    } else {
                        window.location.href = basePath;
                    }
                } else {
                    errorMsg.show(result.statusMessage);
                }
            };


            $("#identifyingCode").click(function () {
                $(this).attr("src", basePath + "/kaptcha/code?" + Math.random());
            });

            $(".radio_span").click(function () {
                $(this).prev().click();
            });

/*

            formHandler.sendingPhoneCode = false;

            var cou = 60;
            var wait = function () {
                $("#sendCode").html("获取激活短信({0})".format(cou));
                setTimeout(function () {
                    cou--;
                    if (cou > -1) {
                        wait();
                    } else {
                        formHandler.sendingPhoneCode = false;
                        $("#sendCode").html("获取激活短信");
                        cou = 60;
                    }
                }, 1000);
            };
*/

           /* $("#sendCode").click(function () {
                name = $.trim($("#username").val());
                if (!formHandler.sendingPhoneCode) {
                    if (!isMobile(name)) {
                        validHandler.show("手机号格式错误！");
                        return false;
                    }

                    formHandler.sendingPhoneCode = true;
                    $.post(basePath + "/user/" + userCfg.createPhoneCode, 'isNotReceive=1&phone=' + name, function (result) {
                        if (result.statusCode == 1) {
                            wait();
                        } else {
                            validHandler.show(result.statusMessage);
                        }
                    });
                }
            });*/

        };

        var init = function () {
            initPageHandler();
            if (userCfg.page == "bindingSuccess") {
                initLod();
            }
            if (userCfg.page == "findInfo") {
                initFindInfo();
            }
            if (userCfg.page == "index") {
                initIndex();
            }
            if (userCfg.page == 'register') {
                registerSubmit();
            }
        };

        return {
            init: init
        };
    })();


    Pingan.Event = (function () {
        //账户管理-显示手机邮箱
        var showPhoneMail = function () {
            var phone = userCfg.phone;
            var email = userCfg.email;
            if (phone != null) {
                var newPhone = phone.substring(0, 3) + "****" + phone.substring(phone.length - 2, phone.length);
                $(".phone").html(newPhone + "<i>(已绑定)</i>");
            }

            if (email != null) {
                newEmail = email.split("@")[0];
                if (email == userCfg.userName) {
                    $(".userName").html("用户名：" + newEmail);
                }
                $(".email").html(email + "<i>(已绑定)</i>");
            }
        };

        //账户管理-更改密码
        var changePwd = function () {
            var changePwdForm = new Pingan.MForm($("#updatePwdForm"));
            changePwdForm.isAjax = true;
            changePwdForm.afterSubmit = function (result) {
            	if(result.statusCode == 1){
            		 Pingan.malertInfo('密码修改成功', 'infoMessage warning', {});
            		 changePwdForm.reset();
            		 return;
            	 }
            	Pingan.malertInfo('密码修改失败', 'infoMessage warning', {});
            	changePwdForm.reset();
            };
        };

        //账户管理-个人信息切换按钮
        var showInfo = function () {
            $("#showMyInfo").on("click", function () {
                $("#showChangePWD").removeAttr("class");
                $("#changePWD").hide();
                $("#showMyInfo").attr("class", "current");
                $("#myInfo").show();
            });
        };

        //账户管理-修改密码切换按钮
        var showChangePWD = function () {
            $("#showChangePWD").on("click", function () {
                $("#showMyInfo").removeAttr("class");
                $("#myInfo").hide();
                $("#showChangePWD").attr("class", "current");
                $("#changePWD").show();
            });
        };

        //账户管理-绑定弹窗
        var countdown;
        var isRun = true;
        var doChange = function () {
            countdown--;
            if (countdown > 0) {
                isRun = false;
                $('#sendCode').css("background-color", "#c0c0c0");
                $('#sendCode').hover(function () {
                    $(this).css("background-color", "#c0c0c0");
                });
                $('#sendCode').css("cursor", "default");
                $('#sendCode').val(countdown + '秒后可重新操作');
                timer = setTimeout(doChange, 1000);//调用自身实现
            } else {
                isRun = true;
                $('#sendCode').css("background-color", "#00bb9c");
                $('#sendCode').hover(function () {
                    $(this).css("background-color", "#00c1a1");
                }, function () {
                    $(this).css("background-color", "#00bb9c");
                });
                $('#sendCode').css("cursor", "pointer");
                $('#sendCode').val('获取验证码');
                clearTimeout(timer);
                bindSendCode();
            }
       };
       
       var bindSendCode = function(){
    	   $("#sendCode").unbind().click(function () {
	           	 if (isRun) {
	           		 var phone = $("#phone").val();
	           		 if (!phone.isMobile()) {
	                        $("#errorPhone").show();
	                    } else {
                         $("#errorPhone").hide();
	                   	 $.post(basePath + "/user/" + userCfg.toBinding, {'param': phone}, function (data) {
	                            if (data != "y") {
	                                $("#errorPhone").html("该手机号已被注册!");
	                                $("#errorPhone").show();
	                            } else {
	                                $.post(basePath + "/user/" + userCfg.validatePhoneCode, {
	                                    'phone': phone,
	                                    'isNotReceive': 1
	                                }, function (data) {
	                                    if (data.statusCode == 1) {
	                                        $('#sendCode').unbind();
	                                        countdown = 60;
	                                        showPhoneMail();
	                                        timer = setTimeout(doChange, 50);
	                                        return;
	                                    }
	                                });
	                            }
	                        });
	                    }
	           		 
	           	 }
	           });
       }
        
        var initBindingPop = function () {
            //var closeButton2=cfg.closeButton2;
            $("#popButton2").click(function () {
                Pingan.malert($("#popDiv2"), $("#closeButton2"), {opacity: 0.2});
            });
            $("#popButton1").click(function () {
            	$("#errorPhone").hide();
            	$("#errorCode").hide();
            	$("#phone").val("");
            	$("#code").val("");
                Pingan.malert($("#popDiv1"), $("#closeButton1"), {opacity: 0.2});
                $("#popDiv1").css("top","435px");
                //$("#popDiv1").top("390px");
                bindSendCode();
            });

            $("#sendEmail").on("click", function () {
                var email = $("#email").val();
                var reg = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
                if (!reg.test(email)) {
                    $("#msg").html("请输入正确格式的邮箱!");
                } else {
                    $.post(basePath + "/user/" + userCfg.toBinding, {'param': email}, function (data) {
                        $("#msg").html("");
                        if (data != "y") {
                            $("#msg").html("该邮箱已被注册!");
                        } else {
                            var emailAddr = "http://mail." + email.split("@")[1];
                            $.post(basePath + "/user/" + userCfg.toBindEmail, {'email': email}, function (data) {
                                if (data.statusCode == 1) {
                                    $("#msg").css("color", "rgb(17, 187, 17)");
                                    $("#msg").html("邮件已成功发出,<a href='" + emailAddr + "' target='_blank'>立即登录邮箱</a>");
                                    $(this).unbind("click");
                                } else {
                                    $("#msg").html(data.statusMessage);
                                    $(this).html("点击重新发送!");
                                }
                            });
                        }
                    });
                }
            });

            $("#updateNick").on("click", function () {
                var nick = $("#nick").val();
                if (nick == null || nick == "") {
                    $("#msg2").html("请输入昵称!");
                } else {
                    $.post(basePath + "/user/" + userCfg.updateNick, {'userNickname': nick}, function (data) {
                        $("#msg2").html("");
                        if (data.statusCode == 1) {
                            $("#userNick").html(nick);
                            Pingan.malertInfo(data.statusMessage, 'infoMessage warning', {});
                            setTimeout($("#closeButton2").click(), 1500);

                        } else {
                            $("#msg2").html(data.statusMessage);
                        }
                    })
                }
            });

            $("#bindingBT").on("click", function () {

                var code = $("#code").val();
                var phone = $("#phone").val();

                if (!$("#phone").val().isMobile()) {
                    $("#errorPhone").show();
                    return;
                }else
                {
                    $("#errorPhone").hide();
                }
                
                if (!code) {
                    $("#errorCode").show();
                    return;
                }else {
                        $("#errorCode").hide();
                    }
               
                $.post(basePath + "/user/" + userCfg.binding, {'phone': phone, 'code': code}, function (data) {
                    if (data.statusCode == 1) {
                        Pingan.showMsg("infoMessage", data.statusMessage);
                        setTimeout($("#closeButton1").click(), 1500);
                    } else {
                        $("#errorCode").html(data.statusMessage);
                        $("#errorCode").show();
                    }
                });

            });
            
            $("#bindingCencer").on("click",function(){
            	var time=300;
            	var mask=$("#malert_mask");
            	mask.fadeOut(time).remove();
            	$("#popDiv1").hide();
            });
        }

        //认领企业-自动完成
        var initClaimAutocomplete = function () {
            autocomplete.init({model: "owner", "url": basePath + "/user/owner/" + userCfg.encodeAddInit});
            $("#searchKey").focus(function () {
                $("#searchKey").autocomplete("enable");
                $("#searchKey").autocomplete("search");
            });
        };

        //我的企业-自动完成
        var initCompanyAutoComplete = function () {
        	 autocomplete.init({model: "owner", "url": basePath + "/user/owner/" + userCfg.encodeAddInit});
        };
        
        //认领提交界面-自动完成
        var initAddCompanyAutoComplete = function () {
       	   autocomplete.init({model: "fill_without_href"});
         };


        //我的企业-初始化操作
    	var deleteInput = function(attrDelete,divId,addButton){
    		$("["+attrDelete+"]").unbind().on('click',function(){
    			if($("#"+divId).find("input").length > 1){
    				$("#"+addButton).siblings("input").eq($(this).attr(""+attrDelete+"")).remove();
    				$(this).remove();
    				$("#"+addButton).insertBefore($("["+attrDelete+"]"));
      			   $("#"+addButton).show();
    			}
    			
    			$("["+attrDelete+"]").attr(""+attrDelete+"",1);
    			if($("#"+divId).find("input").length == 1){
    				 $("["+attrDelete+"]").hide();
    			}
    			 
    			 if(divId == "phone_p"){
					 $("#phoneMsg").hide();
				 }
				 if(divId == "email_p"){
					 $("#emailMsg").hide();
				 }
				 if(divId == "officialWeb_p"){
					 $("#websiteMsg").hide();
				 }
    		});
    	}
    	
    	var addInput = function(addButton,divId,attrDelete,attrB){
    		$("#"+addButton).unbind().on('click',function(){
    			  var attrVal = $("#"+divId).find("input").length;
    			  var html = "";
    			  if(divId == "phone_p"){
    				  html= '<input class="comp-in" attrPhone="phone" type="text" name="companyPhone" placeholder="请输入联系电话" />';
    			  }
    			  
    			  if(divId == "email_p"){
    				  html= '<input class="comp-in" attrEmail="email" name="companyEmail" type="text" placeholder="请输入联系邮箱" />';
    			  }
    			  
    			  if(divId == "officialWeb_p"){
    				  html= '<input class="comp-in" attrOfficialWeb="officialWeb" name="companyOfficialWebsite" type="text" placeholder="请输入官方网址" />';
    			  }
    			  
    			  $("["+attrDelete+"]").attr(""+attrDelete+"",attrVal);
    			  $("#"+divId+" input").last().after(html);
    			  $("["+attrDelete+"]").show();
    			  inputBlur(attrB);
    			  
    			  if(attrVal == 1){
    				  if(divId == "phone_p"){
    					  $("#phone_p i").last().after('<i class="in-low" attrDeletePhone="'+attrVal+'" style="cursor: pointer;">-</i>');
    				  }
    				  
    				  if(divId == "email_p"){
    					  $("#"+divId+" i").last().after('<i class="in-low" attrEmailDelete="'+attrVal+'" style="cursor: pointer;">-</i>');
    				  }
    				  
    				  if(divId == "officialWeb_p"){
    					  $("#"+divId+" i").last().after('<i class="in-low" attrofficiawebdelete="'+attrVal+'" style="cursor: pointer;">-</i>');
    				  }
    			  }
    			
    			  if($("#"+divId).find("input").length == 3){
    	    			$("#"+addButton).hide();
    	    			if(divId == "phone_p"){
    	    				$("#"+divId).find("input").last().before('<i class="in-low" attrDeletePhone="1"  style="cursor: pointer;">-</i>');
    	    			}
    	    			 
    	    			if(divId == "email_p"){
    	    				$("#"+divId).find("input").last().before('<i class="in-low" attrEmailDelete="1"  style="cursor: pointer;">-</i>');
    	    			}
    	    			  
    	    			if(divId == "officialWeb_p"){
    	    			   $("#"+divId).find("input").last().before('<i class="in-low" attrofficiawebdelete="1"  style="cursor: pointer;">-</i>');
    	    			}
    	    	    }
    			  deleteInput(attrDelete,divId,addButton);
    		});
    	}
    	
    	var inputBlur = function(attrBlur){
    		$("["+attrBlur+"]").unbind().on('blur',function(){
    			var inputVal = $.trim($(this).val());
    			if(attrBlur == "attrPhone"){
    				 if(!inputVal.isMobile()&&!inputVal.isPhone()){
    					 $("#phoneMsg").html("请输入正确的联系方式");
    					 $("#phoneMsg").show();
	       			  } else {
	       				  $("#phoneMsg").hide();
	       			  }
    			}
    			
    			if(attrBlur == "attrEmail"){
    				 if(!inputVal.isEmail()){
    	      			  $("#emailMsg").html("请输入正确的邮箱地址");
    	      			  $("#emailMsg").show();
    	      		  } else {
    	      			$("#emailMsg").hide();
    	      		  }
    			}
    			
    			if(attrBlur == "attrOfficialWeb"){
    				 if(inputVal.trim()!="" && (!inputVal.toLowerCase().startsWith("http"))){
         				$(this).val("http://"+inputVal);
         		  }
    			}
    			
    		});
    	}
    	
        var initCompanyOperate = function () {
        	  $("#edit_data").click(function(){
        		 $("#view_data_div").hide();
        		 $("#edit_data_div").show();
        		 $("#phoneMsg").hide();
        		 $("#emailMsg").hide();
        		 $("#addPhoneInput").show();
        		 $("#addEmailInput").show();
        		 $("#addOfficialWebInput").show();
        		 
        		 if(userCfg.companyLogo != ""){
        			 var item = "<div class='img-wrap'><img />" +
      							"<div class='success' ><a href='javascript:void(0)' style='color:white;'>重新上传</a></div>" +
      							"</div>";
	      			$("#companyLogoDiv").addClass("file-item").html(item);
	     			$("#companyLogoDiv img").attr("src",basePath+"/"+userCfg.companyLogo);
	     			$("#companyLogoDiv img").attr("width","157px");
	     			$("#companyLogoDiv img").attr("height","157px");
	     			$("#companyLogoDiv").attr("style","padding-top: 0;");
	     			$("#logoFilePicker").hide();
	     			//强制删除,防止重复弹出上传
	     			var length = $("#logoFilePicker").find("input[type=file]").length;
	     			$("#logoFilePicker").find("input[type=file]").each(function(index,element){
	     				if((index+1)<length){
	     					$(element).remove();
	     				}
	     			});
	     			
	     			$("#companyLogoDiv").find(".success").unbind().bind("click",function(e){
	     				e.preventDefault();
	     				$("#logoFilePicker").find("input[type=file]").trigger("click");
	     			});
        		 } else {
        			 $("#logoFilePicker").html('<div class="new11-comp-logo" ><img src="'+basePath+'/images/new1-upload.png" /></div><input type="button"  value="上传公司LOGO" />');;
        			 $("#companyLogoDiv").attr("style","").html("");
        			 logoUpload();
        		 }
        		 
        		 if(userCfg.companyPhone != ""){
        			 var tags = userCfg.companyPhone.split(',');
        			 var html="";
        			 if(tags.length == 1){
        				  html ='<input class="comp-in" type="text" attrPhone="phone"  name="companyPhone" value="'+tags[0]+'" placeholder="请输入联系电话" />'+
        				  		'<i class="in-add" id="addPhoneInput" style="cursor: pointer;">+</i>'+
        				  		'&nbsp;&nbsp;<label class="Validform_checktip" id="phoneMsg"  style="color:red;"></label>';
        				 
        				  $("#phone_p span").after(html);
        				  addInput("addPhoneInput","phone_p","attrdeletephone","attrPhone");
        			 }
        			 
        			 if(tags.length == 2){
        				  html ='<input class="comp-in" type="text" attrPhone="phone" name="companyPhone" value="'+tags[0]+'" placeholder="请输入联系电话" />'+
        				 			'<input class="comp-in" type="text" attrPhone="phone"  name="companyPhone" value="'+tags[1]+'" placeholder="请输入联系电话" />'+
        				 			'<i class="in-add" id="addPhoneInput" style="cursor: pointer;">+</i>'+
        				 			'<i class="in-low" attrdeletephone="1" style="cursor: pointer;">-</i>'+
        				 			'&nbsp;&nbsp;<label class="Validform_checktip" id="phoneMsg"  style="color:red;"></label>';
        				 $("#phone_p span").after(html);
        				 deleteInput("attrdeletephone","phone_p","addPhoneInput");
        				 addInput("addPhoneInput","phone_p","attrdeletephone","attrPhone");
        			 }
        			 
        			 if(tags.length == 3){
        				  html ='<input class="comp-in" attrPhone="phone" type="text"  name="companyPhone" value="'+tags[0]+'" placeholder="请输入联系电话" />'+
				 			'<input class="comp-in" attrPhone="phone" type="text"  name="companyPhone" value="'+tags[1]+'" placeholder="请输入联系电话" />'+
				 			'<i class="in-low" attrdeletephone="1" style="cursor: pointer;">-</i>'+
				 			'<input class="comp-in" attrPhone="phone" type="text" name="companyPhone" value="'+tags[2]+'" placeholder="请输入联系电话" />'+
				 			'<i class="in-add" id="addPhoneInput" style="cursor: pointer; display: none;">+</i>'+
				 			'<i class="in-low" attrdeletephone="2" style="cursor: pointer;">-</i>'+
				 			'&nbsp;&nbsp;<label class="Validform_checktip" id="phoneMsg"  style="color:red;"></label>';
        				 	$("#phone_p span").after(html);
        				 	deleteInput("attrdeletephone","phone_p","addPhoneInput");
        			 }
        		 } else {
        			 html ='<input class="comp-in" attrPhone="phone" type="text"  name="companyPhone" value="" placeholder="请输入联系电话" />'+
					       '<i class="in-add" id="addPhoneInput" style="cursor: pointer;">+</i>'+
					       '&nbsp;&nbsp;<label class="Validform_checktip" id="phoneMsg"  style="color:red;"></label>';
        			 $("#phone_p span").after(html);
        			 addInput("addPhoneInput","phone_p","attrdeletephone","attrPhone");
        		 }
        		 
        		 if(userCfg.companyEmail != ""){
        			 var tags = userCfg.companyEmail.split(',');
        			 var html="";
        			 
        			 if(tags.length == 1){
        				 html = '<input class="comp-in" type="text" attrEmail="email" name="companyEmail" value="'+tags[0]+'" placeholder="请输入联系邮箱" />'+
        				 		'<i class="in-add" id="addEmailInput" style="cursor: pointer;">+</i>'+
        				 		'&nbsp;&nbsp;<label class="Validform_checktip" id="emailMsg"  style="color:red;"></label>';
        				 $("#email_p span").after(html);
        				 addInput("addEmailInput","email_p","attrEmailDelete","attrEmail");
        			 }
        			 
        			 if(tags.length == 2){
        				 html = '<input class="comp-in" type="text" attrEmail="email" name="companyEmail" value="'+tags[0]+'" placeholder="请输入联系邮箱" />'+
        				         '<input class="comp-in" type="text" attrEmail="email" name="companyEmail" value="'+tags[1]+'" placeholder="请输入联系邮箱" />'+
        				 		 '<i class="in-add" id="addEmailInput" style="cursor: pointer;">+</i>'+
        				 		 '<i class="in-low" attrEmailDelete="1" style="cursor: pointer;">-</i>'+
        				 		 '&nbsp;&nbsp;<label class="Validform_checktip" id="emailMsg"  style="color:red;"></label>';
        				 $("#email_p span").after(html);
        				 deleteInput("attrEmailDelete","email_p","addEmailInput");
        				 addInput("addEmailInput","email_p","attrEmailDelete","attrEmail");
        			 }
        			 
        			 if(tags.length == 3){
        				 html = '<input class="comp-in" type="text" attrEmail="email" name="companyEmail" value="'+tags[0]+'" placeholder="请输入联系邮箱" />'+
        				         '<input class="comp-in" type="text" attrEmail="email" name="companyEmail" value="'+tags[1]+'" placeholder="请输入联系邮箱" />'+
        				         '<i class="in-low" attrEmailDelete="1" style="cursor: pointer;">-</i>'+
        				         '<input class="comp-in" type="text" attrEmail="email" name="companyEmail" value="'+tags[2]+'" placeholder="请输入联系邮箱" />'+
        				 		 '<i class="in-add" id="addEmailInput" style="cursor: pointer;display: none;">+</i>'+
        				 		 '<i class="in-low" attrEmailDelete="2" style="cursor: pointer;">-</i>'+
        				 		 '&nbsp;&nbsp;<label class="Validform_checktip" id="emailMsg"  style="color:red;"></label>';
        				 $("#email_p span").after(html);
        				 deleteInput("attrEmailDelete","email_p","addEmailInput");
        				 addInput("addEmailInput","email_p","attrEmailDelete","attrEmail");
        			 }
        		 } else {
        			 html ='<input class="comp-in" type="text" attrEmail="email" name="companyEmail" value="" placeholder="请输入联系邮箱" />'+
						    '<i class="in-add" id="addEmailInput" style="cursor: pointer;">+</i>'+
						    '&nbsp;&nbsp;<label class="Validform_checktip" id="emailMsg"  style="color:red;"></label>';
		  			 $("#email_p span").after(html);
		  			addInput("addEmailInput","email_p","attrEmailDelete","attrEmail");
        		 }
        		 
        		 if(userCfg.companyOfficialWebsite != ""){
        			 var tags = userCfg.companyOfficialWebsite.split(',');
        			 var html="";
        			 
        			 if(tags.length == 1){
        				 html = '<input class="comp-in" type="text" attrOfficialWeb="officialWeb" name="companyOfficialWebsite" value="'+tags[0]+'" placeholder="请输入官方网址" />'+
        				 		'<i class="in-add" id="addOfficialWebInput" style="cursor: pointer;">+</i>'+
        				 		'&nbsp;&nbsp;<label class="Validform_checktip" id="websiteMsg"  style="color:red;"></label>';
        				 $("#officialWeb_p span").after(html);
        				 addInput("addOfficialWebInput","officialWeb_p","attrOfficiaWebDelete","attrOfficialWeb");
        			 }
        			 
        			 if(tags.length == 2){
        				 if(tags[0] == "" || tags[1] == ""){
        					 html = '<input class="comp-in" type="text" attrOfficialWeb="officialWeb" name="companyOfficialWebsite" value="'+tags[0]+'" placeholder="请输入官方网址" />'+
     				 			    '<i class="in-add" id="addOfficialWebInput" style="cursor: pointer;">+</i>'+
     				 		        '&nbsp;&nbsp;<label class="Validform_checktip" id="websiteMsg"  style="color:red;"></label>';
        				 } else {
        					 html = '<input class="comp-in" type="text" attrOfficialWeb="officialWeb" name="companyOfficialWebsite" value="'+tags[0]+'" placeholder="请输入官方网址" />'+
		    				         '<input class="comp-in" type="text" attrOfficialWeb="officialWeb" name="companyOfficialWebsite" value="'+tags[1]+'" placeholder="请输入官方网址" />'+
		    				 		 '<i class="in-add" id="addOfficialWebInput" style="cursor: pointer;">+</i>'+
		    				 		 '<i class="in-low" attrOfficiaWebDelete="1" style="cursor: pointer;">-</i>'+
		    				 		 '&nbsp;&nbsp;<label class="Validform_checktip" id="websiteMsg"  style="color:red;"></label>';
        				 }
        				 $("#officialWeb_p span").after(html);
        				 deleteInput("attrOfficiaWebDelete","officialWeb_p","addOfficialWebInput");
        				 addInput("addOfficialWebInput","officialWeb_p","attrOfficiaWebDelete","attrOfficialWeb");
        			 }
        			 
        			 
        			 if(tags.length == 3){
        				 if(tags[0] == "" || tags[1] == ""){
        					 html = '<input class="comp-in" type="text" attrOfficialWeb="officialWeb" name="companyOfficialWebsite" value="'+tags[0]+'" placeholder="请输入官方网址" />'+
					 			    '<i class="in-add" id="addOfficialWebInput" style="cursor: pointer;">+</i>'+
					 		        '&nbsp;&nbsp;<label class="Validform_checktip" id="websiteMsg"  style="color:red;"></label>';
        				 } else if(tags[2] == ""){
        					 html = '<input class="comp-in" type="text" attrOfficialWeb="officialWeb" name="companyOfficialWebsite" value="'+tags[0]+'" placeholder="请输入官方网址" />'+
        					 		'<input class="comp-in" type="text" attrOfficialWeb="officialWeb" name="companyOfficialWebsite" value="'+tags[1]+'" placeholder="请输入官方网址" />'+   	
        					 		'<i class="in-add" id="addOfficialWebInput" style="cursor: pointer;">+</i>'+
				 			    	'<i class="in-low" attrOfficiaWebDelete="1" style="cursor: pointer;">-</i>'+
				 			    	'&nbsp;&nbsp;<label class="Validform_checktip" id="websiteMsg"  style="color:red;"></label>';
        				 } else {
        					 html = '<input class="comp-in" type="text" attrOfficialWeb="officialWeb" name="companyOfficialWebsite" value="'+tags[0]+'" placeholder="请输入官方网址" />'+
		    				         '<input class="comp-in" type="text" attrOfficialWeb="officialWeb" name="companyOfficialWebsite" value="'+tags[1]+'" placeholder="请输入官方网址" />'+
		    				         '<i class="in-low" attrOfficiaWebDelete="1" style="cursor: pointer;">-</i>'+
		    				         '<input class="comp-in" type="text" attrOfficialWeb="officialWeb" name="companyOfficialWebsite" value="'+tags[2]+'" placeholder="请输入官方网址" />'+
		    				 		 '<i class="in-add" id="addOfficialWebInput" style="cursor: pointer;display: none;">+</i>'+
		    				 		 '<i class="in-low" attrOfficiaWebDelete="2" style="cursor: pointer;">-</i>'+
		    				 		 '&nbsp;&nbsp;<label class="Validform_checktip" id="websiteMsg"  style="color:red;"></label>';
        				 }
        				 $("#officialWeb_p span").after(html);
        				 deleteInput("attrOfficiaWebDelete","officialWeb_p","addOfficialWebInput");
        				 addInput("addOfficialWebInput","officialWeb_p","attrOfficiaWebDelete","attrOfficialWeb");
        			 }
        		 } else {
        			 html ='<input class="comp-in" type="text" attrOfficialWeb="officialWeb" name="companyOfficialWebsite" value="" placeholder="请输入官方网址" />'+
						    '<i class="in-add" id="addOfficialWebInput" style="cursor: pointer;">+</i>'+
						    '&nbsp;&nbsp;<label class="Validform_checktip" id="websiteMsg"  style="color:red;"></label>';
		  			 $("#officialWeb_p span").after(html);
		  			addInput("addOfficialWebInput","officialWeb_p","attrOfficiaWebDelete","attrOfficialWeb");
        		 }
        		 inputBlur("attrPhone");
        		 inputBlur("attrEmail");
        		 inputBlur("attrOfficialWeb");
        	  });
        };
        
        var updateCompany = function(){
      	    var companyForm = new Pingan.MForm($("#updateCompanyForm"));
      	        companyForm.isAjax = true;
      	        companyForm.beforeSubmit = function () {
      	        	 var flagFalse = true;
           	         var flagTrue = false; 
	      	    	$("#phone_p input").each(function(){
	      	    	   var companyPhone = $.trim($(this).val());
	       			   if(!companyPhone.isMobile()&&!companyPhone.isPhone()){
	       				  $("#phoneMsg").html("请输入正确的联系方式");
	           			  $("#phoneMsg").show();
	           			  flagFalse = false;
	           			  return false;
	       			   } else {
	       				  $("#phoneMsg").hide();
	       				  flagTrue = true;
	       			   }
	      	    	});
	      	    	
	      	    	$("#email_p input").each(function(){
	      	    		var companyEmail = $.trim($(this).val());
	      	    		if(!companyEmail.isEmail()){
	            			  $("#emailMsg").html("请输入正确的邮箱地址");
	            			  $("#emailMsg").show();
	            			  flagFalse = false;
	            			  return false;
	            		  } else {
	            			$("#emailMsg").hide(); 
	            			flagTrue = true;
	            		 }
	      	    	});
	      	    
	      	    	if(flagTrue && flagFalse)
	      	    	{
	      	    		return true;
	      	    	}
	      	    	
	      	    };
        	    companyForm.afterSubmit = function (result) {
        	    $("#saveData").attr('disabled',true);
            	if(result.statusCode == 1){
  				   Pingan.malertInfo('公司资料更新成功!', 'datum-tip-cls', {});
  				   setTimeout("location.reload()", 1500);
  				   return;
  			    }
  			    Pingan.malertInfo('公司资料更新失败!', 'datum-tip-cls', {});
            };

        	    $("#saveData").click(function (){
                    $("#updateCompanyForm").submit();
                });
           
            $("#cencelEdit").click(function(){
        	   $("#view_data_div").show();
        	   $("#edit_data_div").hide();
        	   $("#phone_p span").siblings().remove();
        	   $("#email_p span").siblings().remove();
        	   $("#officialWeb_p span").siblings().remove();
        	   companyForm.reset();
            });
        }
        
        //我的企业-资料信息
        var detailCompany = function(){
        	$("[attrCompanyNo]").click(function(){
        		 window.location.href = basePath + "/company/professionalInfo?s=" + $(this).attr("attrCompanyNo");
        	});
        }
        
        var myCompanyUpload =  function(){
        	$("input[data-attr]").on('click',function(){
        	    $("#language").val($(this).attr('data-attr'));
        		$("#fileUploadDiv").show();
        		$("#immediately_div").hide();
        		 immediatelyUpload('#uploader1', '#filePicker1', '#filePicker_add_button1', '#uploader1 .queueList');
        		 
        		 $("#blackUpload").unbind().click(function(){
             		$("#fileUploadDiv").hide();
             		$("#immediately_div").show();
             	});
        	});
        }
        
        //我的企业--增信资料文件上传
        var immediatelyUpload = function(wrap_dom, pick_id, add_button_id, dnd_id){
            jQuery(function () {

                var $ = jQuery,    // just in case. Make sure it's not an other libaray.

                    $wrap = $(wrap_dom),

                // 图片容器
                    $queue = $('<ul class="filelist" attr="file_dis"></ul>')
                        .appendTo($wrap.find('.queueList')),

                // 状态栏，包括进度和控制按钮
                    $statusBar = $wrap.find('.statusBar'),

                // 文件总体选择信息。
                    $info = $statusBar.find('.info'),

                // 上传按钮
                    $upload = $wrap.find('.uploadBtn'),

                // 没选择文件之前的内容。
                    $placeHolder = $wrap.find('.placeholder'),

                // 总体进度条
                    $progress = $statusBar.find('.progress').hide(),

                // 添加的文件数量
                    fileCount = 0,

                // 添加的文件总大小
                    fileSize = 0,

                // 优化retina, 在retina下这个值是2
                    ratio = window.devicePixelRatio || 1,

                // 缩略图大小
                    thumbnailWidth = 110 * ratio,
                    thumbnailHeight = 110 * ratio,

                // 可能有pedding, ready, uploading, confirm, done.
                    state = 'pedding',

                // 所有文件的进度信息，key为file id
                    percentages = {},

                    supportTransition = (function () {
                        var s = document.createElement('p').style,
                            r = 'transition' in s ||
                                'WebkitTransition' in s ||
                                'MozTransition' in s ||
                                'msTransition' in s ||
                                'OTransition' in s;
                        s = null;
                        return r;
                    })(),

                // WebUploader实例
                    uploader;

                if (!WebUploader.Uploader.support()) {
                    alert('Web Uploader 不支持您的浏览器！如果你使用的是IE浏览器，请尝试升级 flash 播放器');
                    throw new Error('WebUploader does not support the browser you are using.');
                }
                
                // 实例化
                uploader = WebUploader.create({
                    pick: {
                        id: pick_id,
                        label: '点击选择图片'
                    },
                    dnd: dnd_id,
                    paste: document.body,

                    accept: {
                        title: 'Images',
                        extensions: 'jpg,jpeg,png',
                        mimeTypes: 'image/jpg,image/jpeg,image/png'
                    },

                    thumb: {
                        width: 110,
                        height: 110,

                        // 图片质量，只有type为`image/jpeg`的时候才有效。
                        // quality: 70,

                        // 是否允许放大，如果想要生成小图的时候不失真，此选项应该设置为false.
                        allowMagnify: true,

                        // 是否允许裁剪。
                        crop: true,

                        // 为空的话则保留原有图片格式。
                        // 否则强制转换成指定的类型。
                        // type: 'image/jpeg'
                    },
                    compress: {
                        width: 1600,
                        height: 1600,

                        // 图片质量，只有type为`image/jpeg`的时候才有效。
                        quality: 90,

                        // 是否允许放大，如果想要生成小图的时候不失真，此选项应该设置为false.
                        allowMagnify: false,

                        // 是否允许裁剪。
                        crop: false,

                        // 是否保留头部meta信息。
                        preserveHeaders: true,

                        // 如果发现压缩后文件大小比原来还大，则使用原来图片
                        // 此属性可能会影响图片自动纠正功能
                        noCompressIfLarger: false,

                        // 单位字节，如果图片大小小于此值，不会采用压缩。
                        compressSize: 2 * 1024 * 1024
                    },
                    
                    // swf文件路径
                    swf: basePath + '/js/lib/webUpload/Uploader.swf',
                    disableGlobalDnd: true,

                    chunked: true,
                    server: basePath + "/asso/indlight/datum/upload?isFullPath=false",
                    fileNumLimit: 5,
                    fileSizeLimit: 20 * 1024 * 1024,    // 20 M
                    fileSingleSizeLimit: 2 * 1024 * 1024,    // 2 M
                    // runtimeOrder: 'html5,flash'
                });

                // 添加“添加文件”的按钮，
                uploader.addButton({
                    id: add_button_id,
                    label: '继续添加'
                });

                // 当有文件添加进来时执行，负责view的创建
                function addFile(file) {
                    var $li = $('<li id="' + file.id + '">' +
                            '<p class="title">' + file.name + '</p>' +
                            '<p class="imgWrap"></p>' +
                            '<p class="progress"><span></span></p>' +
                            '</li>'),

                        $btns = $('<div class="file-panel">' +
                            '<span class="cancel">删除</span>' +
                            '<span class="rotateRight">向右旋转</span>' +
                            '<span class="rotateLeft">向左旋转</span></div>').appendTo($li),
                        $prgress = $li.find('p.progress span'),
                        $wrap = $li.find('p.imgWrap'),
                        $info = $('<p class="error"></p>'),

                        showError = function (code) {
                            switch (code) {
                                case 'exceed_size':
                                    text = '文件大小超出';
                                    break;

                                case 'interrupt':
                                    text = '上传暂停';
                                    break;

                                default:
                                    text = '上传失败，请重试';
                                    break;
                            }

                            $info.text(text).appendTo($li);
                        };

                    if (file.getStatus() === 'invalid') {
                        showError(file.statusText);
                    } else {
                        // @todo lazyload
                        $wrap.text('预览中');
                        uploader.makeThumb(file, function (error, src) {
                            if (error) {
                                $wrap.text('不能预览');
                                return;
                            }

                            var img = $('<img src="' + src + '">');
                            $wrap.empty().append(img);
                        }, thumbnailWidth, thumbnailHeight);

                        percentages[file.id] = [file.size, 0];
                        file.rotation = 0;
                    }

                    file.on('statuschange', function (cur, prev) {
                        if (prev === 'progress') {
                            $prgress.hide().width(0);
                        } else if (prev === 'queued') {
                            $li.off('mouseenter mouseleave');
                            $btns.remove();
                        }

                        // 成功
                        if (cur === 'error' || cur === 'invalid') {
                            console.log(file.statusText);
                            showError(file.statusText);
                            percentages[file.id][1] = 1;
                        } else if (cur === 'interrupt') {
                            showError('interrupt');
                        } else if (cur === 'queued') {
                            percentages[file.id][1] = 0;
                        } else if (cur === 'progress') {
                            $info.remove();
                            $prgress.css('display', 'block');
                        } else if (cur === 'complete') {
                            $li.append('<span class="success"></span>');
                            $li.prepend('<p  class="see-or-not-all" name="see_or_not" style="width:110px;">上传成功</p>');
                            $('.title').hide();
                        }

                        $li.removeClass('state-' + prev).addClass('state-' + cur);
                    });

                    $li.on('mouseenter', function () {
                        $btns.stop().animate({height: 30});
                    });

                    $li.on('mouseleave', function () {
                        $btns.stop().animate({height: 0});
                    });

                    $btns.on('click', 'span', function () {
                        var index = $(this).index(),
                            deg;

                        switch (index) {
                            case 0:
                                uploader.removeFile(file);
                                return;

                            case 1:
                                file.rotation += 90;
                                break;

                            case 2:
                                file.rotation -= 90;
                                break;
                        }

                        if (supportTransition) {
                            deg = 'rotate(' + file.rotation + 'deg)';
                            $wrap.css({
                                '-webkit-transform': deg,
                                '-mos-transform': deg,
                                '-o-transform': deg,
                                'transform': deg
                            });
                        } else {
                            $wrap.css('filter', 'progid:DXImageTransform.Microsoft.BasicImage(rotation=' + (~~((file.rotation / 90) % 4 + 4) % 4) + ')');
                        }
                    });
                    
                    $("#blackUpload").unbind().click(function(){
                		$("#fileUploadDiv").hide();
                		$("#immediately_div").show();
                	    uploader.removeFile(file);
                	});

                    $li.appendTo($queue);
                }

                // 负责view的销毁
                function removeFile(file) {
                    var $li = $('#' + file.id);

                    delete percentages[file.id];
                    updateTotalProgress();
                    $li.off().find('.file-panel').off().end().remove();
                }

                function updateTotalProgress() {
                    var loaded = 0,
                        total = 0,
                        spans = $progress.children(),
                        percent;

                    $.each(percentages, function (k, v) {
                        total += v[0];
                        loaded += v[0] * v[1];
                    });

                    percent = total ? loaded / total : 0;

                    spans.eq(0).text(Math.round(percent * 100) + '%');
                    spans.eq(1).css('width', Math.round(percent * 100) + '%');
                    updateStatus();
                }

                function updateStatus() {
                    var text = '', stats;

                    if (state === 'ready') {
                        text = '选中' + fileCount + '张图片，共' +
                            WebUploader.formatSize(fileSize) + '。';
                    } else if (state === 'confirm') {
                        stats = uploader.getStats();
                        text = '已成功上传' + stats.successNum + '张照片 '
                        if (stats.uploadFailNum > 0) {
                            text += ',' + stats.uploadFailNum + '张照片上传失败，<a class="retry"  id="f_btn_submit_flow_2" href="javascript:void(0);">重新上传</a>失败图片或<a id="ignore_err_picture" class="ignore" href="javascript:void(0);">忽略</a>'
                        }

                    } else {
                        stats = uploader.getStats();
                        text = '共' + stats.successNum + '张（' +
                            WebUploader.formatSize(fileSize) +
                            '），已上传' + stats.successNum + '张';

                        if (stats.uploadFailNum) {
                            text += '，失败' + stats.uploadFailNum + '张';
                        }
                    }

                    $info.html(text);
                }
                

                function setState(val) {
                    var file, stats;

                    if (val === state) {
                        return;
                    }

                    $upload.removeClass('state-' + state);
                    $upload.addClass('state-' + val);
                    state = val;

                    switch (state) {
                        case 'pedding':
                            $placeHolder.removeClass('element-invisible');
                            $queue.parent().removeClass('filled');
                            $queue.hide();
                            $statusBar.addClass('element-invisible');
                            uploader.refresh();
                            break;

                        case 'ready':
                            $placeHolder.addClass('element-invisible');
                            $(add_button_id).removeClass('element-invisible');
                            $queue.parent().addClass('filled');
                            $queue.show();
                            $statusBar.removeClass('element-invisible');
                            uploader.refresh();
                            break;

                        case 'uploading':
                            $(add_button_id).addClass('element-invisible');
                            $progress.show();
                            $upload.text('暂停上传');
                            break;

                        case 'paused':
                            $progress.show();
                            $upload.text('继续上传');
                            break;

                        case 'confirm':
                            $progress.hide();
                            $(add_button_id).removeClass('element-invisible');
                            $upload.text('上传完成').removeClass('disabled');
                            $upload.text('上传完成').html('开始上传');

                            stats = uploader.getStats();
                            if (stats.successNum && !stats.uploadFailNum) {
                                setState('finish');
                                return;
                            }
                            break;
                        case 'finish':
                            stats = uploader.getStats();
                            if (stats.successNum) {
                                // alert( '上传成功' );
                            } else {
                                // 没有成功的图片，重设
                                state = 'done';
                                location.reload();
                            }
                            break;
                    }

                    updateStatus();
                }

                uploader.onUploadProgress = function (file, percentage) {
                    var $li = $('#' + file.id),
                        $percent = $li.find('.progress span');

                    $percent.css('width', percentage * 100 + '%');
                    percentages[file.id][1] = percentage;
                    updateTotalProgress();
                };

                uploader.onFileQueued = function (file) {
                    fileCount++;
                    fileSize += file.size;

                    if (fileCount === 1) {
                        $placeHolder.addClass('element-invisible');
                        $statusBar.show();
                    }

                    addFile(file);
                    setState('ready');
                    updateTotalProgress();
                };

                uploader.onFileDequeued = function (file) {
                    fileCount--;
                    fileSize -= file.size;

                    if (!fileCount) {
                        setState('pedding');
                    }

                    removeFile(file);
                    updateTotalProgress();

                };

                uploader.on('all', function (type) {
                    var stats;
                    switch (type) {
                        case 'uploadFinished':
                            setState('confirm');
                            break;

                        case 'startUpload':
                            setState('uploading');
                            break;

                        case 'stopUpload':
                            setState('paused');
                            break;

                    }
                });

                uploader.onError = function (code) {
                    switch (code) {
                        case 'F_EXCEED_SIZE':
                            Pingan.malertInfo('文件大小超出范围', 'datum-tip-cls', {});
                            break;
                        case 'F_DUPLICATE':
                            Pingan.malertInfo('所选文件重复', 'datum-tip-cls', {});
                            break;
                        case 'Q_TYPE_DENIED':
                            Pingan.malertInfo('文件类型不正确', 'datum-tip-cls', {});
                            break;
                        case 'Q_EXCEED_NUM_LIMIT':
                            Pingan.malertInfo('文件数量超出', 'datum-tip-cls', {});
                            break;
                        default:
                            text = '上传失败，请重试';
                            break;
                    }
                };

                //上传成功后回调
                uploader.on('uploadSuccess', function (file, response) {
                    if (response.statusCode == 1) {
                        $('#' + file.id).append('<input  type="text" name="userDatums[' + file.id.toString().split('_')[2] + '].datumName" value="'+$('#language').val() +'"/>');
                        $('#' + file.id).append('<input  type="text" name="userDatums[' + file.id.toString().split('_')[2] + '].datumLink" value="' + response.data + '"/>');
                        $('#' + file.id).append('<input  type="text" name="userDatums[' + file.id.toString().split('_')[2] + '].ownerId" value="'+userCfg.ownerId+'"/> ');

                    } else {
                        if (response.statusMessage != null || response.statusMessage != undefined) {
                            Pingan.malertInfo('上传失败, ' + response.statusMessage, 'datum-tip-cls', {});
                        } else {
                            Pingan.malertInfo('上传失败!', 'datum-tip-cls', {});
                        }
                    }

                });

                $upload.on('click', function () {
                    if ($(this).hasClass('disabled')) {
                        return false;
                    }

                    if (state === 'ready') {
                        uploader.upload();
                    } else if (state === 'paused') {
                        uploader.upload();
                    } else if (state === 'uploading') {
                        uploader.stop();
                    }
                });

                $info.on('click', '.retry', function () {
                    uploader.retry();
                });

                $info.on('click', '.ignore', function () {
                    var dom = $(this).parent().parent().prev().find('li.state-error');
                    uploader.removeFile(dom.attr('id'));
                    $(add_button_id).removeClass('element-invisible');
                    $upload.text('上传完成').removeClass('disabled');
                    $upload.text('上传完成').html('开始上传');
                });

                $upload.addClass('state-' + state);
                updateTotalProgress();
            
            });
        }
        
        //企业管理---资料提交
        var datumFormSubmit = function () {
            var datumForm = new Pingan.MForm($("#addDatumForm"));
            datumForm.isAjax = true;

            datumForm.afterSubmit = function (result) {
            	if(result.statusCode == 1){
            		 Pingan.malert($("#datumPop"),$("#closePop"),{opacity:0.2});
            		 $("#fileUploadDiv").hide();
             		 $("#immediately_div").show();
                    datum_timer();
            		return;
            	}
            	
            	if(result.statusCode == 4){
            		Pingan.malertInfo('请上传资料!', 'datum-tip-cls', {});
            		return;
            	}
            };

            $("#submitDatum").click(function () {
                $("#addDatumForm").submit();
            });
        };
        
        //企业管理--资料提交成功后，3秒自动返回
        var datum_timer_sec = 3;
        var datum_timer = function(){
            var time_id ;
            var doChange =  function(){
                datum_timer_sec--;
                $("#timeOutSpan").html(datum_timer_sec);
                if(datum_timer_sec == 0) {
                    window.clearInterval(time_id);
                    location.href= basePath + "/user/"+userCfg.list;
                }
            }
            time_id =setInterval(doChange,1000);
        }
        
        //我的企业--初始化信用等级
	    var initCreditLevel = function (){
	    	  $.ajax({
	    		  url:basePath+"/company/score?companyNameDigest="+userCfg.companyNameDigest,
	              success:initCreditLevelCallBack
	    	  });
		};
		
		var initCreditLevelCallBack = function(json){
			if(json == null || json.statusCode != 1){
				$("#credit_span").html("无");
				$("#credit_b").html("暂无");
				return;
			}
			
			var level = json.data.level;
			var desc = json.data.desc;

				$("#credit_span").text(level);
				$("#credit_b").text(desc);
                $("#credit_span").addClass("ci"+level.length);
            $("#credit_b").addClass("cb"+level.length);
		};
		
		var logoUpload = function(){
            uploaderFiles = WebUploader.create({
                auto: true,
                resize: false,
                swf: basePath + '/js/lib/webUpload/Uploader.swf',
                server: basePath + "/user/datum/" + userCfg.upload + "&isFullPath=false",
                pick: '#logoFilePicker',
                fileSingleSizeLimit: 1024 * 512 * 4,
                accept: {
                    title: 'Images',
                    extensions: 'jpg,jpeg,png',
                    mimeTypes: 'image/jpg,image/jpeg,image/png'
                },
                duplicate:true	
            });
            try {
         	   var options = {
         			   afterQueued:function(){
         				   $("#companyLogoDiv").find("img").attr('style','magrin-top:-40px;');
         				   $("#companyLogoDiv").attr('style','padding-top: 0;');
         				   $("#companyLogoDiv").find("div .success").attr('style','padding-top: 0;');
           	            },
           	       
         			   afterSuccess:function(file, url){
         				   if(url){
    							   $("#companyLogo").val(url);
    					   } 
         				   
         				  $("#companyLogoDiv .success").unbind().bind("click",function(){
        						$("#logoFilePicker").find("input[type=file]").trigger("click");
        				  });
         		    }
         	   }
             autoUpload(uploaderFiles, "companyLogoDiv",159,179,options);
            } catch (e) {
                Pingan.malertInfo('服务器异常，上传失败!', 'infoMessage warning', {});
            }
		}
		
        //我的企业-删除操作
        var delOwner = function () {
            $(".delOwner").click(function () {
                var id = $(this).attr("data-ownerId");
                Pingan.mconfirm("是否确认删除!", function () {
                    $.post(basePath + "/user/owner/" + userCfg.encodeDelete, {'ownerId': id}, function (data) {
                        Pingan.showMsg("infoMessage", data.statusMessage);
                    });
                }, function () {
                    return
                }, {});
            });
        };

        //资料管理-选择当前公司
        var myDatumCompanySelect = function () {
            $("[fail]").hide();
            $("[auditStatus]").each(function () {
                var auditStatus = $(this).attr("auditStatus");
                if (auditStatus == "300") {
                    $("[pass]").show();
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
            $("#currentCompany").html($("[ownerId=" + userCfg.ownerId + "]").html() + "<img src='" + basePath + "/images/small-icon.png'  style='margin-left:10px'/>");
            $("#currentCompany").on("click", function () {
                if ($(this).parent().find("ul").is(":visible") == false) {
                    $(this).parent().find("ul").show();
                } else {
                    $(this).parent().find("ul").hide();
                }
            });

            $("#currentCompany").parent().find("li").on("click", function () {
                $("#currentCompany").val($(this).text());
                window.location.href = basePath + "/user/datum/" + userCfg.encodeList + "&ownerId=" + $(this).attr("ownerId");
            });

            $("#addDatum").on("click", function () {
                window.location.href = basePath + "/user/owner/" + userCfg.encodeToSubmitDatum + "&id=" + userCfg.ownerId;
            });

        };

        //资料管理-通过&未通过资质切换
        var myDatumRecordShow = function () {
            $("#myDatumRecord").find("[data-click]").click(function () {
                $("#myDatumRecord").find("input[type='radio']").removeAttr("checked");
                $(this).find("input[type='radio']").prop("checked", true);
                var status = $(this).attr("data-click");
                $("[pass],[fail],[wait]").hide();
                if (status == '300') {
                    $("[pass]").show();
                } else if (status == '100,200') {
                    $("[wait]").show();
                } else if (status == '201,301') {
                    $("[fail]").show();
                }
                var hasData = false;
                $("[auditStatus]").each(function () {
                    var s = $(this).attr("auditStatus");
                    if (status.indexOf(s) != -1) {
                        $(this).show();
                        hasData = true;
                    } else {
                        $(this).hide();
                    }
                });
                if (!hasData) {
                    $("#nodata").show();
                } else {
                    $("#nodata").hide();
                }
                $(".error-title1").find("a").removeAttr("class");
                $(this).attr("class", "current");
            });
            $("#myDatumRecord").find("[data-click=300]").click();
        };

        //资料管理-添加资料-上传证明
        var uploaderCert = function () {
            for (var type in userCfg.typData) {
                $("#datumTypeLi").append("<li typeId=" + type + ">" + userCfg.datumData[type] + "</li>");
            }
            uploader1 = WebUploader.create({
                auto: true,
                resize: false,
                swf: basePath + '/js/lib/webUpload/Uploader.swf',
                server: basePath + "/user/datum/" + userCfg.encodeUploaddatum + "&isFullPath=false",
                pick: '#filePicker1',
                fileSingleSizeLimit: 1024 * 512 * 4,
                accept: {
                    title: 'Images',
                    extensions: 'gif,jpg,jpeg,bmp,png',
                    mimeTypes: 'image/*'
                },
                duplicate: true
            });

            try {
            	  var options = {
            	      afterQueued:function(){
            		    $("#attachOrgfileDiv").find("img").attr('style','padding-top: 0;');
            	    }
           	   }
                autoUpload(uploader1, "attachOrgfileDiv",options);
            } catch (e) {
                Pingan.malertInfo('服务器异常，上传失败!', 'infoMessage warning', {});
            }

        };

        //资料管理-添加资料-资料类型
        var datumSubTypeSelect = function () {
            $(".currentSelect,.tag-select02").on("click", function () {
                if ($(this).parent().find("ul:first").is(":visible") == false) {
                    $(this).parent().find("ul:first").show();
                } else {
                    $(this).parent().find("ul:first").hide();
                }
            });

            $(".currentSelect,.tag-select02").parent().find("li").on("click", function () {
                $(this).parent().siblings(".currentSelect,.tag-select02").html($(this).text() + "<img src='" + basePath + "/images/small-icon.png'  style='margin-left:10px'/>");
                if ($(this).parent().attr("id") == "companyLi") {
                    $("#ownerId").val($(this).attr("value"));
                }
                if ($(this).parent().attr("id") == "datumTypeLi") {
                    $("#datumSubTypeLi").html("");
                    $("#auditDatumId").val($(this).attr("typeId"));			//设置auditDatumId
                    var subTypes = userCfg.typData[$(this).attr("typeId")];
                    var count = 1;
                    for (var code in subTypes) {
                        if (count == 1) {
                            $("#datumSubtype").html(subTypes[code].substring(0, 9) + "<img src='" + basePath + "/images/small-icon.png'  style='margin-left:10px'/>");
                            $("input[name=datumSubtype]").val(code);
                        }
                        count++;
                        $("#datumSubTypeLi").append("<li code='" + code + "' subLi-id='subLi' >" + subTypes[code] + "</li>");
                    }
                    subLiClick();
                }
                $(this).parent().hide();
                $(".pop-img").show();
            });

            var subLiClick = function () {
                $("[subLi-id]").click(function () {
                    $("#datumSubtype").html($(this).text().substring(0, 9) + "<img src='" + basePath + "/images/small-icon.png'  style='margin-left:10px'/>");
                    $("input[name=datumSubtype]").val($(this).attr("code"));
                    $(this).parent().hide();
                });
            }
        };
        
        //消息管理--标签切换
        var  datumSelect = function(){
        	new Pingan.NavHandler($("#message_p").find("[data-nav]"));
        }

        //资料管理-添加资料-提交按钮
        var datumFormButton = function () {
            var datumForm = new Pingan.MForm($("#addDatumForm"));
            datumForm.isAjax = true;
            datumForm.beforeSubmit = function () {
                if ($("#datumType").val() == "请选择" || $("input[name=datumSubtype]").val() == "" || $("#auditDatumId").val() == "") {
                    $("#errorMsg").html("请选择资质类型!");
                    return false;
                }
                var datumLink = $("[name=attachOrgfile]").val();
                if (datumLink == "" || datumLink == null) {
                    $("#errorMsg").html("请上传资质图片!");
                    return false;
                }
                if ($("input[name=checkUrl]").val() == "") {
                    $("#errorMsg").html("请填写查验网址!");
                    return false;
                }
                $("#datumLink").val(datumLink);
                return true;
            };

            datumForm.afterSubmit = function (result) {
                Pingan.showMsg("infoMessage", result.statusMessage);
            };

            $("#toSubmit").click(function () {
                $("#addDatumForm").submit();
            });

        };

        //管理授权-初始化待选择公司
        var initCompanySelect = function () {
            var companyLi_li = $("#companyLi").find("li");
            if (companyLi_li.length > 0) {
                $("#companySelect").html(companyLi_li.eq(0).text() + "<img src='" + basePath + "/images/small-icon.png' style='margin-left:10px; width: 10px; margin-bottom: 4px;'>");
            } else {
                $(".m-typ").html('<div class="myclaim"> <h4>认领我的企业</h4> <div style="margin-top: 30px;padding-bottom: 38px;"> <p>请输入您的企业名称：</p> <div class="select-box" autocomplete="owner"> <input type="text" placeholder="企业名称" class="tag-select" id="searchKey"/> </div> </div> </div>');
            }

            $("#companySelect").click(function () {
                $(".tag-options02").toggle();
            });
        };

        //管理授权-点击待选择公司
        var companyLiClick = function () {
            var companyLi = new Pingan.SelectHandler($("#companyLi").find("li"), false, true);
            companyLi.selected = function (item) {
                $(".tag-options02").toggle();
                $("#companySelect").html(item.text() + "<img src='" + basePath + "/images/small-icon.png' style='margin-left:10px; width: 10px; margin-bottom: 4px;'>");
                var companyNameDigest = item.attr("companyNameDigest");
                var pageHandler_auth = global.pageHandlers.get("authInfo");
                pageHandler_auth.total = 0;
                pageHandler_auth.urlHandler.params.put("companyNameDigest", companyNameDigest);
                pageHandler_auth.onLoaded = function () {
                    Pingan.autoFoot();
                    return true;
                }
                pageHandler_auth.go(1);

                var pageHandler_authHistory = global.pageHandlers.get("authHistoryInfo");
                pageHandler_authHistory.urlHandler.params.put("companyNameDigest", companyNameDigest);
                pageHandler_authHistory.onLoaded = function () {
                    Pingan.autoFoot();
                    return true;
                }
                pageHandler_authHistory.total = 0;
                pageHandler_authHistory.go(1);
                return true;
            }
        };

        //我的企业-验证对公-禁用enter键
        function onkeydownEvent() {
            $('input[name="remitAmount"]').keydown(function () {
                var keyCode = event.keyCode || event.which;
                if (keyCode == 13) {
                    return false;
                }
            });
        }

        //我的企业-验证对公-点击验证金额按钮
        function ValidAccountBtn() {
            $("#validFormBtn").click(function () {
                var remitAmount = $("[name = remitAmount]").val();
                if ("" == remitAmount) {
                    Pingan.malertInfo('请填写验证金额', 'datum-tip-cls', {});
                    return;
                }
                $.ajax({
                    url: basePath + "/user/owner/" + userCfg.validAccount,
                    type: "POST",
                    data: $("#validForm").serialize(),
                    success: function (data) {
                        if (data.statusCode == 1) {
                            Pingan.malertInfo('认领成功了!', 'datum-tip-cls', {});
                            window.location.href = basePath + "/user/owner/" + userCfg.list;
                        }
                        if (data.statusCode == 6) {
                            Pingan.malertInfo('认领失败，金额不对', 'datum-tip-cls', {});
                        }
                    }

                })
            });
        }

        //认领企业-初始化
        var initHrf = function () {
            var hrf = decodeURI(window.location.href);
            if (hrf.indexOf("=") != -1) {
                var s = hrf.split("=")[1];
                var reg = s.split("&")[0];
                var pro = s.split("&")[1];
                var proCode = s.split("&")[2];
                $("#searchCompanyName").val(reg);
                $("#provinceCode").val(proCode);
            }
            $("#companyName").focus();
            $("#searchCompanyName").on("focus", function () {
                $(this).css("background-color", "");
            });

            $("#citySelect").on("click", function () {
                $("#province").css("background-color", "");
            });
        };

        //认领企业-显示/隐藏省份
        var showHidePro = function () {
            $("#citySelect").click(function () {
                if ($(".city-menu").css("display") == "block") {
                    $(".city-menu").hide();
                    $(".find-content").css("height", "");
                } else {
                    $(".find-content").css("height", "450px");
                    $(".city-menu").slideDown();
                }
            });
        };

        //认领企业-初始化省份
        var initPro = function () {
            $.get(Pingan.basePath + "/province", function (result) {
                if (result["statusCode"] == 1) {
                    var data = result["data"];
                    var html = "";
                    for (var area in data) {
                        html = html + "<li>" + area + " <span>|</span>";
                        var pros = data[area];
                        for (var pro in pros) {
                            html = html + "<a name='" + pros[pro] + "' provice='" + pro + "' href='javascript:void(0)'>" + pros[pro] + "</a>";
                        }
                        html = html + "</li>";
                    }
                    $(".city-menu .map").html(html);
                    //选择省份
                    $("[provice]").each(function () {
                        $(this).click(function () {
                            $("[name='province']").val($(this).attr("name"));
                            $(".find-content").css("height", "");
                            $("[name='provinceCode']").val($(this).attr("provice"));
                            $(".city-menu").css("display", "none");
                        });
                    });
                }
            });
        };

        //认领企业-点击马上认领按钮
        var ownerButtonClick = function () {
            $("#ownerButton").on("click", function () {
                if ($("#province").val() == "") {
                    $("#province").css("background-color", "rgb(255,192,203)");
                    return;
                }
                $.ajax({
                    type: "POST",
                    url: basePath + "/user/owner/" + userCfg.url,
                    data: {"companyName": $("#searchCompanyName").val()},
                    success: function (data) {
                        $("input[name=companyName]").val($("#searchCompanyName").val());
                        if (data.statusCode == 2) {
                            malert($("#newDiv"), $("#newDiv").find("#closeButton1"), {opacity: 0.2});
                        }
                        if (data.statusCode == 1) {
                            //企业未认领
                            if (data.data.claimStatus == 0) {
                                malert($("#popDiv"), $("#popDiv").find("#closeButton"), {opacity: 0.2});
                                $("#companyName").val(data.data.companyName);
                                $("#companyCode").val(data.data.companyCode);
                                $("#legalPerson").val(data.data.legalPerson);
                                $("#authority").val(data.data.authority);
                            }
                            if (data.data.claimStatus == 1) {
                                $("#infoMessage").text("该企业已经被认领");
                                $("#infoMessage").fadeIn("slow");
                                $("#infoMessage").fadeOut(1500);
                            }

                        }
                        if (data.statusCode == -1) {
                            $("#searchCompanyName").css("background-color", "pink");
                        }
                    }
                });
            });
        };

        //注册成功
        var registerResult = function () {
            var emailList = {
                'qq.com': 'http://mail.qq.com',
                'gmail.com': 'http://mail.google.com',
                'sina.com': 'http://mail.sina.com.cn',
                '163.com': 'http://mail.163.com',
                '126.com': 'http://mail.126.com',
                'yeah.net': 'http://www.yeah.net/',
                'sohu.com': 'http://mail.sohu.com/',
                'tom.com': 'http://mail.tom.com/',
                'sogou.com': 'http://mail.sogou.com/',
                '139.com': 'http://mail.10086.cn/',
                'hotmail.com': 'http://www.hotmail.com',
                'live.com': 'http://login.live.com/',
                'live.cn': 'http://login.live.cn/',
                'live.com.cn': 'http://login.live.com.cn',
                '189.com': 'http://webmail16.189.cn/webmail/',
                'yahoo.com.cn': 'http://mail.cn.yahoo.com/',
                'yahoo.cn': 'http://mail.cn.yahoo.com/',
                'eyou.com': 'http://www.eyou.com/',
                '21cn.com': 'http://mail.21cn.com/',
                '188.com': 'http://www.188.com/',
                'foxmail.coom': 'http://www.foxmail.com',
                "pingansec.com":'http://mail.sina.net/login'
            };
            var email = window.location.href.split("email=")[1];
            if (email != "") {
                var url = emailList[email.split("@")[1]];
                if(url)
                {
                    $("#mailLink").attr("href",url);
                }else{
                    $("#mailLink").text("请自行登录邮箱查收激活邮件");
                }
            }
            var send = function () {
                $.post(basePath + "/user/" + userCfg.sendEmail, {'account': email, 'type': 1}, function (data) {
                    if (data == true) {
                        $("#infoMessage").text("发送成功!");
                        $("#infoMessage").fadeIn("slow");
                        $("#infoMessage").fadeOut(2800);
                        $("#resend").unbind();
                        $("#resend").hide();
                        $("#resend").parent().append("<a href='http://wpa.qq.com/msgrd?v=3&uin=3252136845&site=qq&menu=yes' target='_blank'>若还未收到邮件,请联系管理员!</a>");
                    } else {
                        $("#infoMessage").text("该用户不存在!");
                        $("#infoMessage").fadeIn("slow");
                        $("#infoMessage").fadeOut(2800);
                        $("#resend").unbind();
                    }
                });
            };
            $("#resend").bind("click", send);
        };


        //认领企业-初始化
        var initAddCompany = function () {
        	 var errorMsg = new Pingan.Popover($('#errorMsg'), $('#errorMsg'));
             var ownerForm = new Pingan.MForm($("#ownerForm"), errorMsg);
             ownerForm.isAjax=true;
             ownerForm.beforeSubmit = function () {
                var attachOrgfile = $("[name='attachOrgfile']").val();
                var attachEnterpriseCard = $("[name='attachEnterpriseCard']").val();
                if (!attachOrgfile) {
                    errorMsg.show('请上传您的营业执照!');
                    return false;
                }
                if (!attachEnterpriseCard) {
                    errorMsg.show('请上传您的企业名片!');
                    return false;
                }
                return true;
            };
            
            $("#userRealname").blur(function(){
	            if(!$("#userRealname").val().isText()){
	            	$("#errorMsg").html("请输入真实姓名");
	        		$("#errorMsg").show();
	        		return;
	        	}
            });
            
            var countdown;
            var isRun = true;
            var doChange = function () {
                countdown--;
                if (countdown > 0) {
                    isRun = false;
                    $('#sendPhoneCode').css("background-color", "#c0c0c0");
                    $('#sendPhoneCode').hover(function () {
                        $(this).css("background-color", "#c0c0c0");
                    });
                    $('#sendPhoneCode').css("cursor", "default");
                    $('#sendPhoneCode').val(countdown + '秒后可重新操作');
                    timer = setTimeout(doChange, 1000);//调用自身实现
                } else {
                    isRun = true;
                    $('#sendPhoneCode').css("background-color", "#00bb9c");
                    $('#sendPhoneCode').hover(function () {
                        $(this).css("background-color", "#00c1a1");
                    }, function () {
                        $(this).css("background-color", "#00bb9c");
                    });
                    $('#sendPhoneCode').css("cursor", "pointer");
                    $('#sendPhoneCode').val('获取验证码');
                    clearTimeout(timer);
                }
            };
            
            $("#sendPhoneCode").click(function () {
                if (isRun) {
                    var num = $(this).attr("num");
                    var phoneNum = $('#phone').val();
                    if (!ownerForm.getItem('phone').validate()) {
                        errorMsg.show('手机号格式不正确!');
                    } else {
                        $.post(basePath + "/user/createPhoneCode", {
                            'phone': phoneNum,
                            'isNotReceive': num
                        }, function (data) {
                            if (data.statusCode == 1) {
                                num++;
                                $("#sendPhoneCode").attr("num", num);
                                $("#smsS").val(data['data']['smsed']);
                                countdown = 60;
                                timer = setTimeout(doChange, 50);
                                return false;
                            }else{
                                errorMsg.show(data.statusMessage);
                            }
                        });
                    }
                }
            });
            
            ownerForm.afterSubmit=function (result) {
            	if(result.statusCode == 1){
            		window.location.href = basePath + "/user/owner/add_success";
            		return;
            	}
            	
            	if(result.statusCode == 99999){
            		 Pingan.malertInfo(result.statusMessage, 'datum-tip-cls', {});
            		 setTimeout("location.reload()",2000);
            		  return;
            	}
            	
            	if(result.statusCode == 2){
            		 Pingan.malertInfo('您输入的企业不存在', 'datum-tip-cls', {});
            		 return;
            	}
            	
            }
            $.ajax({
                url: basePath+"/province/4003/city",
                type: "GET",
                success:function (result) {
                    if(result.statusCode==1){
                        var data = result.data;
                        var optionHtml = "<option value=''>选择市</option>";
                        for(var i=0;i<data.length;i++) {
                            optionHtml+="<option value='"+data[i].id+"'>"+data[i].name+"</option>"
                        }
                        $("#citySelect").find("option").remove();
                        $("#citySelect").append(optionHtml);
                    }
                }
            });

            $("#citySelect").change(function () {
                var key = $(this).val();
                if(!key){
                    return;
                }
                var txt=$(this).find("option:selected").text();
                $("#city").val(txt);
                $.ajax({
                    url: basePath+"/province/"+key+"/city",
                    type: "GET",
                    success:function (result) {
                        if(result.statusCode==1){
                            var data = result.data;
                            var optionHtml = "<option value=''>选择区</option>";
                            for(var i=0;i<data.length;i++) {
                                optionHtml+="<option value='"+data[i].id+"'>"+data[i].name+"</option>"
                            }
                            $("#districtSelect").find("option").remove();
                            $("#districtSelect").append(optionHtml);
                        }
                    }
                });
            });
            $("#districtSelect").change(function () {
                var key = $(this).val();
                if(!key){
                    return;
                }
                var txt=$(this).find("option:selected").text();
              $("#district").val(txt);
            });
        };
        //认领企业返回按钮跳回我的企业页面
        $("#backToMyCompany").unbind('click').click(function () {
            window.location.href = basePath + '/user/owner/list';
        });
        
        //认领成功页面
        //设置3秒后自动跳转页面
        var countTime = 3;
        var timeJump = function(){
        	var doChange =  function(){
	        	  countTime--;   
	   	  		  if(countTime > 0) { 
	   	  			$("#owner_time").html(countTime);
	   	  			setTimeout(doChange,1000);
	   	  		  } else {
	   	  			  location.href= basePath;    
	   	  		  }
        	}
        	setTimeout(doChange,1000);
        }
        
        //返回按钮
        var backIndex = function(){
        	$("#back_index").click(function(){
        		location.href= basePath; 
        	});
        }
        
       var upload_single_file=function(file_picker,attach_file_div,attach_img_id,server_url){
           uploaders = WebUploader.create({
               auto: true,
               resize: false,
               swf: basePath + '/js/lib/webUpload/Uploader.swf',
               server: server_url,
               pick: file_picker,
               fileSingleSizeLimit: 1024 * 512 * 4,
               accept: {
                   title: 'Images',
                   extensions: 'jpg,jpeg,png',
                   mimeTypes: 'image/jpg,image/jpeg,image/png'
               },
               duplicate:true	
           });
           try {
        	   var options = {
        			   afterQueued:function(){
        				   $("#"+attach_file_div).find("img").attr('style','padding-top: 40px;');
          	           },
        			   afterSuccess:function(file, url){
        				   if(url){
   							   $(attach_img_id).val(url);
   						  } 
        				   
        				  $("#"+attach_file_div+"  .success").unbind().bind("click",function(){
       						$(file_picker).find("input[type=file]").trigger("click");
       				     });
        		    }
        	   }
               autoUpload(uploaders, attach_file_div,100,100,options);
           } catch (e) {
               Pingan.malertInfo('服务器异常，上传失败!', 'datum-tip-cls', {});
           }
       };

        //点击当前公司
        var currentCompanyClick = function () {
            $("#currentCompany").on("click", function () {
                if ($(this).parent().find("ul").is(":visible") == false) {
                    $(this).parent().find("ul").show();
                } else {
                    $(this).parent().find("ul").hide();
                }
            });

            $("#currentCompany").parent().find("li").on("click", function () {
                $("#currentCompany").val($(this).html());
                $(this).parent().hide();
            });
        };

        //找回密码
        var initFindPwd = function (cfg) {
 /*           var formHandler = {};
            formHandler.passed = true;

            var validHandler = {};
            validHandler.msgs = new Array();
            validHandler.errorMsg = $("#errorMsg");
            validHandler.show = function (msg) {
                var cont = validHandler.errorMsg;
                cont.fadeIn();
                cont.find("label").html(msg);
                formHandler.passed = false;
            }
            validHandler.hide = function () {
                var cont = validHandler.errorMsg;
                cont.fadeOut();
                cont.find("label").html("");
            }
            var name;
            $("#username").change(function () {
                name = $.trim($(this).val());
                if (name == "") {
                    return false;
                }
                if (name.isMobile()) {
                    $("#mValidate").show();
                    validHandler.hide();
                } else if (name.isEmail()) {
                } else if (name.isEmail()) {
                    $("#mValidate").hide();
                    validHandler.hide();
                } else {
                    validHandler.show("请输入正确的手机号或邮箱地址！");
                }
            });

            formHandler.sendingPhoneCode = false;
            var cou = 60;
            var wait = function () {
                $("#sendCode").html("获取短信验证码({0})".format(cou));
                setTimeout(function () {
                    cou--;
                    if (cou > -1) {
                        wait();
                    } else {
                        formHandler.sendingPhoneCode = false;
                        $("#sendCode").html("获取短信验证码");
                        cou = 60;
                    }
                }, 1000);
            }*/

            $("#identifyingCode").click(function () {
                $(this).attr("src", basePath + "/kaptcha/code?" + Math.random());
            });

/*            $("#sendCode").click(function () {
                name = $.trim($("#username").val());
                if (!formHandler.sendingPhoneCode) {
                    if (!name.isMobile()) {
                        validHandler.show("手机号格式错误！");
                        return false;
                    }
                    formHandler.sendingPhoneCode = true;
                    $.post(basePath + "/user/" + userCfg.createPhoneCode, 'isNotReceive=1&phone=' + name, function (result) {
                        if (result.statusCode == 1) {
                            wait();
                        } else {
                            validHandler.show(result.statusMessage);
                        }
                    });
                }
            });*/

            var errorMsg = new Pingan.Popover($('#errorMsg'), $('#errorMsg'));
            var toFindPwdform = new Pingan.MForm($("#toFindPwdform"),errorMsg);
            toFindPwdform.isAjax = true;
            toFindPwdform.afterSubmit = function (result) {
                var name = $.trim($("#username").val());
                if (result.statusCode == 1) {
                    if (name.isMobile()) {
                        window.location.href = basePath + "/user/password.jsp?username=" + name;
                    } else {
                        $("#step2").find(".findInfo-register-yx").html(name);
                        var p = $("#step2").find("p").html();
                        $("#step2").find("p").html(p.format(result.statusMessage, name.split("@")[1]));
                        $("#step1").hide();
                        $("#step2").show();
                    }
                } else {
                    errorMsg.show(result.statusMessage);
                    return false;
                }
            };

            $("#toFindPwd").click(function () {
                $("#toFindPwdform").submit();
            });
        };

        //用户中心-点击公司认领按钮
        var openCompanyOwnerClick = (function () {
            $("#openCompanyOwner").on("click", function () {
                $.post(basePath + "/user/" + userCfg.updateUserType, null, function (data) {
                    $("#infoMessage").text(data.statusMessage);
                    $("#infoMessage").fadeIn("slow");
                    $("#infoMessage").fadeOut(3000);
                    setTimeout("location.reload()", 2500);
                });
            });
        })();

        //我的纠错
        var popButtonOver = function () {
            //溢出显示省略号，并添加title属性
            Pingan.textOverHide();
            $(".popButton").on("mouseover", function () {
                $("#correctionDetail").find("label").eq(0).text($(this).parent().parent().find("a").eq(0).text());
                $("#correctionDetail").find("label").eq(1).text($(this).parent().parent().find("td").eq(1).text());
                $("#correctionDetail").find("label").eq(2).text($(this).attr("contact"));
                $("#correctionDetail").find("label").eq(3).text($(this).attr("correctionContent"));
            });
        };

        //我的纠错
        var myCorrectionPopupLayer = function () {
            var t8 = new PopupLayer({
                trigger: ".popButton", popupBlk: "#popDiv", closeBtn: "#closeButton", useOverlay: true, useFx: true,
                offsets: {
                    x: 0,
                    y: -41
                }
            });

            t8.doEffects = function (way) {
                if (way == "open") {
                    this.popupLayer.css({opacity: 0.3}).show(400, function () {
                        this.popupLayer.animate({
                            left: ($(document).width() - this.popupLayer.width()) / 1.8,
                            top: (document.documentElement.clientHeight - this.popupLayer.height()) / 2 + $(document).scrollTop() - 120,
                            opacity: 0.8
                        }, 1000, function () {
                            this.popupLayer.css("opacity", 1)
                        }.binding(this));
                    }.binding(this));
                }
                else {
                    this.popupLayer.animate({
                        left: this.trigger.offset().left,
                        top: this.trigger.offset().top,
                        opacity: 0.1
                    }, {
                        duration: 500, complete: function () {
                            this.popupLayer.css("opacity", 1);
                            this.popupLayer.hide()
                        }.binding(this)
                    });
                }
            };
        };

        //我的纠错
        var ownerButtonClick = function () {
            $("#ownerButton").on("click", function () {
                $.ajax({
                    type: "POST",
                    url: basePath + "/user/owner/" + userCfg.url,
                    data: {"companyName": $("#companyName").val()},
                    success: function (data) {
                        if (data.statusCode == -2) {
                            $("#searchMsg").append("未查询到相关记录!<a href='javascript:void(0)' onclick='showInput(this)'>去手动录入企业信息</a>");
                        }
                        if (data.statusCode == 1) {
                            $("#companyInfo").empty();
                            $("#companyInfo").append(data.data.companyName + "<input type='button' value='确认' onclick='inputOwnerInfo(this)'>");
                        }
                        if (data.statusCode == -1) {
                            Pingan.malertInfo(data.statusMessage, 'datum-tip-cls', {});
                        }
                    }
                });
            });
        };

        //我的纠错
        var dataShow = function () {
            $("[data-show]").click(function () {
                $(".drop-name").hide();
                var objId = $(this).attr("id") + "Div";
                $(".error-title1").find("a").removeAttr("class");
                $(this).attr("class", "current");
                $("#" + objId).show();
            });
        };

        //我的关注
        var searchFavorites = function(){
        	var favoritesTable = new Pingan.PageHandler($("#favorites_list"), $("#favoritesTable").siblings(".new-page"));
        	favoritesTable.formateItem = function (index, model, row){
        		
        		var item = $(model.format(row["favoritesId"],row["companyName"],row["legalPerson"],row["capital"],new Date(parseInt(row["establishDate"])).format("yyyy-MM-dd"),row["companyNo"]));
                item.find("[companyNo]").click(function () {
                    window.location.href = basePath + "/company/professionalInfo?s=" + $(this).attr("companyNo");
                });
        		return item;
        	}
        }
        
        //更新密码
        var findPwdFormHandle = function () {

       /*     var formHandler = {};
            formHandler.passedPassword = true;
            formHandler.passedPasswordPuls = true;

            var validHandler = {};
            validHandler.msgs = new Array();
            validHandler.errorMsg = $("#errorMsg");
            validHandler.show = function (msg) {
                var cont = validHandler.errorMsg;
                cont.fadeIn();
                cont.find("label").html(msg);
            }

            validHandler.hide = function () {
                var cont = validHandler.errorMsg;
                cont.fadeOut();
                cont.find("label").html("");
                if (!formHandler.passedPassword) {
                    validHandler.show("两次密码不一致！");
                }
                if (!formHandler.passedPasswordPuls) {
                    validHandler.show("密码必须为6-20位的数字和字母的组合！");
                }
            }

            var pass = $.trim($("#password").val());
            var pass2 = $.trim($("#password2").val());

            $("#password2").change(function () {
                formHandler.passedPassword = true;
                validHandler.hide();

                pass = $.trim($("#password").val());
                pass2 = $.trim($(this).val());
                if (pass != pass2) {
                    validHandler.show("两次密码不一致！");
                    formHandler.passedPassword = false;
                }
            });*/

            var errorMsg = new Pingan.Popover($('#errorMsg'),$('#errorMsg'));
            
            var findPwdForm = new Pingan.MForm($("#findPwdForm"),errorMsg);
                findPwdForm.isAjax = true;
            findPwdForm.afterSubmit = function (result) {
                if (result.statusCode == 0) {
                    window.location.href = basePath + "/user/toLogin";
                    console.log(result.statusMessage);
                }
                if (result.statusCode == 1) {
                    $("#mainDiv").hide();
                    $("#infoDiv").find("span").html(result.data);
                    $("#infoDiv").show();
                }
                if (result.statusCode == -2) {
                    errorMsg.show(result.statusMessage);
                }
            };

        /*    $("#password").change(function () {
                var char = /^(?!\d+$)(?!^[a-zA-Z]+$)[\w]{6,20}$/;
                formHandler.passedPasswordPuls = true;
                validHandler.hide();

                if (!(char.test($(this).val()))) {
                    validHandler.show("密码必须为6-20位的数字和字母的组合");
                    formHandler.passedPasswordPuls = false;
                }
            });*/
        };

      /*  function passwordModify() {
            var errMsg = $("#errorMsg").val();
            console.log(errMsg);


            $("#toSubmit").unbind('click').click(function () {
                var pass = $.trim($("#password").val());
                var pass2 = $.trim($("#password2").val());
                if (errMsg == "" && pass == pass2) {
                    $("#findPwdForm").submit();
                }
            });
            /!*if(errMsg=="" && $("#password2").val()!==""){
             $("#toSubmit").click(function () {
             $("#findPwdForm").submit();
             });
             }*!/
        }*/


        //用户注册-接受协议
        /*	var licenseClick = function (){
         $("#license").click(function (){
         if($(this).is(":checked")){
         $("#submitBT").attr("disabled", false);
         $("#submitBT").css("background", "#00bb9c");
         }else{
         $("#submitBT").attr("disabled", true);
         $("#submitBT").css("background", "#00bb9c");
         }
         });
         };*/

        //用户注册-激活注册
        var sendEmail = function () {
            var account = userCfg.account;
            if (account != "") {
                var url = account.split("@")[1];
            }
            $.post(Pingan.basePath + "/user/" + userCfg.sendEmail, {'account': account, 'type': 1}, function (data) {
                if (data == true) {
                    Pingan.malertInfo('邮件发送成功', 'datum-tip-cls', {fadeIn:300,fadeOut:300,showTime:1000});
                    $("#sendInfo").html("邮件发送成功,<a href='http://mail." + url + "'>点击登录邮箱</a>");
                }
            });
        };
        //用户评论-删除评论
        var delComment = function () {
            $(".new-com-delete").find("a").click(function () {
                id = $(this).attr("code");
                Pingan.mconfirm("是否确认删除!", function () {
                    $.post(basePath + "/user/comment/" + userCfg.encodeDel, {"id": id}, function (data) {
                        $("#infoMessage").text(data.statusMessage);
                        $("#infoMessage").fadeIn("slow");
                        $("#infoMessage").fadeOut(2500);
                        setTimeout("location.reload()", 1500);
                    });

                }, function () {
                    return
                }, {});
            });
        };


        var init = function () {
            if (userCfg.page == 'myAccount') {
                showPhoneMail();
                changePwd();
                showInfo();
                showChangePWD();
                initBindingPop();
            }
            if (userCfg.page == 'myClaim') {
                initClaimAutocomplete();
            }
            if (userCfg.page == 'myCompany') {
                initCompanyOperate();
                delOwner();
                initCompanyAutoComplete();
                myCompanyUpload();
                initCreditLevel();
                updateCompany();
                logoUpload();
                datumFormSubmit();
                detailCompany();
            }
            if (userCfg.page == 'myDatum') {
                myDatumCompanySelect();
                myDatumRecordShow();
            }
            if (userCfg.page == 'addDatum') {
                uploaderCert();
                datumSubTypeSelect();
                datumFormButton();
            }
            if (userCfg.page == 'myAuthorization') {
                initCompanySelect();
                companyLiClick();
                initClaimAutocomplete();
            }
            if (userCfg.page == 'validAccount') {
                onkeydownEvent();
                ValidAccountBtn();
            }
            if (userCfg.page == 'userOwner') {
                initHrf();
                showHidePro();
                initPro();
                ownerButtonClick();
            }
            if (userCfg.page == 'registerResult') {
                registerResult();
            }
            if (userCfg.page == "addCompany") {
                initAddCompany();
                //认领企业-上传营业执照
                upload_single_file('#filePicker3','attachOrgfileDiv','#attachOrgfile',basePath + "/user/datum/" + userCfg.upload + "&isFullPath=false");
                //认领企业-上传企业名片
                upload_single_file('#filePicker4','attachEnterpriseCardDiv','#attachEnterpriseCard',basePath + "/user/datum/" + userCfg.upload + "&isFullPath=false");
                initAddCompanyAutoComplete();
            }
            if (userCfg.page == "ownerSuccess") {
            	timeJump();
            	backIndex();
            }
            if (userCfg.page == "consensus") {
                currentCompanyClick();
            }
            if (userCfg.page == "findPwd") {
                initFindPwd();
            }
            if (userCfg.page == "index") {
                openCompanyOwnerClick();
            }
            if (userCfg.page == "myCorrection") {
                popButtonOver();
                myCorrectionPopupLayer();
                ownerButtonClick();
                dataShow();
            }
            if (userCfg.page == "myFavorites") {
                searchFavorites();
               // cancelClick();
            }
            if (userCfg.page == "passWord") {
                // validPassword();
                findPwdFormHandle();
                // passwordModify();
            }
            if (userCfg.page == 'register') {
                // licenseClick();
                // registerSubmit1();

                // registerform();                
            }
            if (userCfg.page == 'reActive') {
                $("#resend").bind("click", sendEmail);
            }
            if (userCfg.page == 'myComment') {
                delComment();
                initCompanyAutoComplete();
            }

        }
        return {
            init: init
        };
    })();


    (function () {
        Pingan.Base.init();
        Pingan.Load.init();
        Pingan.Event.init();
    })();

});


/*active_success.js*/
function turn() {
    if (cnt < 0) {
        window.location.href = basePath + "/index.jsp";
    } else {
        var str = "页面<font color=red>" + cnt + "</font>秒后跳转,<a style='color:#3a8ac3' href='" + basePath + "/index.jsp'>点击立即跳转</a>";
        cnt--;
        $("#showTime").html(str)
    }
    setTimeout("turn()", 1000);
}


/*addCompany.js*/
function reUpload(obj) {
    var inputName = obj.substring(0, obj.length - 3);
    $("#" + inputName).val("");			//将对应的字段置为空
    $("#" + obj).html("");
    $("#" + obj).parent().find("[class=webuploader-pick]").show();
    //使选择图片的功能恢复
    $("#filePicker2").find("label").show();
}


/*addDatum.js*/
function reUpload(obj) {
    var reUploadDiv = obj.id;
    // var re=reUploadDiv.split("#")[1];
    // $("input[name=" + reUploadDiv.subString(0,-3) + "]").val("");
    // $("[name=attachOrgfile]").val("");
    // $("#attachOrgfileDiv").html("");
    // $("[class=webuploader-pick]").show();
    $('#' + reUploadDiv + ' div').remove();
    $("#" + reUploadDiv).prev().find("div:first-child").show();
    var lenstr = reUploadDiv.length - 3;
    $("input[name=" + reUploadDiv.substring(0, lenstr) + "]").val("");
}

//myFavoites--我的关注（取消关注）
function cancelClick(id){
    Pingan.malert($("#myfav_model_show"), $("#myfav_model_close"), {opacity: 0.2});
    $("#myfav_model_show").css("top","400px");
    $("#myfav_define").click(function(){
    	 $.post(basePath + "/user/favorites/" + userCfg.remove, {"favoriteId": id}, function (data) {
             $("#infoMessage").text(data.statusMessage);
             $("#infoMessage").fadeIn("slow");
             $("#infoMessage").fadeOut(2500);
             setTimeout("location.reload()", 500);
         });
    });
    
   $("#myfav_cancel").click(function(){
    	var time=300;
    	var mask=$("#malert_mask");
    	mask.fadeOut(time).remove();
    	$("#myfav_model_show").hide();
    });

}
