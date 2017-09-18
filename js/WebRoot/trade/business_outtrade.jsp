<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/path.jsp"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>诚信企业名录</title>
<base href="${basePath }/" />
<link href="${basePath }/style/new/trade_style.css" rel="stylesheet"
	type="text/css" />
<link href="${basePath}/style/new-css/style.css" rel="stylesheet"
	type="text/css" />
<link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<link href="${basePath }/style/new/style.css" rel="stylesheet"
	type="text/css" />
<script data-main="${basePath }/js/uzj/trade.js"
	src="${basePath }/js/lib/require.js"></script>
</head>
<body data-attr="ecshop">
	<jsp:include page="/user/top.jsp" />

	<div class="layout content" trade_left='0'>
		<jsp:include page="/trade/left.jsp" />
		<div class="main  main2">
			<div class="fancy">
				<ul>
					<li class="active"><img
						src="${basePath}/images/trade-images/retails-outtrade-bg.jpg"></li>
				</ul>
				<a href="javascript:void(0);" class="fancy-left"><img
					src="${basePath}/images/trade-images/retails-img01.jpg"></a> <a
					href="javascript:void(0);" class="fancy-right"><img
					src="${basePath}/images/trade-images/retails-img02.jpg"></a>
			</div>
			<div class="ret-content">
				<div class="ret-title">
					<p>浙江省对外贸易公共服务平台</p>
				</div>
				<div class="ret-induct">
					<p>浙江省对外贸易公共服务平台是旨在帮助外向型企业拓展海外市场的信息平台、交流平台、资源平台、引流平台和服务对接平台。</p>
					<p>平台秉承“让外贸服务更便捷”的服务理念，以“互联网+”和“+互联网”创新外贸服务，借助“移动APP（微信）和PC端平台”，通过资源共享、服务集成、抱团营销、平台引流等方式创新外贸出口新手段，培育外贸竞争新优势，力争提升浙货国际市场占有率和品牌影响力，提升外向型企业国际化经营能力。</p>
				</div>
			</div>
			<div class="ret-content">
				<div class="ret-title">
					<p>诚信企业名录</p>
				</div>
				<div class="ret-data">
					<img src="${basePath}/images/trade-images/retails-img06.jpg">
						<h3>暂无数据</h3>
				</div>
			</div>
			<div class="ret-apply">
				<p>
					<a href="javascript:void(0);">申请加入</a>
				</p>
			</div>
		</div>
	</div>
	<jsp:include page="/footer.jsp" />
</body>
</html>