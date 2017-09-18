<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
   	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>诚信厨房</title>
	<base href="${basePath }/" />
	<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/new/trade_style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/jquery-ui-autocomplete.css" rel="stylesheet" type="text/css" />
	<script data-main="${basePath }/js/uzj/combination.js" src="${basePath }/js/lib/require.js"></script>
	<script type="text/javascript">
	    var CompanySchemaCfg = CompanySchemaCfg || {page:'addIntegrity'}
	</script>
  </head>
  <body data-attr="integrity">
	<jsp:include page="/user/top.jsp"/>
	 <div class="kitchen-apply">
		<div class="layout">
		  <div class="fina-left">
				<h2>诚信厨房入驻申请</h2>
				<h4>申请成功后，我们的工作人员会在当日与您取得联系</h4>
				<h5><img src="${basePath }/images/trade-images/fi-icon1.png"><span>工作时间：9:00 - 18:00 节假日除外</span></h5>
				<h4>若您想对该产品作进一步了解，也可以直接拨打我们的咨询热线</h4>
				<h5><img src="${basePath }/images/trade-images/fi-icon2.png"><span>咨询热线：0571-87655905</span></h5>
			</div>
			<div class="fina-right">
			   <div class="fina-main fina-write fina-pad" id="integrityAdd">
				  <form id="kitchenForm" action="${basePath}<%=response.encodeURL("/user/integrity/kitchen/addIntegrity")%>" method="post">
				        <input type="hidden" name="companyNameDigest" id="companyNameDigest" />
				        <input type="hidden" name="integrityPhone" id="integrityPhone" />
						<h4 class="fina-top" id="autocomplete_finance">
						   <i style="display: none;top:42px;" id="errorMsg"></i>
						   <span><em>*</em>企业名称</span>
						   <input class="fina-in1" type="text" name="companyName" value="" title="" ajaxotherparam="companyName" ajax="${basePath }/company/<%=response.encodeURL("companyNameValidate") %>" ajaxmsg="该企业暂未收录" id="companyName" minlength="1" des="企业名称" msgtip="right"  placeholder="请填写企业营业执照上的全称" style="color: #444;"/>
						</h4>
						<h4>
						   <span><em>*</em>真实姓名</span>
						   <input class="fina-in2" type="text" name="integrityRealname" id="integrityRealname" minlength="2" maxlength="26" des="真实姓名" msgtip="right" placeholder="请填写真实姓名" style="color: #444;"  />
						</h4>
						<h4>
						  <span><em>*</em>手机号码</span>
						  <input class="fina-in2" type="mobile" name="phone" id="phone" des="手机号" msgtip="bottom" maxlength="11" minlength="11" placeholder="请填写手机号码" style="color: #444;"/>
						</h4>
						<h4>
							<span><em>*</em>验证码</span>
							<input class="fina-in2" name="code" id="smsCode" type="text" ajaxotherparam="phone" maxlength="4" minlength="4" ajax="${basePath }/user/<%=response.encodeURL("phoneValidate") %>" ajaxmsg="验证码错误" msgtip="right" des="验证码"  placeholder="请填写验证码" style="color: #444;"/>
							<input class="fina-in3" type="button" id="sendPhoneCode" num="1" value="获取验证码" />
							<!-- <i>请输入系统发送给您的验证码</i> -->
						</h4>
						<h4>
							<span><em>*</em>企业邮箱</span>
							<input class="fina-in1" type="email" name="integrityEmail" id="integrityEmail" des="邮箱" minlength="1" msgtip="innerLeft" value=""  placeholder="请填写企业邮箱" style="color: #444;"/>
						</h4>
						<h5><input type="button" id="submitKitchen" value="立即申请" style="cursor: pointer;"  /></h5>
				  </form>
				</div>
				
				<div class="fina-main fina-succeed fina-pad" id="integritySuccess" style="display: none;">
					<img src="${basePath}/images/trade-images/fi-icon3.png">
					<h3>恭喜您申请成功！</h3>
					<h4>请保持电话畅通，我们的工作人员稍后会和您取得联系~</h4>
					<h5><span id="timeCountDown">3</span>秒钟后自动跳转诚信厨房首页</h5>
					<input type="button" id="button_success" value="立即前往" style="cursor: pointer;" />
				</div>
				
			</div>
		</div>
	</div>
    <jsp:include page="/footer.jsp" />
 </body>
</html>