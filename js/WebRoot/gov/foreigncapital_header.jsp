<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>信用动态-之江信用</title>
	<%--<link href="${basePath }/style/new/gov_style.css" rel="stylesheet" type="text/css" />--%>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body class="container" id="body" data-attr="">
<jsp:include page="/gov/gov_top.jsp" />
<div class="two-menu">
	<div class="layout">
		<ul class="two-ul" id="creditculture">
			<li data-nav="companysearch" style="margin-top:-2px"><a href="${basePath}/gov/user/companysearch" >企业查询</a></li>
			<li data-nav="foreigncapital" style="margin-top:-2px"><a href="${basePath}/gov/user/foreigncapital/list" >已添加企业</a></li>
		</ul>
	</div>
</div>
</body>
</html>