<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>之江信用</title>
		<base href="${basePath }/" data-detailUrl="${companyDetailUrl }"/>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		
		<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
		<link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css" />
		<link href="${basePath}/style/new-css/activity.css" rel="stylesheet" type="text/css" />
		<link href="${basePath}/style/new/style.css" rel="stylesheet" type="text/css" />
		<meta property="qc:admins" content="1453276267425345466727" />
		<script data-main="${basePath }/js/uzj/light.js" src="${basePath }/js/lib/require.js"></script>
		<script>
		</script>
	</head>
	<body id="body" id="container">
	 <jsp:include page="/user/top.jsp"/>
	<!--header-->
	<div id="banner_y03" class="w100">
		<h2>加入之江信用，点亮企业信用灯塔</h2>
		<a href="">马上申请</a>
	</div>

	<!--activity-->
	<div class="rule_number">
		<div id="rules_y03" class="rules_arc">
			<div class="rule_number_list">
				<h3>43,000,000+</h3>
				<p>已收录企业</p>
			</div>
			<div class="rule_number_list">
				<h3>11,229</h3>
				<p>已认领企业</p>
			</div>
			<div class="rule_number_list">
				<h3>947</h3>
				<p>已认证企业</p>
			</div>
		</div>
	</div>
	<!--image_text-->

	<div id="image_text_yb" class="w100" style="padding-top: 60px;">
		<div id="tetle_y02">
			<font>信用灯塔介绍</font>
		</div>
		<div id="rules_y03" class="rules_arc">
			<p>信用灯塔是平台针对合法经营的企业推出的信用服务，通过对企业的身份验证、经营状况验证、经营资质核验、企业安全性评估等手段进行多种信息维度核验。信用评定结果优质的企业可在平台推荐企业名录中展示，授予诚信企业荣誉牌匾及其他政策激励，获得更多用户的信赖。</p>
			<div class="rules_tab" id="light_div">
				<p>
					<span data-mark="#light1" class="current">效果展示<i></i></span><span data-mark="#light2">服务体系<i></i></span><span data-mark="#light3">服务流程<i></i></span><span data-mark="#light4">常见问题<i></i></span>
				</p>
			</div>
		</div>
	</div>
	 <!-- 效果展示  -->
	 <jsp:include page="/lighthouse/show_results.jsp"/>
	  <!-- 服务体系  -->
	 <jsp:include page="/lighthouse/service_system.jsp"/>
	  <!-- 服务流程  -->
	 <jsp:include page="/lighthouse/service_process.jsp"/>
	  <!-- 常见问题 -->
	 <jsp:include page="/lighthouse/common_problem.jsp"/>
	 
	  <jsp:include page="/footer.jsp" />
</body>
</html>
