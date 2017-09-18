<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>之江信用</title>
	<base href="${basePath }/" data-detailUrl="${companyDetailUrl }"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta name="renderer" content="webkit" />
	<meta name="renderer" content="webkit|ie-comp|ie-stand" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="keywords" content="" />
	<meta http-equiv="description" content="" />
	<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new-css/activity.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/jquery-ui-autocomplete.css" rel="stylesheet" type="text/css" />
	<meta property="qc:admins" content="1453276267425345466727" />
	<script data-main="${basePath }/js/uzj/index.js" src="${basePath }/js/lib/require.js"></script>
</head>
<body id="body" style="background-color: #f2f4f8;">
<jsp:include page="/user/top.jsp"/>
<jsp:include page="/taca/pop.jsp"/>
<!--end n-header-->
<jsp:include page="/index_content.jsp"/>
<jsp:include page="/footer.jsp" />
</body>
</html>
