<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>之江信用</title>
		<base href="${basePath }/" data-detailUrl="${companyDetailUrl }"/>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta name="renderer" content="webkit" />
		<meta name="renderer" content="webkit|ie-comp|ie-stand" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="" />
		<meta http-equiv="description" content="" />
		
		<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
		<link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css" />
		<link href="${basePath}/style/new-css/flow.css" rel="stylesheet" type="text/css" />
		<link href="${basePath}/style/new-css/slider.css" rel="stylesheet" type="text/css" />
		<link href="${basePath}/style/new-css/lightbox.css" rel="stylesheet" type="text/css" />
		<link href="${basePath}/style/new/style.css" rel="stylesheet" type="text/css" />
		<meta property="qc:admins" content="1453276267425345466727" />
		<script data-main="${basePath }/js/uzj/activity.js" src="${basePath }/js/lib/require.js"></script>
		<script>
			var activityCfg = activityCfg || {};
		</script>
	</head>
	<body id="body">
	<jsp:include page="/user/top.jsp"/>
		<!--top_bg-->
	<div class="top_bg_y"></div>
	<!--flow-->
    <div class="n-layout">
        <div id="flow_y"><h3>申报流程</h3><dl class="flow_bg4_y"><span>填写基础信息</span><span>上传增信信息</span><span>确认支付</span><span>等待审核</span></dl></div>
       <c:if test="${result==1}">
        <div class="f_prompt_ok">
            <dl>您已成功支付${totalFee}元！<br />
                我们将在活动申报截止的次日安排审核，请您耐心等待！
            </dl>
            <a href="${basePath}">返回首页</a>
        </div>
       </c:if>
        <c:if test="${result==-1}">
        <div class="f_prompt_ok">
            <dl class="f_error_y">出错啦！<br/>
                请您返回支付页面重新支付！心等待！
            </dl>
            <a href="${basePath}/asso/companyIndLight/confirm/payment?activityNo=${activityNo}">返回首页</a>
        </div>
        </c:if>
    </div>
	<jsp:include page="/footer.jsp" />
	
	<!--popup-->
  </body>
</html>
