require.config({
    waitSeconds: 0,
    baseUrl: basePath,
    paths: {
        Pingan: 'js/common/common',
        bootstrap: 'js/lib/new/bootstrap.min',
        slide: 'js/lib/new/slider',
        lightbox: "js/lib/new/lightbox-2.6.min",
        // jquerym: 'js/lib/new/jquerym',
        top: 'js/uzj/new_top',
        flowOneUploader: 'js/lib/WebUploaderImg/uploadImg',
        autocomplete: 'js/lib/jquery-ui-autocomplete.min'
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
        bootstrap: {
            deps: ['Pingan']
        },
        flowOneUploader: {
            deps: ['Pingan']
        },
        autocomplete: {
            deps: ['Pingan']
        }
    },
    deps: ['top', 'lightbox']
});

require(['top', 'slide', 'flowOneUploader', 'autocomplete'], function (top, slide, flowOneUploader, autocomplete) {
    WebUploader = flowOneUploader.WebUploader;

    Pingan.Base = (function () {

        var initGlobalVar = function () {
            SysSecond, InterValObj;
        };

        var getRemainTime = function () {
            InterValObj = window.setInterval(function () {
                //设定活动截止日期
                Pingan.Load.setRemainTime(2017, 1, 1, 0, 0, 0);
            }, 1000); //间隔函数，1秒执行
        };

        var imageScroll = function () {
            $('#letterA').slider({speed: 500});
        };
        
        
        var init = function () {
            getRemainTime();
            imageScroll();
           
        };

        return {
            init: init
        }
    })();

    Pingan.Load = (function () {

        //将时间减去1秒，计算天、时、分、秒    
        var setRemainTime = function (year, month, day, hour, min, sec) {
            var now = new Date();
            
            var endDate = new Date(year, month - 1, day, hour, min, sec);
            var leftTime = endDate.getTime() - now.getTime();
            var leftSecond = parseInt(leftTime / 1000);
            if (leftTime <= 0) {
                window.clearInterval(InterValObj);
                $('[attr-role="day"]').html(0);
                $('[attr-role="hour"]').html(0);
                $('[attr-role="minite"]').html(0);
                $('[attr-role="second"]').html(0);
            } else {
                var leftDay = Math.floor(leftSecond / (60 * 60 * 24));
                var leftHour = Math.floor((leftSecond - leftDay * 24 * 60 * 60) / 3600);
                var leftMinute = Math.floor((leftSecond - leftDay * 24 * 60 * 60 - leftHour * 3600) / 60);
                var second = Math.floor(leftSecond - leftDay * 24 * 60 * 60 - leftHour * 3600 - leftMinute * 60);
                $('[attr-role="day"]').html(leftDay);
                $('[attr-role="hour"]').html(leftHour);
                $('[attr-role="minite"]').html(leftMinute);
                $('[attr-role="second"]').html(second);
            }
        };

        var postComment = function () {
            $("#postComment").click(function () {
                Pingan.malert($("#openPost"), $("#closePay"), {
                    opacity: 0.2, onclose: function () {
                    }
                });
            });
        };
        
        var init = function () {
            postComment();
        };

        return {
            init: init,
            setRemainTime: setRemainTime
        }

    })();

    Pingan.Event = (function () {
        
        var beforeApply = function () {
            $("#button_y, #button_y1").click(function () {
                $.post(basePath + "/asso/companyindlight/apply/check", {}, function (data) {
                    if (data.statusCode == 5) {
                        Pingan.malertInfo('先登录', 'infoMessage warning', {});
                        window.location.href = basePath + "/user/toLogin";
                        return false;
                    }
                    if (data.statusCode == 3) {
                        Pingan.malertInfo('此用户不是协会', 'infoMessage warning', {});
                        return false;
                    }
                    if (data.statusCode == 30001) {
                        Pingan.malertInfo('活动已结束', 'infoMessage warning', {});
                        return false;
                    }
                    if (data.statusCode == 1) {
                        var activityNo = data['data'];

                        if (!activityNo) {
                            window.location.href = basePath + "/asso/companyindlight/apply";
                        } else {
                            Pingan.mconfirm("继续之前的操作吗?", function () {
                                window.location.href = basePath + "/asso/companyindlight/apply?delete=not_delete&activityNo=" + activityNo;
                            }, function () {
                                window.location.href = basePath + "/asso/companyindlight/apply?activityNo=" + activityNo;
                            }, {});
                        }
                        return false;
                    }
                });
            });
        };
        var sendPhoneCode = function () {
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
                    $('#sendCode strong').html(countdown + '秒后可重新操作');
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
                    $('#sendCode strong').html('发送手机验证码');
                    clearTimeout(timer);
                }
            };

            $("#sendCode").click(function () {
                if (isRun) {
                    var num = $(this).attr("num");
                    var phone = $("#userPhone").val();
                    var reg = /^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8]))\d{8}$/;
                    if (!reg.test(phone)) {
                        $("#userPhoneError").html("<font color='red'>x</font> 手机号格式不正确");
                        $("#userPhoneError").show();
                    } else {
                        $("#userPhoneError").html("");
                        $.post(basePath + "/user/createPhoneCode", {
                            'phone': phone,
                            'isNotReceive': num
                        }, function (data) {
                            if (data.statusCode == 1) {
                                num++;
                                $("#sendCode").attr("num", num);
                                $("#smsS").val(data['data']['smsed']);
                                countdown = 60;
                                timer = setTimeout(doChange, 50);
                                return false;
                            }
                        });
                    }
                }
            });
        };

        //公司名称搜索
        var companyNameAutoComplete = function () {
            $("#companyName").autocomplete({
                source: function (request, response) {
                    $.getJSON(basePath + "/autocomplete/lists", {"key": $("#companyName").val(), "npage": 0}, response);
                },
                minLength: 2
            });
            $("#companyName").data("ui-autocomplete")._renderItemData = function (ul, item) {
                console.log(item);
                var companyName = item.companyName.replace(/<em>/g, '').replace(/<\/em>/g, '').replace(/null/g, '');
                item["value"] = companyName;
                return jQuery("<li></li>").data("item.autocomplete", item).data(
                    "ui-autocomplete-item", item).append("<li>"
                    + "<span>" + item.value + "</span></li>").appendTo(ul);
            };
            $("#companyName").blur(function () {
                var companyName = $("#companyName").val();
                companyName = companyName.replace(/^\s+|\s+$/g, "");
                $("#companyName").val(companyName);
                if (companyName == "") {
                    $("#companyNameError").show();
                } else {
                    $("#companyNameError").hide();
                }
            });
        }

        var imgUpload = function () {
        	var options1 = {
    			server: basePath + '/asso/indlight/datum/upload?isFullPath=false',
    			label: '<img src="' + basePath + '/images/new-images/upload_id_y2.png" style="float:left; margin:8px -8px 0 0; width:60px; height:65px;"/>',
    			imgList: '#imgList1',
    			filePacker: '#open1',
    			width: 85,
    			height: 85,
    			resUrl: '#imgLink1'
        	};
        	var options2 = {
    			server: basePath + '/asso/indlight/datum/upload?isFullPath=false',
    			label: '<img src="' + basePath + '/images/new-images/upload_id_y2.png" style="float:left; margin:8px -8px 0 0; width:60px; height:65px;"/>',
    			imgList: '#imgList2',
    			filePacker: '#open2',
    			width: 85,
    			height: 85,
    			resUrl: '#imgLink2'
        	};
        	var options3 = {
    			server: basePath + '/asso/indlight/datum/upload?isFullPath=false',
    			label: '<img src="' + basePath + '/images/new-images/upload_id_y2.png" style="float:left; margin:8px -8px 0 0; width:60px; height:65px;"/>',
    			imgList: '#imgList3',
    			filePacker: '#open3',
    			width: 85,
    			height: 85,
    			resUrl: '#imgLink3'
        	};
        	var options4 = {
    			server: basePath + '/asso/indlight/datum/upload?isFullPath=false',
    			label: '<img src="' + basePath + '/images/new-images/upload_id_y2.png" style="float:left; margin:8px -8px 0 0; width:60px; height:65px;"/>',
    			imgList: '#imgList4',
    			filePacker: '#open4',
    			width: 85,
    			height: 85,
    			resUrl: '#imgLink4'
        	}
            try {
                autoUpload(options1);
                autoUpload(options2);
                autoUpload(options3);
                autoUpload(options4);
            } catch (e) {
                Pingan.malertInfo('服务器异常!', 'infoMessage warning', {});
            }
        };

        var selectOption = function () {
            $("#provinceCode").change(function () {
                var provinceCode = $(this).find("option:selected").attr("key");
                $.get(basePath + "/province/"+provinceCode+"/city", function (data) {
                    var html = "<option key='-1'>请选择</option>";
                    if (data.statusCode == 1) {
                        var cityList = data['data'];
                        for (var i = 0; i < cityList.length; i++) {
                            html += "<option key='" + cityList[i]['id'] + "'>" + cityList[i]['areaName'] + "</option>";
                        }
                        $("#cityCode").html(html);
                    } else {
                        $("#cityCode").html(html);
                        Pingan.malertInfo('服务器异常!', 'infoMessage warning', {});
                    }
                });
            });
        };

        var validateField = function (userRealName, userPhone, phoneCode, smsS, userEmail,
                                      userBusinessCard, companyName, industryCode, provinceCode, cityCode, companyContacts,
                                      businessLicense, bankLicense, industryLicense) {
            var passValid = true;
            var regPhone = /^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8]))\d{8}$/;
            var regEmail = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            if (null == userRealName || typeof(userRealName) == "undefined" || "" == userRealName.trim()) {
                $("#userRealNameError").show();
                passValid = false;
            } else {
                $("#userRealNameError").hide();
            }
            if (null == userPhone || typeof(userPhone) == "undefined" || "" == userPhone.trim()) {
                $("#userPhoneError").show();
                passValid = false;
            } else if (!regPhone.test(userPhone)) {
                $("#userPhoneError").html("<font color='red'>x</font> 手机号格式不正确");
                passValid = false;
            } else {
                $("#userPhoneError").hide();
            }
            if (null == phoneCode || typeof(phoneCode) == "undefined" || "" == phoneCode.trim()) {
            	$("#phoneCodeError font[tip]").html(" 请填写短信验证码在进行下一步操作");
                $("#phoneCodeError").show();
                passValid = false;
            } else if (null == smsS || typeof(smsS) == "undefined" || "" == smsS.trim()) {
            	$("#phoneCodeError font[tip]").html(" 请先获取验证码在进行下一步操作");
                $("#phoneCodeError").show();
                passValid = false;
            } else {
                $("#phoneCodeError").hide();
            }
            if (null == userEmail || typeof(userEmail) == "undefined" || "" == userEmail.trim()) {
                $("#userEmailError").show();
                passValid = false;
            } else if (!regEmail.test(userEmail)) {
                $("#userEmailError").html("<font color='red'>x</font> 邮箱格式不正确");
                passValid = false;
            } else {
                $("#userEmailError").hide();
            }
            if (null == userBusinessCard || typeof(userBusinessCard) == "undefined" || "" == userBusinessCard.trim()) {
                $("#imgError1").show();
                passValid = false;
            } else {
                $("#imgError1").hide();
            }
            if (null == companyName || typeof(companyName) == "undefined" || "" == companyName.trim()) {
                $("#companyNameError").show();
                passValid = false;
            } else {
                $("#companyNameError").hide();
            }
            if (null == industryCode || typeof(industryCode) == "undefined" || "-1" == industryCode) {
                $("#industryNameError").show();
                passValid = false;
            } else {
                $("#industryNameError").hide();
            }
            if (null == provinceCode || typeof(provinceCode) == "undefined" || "-1" == provinceCode) {
                $("#adressError").show();
                passValid = false;
            } else {
                $("#adressError").hide();
            }
            if (null == cityCode || typeof(cityCode) == "undefined" || "-1" == cityCode) {
                $("#adressError").show();
                passValid = false;
            } else {
                $("#adressError").hide();
            }
            if (null == companyContacts || typeof(companyContacts) == "undefined" || "" == companyContacts.trim()) {
                $("#companyContactsError").show();
                passValid = false;
            } else {
                $("#companyContactsError").hide();
            }
            if (null == businessLicense || typeof(businessLicense) == "undefined" || "" == businessLicense.trim()) {
                $("#imgError2").show();
                passValid = false;
            } else {
                $("#imgError2").hide();
            }
            if (null == bankLicense || typeof(bankLicense) == "undefined" || "" == bankLicense.trim()) {
                $("#imgError2").show();
                passValid = false;
            } else {
                $("#imgError2").hide();
            }
            if (null == industryLicense || typeof(industryLicense) == "undefined" || "" == industryLicense.trim()) {
                $("#imgError2").show();
                passValid = false;
            } else {
                $("#imgError2").hide();
            }
            return passValid;
        };

        var saveFlowOne = function () {
            $("#f_btn_submit1").click(function () {
                var userRealName = $("#userRealName").val().trim();
                var userPhone = $("#userPhone").val().trim();
                var phoneCode = $("#phoneCode").val().trim();
                var smsS = $("#smsS").val().trim();
                var userEmail = $("#userEmail").val().trim();
                var userBusinessCard = $("#imgLink1").val().trim();
                var companyName = $("#companyName").val().trim();
                var industryCode = $("#industryName").find("option:selected").attr("key").trim();
                var provinceCode = $("#provinceCode").find("option:selected").attr("key").trim();
                var cityCode = $("#cityCode").find("option:selected").attr("key").trim();
                var companyContacts = $("#companyContacts").val().trim();
                var companySite = $("#companySite").val().trim();
                var businessLicense = $("#imgLink2").val().trim();
                var bankLicense = $("#imgLink3").val().trim();
                var industryLicense = $("#imgLink4").val().trim();
                var passValid = validateField(userRealName, userPhone, phoneCode, smsS, userEmail,
                    userBusinessCard, companyName, industryCode, provinceCode, cityCode, companyContacts,
                    businessLicense, bankLicense, industryLicense);
                if (passValid) {
                    var industryName = $("#industryName").find("option:selected").text().trim();
                    var province = $("#provinceCode").find("option:selected").text().trim();
                    var city = $("#cityCode").find("option:selected").text().trim();
                    var config = {
                        userRealName: userRealName, userPhone: userPhone, userEmail: userEmail,
                        userBusinessCard: userBusinessCard, companyName: companyName, industryName: industryName,
                        provinceCode: provinceCode, province: province, cityCode: cityCode,
                        city: city, companyContacts: companyContacts, companySite: companySite,
                        businessLicense: businessLicense, bankLicense: bankLicense,
                        industryLicense: industryLicense, phoneCode: phoneCode, smsS: smsS
                    };
                    $.post(basePath + "/asso/companyindlight/savebaseinfo", config, function (data) {
                        if (data.statusCode == 1) {
                            window.location.href = basePath + "/asso/indlight/datum?activityNo=" + data['data'];
                        } else if (data.statusCode == 2) {
                            $("#phoneCodeError font[tip]").html(" 验证码错误");
                            $("#phoneCodeError").show();
                        } else if (data.statusCode == 4) {
                            Pingan.malertInfo('提交内容不能为空', 'infoMessage warning', {});
                        } else {
                            Pingan.malertInfo('提交失败', 'infoMessage warning', {});
                        }
                        return false;
                    });
                }
            });
        };

        var canselFlowOne = function () {
            window.onhashchange = function () {
                if (window.history && window.history.pushState) {
                    var counter = 0;
                    if (window.history && window.history.pushState) {
                        var popstat = $(window).on('popstate', function () {
                            window.history.pushState('forward', null, 'asso/companyindlight/apply');
                            window.history.forward(1);
                            var isC = Pingan.mconfirm("已编辑的页面内容会丢失, 是否确认返回?", function () {
                                window.location.href = basePath + "/companyIndLight/activity";
                            }, function () {
                            }, {});
                        });
                    }
                    window.history.pushState('forward', null, 'asso/companyindlight/apply'); //在IE中必须得有这两行
                    window.history.forward(1);
                }
            };
            onhashchange();
            $("#f_btn_return1").click(function () {
                Pingan.mconfirm("已编辑的页面内容会丢失, 是否确认返回?", function () {
                    window.location.href = basePath + "/companyIndLight/activity";
                }, function () {
                }, {});
            });
        };

        var init = function () {
            if (activityCfg.page == "activity") {
                beforeApply();
            }
            if (activityCfg.page == "flowOne") {
                sendPhoneCode();
                companyNameAutoComplete();
                imgUpload();
                selectOption();
                saveFlowOne();
                canselFlowOne();
            }
        };

        return {
            init: init
        }

    })();

    (function () {
        Pingan.Base.init();
        Pingan.Load.init();
        Pingan.Event.init();
    })();

});

