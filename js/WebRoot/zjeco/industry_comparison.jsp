<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <title>细分行业对比</title>
	<link type="text/css" href="${basePath}/zjeco/css/test.css" rel="Stylesheet" />
	<script data-main="${basePath}/zjeco/js/company_common.js" src="${basePath}/zjeco/js/require.js"></script>
	<script type="text/javascript">
		var companyCfg = companyCfg || {
			 page: 'detail'
	    };
    </script>
</head>
<body>
<div id="u19_div" class="main-container">
	<div class="top">
		<span class="title"><a href="${basePath}/zjeco/industry_comparison.jsp">企业信用预警</a></span>
		
	</div>
	<div id="u192_div" class="nav">
		<ul>
			<li class="on">信用排行</li>
			<li>信用分析</li>
			<li>信用增长率</li>
		</ul>
	</div>
	<div class="main-content">
		<div class="contrast-content">
			<div class="contrast-left">
				<span class="on">杭州</span>
				<span >宁波</span>
				<span >温州</span>
				<span >金华</span>
				<span >绍兴</span>
				<span >嘉兴</span>
				<span >台州</span>
				<span >湖州</span>
				<span >衢州</span>
				<span >舟山</span>
				<span >丽水</span>
			</div>
			<div class="contrast-map" id="echart_industry_contrast"></div>
			<div class="map-list-top">
				<table border="0">
					<thead>
					<tr class="list-title">
						<th width="300px;" class="list-name">行业信用TOP10</th>
						<th width="300px;">企业名称</th>
						<th>
							信用综合分
						</th>
					</tr>
					</thead>
					<tbody>
					<tr class="tb-data">
						<td class="top-name">制造业</td>
						<td>
							<ul class="company-list">
							</ul>
						</td>
						<td>
							<ul class="company-list-data">
							</ul>
						</td>
					</tr>
					</tbody>
				</table>

			</div>
		</div>
	</div>
</div>
</body>
</html>