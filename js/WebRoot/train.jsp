<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>信用直通车-之江信用</title>
	<base href="${basePath}/" />
	<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
        <link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="${basePath}/style/new/style.css" rel="stylesheet" type="text/css" />
        <script data-main="${basePath }/js/uzj/combination.js" src="${basePath }/js/lib/require.js"></script>
	<script type="text/javascript">
      var CompanySchemaCfg = CompanySchemaCfg || {}
    </script>
	</head>
	<body id="body" data-attr="train">
		 <jsp:include page="/user/top.jsp"/>
	    <div class="banner-bg02"></div>
	    <!--end banner-bg01-->
	    <div class="layout train" >
	    	<div class="train-style" style="margin-bottom:20px;">
	    		<%-- <p>之江信用为不同类型的用户提供定制化服务，点击图标进入<img src="${basePath}/images/small-icon.png" style="vertical-align:middle"/></p> --%>
	    	</div>
	    	<h2 >信用直通车&nbsp&nbsp<span>之江信用为不同类型的用户提供定制化服务,请选择您的类型<img src="${basePath}/images/small-icon.png" style="vertical-align:middle"/></span></h2>
	    	<div class="train-style">
	        	<div class="t-style cursor_pointer" data_attr="${basePath }/user/<%=response.encodeURL("toLogin") %>">
	            	<div class="stylebg style01" title="管理个人信息、评论投诉"><a href="javascript:void(0)">个人用户</a></div>
	            </div>
	            <div class="t-style cursor_pointer" data_attr="${basePath }/user/<%=response.encodeURL("toLogin") %>">
	            	<div class="stylebg style02" title="管理企业信用资料，申请政策金融服务，查看互联网舆情"><a href="javascript:void(0)">企业用户</a></div>
	            </div>
	            <div class="t-style">
	            	<div class="stylebg style03" title="定制企业信用信息，管理征信报告"><a href="javascript:void(0)">征信机构</a></div>
	            </div>
<%--	            <div style="display:none" class="t-style"  data_attr="${basePath }/<%=response.encodeURL("spvision") %>">
	            	<div class="stylebg style04 cursor_pointer" title="政府决策支持、监管服务"><a href="javascript:void(0)">政府监管</a></div>
	            </div>--%>
	            <div class="t-style" style="margin-right:0">
	            	<div class="stylebg style05" title="检索企业信用，金融服务通道"><a href="javascript:void(0)">金融机构</a></div>
	            </div>
	        </div>
	    </div>
	    <!--end train-->
	    <jsp:include page="/footer.jsp" />
	</body>
</html>