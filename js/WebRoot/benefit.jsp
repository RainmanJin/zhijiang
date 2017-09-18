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
	<meta property="qc:admins" content="1453276267425345466727" />
	<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new-css/activity.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/jquery-ui-autocomplete.css" rel="stylesheet" type="text/css" />
</head>
<body id="body">
<jsp:include page="/user/top.jsp"/>
  <!--end top-->
	<div class="bf-banner" >
	    <p><a href="${basePath}/user/owner/add_init">立即认领</a></p>
	</div>     
	<!--end n-banner-->
	<div class="n-layout ben-show">
		<h3>360搜索展示</h3>
		<h4>之江信用联合凭安水滴，借助360搜索展示已认领企业信息，让诚信推广更直接。</h4>
		<h4>信用，一种会说话的搜索方式</h4>
		<div class="ben-img">
			<img src="${basePath }/images/ben-tp.jpg">
		</div>
	</div>
	<div class="bg-ben">
		<div class="n-layout ben-show">
			<h3>项目审批畅通</h3>
			<h4>已认领企业可通过之江信用优先获取商务部门项目审批资格。</h4>
			<h4>以信用为鉴，让商务决策更高效</h4>
			<div class="ben-img01">
				<img src="${basePath }/images/step.png">
			</div>
		</div>
	</div>
	<div class="n-layout ben-show">
		<h3>银行贷款优先</h3>
		<h4>之江信用为已认领企业提供合作银行贷款优先服务。</h4>
		<h4>用信用贷款，让企业资金灵活运转</h4>
		<div class="ben-number">
			<div class="ben-block"><span></span><img src="${basePath }/images/member01.jpg"></div>
			<div class="ben-block"><span></span><img src="${basePath }/images/member02.jpg"></div>
			<div class="ben-block"><span></span><img src="${basePath }/images/member03.jpg"></div>
			<div class="ben-block"><span></span><img src="${basePath }/images/member04.jpg"></div>
			<div class="ben-block" style="margin-right: 0;"><span></span><img src="${basePath }/images/member05.jpg"></div>
			<div class="ben-block"><span></span><img src="${basePath }/images/member06.jpg"></div>
			<div class="ben-block"><span></span><img src="${basePath }/images/member07.jpg"></div>
			<div class="ben-block"><span></span><img src="${basePath }/images/member08.jpg"></div>			
		</div>
	</div>
<jsp:include page="/footer.jsp" />
</body>
</html>
