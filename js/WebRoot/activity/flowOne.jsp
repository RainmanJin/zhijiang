<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="${basePath }/" data-detailUrl="${companyDetailUrl }" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta name="renderer" content="webkit" />
	<meta name="renderer" content="webkit|ie-comp|ie-stand" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="keywords" content="" />
	<meta http-equiv="description" content="" />
	<title>首页-之江信用</title>
	<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new-css/flow.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/webuploader.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/js/lib/WebUploaderImg/uploaderImg.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/jquery-ui-autocomplete.css" rel="stylesheet" type="text/css"/>
	<script data-main="${basePath }/js/uzj/activity.js" src="${basePath }/js/lib/require.js"></script>
	<script>
		var activityCfg = activityCfg || { page : 'flowOne' };
	</script>
</head>

<body>
	<jsp:include page="/user/top.jsp" />

	<!--top_bg-->
	<div class="top_bg_y"></div>

	<!--flow-->
	<div class="n-layout">
		<div id="flow_y">
			<h3>申报流程</h3>
			<dl>
				<span>填写基础信息</span>
				<span>上传增信信息</span>
				<span>确认支付</span>
				<span>等待审核</span>
			</dl>
		</div>

		<div id="greetings_y">
			<b>小江有话说：</b>
			<p>您向之江信用提供的证件、信息等内容必须真实、准确、完整、及时、有效，如若因您提供的证件、信息等内容不满足真实、准确、完整、及时、有效条件而引致的各种损失
				或责任，均由您承担哦！</p>
		</div>

		<h2 class="flow_tetle_y">申请者个人信息</h2>
		<ul class="flow_ul_y">
			<li>
				<p>*您的真实姓名</p>
				<span><input class="input_text_y" name="userRealName" id="userRealName" type="text"/></span>
				<span style="display: none;color:#888;position:relative;top:5px;left:15px;z-index:-99;" id="userRealNameError"><font color="red">x</font> 请填写您的真实姓名在进行下一步操作</span>
			</li>
			<li>
				<p>*您的联系方式</p>
				<span><input class="input_text_y" name="userPhone" id="userPhone" type="text"/></span>
				<span style="display: none;color:#888;position:relative;top:5px;left:15px;z-index:-99;" id="userPhoneError"><font color="red">x</font> 请填写您的联系方式在进行下一步操作</span>
			</li>
			<li>
				<p>*短信验证码</p>
				<span>
					<input class="input_text_y f_w110 f_l" style="width: 100px;" name="phoneCode" id="phoneCode" type="text"/>
					<input type="hidden" name="smsS" id="smsS" value=""/>
					<button class="f_btn_y f_l" style="width: 150px;" id="sendCode" num="1">
						<strong>获取验证码</strong>
					</button>
					<span style="display: none;color:#888;position:relative;top:5px;left:15px;z-index:-99;" id="phoneCodeError"><font color="red">x</font><font tip> 请填写短信验证码在进行下一步操作</font></span>
				</span>
			</li>
			<li>
				<p>*您的工作邮箱</p>
				<span><input class="input_text_y" name="userEmail" id="userEmail" type="text"/></span>
				<span style="display: none;color:#888;position:relative;top:5px;left:15px;z-index:-99;" id="userEmailError"><font color="red">x</font> 请填写您的工作邮箱在进行下一步操作</span>
			</li>
			<li class="h75_y">
				<p>*上传名片</p>
				<span>
					<input type="hidden" name="userBusinessCard" id="imgLink1" value=""/>
					<div class="f_upload_pic_y" id="imgCollection1">
						<span class="select" id="open1"></span>
						<span class="img" id="imgList1" style="display: none;"></span>
						<span class="btn_delete_y" id="delete1" style="display: none;"></span>
					</div>
					<font class="c888">格式为JPG、JPEG、PNG，小于2MB。</font>
					<div style="display: none;color:#888;position:relative;top:5px;z-index:-99;" id="imgError1"><font color="red">x</font> 请上传名片在进行下一步操作</div></span>
				</span>
			</li>
			<div class="clear"></div>
		</ul>

		<h2 class="flow_tetle_y">企业基本信息</h2>
		<ul class="flow_ul_y">
			<li>
				<p>*企业名称</p>
				<span>
					<input class="input_text_y" name="companyName" id="companyName" type="text"/>
				</span>
				<span style="display: none;color:#888;position:relative;top:5px;left:15px;z-index:-99;" id="companyNameError"><font color="red">x</font> 请填写企业名称在进行下一步操作</span>
			</li>
			<li>
				<p>*行业分类</p>
				<span>
					<select class="select_option_y" name="industryName" id="industryName">
						<option key="-1">请选择</option>
						<option key="1">医疗器械</option>
						<option key="2">批发零售</option>
						<option key="3">煤炭流通</option>
						<option key="4">物流</option>
						<option key="5">租赁</option>
						<option key="6">典当</option>
						<option key="7">拍卖</option>
						<option key="8">住宿</option>
						<option key="9">餐馆</option>
						<option key="10">居民服务</option>
						<option key="11">食品安全</option>
						<option key="12">汽车流通</option>
						<option key="13">酒类流通</option>
						<option key="13">其他</option>
					</select>
				</span>
				<span style="display: none;color:#888;position:relative;top:5px;left:15px;z-index:-99;" id="industryNameError"><font color="red">x</font> 请选择行业分类在进行下一步操作</span>
			</li>
			<li>
				<p>*企业所在地</p>
				<span>
					<select class="select_option_y" name="provinceCode" id="provinceCode">
						<option key="-1">请选择</option>
						<c:forEach items="${provinceList}" var="province">
                            <option key="${province.id}">${province.areaName}</option>
                        </c:forEach>
					</select>
					<select class="select_option_y" name="cityCode" id="cityCode">
						<option key="-1">请选择</option>
					</select>
				</span>
				<span style="display: none;color:#888;position:relative;top:5px;left:5px;z-index:-99;" id="adressError"><font color="red">x</font> 请选择企业所在地在进行下一步操作</span>
			</li>
			<li>
				<p>*企业联系电话</p>
				<span>
					<input class="input_text_y" name="companyContacts" id="companyContacts" type="text"/>
				</span>
				<span style="display: none;color:#888;position:relative;top:5px;left:15px;z-index:-99;" id="companyContactsError"><font color="red">x</font> 请填写企业联系电话在进行下一步操作</span>
			</li>
			<li>
				<p>企业官方网站地址</p>
				<span>
					<input class="input_text_y" name="companySite" id="companySite" type="text"/>
				</span>
				<span style="display: none;color:#888;position:relative;top:5px;left:15px;z-index:-99;" id="companySiteError"><font color="red">x</font></span>
			</li>
			<li><p>*上传证件</p></li>
			<li class="h160_y">
				<span class="f_massmap_y">
					<input type="hidden" name="businessLicense" id="imgLink2" value=""/>
					<div class="f_upload1_pic_y" id="imgCollection2">
						<span class="select1" id="open2"></span>
						<span class="img1" id="imgList2" style="display: none;"></span>
						<span class="btn_delete_y" id="delete2" style="display: none;"></span>
					</div>
					<input type="hidden" name="bankLicense" id="imgLink3" value=""/>
					<div class="f_upload1_pic_y" id="imgCollection3">
						<span class="select1" id="open3"></span>
						<span class="img1" id="imgList3" style="display: none;"></span>
						<span class="btn_delete_y" id="delete3" style="display: none;"></span>
					</div>
					<input type="hidden" name="industryLicense" id="imgLink4" value=""/>
					<div class="f_upload1_pic_y" id="imgCollection4">
						<span class="select1" id="open4"></span>
						<span class="img1" id="imgList4" style="display: none;"></span>
						<span class="btn_delete_y" id="delete4" style="display: none;"></span>
					</div>
				</span>
				<div style="display: none;color:#888;position:relative;top:55px;left:30px;z-index:-99;" id="imgError2"><font color="red">x</font> 请上传证件在进行下一步操作</div>
				<div class="clear"></div>
				
			</li>
			<li><font class="c888">请上传营业执照、银行开户许可证、行业经营许可证原件的扫描件或照片；格式为JPG、JPEG、PNG，小于2MB</font></li>
			<div class="clear"></div>
		</ul>
		<div class="f_button_y">
			<button class="f_btn_submit" id="f_btn_submit1">下一步</button>
			<button class="f_btn_return" id="f_btn_return1">返回</button>
		</div>
	</div>

	<!--end n-main-->
	<jsp:include page="/footer.jsp" />
	<!--end n-footer-->
</body>
</html>
