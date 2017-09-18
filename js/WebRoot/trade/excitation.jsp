<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
   	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>守信激励</title>
	<base href="${basePath }/" />
	<link href="${basePath }/style/new/trade_style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
	<script data-main="${basePath }/js/uzj/trade.js" src="${basePath }/js/lib/require.js"></script>
	<script type="text/javascript">
	   var financeCfg = financeCfg || {page:'excitation'};
	</script>
  </head>
  <body data-attr="excitation">
	<jsp:include page="/user/top.jsp"/>
	
	<div class="excitation-banner"><!-- <p><a href="javascript:void(0);">立即申请</a></p> --></div>
	
	<div class="layout excit">
    	<div class="excit-title">
        	<h2>信用分四星以上用户可申请以下政策激励</h2>
        </div>
        <div class="excit-main">
        	<div class="excit-list">
            	<img src="${basePath}/images/trade-images/excit01.png" />
                <h3>诚信示范企业认定</h3>
              <!--   <a href="javascript:void(0);">我要申请</a> -->
            </div>
            <div class="excit-list">
            	<img src="${basePath}/images/trade-images/excit02.png" />
                <h3>出口名牌认定</h3>
               <!--  <a href="javascript:void(0);">我要申请</a> -->
            </div>
            <div class="excit-list excit-margin">
            	<img src="${basePath}/images/trade-images/excit03.png" />
                <h3>外商投资优先对接</h3>
              <!--   <a href="javascript:void(0);">我要申请</a> -->
            </div>
        </div>
    </div>
    <jsp:include page="/footer.jsp" />
 </body>
</html>