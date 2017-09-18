<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <title>行业概况</title>
	<link type="text/css" href="${basePath}/zjeco/css/test.css" rel="Stylesheet" />
	<script data-main="${basePath}/zjeco/js/company_common.js" src="${basePath}/zjeco/js/require.js"></script>
	<script type="text/javascript">
        var companyCfg = companyCfg || {
                page: 'digest'
            };
    </script>
</head>
<body>
<div id="u19_div" class="main-container">
	<div class="top">
		<span class="title"><a href="${basePath}/zjeco/index.jsp">企业信用预警</a></span>
		
	</div>
	<div class="main-content">
		<div id="u192_div" class="nav">
			<ul>
				<li class="on">信用排行</li>
				<li>信用分析</li>
				<li>信用增长率</li>
			</ul>
		</div>
    <div style="width:1280px;">
  		<div class="map-content">
  			<img  src="${basePath}/zjeco/images/zj.png">
  			<div class="hover_text">
  				<div class="text">
  					<label>2016-09</label><span>杭州</span></br>
  					<label>区域经营指数</label><span>1110</span></br>
  					<label>区域经营指数排行</label><span>NO.1</span>
  				</div>
  				<img id="hangzhou_digest_icon" src="${basePath}/zjeco/images/u38.png">
  			</div>
  		</div>
  		<div id="echart_industry_operate_development" class="map-list"></div>
   </div>
	</div>
</div>
</body>
</html>