<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp"%>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>${bizCompany.companyName }企业信用-水滴信用</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta http-equiv="expires" content="0"/>
		<meta name="renderer" content="webkit">
		<meta http-equiv="keywords" content="${bizCompany.companyName },${bizCompany.companyName }招聘,${bizCompany.companyName }地址电话,${bizCompany.companyName }怎么样,${bizCompany.companyName }工资待遇,企业查询,企业信用,工商企业查询,企业信用查询,企业工商信息查询"/>
		<meta http-equiv="description" content="水滴信用为您提供${bizCompany.companyName }工商,股东,法人,企业对外投资信息,失信记录等各类企业信用信息,以及${bizCompany.companyName }招聘信息,${bizCompany.companyName }地址电话,${bizCompany.companyName }工资待遇。"/>
        <link href="${basePath}/style/new/gov_style.css" rel="stylesheet" type="text/css" />

        <script type="text/javascript" src="${basePath}/js/lib/jquery-1.11.3.min.js"></script>
    	<%--<script data-main="${basePath }/js/uzj/detail.js" src="${basePath }/js/lib/require.js"></script>--%>
	</head>
	<body style="overflow:hidden;">
		<jsp:include page="/gov/gov_top.jsp" />
		<fmt:requestEncoding value="UTF-8" />
		<div style="height:50px; line-height:50px;border-bottom:solid 1px #ececec;">
			<div style="width:1200px;margin:0px auto;">
				<label class="sidebar-module"><a href="${fn:replace(govCompanyDetailUrl, 'companyNo', param.s)}" style="font-size:16px; color:#444;" id="companyName"></a></label>
				<label class="col-contact1" style="width:160px;">
					<a class="icon2" href="${fn:replace(govCompanyDetailUrl, 'companyNo', param.s)}">查看公司</a>
					<a href="${param.url }" style="color:black;margin-left:20px; box-shadow:none;">打开原页面</a>
				</label>
			</div>
		</div>
		<iframe id="iframe1" name="iframe1" style="width:100%;height:500px;" frameborder="0" src="${param.url }" ></iframe>
	</body>
</html>
<script>
    $(".sd_menu_side").remove();
    var auto_height = $(window).height()-$("#iframe1").offset().top;
    $("#iframe1").height(auto_height);
    var local_href= window.location.href;
    $("[companyName]").html(decodeURI(local_href).split("name=")[1]);
</script>