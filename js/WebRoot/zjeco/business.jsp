<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <title>企业经营能力分析</title>
	<link type="text/css" href="${basePath}/zjeco/css/test.css" rel="Stylesheet" />
	<script data-main="${basePath}/zjeco/js/company_common.js" src="${basePath}/zjeco/js/require.js"></script>
	<script type="text/javascript">
		var companyCfg = companyCfg || {
	        page: 'industry_operate'
	    };
    </script>
</head>
<body>
<div id="u19_div" class="main-container">
	<div class="top">
		<span class="title">企业信用走势分析</span>
		
	</div>
	<div class="main-content">
		<div class="manage-content manage-s1">
			<div class="chart-s1" id="company_operate_ability_anylytic1"></div>
			<div class="chart-s2" id="company_operate_ability_anylytic2"></div>
			<div class="chart-s3" id="company_operate_ability_anylytic3"></div>
			<div class="chart-s4" id="company_operate_ability_anylytic4"></div>
		</div>
	</div>
</div>
</body>
</html>