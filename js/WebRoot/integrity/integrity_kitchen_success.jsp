<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
   	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>信用金融</title>
	<base href="${basePath }/" />
	<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/new/trade_style.css" rel="stylesheet" type="text/css" />
	<script data-main="${basePath }/js/uzj/combination.js" src="${basePath }/js/lib/require.js"></script>
	<script type="text/javascript">
		var CompanySchemaCfg = CompanySchemaCfg || {}
	</script>
  </head>
  <body data-attr="integrity">
	<jsp:include page="/user/top.jsp"/>
	 <div class="finance" style="background: url(${basePath }/images/new-images/n-b6.jpg) no-repeat center;">
		<div class="layout">
		 <div class="fina-left">
				<h2>诚信厨房入驻申请</h2>
				<h4>申请成功后，我们的工作人员会在当日与您取得联系</h4>
				<h5><img src="${basePath }/images/trade-images/fi-icon1.png"><span>工作时间：9:00 - 18:00 节假日除外</span></h5>
				<h4>若您想对该产品作进一步了解，也可以直接拨打我们的咨询热线</h4>
				<h5><img src="${basePath }/images/trade-images/fi-icon2.png"><span>咨询热线：0571-87655905</span></h5>
			</div>
			<div class="fina-right">
			   <div class="fina-main fina-succeed fina-pad">
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