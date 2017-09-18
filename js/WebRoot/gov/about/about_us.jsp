<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="${basePath}/" />
	<title>关于我们-之江信用</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">	
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="企业信用,企业查询,工商信息,企业工商,工商查询,企业信用查询,企业工商信息查询">
	<meta http-equiv="description" content="水滴信用是在国家发改委指导下的大数据企业信用评价平台。水滴信用集合社会各界信息,对企业进行综合评价,向网民实时提供企业相关的股东,法人,企业对外投资信息,信用信息,失信记录。">
	<link href="${basePath }/style/new/gov_style.css" rel="stylesheet" type="text/css"/>
	<link href="${basePath}/style/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new/footer.css" rel="stylesheet" type="text/css" />
	<script  data-main="${basePath}/gov/js/gov_about.js" src="${basePath}/gov/js/lib/require.js"></script>
</head>

<body data-attr="about">
<jsp:include page="/gov/gov_top.jsp" />
	<!--end banner-->
	<div class="container-group">
		<div class="content content-group" user_left="0">
			<jsp:include page="../about/left.jsp"/>
			<div class="list-right">
				<h2>关于我们</h2>
				<div class="list-main">
					<p>浙江省商务信用公众服务平台（之江信用）是在国家商务部的指导下，由浙江省商务厅、浙江省发改委、人民银行杭州支行杭州金融清算中心、北京奇虎科技有限公司、上海凭安信用服务有限公司共同建设及运营的商务信用公众服务平台。之江信用将为公众提供信用资讯浏览、信用信息查询、失信企业举报等功能。</p>
				</div>
                <div class="new-partner">
                	<h2>合作单位</h2>
                    <div class="new-partner-logo">
                    	<img src="${basePath }/images/new-logo1.jpg" />
                        <img src="${basePath }/images/new-logo2.jpg" />
                        <img src="${basePath }/images/new-logo3.jpg" />
                        <img style="margin-right:0;" src="${basePath }/images/new-logo4.jpg" />
                        <img src="${basePath }/images/new-logo5.jpg" />
                    </div>
                </div>
			</div>
		</div>
	</div>
<jsp:include page="/gov/footer.jsp" />
</body>
</html>
