<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>信用动态-之江信用</title>
    <link href="${basePath }/style/new/gov_style.css" rel="stylesheet" type="text/css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body class="container" id="body" data-attr="">
<jsp:include page="/gov/gov_top.jsp"/>
<div class="two-menu">
    <div class="layout">
        <ul class="two-ul" id="creditculture">
            <li data-nav="news"><a href="${basePath}/gov/news/list">信用动态</a></li>
            <li data-nav="policy"><a href="${basePath}/gov/policy/list">政策法规</a></li>
            <li data-nav="chasten"><a href="${basePath}/gov/chasten/list">联合惩戒</a></li>
            <li data-nav="honour"><a href="${basePath}/gov/honour/list">守信光荣</a></li>
            <li data-nav="school"><a href="${basePath}/gov/school/list">信用学堂</a></li>
            <li data-nav="report"><a href="${basePath}/about/report.jsp">失信举报</a></li>
        </ul>
    </div>
</div>
</body>
</html>